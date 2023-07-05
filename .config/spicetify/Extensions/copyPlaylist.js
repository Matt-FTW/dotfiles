// NAME: Copy Playlists
// AUTHOR: einzigartigerName
// DESCRIPTION: copy/combine playlist/queue directly in Spotify

(function CopyPlaylist() {

    const { CosmosAPI, BridgeAPI, LocalStorage, PlaybackControl, ContextMenu, URI } = Spicetify
    if (!(CosmosAPI || BridgeAPI)) {
        setTimeout(CopyPlaylist, 1000);
        return;
    }

    const STORAGE_KEY = "combine_buffer_spicetify"
    const TOP_BTN_TOOLTIP = "Combine Playlists"
    const MENU_BTN_CREATE_NEW = "Create Playlist"
    const MENU_BTN_INSERT_BUFFER = "Copy to Buffer"

    class PlaylistCollection {
        constructor() {
            const menu = createMenu()
            this.container = menu.container
            this.items = menu.menu
            this.lastScroll = 0
            this.container.onclick = () => {
                this.storeScroll()
                this.container.remove()
            }
            this.pattern
            this.apply()
        }

        apply() {
            this.items.textContent = '' // Remove all childs
            this.items.append(createMenuItem("Create Playlist", () => highjackCreateDialog(mergePlaylists(this.pattern))))
            this.items.append(createMenuItem("Clear Buffer", () => LIST.clearStorage()))

            const select = createPatternSelect(this.filter);
            select.onchange = (event) => {
                this.pattern = event.srcElement.selectedIndex;
            }
            this.items.append(select);

            const collection = this.getStorage();
            collection.forEach((item) => this.items.append(new CardContainer(item)))
        }

        getStorage() {
            const storageRaw = LocalStorage.get(STORAGE_KEY);
            let storage = [];

            if (storageRaw) {
                storage = JSON.parse(storageRaw);
            } else {
                LocalStorage.set(STORAGE_KEY, "[]")
            }

            return storage;
        }

        addToStorage(data) {

            /** @type {Object[]} */
            const storage = this.getStorage();
            storage.push(data);

            LocalStorage.set(STORAGE_KEY, JSON.stringify(storage));
            this.apply()
        }

        removeFromStorage(id) {
            const storage = this.getStorage()
                .filter(item => item.id !== id)

            LocalStorage.set(STORAGE_KEY, JSON.stringify(storage));
            this.apply()
        }

        clearStorage() {
            LocalStorage.set(STORAGE_KEY, "[]");
            this.apply()
        }

        moveItem(uri, direction) {
            var storage = this.getStorage()

            var from;

            for (var i = 0; i < storage.length; i++) {
                if (storage[i].uri === uri) {
                    from = i
                    break;
                }
            }
            if (!from) { return }
            
            var to = from + direction
            if (to < 0 || to >= storage.length) { return }

            var tmp = storage[from]
            storage[from] = storage[to]
            storage[to] = tmp

            LocalStorage.set(STORAGE_KEY, JSON.stringify(storage));
            this.apply()
        }

        changePosition(x, y) {
            this.items.style.left = x + "px"
            this.items.style.top = y + 10 + "px"
        }

        storeScroll() {
            this.lastScroll = this.items.scrollTop
        }

        setScroll() {
            this.items.scrollTop = this.lastScroll
        }
    }

    /*
    * Displays Stored Playlist
    * {id, uri, name, tracks, imgUri, owner} 
    */
    class CardContainer extends HTMLElement {
        constructor(info) {
            super()

            this.innerHTML = `
<div class="card card-horizontal card-type-album ${info.imgUri ? "" : "card-hidden-image"}" data-uri="${info.uri}" data-contextmenu="">
    <div class="card-attention-highlight-box"></div>
    <div class="card-horizontal-interior-wrapper">
        ${info.imgUri ? `
            <div class="card-image-wrapper">
                <div class="card-image-hit-area">
                    <a class="card-image-link" link="${info.uri}">
                        <div class="card-hit-area-counter-scale-left"></div>
                        <div class="card-image-content-wrapper">
                            <div class="card-image" style="background-image: url('${info.imgUri}')"></div>
                        </div>
                    </a>
                    <div class="card-overlay"></div>
                </div>
            </div>
        ` : ""}
        <div class="card-info-wrapper">
            <div class="order-controls">
                <div class="order-controls-up">
                    <button class="button button-green button-icon-only spoticon-chevron-up-16" data-tooltip="Move Up"></button>
                </div>
                <div class="order-controls-remove">    
                    <button class="button button-green button-icon-only spoticon-x-16" data-tooltip="Remove"></button>
                </div>
                <div class="order-controls-down">
                    <button class="button button-green button-icon-only spoticon-chevron-down-16" data-tooltip="Move Down"></button>
                </div>
            </div>
            <a class="card-info-link" ${info.uri}>
                <div class="card-info-content-wrapper">
                    <div class="card-info-title"><span class="card-info-title-text">${info.name}</span></div>
                    <div class="card-info-subtitle-owner"><span>${info.owner}</span></div>
                    <div class="card-info-subtitle-tracks"><span>${info.tracks.length === 1 ? "1 Track" : `${info.tracks.length} Tracks`}</span></div>
                </div>
            </a>
        </div>
    </div>
</div>`

            const up = this.querySelector(".order-controls-up")
            up.onclick = (event) => {
                LIST.moveItem(info.uri, -1)
                event.stopPropagation()
            }

            const remove = this.querySelector(".order-controls-remove")
            remove.onclick = (event) => {
                LIST.removeFromStorage(info.id)
                event.stopPropagation()
            }

            const down = this.querySelector(".order-controls-down")
            down.onclick = (event) => {
                LIST.moveItem(info.uri, +1)
                event.stopPropagation()
            }

            const imageLink = this.querySelector(".card-image-link");
            const infoLink = this.querySelector(".card-info-link");

            if (imageLink) imageLink.addEventListener("click", ((e) => showPlaylist(e)));
            
            if (infoLink) infoLink.addEventListener("click", ((e) => showPlaylist(e)));
        }
    }

    customElements.define("combine-buffer-card-container", CardContainer)

    const LIST = new PlaylistCollection()

    // New Playlist Button
    const playlistDialogButton = document.querySelector("#new-playlist-button-mount-point > div > button")
    if (!playlistDialogButton) return;

    document.querySelector("#view-browser-navigation-top-bar")
        .append(createTopBarButton())

    createPlaylistContextMenu().register()


    /**************************************************************************
                                UI Building
    **************************************************************************/
    // If Queue Page add Buttons
    const iframeInterval = setInterval(() => {
        /** @type {HTMLIFrameElement} */
        const currentIframe = document.querySelector("iframe.active");
        if (!currentIframe ||
            currentIframe.id !== "app-queue"
        ) {
            return;
        }

        const headers = currentIframe.contentDocument.querySelectorAll(
            ".glue-page-header__buttons"
        );

        for (const e of headers) {
                e.append(createQueueButton(
                    "Save as Playlist",
                    "Save the current Queue as a new Playlist",
                    () => {
                        let tracks = getQueueTracks();
                        highjackCreateDialog(tracks);
                    },
                ));

                e.append(createQueueButton(
                    "Copy into Buffer",
                    "Insert the current Queue into the Buffer",
                    () => { queueToBuffer() },
                ));
        }

        if (headers.length > 0) clearInterval(iframeInterval);
    }, 500)

    // Creates the Main Menu
    function createMenu() {
        const container = document.createElement("div")
        container.id = "combine-playlist-spicetify"
        container.className = "context-menu-container"
        container.style.zIndex = "1029"

        const style = document.createElement("style")
        style.textContent = `
#combine-menu {
    display: inline-block;
    width: 33%;
    max-height: 70%;
    overflow: hidden auto;
    padding: 10px
}
.combine-pattern {
    margin-top: 7px;
}
.order-controls {
    position: absolute;
    right: 0;
    padding: 0 5px 5px 0;
    z-index: 3
}
.button.button-icon-only::before {
    color: var(--modspotify_main_fg);
}
.order-controls-up {
    position: relative;
    top: 100%;
}
.order-controls-remove {
    position: relative;
    top: 50%;
}
.order-controls-down {
    position: relative;
    bottom: 100%;
}
.card-info-subtitle-owner {
    color: var(--modspotify_secondary_fg);
}
.card-info-subtitle-tracks {
    font-weight: lighter;
    color: var(--modspotify_secondary_fg);
}
`

        const menu = document.createElement("ul")
        menu.id = "combine-menu"
        menu.className = "context-menu"

        container.append(style, menu)

        return { container, menu }
    }

    // Creates a Button in the Combine Menu
    function createMenuItem(name, callback) {
        const item = document.createElement("div");
        item.classList.add("item");
        item.onclick = callback;
        item.onmouseover = () => item.classList.add("hover");
        item.onmouseleave = () => item.classList.remove("hover");

        const text = document.createElement("span");
        text.classList.add("text");
        text.innerText = name;

        item.append(text);

        return item;
    }

    // Creates the SubMenu in Playlist Context
    function createPlaylistContextMenu() {
        var createFromCurrent = new Spicetify.ContextMenu.Item(
            MENU_BTN_CREATE_NEW,
            (uris) => {
                if (uris.length === 1) {
                    fetchPlaylist(uris[0])
                        .then((buffer) => highjackCreateDialog(buffer.tracks))
                        .catch((err) => Spicetify.showNotification(`${err}`));
                    return;
                } else {
                    Spicetify.showNotification("Unable to find Playlist URI")
                }           
            },
            (_) => true
        )

        var insertIntoBuffer = new Spicetify.ContextMenu.Item(
            MENU_BTN_INSERT_BUFFER,
            (uris) => {
                
                if (uris.length === 1) {
                    fetchPlaylist(uris[0])
                        .then((buffer) => {LIST.addToStorage(buffer)})
                        .catch((err) => Spicetify.showNotification(`${err}`));
                    return;
                } 
            },
            (_) => true
        )

        return new Spicetify.ContextMenu.SubMenu(
            "Copy Playlist",
            [ createFromCurrent, insertIntoBuffer],
            (uris) => {
                if (uris.length === 1) {
                    const uriObj = Spicetify.URI.fromString(uris[0]);
                    switch (uriObj.type) {
                        case Spicetify.URI.Type.PLAYLIST:
                        case Spicetify.URI.Type.PLAYLIST_V2:
                            return true;
                    }
                    return false;
                }
                // Multiple Items selected.
                return false;
            }
        )
    }

    // Creates the Button to View Merge Buffer
    function createTopBarButton() {
        const button = document.createElement("button")
        button.classList.add("button", "spoticon-copy-16", "merge-button")
        button.setAttribute("data-tooltip", TOP_BTN_TOOLTIP)
        button.setAttribute("data-contextmenu", "")
        button.setAttribute("data-uri", "spotify:special:copy")
        button.onclick = () => {
            const bound = button.getBoundingClientRect()
            LIST.changePosition(bound.left, bound.top)
            document.body.append(LIST.container)
            LIST.setScroll()
        }
        return button
    }

    // Creates the Dropdown Menu for Merge Pattern
    function createPatternSelect(defaultOpt = 0) {
        const select = document.createElement("select");
        select.className = "GlueDropdown combine-pattern";

        const appendOpt = document.createElement("option");
        appendOpt.text = "Append";

        const shuffleOpt = document.createElement("option");
        shuffleOpt.text = "Shuffle";

        const alternateOpt = document.createElement("option");
        alternateOpt.text = "Alternate";

        select.onclick = (ev) => ev.stopPropagation();
        select.append(appendOpt, shuffleOpt, alternateOpt);
        select.options[defaultOpt].selected = true;

        return select;
    }

    // Queue button
    function createQueueButton(name, tooltip, callback) {
        const b = document.createElement("button");
        b.classList.add("button", "button-green");
        b.innerText = name;
        b.setAttribute("data-tooltip", tooltip);
        b.onclick = callback;
        return b;
    }

    // Highjack Spotifies 'New Playlist' Dialog
    function highjackCreateDialog(tracks) {
        playlistDialogButton.click()

        var createButton = document.querySelector("body > div.Modal__portal > div > div > div > div.PlaylistAnnotationModal__submit-button-container > button")
        var buttonContainer = document.querySelector("body > div.Modal__portal > div > div > div > div.PlaylistAnnotationModal__submit-button-container")

        var highjackedButton = createButton.cloneNode(true)
        highjackedButton.addEventListener("click", () => onCreateNewPlaylist(tracks))

        window.addEventListener("keypress", (event) => {
            if (event.code === `Enter`) {
              // Cancel the default action, if needed
              event.preventDefault();
              // Trigger the button element with a click
              createButton.click();
            }
          });

        createButton.remove()
        buttonContainer.insertAdjacentElement("afterbegin", highjackedButton)
    }


    /**************************************************************************
                                OnCLick Functions
    **************************************************************************/
    // Create a new Playlist from Inputs
    function onCreateNewPlaylist(tracks) {
        var exitButton = document.querySelector("body > div.Modal__portal > div > div > div > div.PlaylistAnnotationModal__close-button > button");
        var nameInput = document.querySelector("body > div.Modal__portal > div > div > div > div.PlaylistAnnotationModal__content > div.PlaylistAnnotationModal__playlist-name > input")
        var descInput = document.querySelector("body > div.Modal__portal > div > div > div > div.PlaylistAnnotationModal__content > div.PlaylistAnnotationModal__playlist-description > textarea")
        var imageInput = document.querySelector("body > div.Modal__portal > div > div > div > div.PlaylistAnnotationModal__content > div.PlaylistAnnotationModal__img-container > div > div.PlaylistAnnotationModal__img-holder > img")

        var name = nameInput.value
        if (!name) {
            name = nameInput.getAttribute("placeholder")
        }

        var desc = descInput.value

        var img;
        if (imageInput) {
            img = imageInput.getAttribute("src")
        }

        createPlaylist(name)
            .then(res => addTracks(res.uri, tracks))
            .then((_) => Spicetify.showNotification(`Created Playlist: "${name}"`))
            .catch((err) => Spicetify.showNotification(`${err}`));

        exitButton.click()

        if (exitButton) {
            exitButton.click()
        }
    }

    // Get All Tracks in Queue and remove delimiter
    function getQueueTracks() {
        return Spicetify.Queue.next_tracks
            .map((t) => t.uri)
            .filter((t) => { return t != "spotify:delimiter"; })
    }

    // Copy the Queue to the Combine Buffer
    function queueToBuffer() {
        let tracks = getQueueTracks();

        var date = new Date()
        var year = new Intl.DateTimeFormat('en', { year: 'numeric' }).format(date);
        var month = new Intl.DateTimeFormat('en', { month: 'short' }).format(date);
        var day = new Intl.DateTimeFormat('en', { day: '2-digit' }).format(date);
        
        const timeOptions = { hour: 'numeric', minute: 'numeric', hour12: false};
        var time = new Intl.DateTimeFormat(`en`, timeOptions).format(date);

        let queue = {
            id: `spotify:queue-${date}`,
            uri: `spotify:queue`,
            name: "Queue",
            imgUri: undefined,
            tracks: tracks,
            owner: `${time} - ${day} ${month} ${year}`,
        }

        LIST.addToStorage(queue);
    }

    // Show the clicked Playlist
    async function showPlaylist(event) {
        console.log(event)
    }
    

    /**************************************************************************
                                Merge Playlists
    **************************************************************************/
    // Merge all Playlists
    function mergePlaylists(pattern) {
        var tracks = LIST.getStorage().map((pl) => pl.tracks)

        switch (pattern) {
            case  1: return shuffle(tracks);
            case  2: return alternate(tracks);
            default: return append(tracks);
        }
    }

    // Alternate Playlists
    function alternate(arrays) {
        var combined = []

        while (arrays.length != 0) {
            var current = arrays.shift()
            if (current.length != 0) {
                combined.push(current.shift())

                if (current.length != 0) {
                    arrays.push(current)
                }
            }
        }

        return combined
    }

    // Shuffle all tracks using the Durstenfeld Shuffle
    function shuffle(arrays) {
        var combined = append(arrays)

        for (var i = combined.length - 1; i > 0; i--) {
            var j = Math.floor(Math.random() * (i + 1));
            var temp = combined[i];
            combined[i] = combined[j];
            combined[j] = temp;
        }

        return combined;
    }

    // Simply Concat all Playlist
    function append(arrays) {
        var combined = []
        arrays.forEach((arr) => combined = combined.concat(arr))

        return combined;
    }

    /**************************************************************************
                                Calls to the CosmosAPI
    **************************************************************************/
    // Fetch all Track from Playlist URI
    async function fetchPlaylist(uri) {
        return await new Promise((resolve, reject) => {
            Spicetify.BridgeAPI.cosmosJSON(
                {
                    method: "GET",
                    uri: `sp://core-playlist/v1/playlist/${uri}/`,
                    body: {
                        policy: {
                            link: true,
                        },
                    },
                },
                (error, res) => {
                    if (error) {
                        reject(error);
                        return;
                    }

                    let id = `${uri}-${new Date()}`
                    let tracks = res.items.map((track) => track.link)
                    let img = res.playlist.picture
                    let name = res.playlist.name
                    let owner = res.playlist.owner.name

                    let playlist = {id: id, uri: uri, name: name, tracks: tracks, imgUri: img, owner: owner}
                    
                    resolve(playlist);
                }
            );
        });
    }

    // Create a new Playlist
    async function createPlaylist(name) {
        return await new Promise((resolve, reject) => {
            Spicetify.BridgeAPI.cosmosJSON(
                {
                    method: "POST",
                    uri: `sp://core-playlist/v1/rootlist`,
                    body: {
                        operation: "create",
                        playlist: !0,
                        before: "start",
                        name: name,
                    },
                },
                (error, res) => {
                    if (error) {
                        reject(error);
                        return;
                    }

                    resolve(res);
                }
            );
        });
    }

    // add track list to playlist
    async function addTracks(uri, tracks) {
        return await new Promise((resolve, reject) => {
            Spicetify.BridgeAPI.cosmosJSON(
                {
                    method: "POST",
                    uri: `sp://core-playlist/v1/playlist/${uri}`,
			        body: {
				        operation: "add",
				        uris: tracks,
				        after: "end"
			        }
                },
                (error, res) => {
                    if (error) {
                        reject(error);
                        return;
                    }

                    resolve(res);
                }
            );
        });
    }
})();
