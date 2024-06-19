(async function() {
          while (!Spicetify.React || !Spicetify.ReactDOM) {
            await new Promise(resolve => setTimeout(resolve, 10));
          }
          "use strict";
var stats = (() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
  var __copyProps = (to, from, except, desc) => {
    if (from && typeof from === "object" || typeof from === "function") {
      for (let key of __getOwnPropNames(from))
        if (!__hasOwnProp.call(to, key) && key !== except)
          __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
    }
    return to;
  };
  var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
    isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
    mod
  ));
  var __publicField = (obj, key, value) => {
    __defNormalProp(obj, typeof key !== "symbol" ? key + "" : key, value);
    return value;
  };

  // external-global-plugin:react
  var require_react = __commonJS({
    "external-global-plugin:react"(exports, module) {
      module.exports = Spicetify.React;
    }
  });

  // src/extensions/extension.tsx
  var import_react15 = __toESM(require_react());

  // src/pages/playlist.tsx
  var import_react12 = __toESM(require_react());

  // src/components/cards/stat_card.tsx
  var import_react = __toESM(require_react());
  function formatValue(name, value) {
    switch (name) {
      case "tempo":
        return `${Math.round(value)} bpm`;
      case "popularity":
        return `${Math.round(value)} %`;
      default:
        return `${Math.round(value * 100)} %`;
    }
  }
  function normalizeString(inputString) {
    return inputString.charAt(0).toUpperCase() + inputString.slice(1).toLowerCase();
  }
  function StatCard(props) {
    const { TextComponent } = Spicetify.ReactComponent;
    const { label, value } = props;
    return /* @__PURE__ */ import_react.default.createElement("div", {
      className: "main-card-card"
    }, /* @__PURE__ */ import_react.default.createElement(TextComponent, {
      as: "div",
      semanticColor: "textBase",
      variant: "alto",
      children: typeof value === "number" ? formatValue(label, value) : value
    }), /* @__PURE__ */ import_react.default.createElement(TextComponent, {
      as: "div",
      semanticColor: "textBase",
      variant: "balladBold",
      children: normalizeString(label)
    }));
  }
  var stat_card_default = StatCard;

  // src/components/cards/genres_card.tsx
  var import_react2 = __toESM(require_react());
  var genreLine = (name, value, limit, total) => {
    return /* @__PURE__ */ import_react2.default.createElement("div", {
      className: "stats-genreRow"
    }, /* @__PURE__ */ import_react2.default.createElement("div", {
      className: "stats-genreRowFill",
      style: {
        width: `calc(${value / limit * 100}% + ${(limit - value) / (limit - 1) * 100}px)`
      }
    }, /* @__PURE__ */ import_react2.default.createElement("span", {
      className: "stats-genreText"
    }, name)), /* @__PURE__ */ import_react2.default.createElement("span", {
      className: "stats-genreValue"
    }, Math.round(value / total * 100) + "%"));
  };
  var genreLines = (genres, total) => {
    return genres.map(([genre, value]) => {
      return genreLine(genre, value, genres[0][1], total);
    });
  };
  var genresCard = ({ genres, total }) => {
    const genresArray = genres.sort(([, a], [, b]) => b - a).slice(0, 10);
    return /* @__PURE__ */ import_react2.default.createElement("div", {
      className: `main-card-card stats-genreCard`
    }, genreLines(genresArray, total));
  };
  var genres_card_default = genresCard;

  // ../library/src/components/collection_menu.tsx
  var import_react5 = __toESM(require_react());

  // ../library/src/components/text_input_dialog.tsx
  var import_react3 = __toESM(require_react());
  var TextInputDialog = (props) => {
    const { ButtonPrimary } = Spicetify.ReactComponent;
    const { def, placeholder, onSave } = props;
    const [value, setValue] = import_react3.default.useState(def);
    const onSubmit = (e) => {
      e.preventDefault();
      Spicetify.PopupModal.hide();
      onSave(value);
    };
    return /* @__PURE__ */ import_react3.default.createElement(import_react3.default.Fragment, null, /* @__PURE__ */ import_react3.default.createElement("form", {
      className: "text-input-form",
      onSubmit
    }, /* @__PURE__ */ import_react3.default.createElement("label", {
      className: "text-input-wrapper"
    }, /* @__PURE__ */ import_react3.default.createElement("input", {
      className: "text-input",
      type: "text",
      value,
      placeholder,
      onChange: (e) => setValue(e.target.value)
    })), /* @__PURE__ */ import_react3.default.createElement("button", {
      type: "submit",
      "data-encore-id": "buttonPrimary",
      className: "Button-sc-qlcn5g-0 Button-small-buttonPrimary"
    }, /* @__PURE__ */ import_react3.default.createElement("span", {
      className: "ButtonInner-sc-14ud5tc-0 ButtonInner-small encore-bright-accent-set"
    }, "Save"))));
  };
  var text_input_dialog_default = TextInputDialog;

  // ../library/src/components/leading_icon.tsx
  var import_react4 = __toESM(require_react());
  var LeadingIcon = ({ path }) => {
    return /* @__PURE__ */ import_react4.default.createElement(Spicetify.ReactComponent.IconComponent, {
      semanticColor: "textSubdued",
      dangerouslySetInnerHTML: {
        __html: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">${path}</svg>`
      },
      iconSize: 16
    });
  };
  var leading_icon_default = LeadingIcon;

  // ../library/src/components/collection_menu.tsx
  var editIconPath = '<path d="M11.838.714a2.438 2.438 0 0 1 3.448 3.448l-9.841 9.841c-.358.358-.79.633-1.267.806l-3.173 1.146a.75.75 0 0 1-.96-.96l1.146-3.173c.173-.476.448-.909.806-1.267l9.84-9.84zm2.387 1.06a.938.938 0 0 0-1.327 0l-9.84 9.842a1.953 1.953 0 0 0-.456.716L2 14.002l1.669-.604a1.95 1.95 0 0 0 .716-.455l9.841-9.841a.938.938 0 0 0 0-1.327z"></path>';
  var deleteIconPath = '<path d="M8 1.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"></path><path d="M12 8.75H4v-1.5h8v1.5z"></path>';
  var CollectionMenu = ({ id }) => {
    const { Menu, MenuItem } = Spicetify.ReactComponent;
    const deleteCollection = () => {
      SpicetifyLibrary.CollectionWrapper.deleteCollection(id);
    };
    const renameCollection = () => {
      const name = SpicetifyLibrary.CollectionWrapper.getCollection(id).name;
      const rename = (newName) => {
        SpicetifyLibrary.CollectionWrapper.renameCollection(id, newName);
      };
      Spicetify.PopupModal.display({
        title: "Rename Collection",
        content: /* @__PURE__ */ import_react5.default.createElement(text_input_dialog_default, {
          def: name,
          onSave: rename
        })
      });
    };
    const image = SpicetifyLibrary.CollectionWrapper.getCollection(id).imgUrl;
    const setCollectionImage = () => {
      const setImg = (imgUrl) => {
        SpicetifyLibrary.CollectionWrapper.setCollectionImage(id, imgUrl);
      };
      Spicetify.PopupModal.display({
        title: "Set Collection Image",
        content: /* @__PURE__ */ import_react5.default.createElement(text_input_dialog_default, {
          def: image,
          placeholder: "Image URL",
          onSave: setImg
        })
      });
    };
    const removeImage = () => {
      SpicetifyLibrary.CollectionWrapper.removeCollectionImage(id);
    };
    return /* @__PURE__ */ import_react5.default.createElement(Menu, null, /* @__PURE__ */ import_react5.default.createElement(MenuItem, {
      leadingIcon: /* @__PURE__ */ import_react5.default.createElement(leading_icon_default, {
        path: editIconPath
      }),
      onClick: renameCollection
    }, "Rename"), /* @__PURE__ */ import_react5.default.createElement(MenuItem, {
      leadingIcon: /* @__PURE__ */ import_react5.default.createElement(leading_icon_default, {
        path: deleteIconPath
      }),
      onClick: deleteCollection
    }, "Delete"), /* @__PURE__ */ import_react5.default.createElement(MenuItem, {
      leadingIcon: /* @__PURE__ */ import_react5.default.createElement(leading_icon_default, {
        path: editIconPath
      }),
      onClick: setCollectionImage
    }, "Set Collection Image"), image && /* @__PURE__ */ import_react5.default.createElement(MenuItem, {
      leadingIcon: /* @__PURE__ */ import_react5.default.createElement(leading_icon_default, {
        path: deleteIconPath
      }),
      onClick: removeImage
    }, "Remove Collection Image"));
  };
  var collection_menu_default = CollectionMenu;

  // ../library/src/components/folder_menu.tsx
  var import_react6 = __toESM(require_react());
  var editIconPath2 = '<path d="M11.838.714a2.438 2.438 0 0 1 3.448 3.448l-9.841 9.841c-.358.358-.79.633-1.267.806l-3.173 1.146a.75.75 0 0 1-.96-.96l1.146-3.173c.173-.476.448-.909.806-1.267l9.84-9.84zm2.387 1.06a.938.938 0 0 0-1.327 0l-9.84 9.842a1.953 1.953 0 0 0-.456.716L2 14.002l1.669-.604a1.95 1.95 0 0 0 .716-.455l9.841-9.841a.938.938 0 0 0 0-1.327z"></path>';
  var deleteIconPath2 = '<path d="M8 1.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"></path><path d="M12 8.75H4v-1.5h8v1.5z"></path>';
  var FolderMenu = ({ uri }) => {
    const { MenuItem, Menu } = Spicetify.ReactComponent;
    const image = SpicetifyLibrary.FolderImageWrapper.getFolderImage(uri);
    const setImage = () => {
      const setNewImage = (newUrl) => {
        SpicetifyLibrary.FolderImageWrapper.setFolderImage({ uri, url: newUrl });
      };
      Spicetify.PopupModal.display({
        title: "Set Folder Image",
        content: /* @__PURE__ */ import_react6.default.createElement(text_input_dialog_default, {
          def: image,
          onSave: setNewImage
        })
      });
    };
    const removeImage = () => {
      SpicetifyLibrary.FolderImageWrapper.removeFolderImage(uri);
    };
    return /* @__PURE__ */ import_react6.default.createElement(Menu, null, /* @__PURE__ */ import_react6.default.createElement(MenuItem, {
      leadingIcon: /* @__PURE__ */ import_react6.default.createElement(leading_icon_default, {
        path: editIconPath2
      }),
      onClick: setImage
    }, "Set Folder Image"), image && /* @__PURE__ */ import_react6.default.createElement(MenuItem, {
      leadingIcon: /* @__PURE__ */ import_react6.default.createElement(leading_icon_default, {
        path: deleteIconPath2
      }),
      onClick: removeImage
    }, "Remove Folder Image"));
  };
  var folder_menu_default = FolderMenu;

  // ../shared/components/spotify_card.tsx
  var import_react8 = __toESM(require_react());

  // ../shared/components/folder_fallback.tsx
  var import_react7 = __toESM(require_react());
  var FolderSVG = (e) => {
    return /* @__PURE__ */ import_react7.default.createElement(Spicetify.ReactComponent.IconComponent, {
      semanticColor: "textSubdued",
      viewBox: "0 0 24 24",
      size: "xxlarge",
      dangerouslySetInnerHTML: {
        __html: '<path d="M1 4a2 2 0 0 1 2-2h5.155a3 3 0 0 1 2.598 1.5l.866 1.5H21a2 2 0 0 1 2 2v13a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4zm7.155 0H3v16h18V7H10.464L9.021 4.5a1 1 0 0 0-.866-.5z"/>'
      },
      ...e
    });
  };
  var folder_fallback_default = FolderSVG;

  // ../shared/components/spotify_card.tsx
  function SpotifyCard(props) {
    const { Cards, TextComponent, ArtistMenu, AlbumMenu, PodcastShowMenu, PlaylistMenu, ContextMenu } = Spicetify.ReactComponent;
    const { FeatureCard: Card, CardImage } = Cards;
    const { createHref, push } = Spicetify.Platform.History;
    const { type, header, uri, imageUrl, subheader, artistUri } = props;
    const backupImageUrl = type === "folder" || type === "collection" ? "https://raw.githubusercontent.com/harbassan/spicetify-apps/main/shared/placeholders/folder_placeholder.png" : "https://raw.githubusercontent.com/harbassan/spicetify-apps/main/shared/placeholders/def_placeholder.png";
    const Menu = () => {
      switch (type) {
        case "artist":
          return /* @__PURE__ */ import_react8.default.createElement(ArtistMenu, {
            uri
          });
        case "album":
          return /* @__PURE__ */ import_react8.default.createElement(AlbumMenu, {
            uri,
            artistUri,
            canRemove: true
          });
        case "playlist":
          return /* @__PURE__ */ import_react8.default.createElement(PlaylistMenu, {
            uri
          });
        case "show":
          return /* @__PURE__ */ import_react8.default.createElement(PodcastShowMenu, {
            uri
          });
        case "collection":
          return /* @__PURE__ */ import_react8.default.createElement(collection_menu_default, {
            id: uri
          });
        case "folder":
          return /* @__PURE__ */ import_react8.default.createElement(folder_menu_default, {
            uri
          });
        default:
          return /* @__PURE__ */ import_react8.default.createElement(import_react8.default.Fragment, null);
      }
    };
    const lastfmProps = type === "lastfm" ? { onClick: () => window.open(uri, "_blank"), isPlayable: false, delegateNavigation: true } : {};
    const folderProps = type === "folder" ? {
      delegateNavigation: true,
      onClick: () => {
        createHref({ pathname: `/library/folder/${uri}` });
        push({ pathname: `/library/folder/${uri}` });
      }
    } : {};
    const collectionProps = type === "collection" ? {
      delegateNavigation: true,
      onClick: () => {
        createHref({ pathname: `/library/collection/${uri}` });
        push({ pathname: `/library/collection/${uri}` });
      }
    } : {};
    return /* @__PURE__ */ import_react8.default.createElement(ContextMenu, {
      menu: Menu(),
      trigger: "right-click"
    }, /* @__PURE__ */ import_react8.default.createElement(Card, {
      featureIdentifier: type,
      headerText: header,
      renderCardImage: () => /* @__PURE__ */ import_react8.default.createElement(CardImage, {
        images: [
          {
            height: 640,
            url: imageUrl,
            width: 640
          }
        ],
        isCircular: type === "artist",
        FallbackComponent: folder_fallback_default
      }),
      renderSubHeaderContent: () => /* @__PURE__ */ import_react8.default.createElement(TextComponent, {
        as: "div",
        variant: "mesto",
        semanticColor: "textSubdued",
        children: subheader
      }),
      uri,
      ...lastfmProps,
      ...folderProps,
      ...collectionProps
    }));
  }
  var spotify_card_default = SpotifyCard;

  // ../shared/components/status.tsx
  var import_react9 = __toESM(require_react());
  var ErrorIcon = () => {
    return /* @__PURE__ */ import_react9.default.createElement("svg", {
      "data-encore-id": "icon",
      role: "img",
      "aria-hidden": "true",
      viewBox: "0 0 24 24",
      className: "status-icon"
    }, /* @__PURE__ */ import_react9.default.createElement("path", {
      d: "M11 18v-2h2v2h-2zm0-4V6h2v8h-2z"
    }), /* @__PURE__ */ import_react9.default.createElement("path", {
      d: "M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12z"
    }));
  };
  var LibraryIcon = () => {
    return /* @__PURE__ */ import_react9.default.createElement("svg", {
      role: "img",
      height: "46",
      width: "46",
      "aria-hidden": "true",
      viewBox: "0 0 24 24",
      "data-encore-id": "icon",
      className: "status-icon"
    }, /* @__PURE__ */ import_react9.default.createElement("path", {
      d: "M14.5 2.134a1 1 0 0 1 1 0l6 3.464a1 1 0 0 1 .5.866V21a1 1 0 0 1-1 1h-6a1 1 0 0 1-1-1V3a1 1 0 0 1 .5-.866zM16 4.732V20h4V7.041l-4-2.309zM3 22a1 1 0 0 1-1-1V3a1 1 0 0 1 2 0v18a1 1 0 0 1-1 1zm6 0a1 1 0 0 1-1-1V3a1 1 0 0 1 2 0v18a1 1 0 0 1-1 1z"
    }));
  };
  var Status = (props) => {
    const [isVisible, setIsVisible] = import_react9.default.useState(false);
    import_react9.default.useEffect(() => {
      const to = setTimeout(() => {
        setIsVisible(true);
      }, 500);
      return () => clearTimeout(to);
    }, []);
    return isVisible ? /* @__PURE__ */ import_react9.default.createElement(import_react9.default.Fragment, null, /* @__PURE__ */ import_react9.default.createElement("div", {
      className: "loadingWrapper"
    }, props.icon === "error" ? /* @__PURE__ */ import_react9.default.createElement(ErrorIcon, null) : /* @__PURE__ */ import_react9.default.createElement(LibraryIcon, null), /* @__PURE__ */ import_react9.default.createElement("h1", null, props.heading), /* @__PURE__ */ import_react9.default.createElement("h3", null, props.subheading))) : /* @__PURE__ */ import_react9.default.createElement(import_react9.default.Fragment, null);
  };
  var status_default = Status;

  // src/components/inline_grid.tsx
  var import_react10 = __toESM(require_react());
  function scrollGrid(event) {
    const { target } = event;
    if (!(target instanceof HTMLElement))
      return;
    const grid = target.parentNode?.querySelector("div");
    if (!grid)
      return;
    grid.scrollLeft += grid.clientWidth;
    if (grid.scrollWidth - grid.clientWidth - grid.scrollLeft <= grid.clientWidth) {
      grid.setAttribute("data-scroll", "end");
    } else {
      grid.setAttribute("data-scroll", "both");
    }
  }
  function scrollGridLeft(event) {
    const { target } = event;
    if (!(target instanceof HTMLElement))
      return;
    const grid = target.parentNode?.querySelector("div");
    if (!grid)
      return;
    grid.scrollLeft -= grid.clientWidth;
    if (grid.scrollLeft <= grid.clientWidth) {
      grid.setAttribute("data-scroll", "start");
    } else {
      grid.setAttribute("data-scroll", "both");
    }
  }
  function InlineGrid(props) {
    const { children, special } = props;
    return /* @__PURE__ */ import_react10.default.createElement("section", {
      className: "stats-gridInlineSection"
    }, /* @__PURE__ */ import_react10.default.createElement("button", {
      className: "stats-scrollButton",
      onClick: scrollGridLeft
    }, "<"), /* @__PURE__ */ import_react10.default.createElement("button", {
      className: "stats-scrollButton",
      onClick: scrollGrid
    }, ">"), /* @__PURE__ */ import_react10.default.createElement("div", {
      className: `main-gridContainer-gridContainer stats-gridInline${special ? " stats-specialGrid" : ""}`,
      "data-scroll": "start"
    }, children));
  }
  var inline_grid_default = import_react10.default.memo(InlineGrid);

  // src/components/shelf.tsx
  var import_react11 = __toESM(require_react());
  function Shelf(props) {
    const { TextComponent } = Spicetify.ReactComponent;
    const { title, children } = props;
    return /* @__PURE__ */ import_react11.default.createElement("section", {
      className: "main-shelf-shelf Shelf"
    }, /* @__PURE__ */ import_react11.default.createElement("div", {
      className: "main-shelf-header"
    }, /* @__PURE__ */ import_react11.default.createElement("div", {
      className: "main-shelf-topRow"
    }, /* @__PURE__ */ import_react11.default.createElement("div", {
      className: "main-shelf-titleWrapper"
    }, /* @__PURE__ */ import_react11.default.createElement(TextComponent, {
      children: title,
      as: "h2",
      variant: "canon",
      semanticColor: "textBase"
    })))), /* @__PURE__ */ import_react11.default.createElement("section", null, children));
  }
  var shelf_default = import_react11.default.memo(Shelf);

  // src/endpoints.ts
  var SPOTIFY = {
    toptracks: (range) => `https://api.spotify.com/v1/me/top/tracks?limit=50&offset=0&time_range=${range}`,
    topartists: (range) => `https://api.spotify.com/v1/me/top/artists?limit=50&offset=0&time_range=${range}`,
    artists: (artists) => `https://api.spotify.com/v1/artists?ids=${filter(artists)}`,
    rootlist: "sp://core-playlist/v1/rootlist",
    playlist: (uri) => `sp://core-playlist/v1/playlist/${uri}`,
    search: (track, artist) => `https://api.spotify.com/v1/search?q=track:${filter(track)}+artist:${filter(artist)}&type=track`,
    searchartist: (artist) => `https://api.spotify.com/v1/search?q=artist:${filter(artist)}&type=artist`,
    searchalbum: (album, artist) => `https://api.spotify.com/v1/search?q=${filter(album)}+artist:${filter(artist)}&type=album`,
    audiofeatures: (ids) => `https://api.spotify.com/v1/audio-features?ids=${ids}`,
    queryliked: (ids) => `https://api.spotify.com/v1/me/tracks/contains?ids=${ids}`
  };
  var PLACEHOLDER = "https://raw.githubusercontent.com/harbassan/spicetify-apps/main/stats/src/styles/placeholder.png";

  // src/funcs.ts
  function filter(str) {
    const normalizedStr = str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    return normalizedStr.replace(/[^a-zA-Z0-9\-._~:/?#[\]@!$&()*+,;= ]/g, "").replace(/ /g, "+");
  }
  var apiRequest = async (name, url, timeout = 5, log = true) => {
    try {
      const timeStart = window.performance.now();
      const response = await Spicetify.CosmosAsync.get(url);
      if (log)
        console.log("stats -", name, "fetch time:", window.performance.now() - timeStart);
      return response;
    } catch (e) {
      if (timeout === 0) {
        console.log("stats -", name, "all requests failed:", e);
        console.log("stats -", name, "giving up");
        return null;
      } else {
        if (timeout === 5) {
          console.log("stats -", name, "request failed:", e);
          console.log("stats -", name, "retrying...");
        }
        await new Promise((resolve) => setTimeout(resolve, 5e3));
        return apiRequest(name, url, timeout - 1);
      }
    }
  };
  var fetchAudioFeatures = async (ids) => {
    const batchSize = 100;
    const batches = [];
    ids = ids.filter((id) => id.match(/^[a-zA-Z0-9]{22}$/));
    for (let i = 0; i < ids.length; i += batchSize) {
      const batch = ids.slice(i, i + batchSize);
      batches.push(batch);
    }
    const promises = batches.map((batch, index) => {
      return apiRequest(`audioFeaturesBatch${index}`, SPOTIFY.audiofeatures(batch.join(",")), 5, false);
    });
    const responses = await Promise.all(promises);
    const data = responses.reduce((acc, response) => {
      if (!response?.audio_features)
        return acc;
      return acc.concat(response.audio_features);
    }, []);
    return data;
  };
  var fetchTopAlbums = async (albums, cachedAlbums) => {
    let album_keys = Object.keys(albums).filter((id) => id.match(/^[a-zA-Z0-9]{22}$/)).sort((a, b) => albums[b] - albums[a]).slice(0, 100);
    let release_years = {};
    let total_album_tracks = 0;
    const cachedAlbumsSet = new Set(cachedAlbums?.map((album) => album.uri));
    let top_albums = await Promise.all(
      album_keys.map(async (albumID) => {
        let albumMeta;
        if (cachedAlbums && cachedAlbumsSet.has(`spotify:album:${albumID}`)) {
          albumMeta = cachedAlbums.find((album) => album.uri === `spotify:album:${albumID}`);
        }
        if (!albumMeta) {
          try {
            albumMeta = await Spicetify.GraphQL.Request(Spicetify.GraphQL.Definitions.getAlbum, {
              uri: `spotify:album:${albumID}`,
              locale: "en",
              offset: 0,
              limit: 50
            });
            if (!albumMeta?.data?.albumUnion?.name)
              throw new Error("Invalid URI");
          } catch (e) {
            console.error("stats - album metadata request failed:", e);
            return;
          }
        }
        const releaseYear = albumMeta?.release_year || albumMeta.data.albumUnion.date.isoString.slice(0, 4);
        release_years[releaseYear] = (release_years[releaseYear] || 0) + albums[albumID];
        total_album_tracks += albums[albumID];
        return {
          name: albumMeta.name || albumMeta.data.albumUnion.name,
          uri: albumMeta.uri || albumMeta.data.albumUnion.uri,
          image: albumMeta.image || albumMeta.data.albumUnion.coverArt.sources[0]?.url || PLACEHOLDER,
          release_year: releaseYear,
          freq: albums[albumID]
        };
      })
    );
    top_albums = top_albums.filter((el) => el != null).slice(0, 10);
    return [top_albums, Object.entries(release_years), total_album_tracks];
  };
  var fetchTopArtists = async (artists) => {
    if (Object.keys(artists).length === 0)
      return [[], [], 0];
    let artist_keys = Object.keys(artists).filter((id) => id.match(/^[a-zA-Z0-9]{22}$/)).sort((a, b) => artists[b] - artists[a]).slice(0, 50);
    let genres = {};
    let total_genre_tracks = 0;
    const artistsMeta = await apiRequest("artistsMetadata", SPOTIFY.artists(artist_keys.join(",")));
    let top_artists = artistsMeta?.artists?.map((artist) => {
      if (!artist)
        return null;
      artist.genres.forEach((genre) => {
        genres[genre] = (genres[genre] || 0) + artists[artist.id];
      });
      total_genre_tracks += artists[artist.id];
      return {
        name: artist.name,
        uri: artist.uri,
        image: artist.images[2]?.url || PLACEHOLDER,
        freq: artists[artist.id]
      };
    });
    top_artists = top_artists.filter((el) => el != null).slice(0, 10);
    const top_genres = Object.entries(genres).sort((a, b) => b[1] - a[1]).slice(0, 10);
    return [top_artists, top_genres, total_genre_tracks];
  };

  // src/pages/playlist.tsx
  var PlaylistPage = ({ uri }) => {
    const { ReactComponent, ReactQuery, Platform, _platform } = Spicetify;
    const { History, ReduxStore } = Platform;
    const { QueryClientProvider, QueryClient } = ReactQuery;
    const { Router, Route, Routes, PlatformProvider, StoreProvider } = ReactComponent;
    const [library, setLibrary] = import_react12.default.useState(100);
    const fetchData = async () => {
      const start = window.performance.now();
      const playlistMeta = await apiRequest("playlistMeta", SPOTIFY.playlist(uri));
      if (!playlistMeta) {
        setLibrary(200);
        return;
      }
      let duration = playlistMeta.playlist.duration;
      let trackCount = playlistMeta.playlist.length;
      let explicitCount = 0;
      let trackIDs = [];
      let popularity = 0;
      let albums = {};
      let artists = {};
      playlistMeta.items.forEach((track) => {
        popularity += track.popularity;
        trackIDs.push(track.link.split(":")[2]);
        if (track.isExplicit)
          explicitCount++;
        const albumID = track.album.link.split(":")[2];
        albums[albumID] = albums[albumID] ? albums[albumID] + 1 : 1;
        track.artists.forEach((artist) => {
          const artistID = artist.link.split(":")[2];
          artists[artistID] = artists[artistID] ? artists[artistID] + 1 : 1;
        });
      });
      const [topAlbums, releaseYears, releaseYearsTotal] = await fetchTopAlbums(albums);
      const [topArtists, topGenres, topGenresTotal] = await fetchTopArtists(artists);
      const fetchedFeatures = await fetchAudioFeatures(trackIDs);
      let audioFeatures = {
        danceability: 0,
        energy: 0,
        valence: 0,
        speechiness: 0,
        acousticness: 0,
        instrumentalness: 0,
        liveness: 0,
        tempo: 0
      };
      for (let i = 0; i < fetchedFeatures.length; i++) {
        if (!fetchedFeatures[i])
          continue;
        const track = fetchedFeatures[i];
        Object.keys(audioFeatures).forEach((feature) => {
          audioFeatures[feature] += track[feature];
        });
      }
      audioFeatures = {
        popularity,
        explicitness: explicitCount,
        ...audioFeatures
      };
      for (let key in audioFeatures) {
        audioFeatures[key] /= fetchedFeatures.length;
      }
      const stats2 = {
        audioFeatures,
        trackCount,
        totalDuration: duration,
        artistCount: Object.keys(artists).length,
        artists: topArtists,
        genres: topGenres,
        genresDenominator: topGenresTotal,
        albums: topAlbums,
        years: releaseYears,
        yearsDenominator: releaseYearsTotal
      };
      setLibrary(stats2);
      console.log("total playlist stats fetch time:", window.performance.now() - start);
    };
    import_react12.default.useEffect(() => {
      fetchData();
    }, []);
    switch (library) {
      case 200:
        return /* @__PURE__ */ import_react12.default.createElement(status_default, {
          icon: "error",
          heading: "Failed to Fetch Stats",
          subheading: "Make an issue on Github"
        });
      case 100:
        return /* @__PURE__ */ import_react12.default.createElement(status_default, {
          icon: "library",
          heading: "Analysing the Playlist",
          subheading: "This may take a while"
        });
    }
    const statCards = Object.entries(library.audioFeatures).map(([key, value]) => {
      return /* @__PURE__ */ import_react12.default.createElement(stat_card_default, {
        label: key,
        value
      });
    });
    const artistCards = library.artists.map((artist) => {
      return /* @__PURE__ */ import_react12.default.createElement(spotify_card_default, {
        type: "artist",
        uri: artist.uri,
        header: artist.name,
        subheader: `Appears in ${artist.freq} tracks`,
        imageUrl: artist.image
      });
    });
    const albumCards = library.albums.map((album) => {
      return /* @__PURE__ */ import_react12.default.createElement(spotify_card_default, {
        type: "album",
        uri: album.uri,
        header: album.name,
        subheader: `Appears in ${album.freq} tracks`,
        imageUrl: album.image
      });
    });
    return /* @__PURE__ */ import_react12.default.createElement("div", {
      id: "stats-app",
      className: "page-content encore-dark-theme encore-base-set"
    }, /* @__PURE__ */ import_react12.default.createElement("section", {
      className: "stats-libraryOverview"
    }, /* @__PURE__ */ import_react12.default.createElement(stat_card_default, {
      label: "Total Tracks",
      value: library.trackCount.toString()
    }), /* @__PURE__ */ import_react12.default.createElement(stat_card_default, {
      label: "Total Artists",
      value: library.artistCount.toString()
    }), /* @__PURE__ */ import_react12.default.createElement(stat_card_default, {
      label: "Total Minutes",
      value: Math.floor(library.totalDuration / 60).toString()
    }), /* @__PURE__ */ import_react12.default.createElement(stat_card_default, {
      label: "Total Hours",
      value: (library.totalDuration / (60 * 60)).toFixed(1)
    })), /* @__PURE__ */ import_react12.default.createElement(shelf_default, {
      title: "Most Frequent Genres"
    }, /* @__PURE__ */ import_react12.default.createElement(genres_card_default, {
      genres: library.genres,
      total: library.genresDenominator
    }), /* @__PURE__ */ import_react12.default.createElement(inline_grid_default, {
      special: true
    }, statCards)), /* @__PURE__ */ import_react12.default.createElement(shelf_default, {
      title: "Release Year Distribution"
    }, /* @__PURE__ */ import_react12.default.createElement(genres_card_default, {
      genres: library.years,
      total: library.yearsDenominator
    })));
  };
  var playlist_default = import_react12.default.memo(PlaylistPage);

  // package.json
  var version = "0.3.3";

  // ../shared/config/config_wrapper.tsx
  var import_react14 = __toESM(require_react());

  // ../shared/config/config_modal.tsx
  var import_react13 = __toESM(require_react());
  var TextInput = (props) => {
    const handleTextChange = (event) => {
      props.callback(event.target.value);
    };
    return /* @__PURE__ */ import_react13.default.createElement("label", {
      className: "text-input-wrapper"
    }, /* @__PURE__ */ import_react13.default.createElement("input", {
      className: "text-input",
      type: "text",
      value: props.value || "",
      "data-storage-key": props.storageKey,
      placeholder: props.placeholder,
      id: `text-input:${props.storageKey}`,
      title: `Text input for ${props.storageKey}`,
      onChange: handleTextChange
    }));
  };
  var Dropdown = (props) => {
    const handleDropdownChange = (event) => {
      props.callback(event.target.value);
    };
    return /* @__PURE__ */ import_react13.default.createElement("label", {
      className: "dropdown-wrapper"
    }, /* @__PURE__ */ import_react13.default.createElement("select", {
      className: "dropdown-input",
      value: props.value,
      "data-storage-key": props.storageKey,
      id: `dropdown:${props.storageKey}`,
      title: `Dropdown for ${props.storageKey}`,
      onChange: handleDropdownChange
    }, props.options.map((option, index) => /* @__PURE__ */ import_react13.default.createElement("option", {
      key: index,
      value: option
    }, option))));
  };
  var ToggleInput = (props) => {
    const { Toggle } = Spicetify.ReactComponent;
    const handleToggleChange = (newValue) => {
      props.callback(newValue);
    };
    return /* @__PURE__ */ import_react13.default.createElement(Toggle, {
      id: `toggle:${props.storageKey}`,
      value: props.value,
      onSelected: (newValue) => handleToggleChange(newValue)
    });
  };
  var SliderInput = (props) => {
    const { Slider } = Spicetify.ReactComponent;
    const handleSliderChange = (newValue) => {
      const calculatedValue = props.min + newValue * (props.max - props.min);
      props.callback(calculatedValue);
    };
    const value = (props.value - props.min) / (props.max - props.min);
    return /* @__PURE__ */ import_react13.default.createElement(Slider, {
      id: `slider:${props.storageKey}`,
      value,
      min: 0,
      max: 1,
      step: 0.1,
      onDragMove: (newValue) => handleSliderChange(newValue),
      onDragStart: () => {
      },
      onDragEnd: () => {
      }
    });
  };
  var TooltipIcon = () => {
    return /* @__PURE__ */ import_react13.default.createElement("svg", {
      role: "img",
      height: "16",
      width: "16",
      className: "Svg-sc-ytk21e-0 uPxdw nW1RKQOkzcJcX6aDCZB4",
      viewBox: "0 0 16 16"
    }, /* @__PURE__ */ import_react13.default.createElement("path", {
      d: "M8 1.5a6.5 6.5 0 100 13 6.5 6.5 0 000-13zM0 8a8 8 0 1116 0A8 8 0 010 8z"
    }), /* @__PURE__ */ import_react13.default.createElement("path", {
      d: "M7.25 12.026v-1.5h1.5v1.5h-1.5zm.884-7.096A1.125 1.125 0 007.06 6.39l-1.431.448a2.625 2.625 0 115.13-.784c0 .54-.156 1.015-.503 1.488-.3.408-.7.652-.973.818l-.112.068c-.185.116-.26.203-.302.283-.046.087-.097.245-.097.57h-1.5c0-.47.072-.898.274-1.277.206-.385.507-.645.827-.846l.147-.092c.285-.177.413-.257.526-.41.169-.23.213-.397.213-.602 0-.622-.503-1.125-1.125-1.125z"
    }));
  };
  var ConfigRow = (props) => {
    return /* @__PURE__ */ import_react13.default.createElement("div", {
      className: "setting-row"
    }, /* @__PURE__ */ import_react13.default.createElement("label", {
      className: "col description"
    }, props.name, props.desc && /* @__PURE__ */ import_react13.default.createElement(Spicetify.ReactComponent.TooltipWrapper, {
      label: /* @__PURE__ */ import_react13.default.createElement("div", {
        dangerouslySetInnerHTML: { __html: props.desc }
      }),
      renderInline: true,
      showDelay: 10,
      placement: "top",
      labelClassName: "tooltip",
      disabled: false
    }, /* @__PURE__ */ import_react13.default.createElement("div", {
      className: "tooltip-icon"
    }, /* @__PURE__ */ import_react13.default.createElement(TooltipIcon, null)))), /* @__PURE__ */ import_react13.default.createElement("div", {
      className: "col action"
    }, props.children));
  };
  var ConfigModal = (props) => {
    const { config, structure, appKey, updateAppConfig } = props;
    const [modalConfig, setModalConfig] = import_react13.default.useState({ ...config });
    const modalRows = structure.map((modalRow, index) => {
      const key = modalRow.key;
      const currentValue = modalConfig[key];
      const updateItem = (state) => {
        console.debug(`toggling ${key} to ${state}`);
        localStorage.setItem(`${appKey}:config:${key}`, String(state));
        if (modalRow.callback)
          modalRow.callback(state);
        const newConfig = { ...modalConfig };
        newConfig[key] = state;
        updateAppConfig(newConfig);
        setModalConfig(newConfig);
      };
      const header = modalRow.sectionHeader;
      const element = () => {
        switch (modalRow.type) {
          case "toggle":
            return /* @__PURE__ */ import_react13.default.createElement(ToggleInput, {
              storageKey: key,
              value: currentValue,
              callback: updateItem
            });
          case "text":
            return /* @__PURE__ */ import_react13.default.createElement(TextInput, {
              storageKey: key,
              value: currentValue,
              callback: updateItem
            });
          case "dropdown":
            return /* @__PURE__ */ import_react13.default.createElement(Dropdown, {
              storageKey: key,
              value: currentValue,
              options: modalRow.options,
              callback: updateItem
            });
          case "slider":
            return /* @__PURE__ */ import_react13.default.createElement(SliderInput, {
              storageKey: key,
              value: currentValue,
              min: modalRow.min,
              max: modalRow.max,
              step: modalRow.step,
              callback: updateItem
            });
        }
      };
      return /* @__PURE__ */ import_react13.default.createElement(import_react13.default.Fragment, null, header && index !== 0 && /* @__PURE__ */ import_react13.default.createElement("br", null), header && /* @__PURE__ */ import_react13.default.createElement("h2", {
        className: "section-header"
      }, modalRow.sectionHeader), /* @__PURE__ */ import_react13.default.createElement(ConfigRow, {
        name: modalRow.name,
        desc: modalRow.desc
      }, element()));
    });
    return /* @__PURE__ */ import_react13.default.createElement("div", {
      className: "config-container"
    }, modalRows);
  };
  var config_modal_default = ConfigModal;

  // ../shared/config/config_wrapper.tsx
  var _ConfigWrapper = class {
    Config;
    launchModal;
    constructor(modalStructure, key) {
      const config = modalStructure.map((modalStructureRow) => {
        const value = _ConfigWrapper.getLocalStorageDataFromKey(
          `${key}:config:${modalStructureRow.key}`,
          modalStructureRow.def
        );
        modalStructureRow.callback?.(value);
        return { [modalStructureRow.key]: value };
      });
      this.Config = Object.assign({}, ...config);
      this.launchModal = (callback) => {
        const updateConfig = (config2) => {
          this.Config = { ...config2 };
          callback?.(config2);
        };
        Spicetify.PopupModal.display({
          title: `${key.charAt(0).toUpperCase() + key.slice(1)} Settings`,
          content: /* @__PURE__ */ import_react14.default.createElement(config_modal_default, {
            config: this.Config,
            structure: modalStructure,
            appKey: key,
            updateAppConfig: updateConfig
          }),
          isLarge: true
        });
      };
    }
  };
  var ConfigWrapper = _ConfigWrapper;
  __publicField(ConfigWrapper, "getLocalStorageDataFromKey", (key, fallback) => {
    const data = localStorage.getItem(key);
    if (data) {
      try {
        return JSON.parse(data);
      } catch (err) {
        return data;
      }
    } else {
      return fallback;
    }
  });
  var config_wrapper_default = ConfigWrapper;

  // src/extensions/extension.tsx
  var SpicetifyStats = class {
    ConfigWrapper = new config_wrapper_default(
      [
        {
          name: "Last.fm Api Key",
          key: "api-key",
          type: "text",
          def: null,
          placeholder: "Enter API Key",
          desc: `You can get this by visiting www.last.fm/api/account/create and simply entering any name.<br/>You'll need to make an account first, which is a plus.`,
          sectionHeader: "Last.fm Integration"
        },
        {
          name: "Last.fm Username",
          key: "lastfm-user",
          type: "text",
          def: null,
          placeholder: "Enter Username"
        },
        {
          name: "Use Last.fm for Stats",
          key: "use-lastfm",
          type: "toggle",
          def: false,
          desc: `Last.fm charts your stats purely based on the streaming count, whereas Spotify factors in other variables`
        },
        {
          name: "Artists Page",
          key: "show-artists",
          type: "toggle",
          def: true,
          sectionHeader: "Pages"
        },
        { name: "Tracks Page", key: "show-tracks", type: "toggle", def: true },
        {
          name: "Albums Page",
          key: "show-albums",
          type: "toggle",
          def: false,
          desc: `Requires Last.fm API key and username`
        },
        { name: "Genres Page", key: "show-genres", type: "toggle", def: true },
        { name: "Library Page", key: "show-library", type: "toggle", def: true },
        {
          name: "Charts Page",
          key: "show-charts",
          type: "toggle",
          def: true,
          desc: `Requires Last.fm API key`
        }
      ],
      "stats"
    );
  };
  window.SpicetifyStats = new SpicetifyStats();
  (function stats() {
    const {
      PopupModal,
      LocalStorage,
      Topbar,
      Platform: { History }
    } = Spicetify;
    if (!PopupModal || !LocalStorage || !Topbar || !History) {
      setTimeout(stats, 300);
      return;
    }
    const version2 = localStorage.getItem("stats:version");
    if (!version2 || version2 !== version) {
      for (let i = 0; i < localStorage.length; i++) {
        const key = localStorage.key(i);
        if (key.startsWith("stats:") && !key.startsWith("stats:config:")) {
          localStorage.removeItem(key);
        }
      }
      localStorage.setItem("stats:version", version);
    }
    LocalStorage.set("stats:cache-info", JSON.stringify([0, 0, 0, 0, 0, 0]));
    const styleLink = document.createElement("link");
    styleLink.rel = "stylesheet";
    styleLink.href = "/spicetify-routes-stats.css";
    document.head.appendChild(styleLink);
    const playlistEdit = new Topbar.Button("playlist-stats", "visualizer", () => {
      const playlistUri = `spotify:playlist:${History.location.pathname.split("/")[2]}`;
      PopupModal.display({ title: "Playlist Stats", content: /* @__PURE__ */ import_react15.default.createElement(playlist_default, {
        uri: playlistUri
      }), isLarge: true });
    });
    playlistEdit.element.classList.toggle("hidden", true);
    function setTopbarButtonVisibility(pathname) {
      const [, type, uid] = pathname.split("/");
      const isPlaylistPage = type === "playlist" && uid;
      playlistEdit.element.classList.toggle("hidden", !isPlaylistPage);
    }
    setTopbarButtonVisibility(History.location.pathname);
    History.listen(({ pathname }) => {
      setTopbarButtonVisibility(pathname);
    });
  })();
})();

        })();