// @ts-chec

// NAME: Sort By Play Count
// AUTHOR: Tetrax-10
// DESCRIPTION: Sorts Songs by Play Count, Popularity, Release date, Global Scrobbles, Personal Scrobbles Using Spotify and Last.FM

/// <reference path="../dev/globals.d.ts" />

let sortByPlayCount = 0;
(async function sortByPlay() {
    if (!(Spicetify.Platform && Spicetify.React) && sortByPlayCount < 200) {
        setTimeout(sortByPlay, 300);
        sortByPlayCount++;
        return;
    }

    let { Type } = Spicetify.URI;
    let LFMApiKey = "44654ea047786d90338c17331a5f5d95";

    const { React } = Spicetify;
    const { useState } = React;

    let sortedFolderName = "Sorted Playlist";

    ////////////////////////////////////// CONFIG ///////////////////////////////////////////

    async function getLocalStorageDataFromKey(key) {
        return Spicetify.LocalStorage.get(key);
    }

    async function setLocalStorageDataWithKey(key, value) {
        Spicetify.LocalStorage.set(key, value);
    }

    function notification(text) {
        Spicetify.showNotification(text);
    }

    async function validateLocalStorage() {
        if (!CONFIG.lastFmUserName) {
            setLastFmUsername();
            return false;
        }
        return true;
    }

    async function getConfig() {
        try {
            const parsed = JSON.parse(await getLocalStorageDataFromKey("sortByPlayCount:settings"));
            if (parsed && typeof parsed === "object") {
                return parsed;
            }
            throw "Config error Sort By Play Count";
        } catch {
            await setLocalStorageDataWithKey("sortByPlayCount:settings", `{}`);
            // default settings
            return {
                myScrobbles: true,
                lastfmPlayCount: false,
                ascending: false,
                queue: false,
                isPrivate: true,
                artistMode: "all",
                removeDuplicate: true,
                artistNameMust: false,
                lastFmUserName: "",
            };
        }
    }

    async function saveConfig() {
        await setLocalStorageDataWithKey("sortByPlayCount:settings", JSON.stringify(CONFIG));
    }

    const CONFIG = await getConfig();
    await saveConfig();

    ////////////////////////////////////// UI ///////////////////////////////////////////

    let style = React.createElement(
        "style",
        null,
        `.popup-row::after {
                    content: "";
                    display: table;
                    clear: both;
                }
                .popup-row .col {
                    display: flex;
                    padding: 10px 0;
                    align-items: center;
                }
                .popup-row .col.description {
                    float: left;
                    padding-right: 15px;
                }
                .popup-row .col.action {
                    float: right;
                    text-align: right;
                }
                .popup-row .div-title {
                    color: var(--spice-text);
                }                
                .popup-row .divider {
                    height: 2px;
                    border-width: 0;
                    background-color: var(--spice-button-disabled);
                }
                .popup-row .space {
                    margin-bottom: 20px;
                    visibility: hidden;
                }
                .popup-row .info {
                    /* font-size: 13px; */
                }
                .popup-row .demo {
                    font-size: 13px;
                    color: #59CE8F;
                }
                .popup-row .little-space {
                    margin-bottom: 10px;
                }
                .popup-row .inputbox {
                    display: flex;
                    flex-direction: column;
                    padding: 15px;
                    border-radius: 15px;
                    border: 0;
                    box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.06);
                }
                button.checkbox {
                    align-items: center;
                    border: 0px;
                    border-radius: 50%;
                    background-color: rgba(var(--spice-rgb-shadow), 0.7);
                    color: var(--spice-text);
                    cursor: pointer;
                    display: flex;
                    margin-inline-start: 12px;
                    padding: 8px;
                }
                button.checkbox.disabled {
                    color: rgba(var(--spice-rgb-text), 0.3);
                }
                select {
                    color: var(--spice-text);
                    background: rgba(var(--spice-rgb-shadow), 0.7);
                    border: 0;
                    height: 32px;
                }
                ::-webkit-scrollbar {
                    width: 8px;
                }
                .login-button {
                    background-color: var(--spice-button);
                    border-radius: 8px;
                    border-style: none;
                    color: var(--spice-text);
                    cursor: pointer;
                    font-size: 14px;
                    height: 40px;
                    margin-right: 20px;
                    padding: 5px 10px;
                    text-align: center;
                }
                .green {
                    background-color: #6BCB77;
                    color: #25316D;
                }
                .red {
                    background-color: #bf616a;
                }`
    );

    function setLastFmUsername() {
        let addLoginContainer = React.createElement(
            "div",
            null,
            style,
            React.createElement(
                "div",
                { className: "popup-row" },
                React.createElement("p", { className: "col description" }, "With Last.FM Integration you can now sort your top songs (your personal play count) with help of this extension. This extension can sort playlists, albums, even artist page with LastFM."),
                React.createElement(
                    "a",
                    {
                        href: "https://github.com/Tetrax-10/Spicetify-Extensions/tree/master/Sort-by-Play-count#need-to-connect-spotify-and-lastfm-for-personal-scrobbles-to-work-optional-step",
                        className: "demo",
                    },
                    "Click for demo"
                )
            ),
            React.createElement(
                "div",
                { className: "popup-row" },
                React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "divider" }, null)),
                React.createElement("p", { className: "popup-row" }, React.createElement("p", null, "Enter your Last.FM Username :")),
                React.createElement("div", { className: "little-space" }, null),
                React.createElement("div", { className: "little-space" }, null),
                React.createElement("p", { className: "popup-row" }, React.createElement("input", { className: "inputbox", placeholder: CONFIG.lastFmUserName ? CONFIG.lastFmUserName : "Last.FM Username", required: true })),
                React.createElement("div", { className: "little-space" }, null),
                React.createElement("div", { className: "little-space" }, null),
                React.createElement(ButtonItem, {
                    name: "Save",
                    color: " green",
                    onclickFun: async () => {
                        let name = document.querySelector(".popup-row .inputbox").value.replace(/\n/g, "");

                        if (name === "" || !name) {
                            alert("The UserName can't be blank");
                            return;
                        }

                        CONFIG.lastFmUserName = name;
                        await saveConfig();
                        Spicetify.PopupModal.hide();
                    },
                })
            )
        );

        Spicetify.PopupModal.display({
            title: "Connect Last.FM",
            content: addLoginContainer,
        });
    }

    function DisplayIcon({ icon, size }) {
        return React.createElement("svg", {
            width: size,
            height: size,
            viewBox: "0 0 16 16",
            fill: "currentColor",
            dangerouslySetInnerHTML: {
                __html: icon,
            },
        });
    }

    function checkBoxItem({ name, field, onclickFun = () => {} }) {
        let [value, setValue] = useState(CONFIG[field]);
        return React.createElement(
            "div",
            { className: "popup-row" },
            React.createElement("label", { className: "col description" }, name),
            React.createElement(
                "div",
                { className: "col action" },
                React.createElement(
                    "button",
                    {
                        className: "checkbox" + (value ? "" : " disabled"),
                        onClick: async () => {
                            let state = !value;
                            CONFIG[field] = state;
                            setValue(state);
                            await saveConfig();
                            onclickFun();
                        },
                    },
                    React.createElement(DisplayIcon, { icon: Spicetify.SVGIcons.check, size: 16 })
                )
            )
        );
    }

    function dropDownItem({ name, field, options, onclickFun = () => {} }) {
        const [value, setValue] = useState(CONFIG[field]);
        return React.createElement(
            "div",
            { className: "popup-row" },
            React.createElement("label", { className: "col description" }, name),
            React.createElement(
                "div",
                { className: "col action" },
                React.createElement(
                    "select",
                    {
                        value,
                        onChange: async (e) => {
                            setValue(e.target.value);
                            CONFIG[field] = e.target.value;
                            await saveConfig();
                            onclickFun();
                        },
                    },
                    Object.keys(options).map((item) =>
                        React.createElement(
                            "option",
                            {
                                value: item,
                            },
                            options[item]
                        )
                    )
                )
            )
        );
    }

    function ButtonItem({ name, color = "", onclickFun }) {
        return React.createElement(
            "button",
            {
                className: `login-button${color}`,
                onClick: async () => {
                    onclickFun();
                },
            },
            name
        );
    }

    function restartPopup() {
        let DOMcontent = React.createElement(
            "div",
            null,
            style,
            React.createElement(ButtonItem, {
                name: "Restart Now",
                color: " red",
                onclickFun: async () => {
                    await Spicetify.CosmosAsync.post("sp://desktop/v1/restart");
                },
            }),
            React.createElement(ButtonItem, {
                name: "Restart Later",
                color: " green",
                onclickFun: async () => {
                    Spicetify.PopupModal.hide();
                },
            })
        );

        Spicetify.PopupModal.display({
            title: "Restart Spotify",
            content: DOMcontent,
        });
    }

    let settingsDOMContent = React.createElement(
        "div",
        null,
        style,
        React.createElement("div", { className: "popup-row" }, React.createElement("h3", { className: "div-title" }, "Sort Options")),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "divider" }, null)),
        React.createElement(checkBoxItem, {
            name: "Last.FM My Scrobbles",
            field: "myScrobbles",
        }),
        React.createElement(checkBoxItem, {
            name: "Last.FM Play Count",
            field: "lastfmPlayCount",
        }),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "space" }, null)),
        React.createElement("div", { className: "popup-row" }, React.createElement("h3", { className: "div-title" }, "Sort Settings")),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "divider" }, null)),
        React.createElement(checkBoxItem, {
            name: "Ascending Order",
            field: "ascending",
        }),
        React.createElement(checkBoxItem, {
            name: "Add to Queue (Supports Multi-Device)",
            field: "queue",
        }),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "space" }, null)),
        React.createElement("div", { className: "popup-row" }, React.createElement("h3", { className: "div-title" }, "Create Playlist Settings")),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "divider" }, null)),
        React.createElement(checkBoxItem, {
            name: "Make Sorted Playlist Private",
            field: "isPrivate",
        }),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "space" }, null)),
        React.createElement("div", { className: "popup-row" }, React.createElement("h3", { className: "div-title" }, "Artist Sort Settings")),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "divider" }, null)),
        React.createElement(dropDownItem, {
            name: "What to Sort in Artist Page",
            field: "artistMode",
            options: {
                all: "All",
                album: "Albums",
                single: "Singles & EP",
                likedSongArtist: "Liked Songs",
                topTen: "Top 10 Songs",
            },
        }),
        React.createElement(checkBoxItem, {
            name: "Remove Duplicate Songs",
            field: "removeDuplicate",
        }),
        React.createElement(checkBoxItem, {
            name: "Chosen Artist must be Included in Tracks",
            field: "artistNameMust",
        }),
        React.createElement("div", { className: "popup-row" }, React.createElement("hr", { className: "space" }, null)),
        React.createElement(ButtonItem, {
            name: "Login with Last.FM",
            color: " green",
            onclickFun: () => {
                Spicetify.PopupModal.hide();
                setTimeout(setLastFmUsername, 300);
            },
        }),
        React.createElement(ButtonItem, {
            name: "Like on GitHub 👍",
            onclickFun: () => {
                window.open("https://github.com/Tetrax-10/Spicetify-Extensions");
            },
        })
    );

    function settingsPage() {
        Spicetify.PopupModal.display({
            title: "Sort By Play Count",
            content: settingsDOMContent,
            isLarge: true,
        });
    }

    ////////////////////////////////////// Menu ///////////////////////////////////////////

    new Spicetify.Menu.Item("Sort By Play Count", false, settingsPage).register();

    // Play Count
    function shouldAddSpotifyPlayCount(uri) {
        let uriObj = Spicetify.URI.fromString(uri[0]);
        switch (uriObj.type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
            case Type.ALBUM:
            case Type.ARTIST:
                return true;
        }
        return false;
    }

    // Popularity
    function shouldAddSpotifyPopularity(uri) {
        let uriObj = Spicetify.URI.fromString(uri[0]);
        if (CONFIG.artistMode == "topTen" && uriObj.type == Type.ARTIST) {
            return false;
        }
        switch (uriObj.type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
            case Type.ALBUM:
            case Type.ARTIST:
                return true;
        }
        return false;
    }

    // Release date
    function shouldAddSpotifyReleaseDate(uri) {
        let uriObj = Spicetify.URI.fromString(uri[0]);
        if (CONFIG.artistMode == "topTen" && uriObj.type == Type.ARTIST) {
            return false;
        }
        switch (uriObj.type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
            case Type.ARTIST:
                return true;
        }
        return false;
    }

    // Scrobbles
    function shouldAddLastFmScrobbles(uri) {
        let uriObj = Spicetify.URI.fromString(uri[0]);
        if (CONFIG.artistMode == "likedSongArtist" && uriObj.type == Type.ARTIST) {
            return true;
        }
        switch (uriObj.type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
            case Type.ALBUM:
                return true;
        }
        return false;
    }

    // My Scrobbles
    function shouldAddLastFmMyScrobbles(uri) {
        let uriObj = Spicetify.URI.fromString(uri[0]);
        if (!CONFIG.myScrobbles) {
            return false;
        }
        if (CONFIG.artistMode == "likedSongArtist" && uriObj.type == Type.ARTIST) {
            return true;
        }
        switch (uriObj.type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
            case Type.ALBUM:
                return true;
        }
        return false;
    }

    // Last.FM Play Count
    function shouldAddLastFmPlayCount(uri) {
        let uriObj = Spicetify.URI.fromString(uri[0]);
        if (!CONFIG.lastfmPlayCount) {
            return false;
        }
        if (CONFIG.artistMode == "likedSongArtist" && uriObj.type == Type.ARTIST) {
            return true;
        }
        switch (uriObj.type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
            case Type.ALBUM:
                return true;
        }
        return false;
    }

    // Right Click ContextMenu
    function shouldAddContextMenu(uri) {
        let uriObj = Spicetify.URI.fromString(uri[0]);
        switch (uriObj.type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
            case Type.ALBUM:
            case Type.ARTIST:
                return true;
        }
        return false;
    }

    let playCountItemSpotify = new Spicetify.ContextMenu.Item(
        "Play Count",
        async (rawUri) => {
            let uriInfo = rawUri[0].split(":");
            let type = uriInfo[1];
            let uri = uriInfo[2];
            await fetchAndPlay(type, uri, "playcount", "spotify", "Play Count");
        },
        shouldAddSpotifyPlayCount,
        "play"
    );

    let popularityItemSpotify = new Spicetify.ContextMenu.Item(
        "Popularity",
        async (rawUri) => {
            let uriInfo = rawUri[0].split(":");
            let type = uriInfo[1];
            let uri = uriInfo[2];
            await fetchAndPlay(type, uri, "popularity", "spotify", "Popularity");
        },
        shouldAddSpotifyPopularity,
        "heart"
    );

    let releaseDateItemSpotify = new Spicetify.ContextMenu.Item(
        "Release Date",
        async (rawUri) => {
            let uriInfo = rawUri[0].split(":");
            let type = uriInfo[1];
            let uri = uriInfo[2];
            await fetchAndPlay(type, uri, "releaseDate", "spotify", "Release Date");
        },
        shouldAddSpotifyReleaseDate,
        "list-view"
    );

    let scrobblesItemLastFM = new Spicetify.ContextMenu.Item(
        "Scrobbles",
        async (rawUri) => {
            let uriInfo = rawUri[0].split(":");
            let type = uriInfo[1];
            let uri = uriInfo[2];
            await fetchAndPlay(type, uri, "scrobbles", "lastfm", "Scrobbles");
        },
        shouldAddLastFmScrobbles,
        "volume"
    );

    let personalScrobblesItemLastFM = new Spicetify.ContextMenu.Item(
        "My Scrobbles",
        async (rawUri) => {
            if (!CONFIG.lastFmUserName) {
                await validateLocalStorage();
                return;
            }

            let uriInfo = rawUri[0].split(":");
            let type = uriInfo[1];
            let uri = uriInfo[2];
            await fetchAndPlay(type, uri, "personalScrobbles", "lastfm", "My Scrobbles");
        },
        shouldAddLastFmMyScrobbles,
        "artist"
    );

    let playCountItemLastFM = new Spicetify.ContextMenu.Item(
        "Last.FM Play Count",
        async (rawUri) => {
            let uriInfo = rawUri[0].split(":");
            let type = uriInfo[1];
            let uri = uriInfo[2];
            await fetchAndPlay(type, uri, "playcount", "lastfm", "Last.FM Play Count");
        },
        shouldAddLastFmPlayCount,
        "subtitles"
    );

    new Spicetify.ContextMenu.SubMenu("Sort by", [playCountItemSpotify, popularityItemSpotify, releaseDateItemSpotify, scrobblesItemLastFM, personalScrobblesItemLastFM, playCountItemLastFM], shouldAddContextMenu, false).register();

    new Spicetify.Topbar.Button("Add Sorted Songs to Playlist", "plus2px", createSortedPlaylist);

    ////////////////////////////////////// Fetchers ///////////////////////////////////////////

    async function createPlaylist(name, tracks, parentFolderURI = null) {
        return await Spicetify.CosmosAsync.post("sp://core-playlist/v1/rootlist", {
            operation: "create",
            playlist: true,
            uris: tracks,
            name: name,
            after: parentFolderURI,
        });
    }

    async function makePlaylistPrivate(uri) {
        setTimeout(async () => {
            await Spicetify.CosmosAsync.post(`sp://core-playlist/v1/playlist/${uri}/set-base-permission`, {
                permission_level: "BLOCKED",
            });
        }, 1000);
    }

    async function createFolder(name) {
        await Spicetify.Platform.RootlistAPI.createFolder(name, { before: "" });
    }

    async function isFolderCreated(folderName) {
        let root = await Spicetify.Platform.RootlistAPI.getContents();
        let folder = await root.items.find((item) => item.type === "folder" && item.name === folderName);
        return (await folder) ? folder.uri : false;
    }

    let name = "playlist";
    function createItemName(itemName, platform, mode, type) {
        let time = CONFIG.ascending ? "Oldest" : "Latest";
        let personal = mode == "personalScrobbles" ? "My " : "";
        let order = CONFIG.ascending ? "Least" : "Most";
        let like = CONFIG.artistMode == "likedSongArtist" ? "Liked " : "";
        let naming = platform == "spotify" ? (mode == "playcount" ? "Played" : "Popular") : mode == "scrobbles" ? "Scrobbled" : "Played";

        switch (type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
                if (mode == "releaseDate") {
                    name = `${time} Songs from ${itemName}`;
                    break;
                }
                name = `${personal}${order} ${naming} Songs from ${itemName}`;
                break;

            case Type.ARTIST:
                if (mode == "releaseDate") {
                    name = `${time} ${like}Songs from ${itemName}`;
                    break;
                }
                if (CONFIG.artistMode == "topTen") {
                    name = `Top 10 Songs of ${itemName}`;
                    break;
                }
                if (CONFIG.artistMode == "single") {
                    name = `${order} ${naming} Singles from ${itemName}`;
                    break;
                }
                if (CONFIG.artistMode == "album") {
                    name = `${order} ${naming} Album Songs from ${itemName}`;
                    break;
                }
                if (CONFIG.artistMode == "likedSongArtist") {
                    name = `${personal}${order} ${naming} Liked Songs from ${itemName}`;
                    break;
                }
                name = `${order} ${naming} Songs from ${itemName}`;
                break;
            case Type.ALBUM:
                name = `${personal}${order} ${naming} Songs from ${itemName} Album`;
                break;
        }
    }

    async function createSortedPlaylist() {
        let folderURI = await isFolderCreated(sortedFolderName);
        if (folderURI) {
            try {
                let playlistSongs = sortedSongs.filter((item) => item.link != "spotify:delimiter").map((item) => item.link);
                let { uri } = await createPlaylist(name, playlistSongs, folderURI);
                if (CONFIG.isPrivate) {
                    await makePlaylistPrivate(uri);
                }
                notification("Playlist Created");
            } catch {
                notification("Sort some Songs to Create a playlist");
            }
        } else {
            createFolder(sortedFolderName);
            createSortedPlaylist();
        }
    }

    // Sort by "Play Count" or "Popularity" in Playlist Page - Platform Spotify
    async function fetchPlaylistTracksSpotify(uri, mode, name, type, platform) {
        let playlistRes = await Spicetify.CosmosAsync.get(`sp://core-playlist/v1/playlist/spotify:playlist:${uri}/rows`);

        let trackHistory = [];
        let allTracks = [];
        let filteredTrack = [];

        let totalTrackCount = playlistRes.rows.length ? playlistRes.rows.length : 0;

        if (totalTrackCount) {
            let currentTrack = 0;
            createItemName((await Spicetify.Platform.PlaylistAPI.getMetadata(`spotify:playlist:${uri}`)).name, platform, mode, type);

            for (let playlistTrack of playlistRes.rows) {
                if (mode != "popularity") {
                    currentTrack++;
                    notification(`${currentTrack} / ${totalTrackCount} Songs`);
                    if (playlistTrack.link.split(":")[1] == "track" && playlistTrack.playable && !playlistTrack.isLocal && !trackHistory.includes(playlistTrack.album.link)) {
                        let albumRes = await Spicetify.CosmosAsync.get(`wg://album/v1/album-app/album/${playlistTrack.album.link.split(":")[2]}/desktop`);
                        for (let tracks of albumRes.discs) {
                            for (let track of tracks.tracks) {
                                allTracks.push(track);
                                trackHistory.push(playlistTrack.album.link);
                            }
                        }
                    }

                    for (let track of allTracks) {
                        if (playlistTrack.link == track.uri && track[mode]) {
                            filteredTrack.push({ playcount: track.playcount, popularity: track.popularity, link: track.uri, name: track.name, artist: track.artists[0].name });
                        }
                    }
                } else {
                    if (playlistTrack.link.split(":")[1] == "track" && !playlistTrack.isLocal && playlistTrack.playable && playlistTrack.popularity) {
                        filteredTrack.push({ popularity: playlistTrack.popularity, link: playlistTrack.link, name: playlistTrack.name, artist: playlistTrack.artists[0].name });
                    }
                }
            }
        } else {
            notification(`${name} data not available! Try other options`);
            return [];
        }

        return filteredTrack;
    }

    // Sort by "Release Date" in Playlist Page and Artist Page (liked songs) - Platform Spotify API
    async function fetchPlaylistTracksReleaseDateSpotifyAPI(uri = null, source = null, mode = null, type = null, platform = null) {
        let playlistRes;
        let totalTrackCount;
        if (source) {
            playlistRes = source;
            totalTrackCount = source.length;
        } else {
            playlistRes = (await Spicetify.CosmosAsync.get(`sp://core-playlist/v1/playlist/spotify:playlist:${uri}/rows`)).rows;
            totalTrackCount = playlistRes.length ? playlistRes.length : 0;
        }
        createItemName((await Spicetify.Platform.PlaylistAPI.getMetadata(`spotify:playlist:${uri}`)).name, platform, mode, type);

        let resRawArray = [];

        if (totalTrackCount) {
            let idString = "";
            let count = 0;

            for (let track of playlistRes) {
                let info = track.link.split(":");
                if (track.playable && !track.isLocal && info[1] == "track") {
                    if (count) {
                        idString += ",";
                    }
                    idString += info[2];
                    count++;
                    if (count == 50) {
                        idString += "|";
                        count = 0;
                    }
                }
            }

            let requestArray = idString ? idString.split("|") : [];

            for (let apiString of requestArray) {
                if (apiString.length) {
                    let rawRes = await Spicetify.CosmosAsync.get(`https://api.spotify.com/v1/tracks?ids=${apiString}`);
                    for (let track of rawRes.tracks) {
                        if (track.album.release_date) {
                            resRawArray.push({ releaseDate: track.album.release_date, link: track.uri, name: track.name, artist: track.artists[0].name });
                        }
                    }
                }
            }
        } else {
            notification("Release Date data not available! Try other options");
            return [];
        }

        return resRawArray;
    }

    let artistFetchTypeCount = { album: 0, single: 0 };

    // scans every single songs from album or singles and creates valid object for sortByModeForQueue
    async function scanForTracksFromAlbums(res, allCount, artistName, mode, type) {
        let allTracks = [];

        for (let albums of res) {
            let albumsRes;

            try {
                if (albums.discs) {
                    albumsRes = albums;
                } else {
                    albumsRes = await Spicetify.CosmosAsync.get(`wg://album/v1/album-app/album/${albums.uri}/desktop`);
                }
            } catch (error) {}

            artistFetchTypeCount[type]++;
            notification(`${artistFetchTypeCount[type]} / ${allCount} ${type}s`);

            let releaseDate = `${albumsRes.year ? albumsRes.year : ""}${albumsRes.month ? "-" + albumsRes.month : ""}${albumsRes.day ? "-" + albumsRes.day : ""}`;

            for (let disc of albumsRes.discs) {
                for (let track of disc.tracks) {
                    let condition = true;
                    if (CONFIG.artistNameMust) {
                        let artists = track.artists.map((artist) => artist.name);
                        if (!artists.includes(artistName)) {
                            condition = false;
                        }
                    }

                    mode = mode == "releaseDate" ? "uri" : mode;
                    if (track.playable && track[mode] && condition) {
                        allTracks.push({
                            playcount: track.playcount,
                            popularity: track.popularity,
                            duration: track.duration,
                            link: track.uri,
                            name: track.name,
                            artist: track.artists[0].name,
                            releaseDate: releaseDate,
                        });
                    }
                }
            }
        }

        return allTracks;
    }

    // Fetch Artist all albums songs or all singles songs or even both - Platform Spotify
    async function fetchArtistTracksSpotify(uri, mode, name, type, platform) {
        let artistRes = await Spicetify.CosmosAsync.get(`wg://artist/v1/${uri}/desktop?format=json`);

        let artistName = artistRes.info.name;

        let artistAlbums = artistRes.releases.albums;
        let artistSingles = artistRes.releases.singles;

        let allArtistAlbumsTracks = [];
        let allArtistSinglesTracks = [];

        let allAlbumsCount = artistAlbums.total_count;
        let allSinglesCount = artistSingles.total_count;

        if (allAlbumsCount != 0 && CONFIG.artistMode != "single") {
            allArtistAlbumsTracks = await scanForTracksFromAlbums(artistAlbums.releases, allAlbumsCount, artistName, mode, "album");
        }

        if (allSinglesCount != 0 && CONFIG.artistMode != "album") {
            allArtistSinglesTracks = await scanForTracksFromAlbums(artistSingles.releases, allSinglesCount, artistName, mode, "single");
        }

        let allArtistTracks = allArtistAlbumsTracks.concat(allArtistSinglesTracks);

        if (!allArtistTracks.length) {
            notification(`${name} data not available! Try other options`);
            return [];
        }

        if (CONFIG.removeDuplicate) {
            // sort the Songs by popularity so the original song will be on top of the array when compared to its duplicate songs
            allArtistTracks = await sortByMode(allArtistTracks, "popularity", false);

            // Duplicate songs will have same playcount and duration buy different popularity.
            // Song with higher popularity will be listed on top while searching a song in spotify while duplicate once (low popularity) will be below.
            // So this fill remove all songs that have same playcount and duration except the first occurrence.
            // as we have sorted songs by popularity the original will be on top
            allArtistTracks = allArtistTracks.filter((track_, index, array) => array.findIndex((track) => (track.playcount == track_.playcount && track.duration == track_.duration) || track.name == track_.name || track.playcount == track_.playcount) == index);
        }

        createItemName(artistRes.info.name, platform, mode, type);

        return allArtistTracks;
    }

    // Artist Page liked songs sort - Platform Spotify
    async function fetchArtistLikedTracksSpotify(uri, mode, name, type, platform) {
        let artistRes = await Spicetify.CosmosAsync.get(`sp://core-collection/unstable/@/list/tracks/artist/${uri}?responseFormat=protobufJson`);

        let trackHistory = [];
        let allTracks = [];
        let filteredTrack = [];
        let unFilteredTrack = [];

        let totalTrackCount = artistRes.item ? (artistRes.item.length ? artistRes.item.length : 0) : null;

        if (totalTrackCount) {
            createItemName((await Spicetify.CosmosAsync.get(`https://api.spotify.com/v1/artists/${uri}`)).name, platform, mode, type);
            for (let artistTrack of artistRes.item) {
                let currentTrack = 0;

                if (mode == "playcount") {
                    currentTrack++;
                    notification(`${currentTrack} / ${totalTrackCount} Songs`);

                    let artistTrackMetaData = artistTrack.trackMetadata;

                    if (artistTrackMetaData.playable && !artistTrackMetaData.isLocal && !trackHistory.includes(artistTrackMetaData.album.link)) {
                        let albumRes = await Spicetify.CosmosAsync.get(`wg://album/v1/album-app/album/${artistTrackMetaData.album.link.split(":")[2]}/desktop`);

                        for (let tracks of albumRes.discs) {
                            for (let track of tracks.tracks) {
                                allTracks.push(track);
                                trackHistory.push(await artistTrackMetaData.album.link);
                            }
                        }
                    }

                    for (let track of allTracks) {
                        if (artistTrackMetaData.link == track.uri && track.playcount) {
                            filteredTrack.push({ playcount: track.playcount, popularity: track.popularity, link: track.uri, name: track.name, artist: track.artists[0].name });
                        }
                    }
                } else if (mode == "popularity") {
                    let playlistTrack = artistTrack.trackMetadata;

                    if (playlistTrack.link.split(":")[1] == "track" && !playlistTrack.isLocal && playlistTrack.playable && playlistTrack.popularity) {
                        filteredTrack.push({ popularity: playlistTrack.popularity, link: playlistTrack.link, name: playlistTrack.name, artist: playlistTrack.artist[0].name });
                    }
                } else {
                    unFilteredTrack.push(artistTrack.trackMetadata);
                }
            }
            if (mode == "releaseDate") {
                filteredTrack = await fetchPlaylistTracksReleaseDateSpotifyAPI(null, unFilteredTrack);
            }
        } else {
            notification(`${name} data not available! Try other options`);
            return [];
        }

        return filteredTrack;
    }

    // Artist Page Top 10 Songs sort - Platform Spotify
    async function fetchArtistTopTenTracksSpotify(uri, mode, type, platform) {
        let artistRes = await Spicetify.CosmosAsync.get(`wg://artist/v1/${uri}/desktop?format=json`);

        let topTenTracks = [];

        createItemName(artistRes.info.name, platform, mode, type);

        artistRes.top_tracks.tracks.map((track) => {
            if (track.playcount) {
                topTenTracks.push({ playcount: track.playcount, link: track.uri, name: track.name, artist: artistRes.info.name });
            }
        });

        if (topTenTracks.length == 0) {
            notification("Play Count data not available!");
            return [];
        }

        return topTenTracks;
    }

    // Sort Songs in Album Page - Platform Spotify
    async function fetchAlbumTracksSpotify(uri, mode, name, type, platform) {
        let res = await Spicetify.CosmosAsync.get(`wg://album/v1/album-app/album/${uri}/desktop`);
        let availables = [];

        createItemName(res.name, platform, mode, type);

        for (let disc of res.discs) {
            disc.tracks.forEach((track) => {
                if (track.playable) {
                    availables.push(track);
                }
            });
        }

        let unsortedArray = availables
            .filter((track) => track.playable && track[mode])
            .map(async (track) => {
                return { playcount: track.playcount, popularity: track.popularity, link: track.uri, name: track.name, artist: track.artists[0].name };
            });

        if (unsortedArray.length == 0) {
            notification(`${name} data not available! Try other options`);
            return [];
        }

        return Promise.all(unsortedArray);
    }

    // get data from Last.FM
    async function fetchTrackInfoFromLastFM(artist, trackName, lastFmUsername) {
        let url = `https://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=${LFMApiKey}&artist=${encodeURIComponent(artist)}&track=${encodeURIComponent(trackName)}&format=json&username=${encodeURIComponent(lastFmUsername)}`;

        try {
            let initialRequest = await fetch(url);
            let response = await initialRequest.json();
            return response;
        } catch (error) {}
    }

    // Last.FM data to valid object for sortByModeForQueue
    async function createDataFromATrack(track, mode, type = "") {
        let artistName = "";
        let link = "";

        if (type) {
            link = track.link;
            artistName = track.artist[0].name;
        } else {
            link = track.uri;
            artistName = track.artists[0].name;
        }

        let trackInfo = await fetchTrackInfoFromLastFM(artistName, track.name, CONFIG.lastFmUserName);

        if (mode == "scrobbles") {
            mode = "listeners";
        }
        if (mode == "personalScrobbles") {
            mode = "userplaycount";
        }

        try {
            if (await trackInfo.message) {
                return null;
            }
        } catch (error) {}

        try {
            if (await trackInfo.track) {
                if (trackInfo.track[mode]) {
                    return {
                        playcount: trackInfo.track.listeners ? trackInfo.track.listeners : -1,
                        scrobbles: trackInfo.track.playcount ? trackInfo.track.playcount : -1,
                        personalScrobbles: trackInfo.track.userplaycount ? trackInfo.track.userplaycount : -1,
                        link: link,
                        name: track.name,
                        artist: artistName,
                    };
                }
            }
        } catch (error) {}

        return null;
    }

    // Sort by "Scrobbles", "My Scrobbles" and "Last.FM Play Count" in Playlist Page - platform last.FM
    async function fetchPlaylistTracksLastfm(uri, mode, name, type, platform) {
        let res = await Spicetify.Platform.PlaylistAPI.getContents(`spotify:playlist:${uri}`);

        let totalTrackCount = res.items.length ? res.items.length : 0;

        let unsortedArray;

        if (totalTrackCount) {
            createItemName((await Spicetify.Platform.PlaylistAPI.getMetadata(`spotify:playlist:${uri}`)).name, platform, mode, type);

            unsortedArray = await res.items.filter((track) => track.type == "track" && track.isPlayable && !track.isLocal).map(async (track) => await createDataFromATrack(track, mode));
        }

        if (!totalTrackCount || (await unsortedArray.length) == 0 || (await unsortedArray[0]) == null) {
            notification(`${name} data not available! Try other options`);
            return [];
        }

        return Promise.all(unsortedArray);
    }

    // Sort Liked Songs by "Scrobbles", "My Scrobbles" and "Last.FM Play Count" in Artist Page - platform last.FM
    async function fetchArtistLikedTracksLastfm(uri, mode, name, type, platform) {
        let res = await Spicetify.CosmosAsync.get(`sp://core-collection/unstable/@/list/tracks/artist/${uri}?responseFormat=protobufJson`);

        let totalTrackCount = res.item.length ? res.item.length : 0;
        let unsortedArray;

        if (totalTrackCount) {
            createItemName((await Spicetify.CosmosAsync.get(`https://api.spotify.com/v1/artists/${uri}`)).name, platform, mode, type);

            unsortedArray = await res.item.filter((artistTrack) => artistTrack.trackMetadata.playable && !artistTrack.trackMetadata.isLocal).map(async (artistTrack) => await createDataFromATrack(artistTrack.trackMetadata, mode, "artist"));
        }

        if (!totalTrackCount || (await unsortedArray.length) == 0 || (await unsortedArray[0]) == null) {
            notification(`${name} data not available! Try other options`);
            return [];
        }

        return Promise.all(unsortedArray);
    }

    // Sort Songs in Album Page - Platform Last.FM
    async function fetchAlbumTracksLastfm(uri, mode, name, type, platform) {
        let res = await Spicetify.CosmosAsync.get(`wg://album/v1/album-app/album/${uri}/desktop`);
        let availables;

        createItemName(res.name, platform, mode, type);

        for (let disc of res.discs) {
            availables = disc.tracks.filter((track) => track.playable);
        }

        let unsortedArray = await availables.filter((track) => track.playable).map(async (track) => await createDataFromATrack(track, mode));

        if ((await unsortedArray.length) == 0 || (await unsortedArray[0]) == null) {
            notification(`${name} data not available! Try other options`);
            return [];
        }

        return Promise.all(unsortedArray);
    }

    /////////////////////////////////// SORT AND QUEUE ///////////////////////////////////////

    let sortedSongs;
    async function sortByMode(unsortedArray, mode, enableReverse = true) {
        let sortedArray;

        if (mode == "releaseDate") {
            sortedArray = await unsortedArray.sort((track1, track2) => (track1.releaseDate < track2.releaseDate ? 1 : -1));
        } else {
            sortedArray = await unsortedArray.filter((track) => track).sort((track1, track2) => track2[mode] - track1[mode]);
        }

        if (CONFIG.ascending && enableReverse) {
            await sortedArray.reverse();
        }
        sortedSongs = await sortedArray;

        // console.log(mode, await sortedArray); // uncomment to see what you gonna hear
        return await sortedArray;
    }

    async function formatForQueue(sortedArray) {
        sortedArray.push({ link: "spotify:delimiter" });

        sortedArray = sortedArray.map((item) => ({
            uri: item.link,
            provider: CONFIG.queue ? "queue" : "context",
            metadata: {
                is_queued: CONFIG.queue ? "true" : "false",
            },
        }));

        return await sortedArray;
    }

    async function addToQueue(sortedArray, context, type, mode, platform) {
        let count = sortedArray.length - 1;
        if (count == 0) {
            return;
        }

        await Spicetify.Platform.PlayerAPI.clearQueue();

        await Spicetify.CosmosAsync.put("sp://player/v2/main/queue", {
            queue_revision: Spicetify.Queue?.queueRevision,
            next_tracks: sortedArray,
            prev_tracks: Spicetify.Queue?.prevTracks,
        });

        if (!CONFIG.queue) {
            await Spicetify.CosmosAsync.post("sp://player/v2/main/update", {
                context: {
                    uri: context,
                    url: `context://${context}`,
                },
            });
        }

        Spicetify.Player.next();

        let time = CONFIG.ascending ? "Oldest" : "Latest";
        let personal = mode == "personalScrobbles" ? "Your " : "";
        let order = CONFIG.ascending ? "Least" : "Most";
        let like = CONFIG.artistMode == "likedSongArtist" ? "Liked " : "";
        let naming = platform == "spotify" ? (mode == "playcount" ? "Played" : "Popular") : mode == "scrobbles" ? "Scrobbled" : "Played";

        switch (type) {
            case Type.PLAYLIST:
            case Type.PLAYLIST_V2:
                if (mode == "releaseDate") {
                    notification(`${time} ${count} Songs`);
                    break;
                }
                notification(`${personal}${order} ${naming} ${count} Songs`);
                break;

            case Type.ARTIST:
                if (mode == "releaseDate") {
                    notification(`${time} ${count} ${like}Songs`);
                    break;
                }
                if (CONFIG.artistMode == "topTen") {
                    let order = CONFIG.ascending ? "Least" : "Most";
                    notification(`${order} Played Top 10 Songs`);
                    break;
                }
                if (CONFIG.artistMode == "single") {
                    notification(`Sorted ${artistFetchTypeCount.single} Singles, Totally ${count} Songs`);
                    break;
                }
                if (CONFIG.artistMode == "album") {
                    notification(`Sorted ${artistFetchTypeCount.album} Albums, Totally ${count} Songs`);
                    break;
                }
                if (CONFIG.artistMode == "likedSongArtist") {
                    notification(`${personal}${order} ${naming} ${count} Liked Songs`);
                    break;
                }
                notification(`Sorted ${artistFetchTypeCount.album} Albums, ${artistFetchTypeCount.single} Singles, Totally ${count} Songs`);
                break;
            case Type.ALBUM:
                notification(`${personal}${order} ${naming} ${count} Songs`);
                break;
        }

        artistFetchTypeCount.album = 0;
        artistFetchTypeCount.single = 0;
    }

    ////////////////////////////////////// MAIN /////////////////////////////////////////

    async function fetchAndPlay(type, uri, mode, platform, name) {
        try {
            let list;

            switch (type + platform) {
                case Type.PLAYLIST + "spotify":
                case Type.PLAYLIST_V2 + "spotify":
                    if (mode == "releaseDate") {
                        list = await fetchPlaylistTracksReleaseDateSpotifyAPI(uri, null, mode, type, platform);
                        break;
                    }
                    list = await fetchPlaylistTracksSpotify(uri, mode, name, type, platform);
                    break;

                case Type.PLAYLIST + "lastfm":
                case Type.PLAYLIST_V2 + "lastfm":
                    list = await fetchPlaylistTracksLastfm(uri, mode, name, type, platform);
                    break;

                case Type.ARTIST + "spotify":
                    if (CONFIG.artistMode == "likedSongArtist") {
                        list = await fetchArtistLikedTracksSpotify(uri, mode, name, type, platform);
                        break;
                    }
                    if (CONFIG.artistMode == "topTen") {
                        list = await fetchArtistTopTenTracksSpotify(uri, mode, type, platform);
                        break;
                    }
                    list = await fetchArtistTracksSpotify(uri, mode, name, type, platform);
                    break;

                case Type.ARTIST + "lastfm":
                    list = await fetchArtistLikedTracksLastfm(uri, mode, name, type, platform);
                    break;

                case Type.ALBUM + "spotify":
                    list = await fetchAlbumTracksSpotify(uri, mode, name, type, platform);
                    break;

                case Type.ALBUM + "lastfm":
                    list = await fetchAlbumTracksLastfm(uri, mode, name, type, platform);
                    break;
            }

            if (!list.length) {
                return;
            }

            let sortedSongs = await sortByMode(list, mode);
            let queueList = await formatForQueue(await sortedSongs);

            await addToQueue(await queueList, `spotify:${type}:${uri}`, type, mode, platform);
        } catch (error) {
            notification(`${error}`);
            console.log(error);
        }
    }
})();
