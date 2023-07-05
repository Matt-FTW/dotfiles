// NAME: History Shortcut
// AUTHOR: einzigartigerName
// DESCRIPTION: Adds a Shortcut to your Listening History to the Sidebar

(function HistoryShortcut() {

    const { CosmosAPI, Player, LocalStorage, PlaybackControl, ContextMenu, URI } = Spicetify
    if (!(CosmosAPI && Player && LocalStorage && PlaybackControl && ContextMenu && URI)) {
        setTimeout(HistoryShortcut, 300)
        return
    }

    const ITEM_LABEL = "History"

    const HISTORY_DIV_CLASS         = "SidebarListItem"
    const HISTORY_DIV_CLASS_ACTIVE  = "SidebarListItem SidebarListItem--is-active"

    const HISTORY_ANKER_CLASS        = "SidebarListItemLink SidebarListItemLink--tall spoticon-time-24"
    const HISTORY_ANKER_CLASS_ACTIVE = "SidebarListItemLink SidebarListItemLink--is-highlighted SidebarListItemLink--tall spoticon-time-24"

    let historyItem = createHistoyItem()
    // Get Sidebar Lists
    var topicList = document.querySelector("#view-navigation-bar > div > div.LeftSidebar__section > div > ul")
    if (topicList) {
        // Add to first in list
        // On default layout this would be the Home/Browse/Radio List
        topicList.appendChild(historyItem.div)
    } else {
        return
    }

    const toCheckMutate = document.getElementById('view-content');
    const config = { attributes: true, childList: true, subtree: true };

    let observerCallback = function(_, _) {
        appQueue = document.getElementById("app-queue")
        if (!appQueue){ return }
        
        if (appQueue.getAttribute("class") === "active"
            && appQueue.getAttribute("data-app-uri") === "spotify:app:queue:history"
        ) {
            onClickHistory()
        } else {
            onLeaveHistory()
        }
    };

    let observer = new MutationObserver(observerCallback)
    observer.observe(toCheckMutate, config)

    

    // Deactivate Active Status for History Item
    function onLeaveHistory() {
        historyItem.div.setAttribute("class",HISTORY_DIV_CLASS)
        historyItem.anker.setAttribute("class", HISTORY_ANKER_CLASS)
    }

    // Activate Active Status for History Item
    function onClickHistory() {
        historyItem.div.setAttribute("class", HISTORY_DIV_CLASS_ACTIVE)
        historyItem.anker.setAttribute("class", HISTORY_ANKER_CLASS_ACTIVE)
    }

    // Construct the List Item
    function createHistoyItem() {
        /* List Item
        *  <li class="SidebarListItem">
        */
        let listItem = document.createElement("li")
        listItem.setAttribute("class", HISTORY_DIV_CLASS)

        /* Outer Div Element
        *  <div class="DropTarget SidebarListItem__drop-target DropTarget--tracks DropTarget--albums DropTarget--artists DropTarget--playlists">
        */
        let outer = document.createElement("div")
        outer.setAttribute("class", "DropTarget SidebarListItem__drop-target")

        /* Middle Div Element
        *  <div class="SidebarListItem__inner">
        */
        let inner = document.createElement("div")
        inner.setAttribute("class", "SidebarListItem__inner")

        /* Link Div Element
        *  <div class="SidebarListItem__link">
        */
        let link = document.createElement("div")
        link.setAttribute("class", "SidebarListItem__link")

        /* Anker
        * <a class="SidebarListItemLink SidebarListItemLink--tall spoticon-time-24"
        *    draggable="false"
        *    href="spotify:app:queue:history"
        *    data-sidebar-list-item-uri="spotify:app:queue:history"
        *    data-ta-id="sidebar-list-item-link">
        */
        anker = document.createElement("a")
        anker.setAttribute("class", HISTORY_ANKER_CLASS)
        anker.setAttribute("draggable", "false")
        anker.setAttribute("href", "spotify:app:queue:history")
        anker.setAttribute("data-sidebar-list-item-uri", "spotify:app:queue:history")
        anker.setAttribute("data-ta-id", "sidebar-list-item-link")

        /* Item Text
        *  <span class="SidebarListItem__label"
        *        dir="auto">
        *            History
        *  </span>
        */
        span = document.createElement("span")
        span.setAttribute("class", "SidebarListItem__label")
        span.setAttribute("dir", "auto")
        span.textContent = ITEM_LABEL


        anker.appendChild(span)
        link.appendChild(anker)
        inner.appendChild(link)
        outer.appendChild(inner)
        listItem.appendChild(outer)

        listItem.addEventListener("click", onClickHistory)

        return {div: listItem, anker: anker}
    }
})();
