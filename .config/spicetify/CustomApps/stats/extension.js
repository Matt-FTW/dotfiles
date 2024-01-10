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
  var __getOwnPropSymbols = Object.getOwnPropertySymbols;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __propIsEnum = Object.prototype.propertyIsEnumerable;
  var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
  var __spreadValues = (a, b) => {
    for (var prop in b || (b = {}))
      if (__hasOwnProp.call(b, prop))
        __defNormalProp(a, prop, b[prop]);
    if (__getOwnPropSymbols)
      for (var prop of __getOwnPropSymbols(b)) {
        if (__propIsEnum.call(b, prop))
          __defNormalProp(a, prop, b[prop]);
      }
    return a;
  };
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

  // external-global-plugin:react
  var require_react = __commonJS({
    "external-global-plugin:react"(exports, module) {
      module.exports = Spicetify.React;
    }
  });

  // src/extensions/extension.tsx
  var import_react7 = __toESM(require_react());

  // src/pages/playlist.tsx
  var import_react6 = __toESM(require_react());

  // src/components/cards/stat_card.tsx
  var import_react = __toESM(require_react());
  var StatCard = (props) => {
    return /* @__PURE__ */ import_react.default.createElement(import_react.default.Fragment, null, /* @__PURE__ */ import_react.default.createElement("div", {
      className: "main-card-card"
    }, /* @__PURE__ */ import_react.default.createElement("div", {
      className: "stats-cardValue"
    }, props.value), /* @__PURE__ */ import_react.default.createElement("div", null, /* @__PURE__ */ import_react.default.createElement("div", {
      className: "TypeElement-balladBold-textBase-4px-type main-cardHeader-text stats-cardText",
      "data-encore-id": "type"
    }, props.stat))));
  };
  var stat_card_default = import_react.default.memo(StatCard);

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
  var genres_card_default = import_react2.default.memo(genresCard);

  // src/components/cards/artist_card.tsx
  var import_react3 = __toESM(require_react());
  var DraggableComponent = (props) => {
    var _a, _b;
    const dragHandler = (_b = (_a = Spicetify.ReactHook).DragHandler) == null ? void 0 : _b.call(_a, [props.uri], props.title);
    return /* @__PURE__ */ import_react3.default.createElement("div", {
      onDragStart: dragHandler,
      draggable: "true",
      className: "main-card-draggable"
    }, props.children);
  };
  var Card = ({ name, image, uri, subtext }) => {
    const goToArtist = (uriString) => {
      if (uriString.includes("last")) {
        return window.open(uriString, "_blank");
      }
      const uriObj = Spicetify.URI.fromString(uriString);
      const url = uriObj.toURLPath(true);
      Spicetify.Platform.History.push(url);
      Spicetify.Platform.History.goForward();
    };
    const isArtist = uri.includes("artist");
    const MenuWrapper = import_react3.default.memo((props) => {
      return isArtist ? /* @__PURE__ */ import_react3.default.createElement(Spicetify.ReactComponent.ArtistMenu, __spreadValues({}, props)) : /* @__PURE__ */ import_react3.default.createElement(Spicetify.ReactComponent.AlbumMenu, __spreadValues({}, props));
    });
    return /* @__PURE__ */ import_react3.default.createElement(import_react3.default.Fragment, null, /* @__PURE__ */ import_react3.default.createElement(Spicetify.ReactComponent.ContextMenu, {
      menu: /* @__PURE__ */ import_react3.default.createElement(MenuWrapper, {
        uri
      }),
      trigger: "right-click"
    }, /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "main-card-card"
    }, /* @__PURE__ */ import_react3.default.createElement(DraggableComponent, {
      uri,
      title: name
    }, /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "main-card-imageContainer"
    }, /* @__PURE__ */ import_react3.default.createElement("div", {
      className: `main-cardImage-imageWrapper ${isArtist ? `main-cardImage-circular` : ""}`
    }, /* @__PURE__ */ import_react3.default.createElement("div", {
      className: ""
    }, /* @__PURE__ */ import_react3.default.createElement("img", {
      "aria-hidden": "false",
      draggable: "false",
      loading: "lazy",
      src: image,
      className: `main-image-image main-cardImage-image ${isArtist ? `main-cardImage-circular` : ""} main-image-loaded`
    }))), /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "main-card-PlayButtonContainer",
      onClick: () => Spicetify.Player.playUri(uri)
    }, /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "main-playButton-PlayButton"
    }, /* @__PURE__ */ import_react3.default.createElement("button", {
      "data-encore-id": "buttonPrimary",
      className: "Button-md-useBrowserDefaultFocusStyle Button-md-buttonPrimary-useBrowserDefaultFocusStyle Button-medium-buttonPrimary-useBrowserDefaultFocusStyle"
    }, /* @__PURE__ */ import_react3.default.createElement("span", {
      className: "ButtonInner-md-iconOnly ButtonInner-medium-iconOnly encore-bright-accent-set"
    }, /* @__PURE__ */ import_react3.default.createElement("span", {
      "aria-hidden": "true",
      className: "Wrapper-md-24-only Wrapper-medium-medium-only"
    }, /* @__PURE__ */ import_react3.default.createElement("svg", {
      role: "img",
      height: "24",
      width: "24",
      "aria-hidden": "true",
      viewBox: "0 0 24 24",
      "data-encore-id": "icon",
      className: "Svg-img-24 Svg-img-24-icon Svg-img-icon-medium"
    }, /* @__PURE__ */ import_react3.default.createElement("path", {
      d: "m7.05 3.606 13.49 7.788a.7.7 0 0 1 0 1.212L7.05 20.394A.7.7 0 0 1 6 19.788V4.212a.7.7 0 0 1 1.05-.606z"
    })))))))), /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "main-card-cardMetadata"
    }, /* @__PURE__ */ import_react3.default.createElement("a", {
      draggable: "false",
      className: "main-cardHeader-link",
      dir: "auto"
    }, /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "TypeElement-balladBold-textBase-4px-type main-cardHeader-text",
      "data-encore-id": "type"
    }, name)), /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "TypeElement-mesto-textSubdued-type main-cardSubHeader-root",
      "data-encore-id": "type"
    }, /* @__PURE__ */ import_react3.default.createElement("span", null, subtext))), /* @__PURE__ */ import_react3.default.createElement("div", {
      className: "main-card-cardLink",
      onClick: () => goToArtist(uri)
    })))));
  };
  var artist_card_default = import_react3.default.memo(Card);

  // src/funcs.ts
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
      const url = `https://api.spotify.com/v1/audio-features?ids=${batch.join(",")}`;
      return apiRequest("audioFeaturesBatch" + index, url, 5, false);
    });
    const responses = await Promise.all(promises);
    const data = responses.reduce((acc, response) => {
      if (!(response == null ? void 0 : response.audio_features))
        return acc;
      return acc.concat(response.audio_features);
    }, []);
    return data;
  };
  var fetchTopAlbums = async (albums, cachedAlbums) => {
    let album_keys = Object.keys(albums).filter((id) => id.match(/^[a-zA-Z0-9]{22}$/)).sort((a, b) => albums[b] - albums[a]).slice(0, 100);
    let release_years = {};
    let total_album_tracks = 0;
    let top_albums = await Promise.all(
      album_keys.map(async (albumID) => {
        var _a, _b, _c;
        let albumMeta;
        if (cachedAlbums) {
          for (let i = 0; i < cachedAlbums.length; i++) {
            if (cachedAlbums[i].uri === `spotify:album:${albumID}`) {
              albumMeta = cachedAlbums[i];
              break;
            }
          }
        }
        if (!albumMeta) {
          try {
            albumMeta = await Spicetify.GraphQL.Request(Spicetify.GraphQL.Definitions.getAlbum, {
              uri: `spotify:album:${albumID}`,
              locale: "en",
              offset: 0,
              limit: 50
            });
            if (!((_b = (_a = albumMeta == null ? void 0 : albumMeta.data) == null ? void 0 : _a.albumUnion) == null ? void 0 : _b.name))
              throw new Error("Invalid URI");
          } catch (e) {
            console.error("stats - album metadata request failed:", e);
            return;
          }
        }
        const releaseYear = (albumMeta == null ? void 0 : albumMeta.release_year) || albumMeta.data.albumUnion.date.isoString.slice(0, 4);
        release_years[releaseYear] = (release_years[releaseYear] || 0) + albums[albumID];
        total_album_tracks += albums[albumID];
        return {
          name: albumMeta.name || albumMeta.data.albumUnion.name,
          uri: albumMeta.uri || albumMeta.data.albumUnion.uri,
          image: albumMeta.image || ((_c = albumMeta.data.albumUnion.coverArt.sources[0]) == null ? void 0 : _c.url) || "https://commons.wikimedia.org/wiki/File:Black_square.jpg",
          release_year: releaseYear,
          freq: albums[albumID]
        };
      })
    );
    top_albums = top_albums.filter((el) => el != null).slice(0, 10);
    return [top_albums, Object.entries(release_years), total_album_tracks];
  };
  var fetchTopArtists = async (artists) => {
    var _a;
    if (Object.keys(artists).length === 0)
      return [[], [], 0];
    let artist_keys = Object.keys(artists).filter((id) => id.match(/^[a-zA-Z0-9]{22}$/)).sort((a, b) => artists[b] - artists[a]).slice(0, 50);
    let genres = {};
    let total_genre_tracks = 0;
    const artistsMeta = await apiRequest("artistsMetadata", `https://api.spotify.com/v1/artists?ids=${artist_keys.join(",")}`);
    let top_artists = (_a = artistsMeta == null ? void 0 : artistsMeta.artists) == null ? void 0 : _a.map((artist) => {
      var _a2;
      if (!artist)
        return null;
      artist.genres.forEach((genre) => {
        genres[genre] = (genres[genre] || 0) + artists[artist.id];
      });
      total_genre_tracks += artists[artist.id];
      return {
        name: artist.name,
        uri: artist.uri,
        image: ((_a2 = artist.images[2]) == null ? void 0 : _a2.url) || "https://commons.wikimedia.org/wiki/File:Black_square.jpg",
        freq: artists[artist.id]
      };
    });
    top_artists = top_artists.filter((el) => el != null).slice(0, 10);
    const top_genres = Object.entries(genres).sort((a, b) => b[1] - a[1]).slice(0, 10);
    return [top_artists, top_genres, total_genre_tracks];
  };

  // src/components/status.tsx
  var import_react4 = __toESM(require_react());
  var ErrorIcon = () => {
    return /* @__PURE__ */ import_react4.default.createElement("svg", {
      "data-encore-id": "icon",
      role: "img",
      "aria-hidden": "true",
      viewBox: "0 0 24 24",
      className: "status-icon"
    }, /* @__PURE__ */ import_react4.default.createElement("path", {
      d: "M11 18v-2h2v2h-2zm0-4V6h2v8h-2z"
    }), /* @__PURE__ */ import_react4.default.createElement("path", {
      d: "M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12z"
    }));
  };
  var LibraryIcon = () => {
    return /* @__PURE__ */ import_react4.default.createElement("svg", {
      role: "img",
      height: "46",
      width: "46",
      "aria-hidden": "true",
      viewBox: "0 0 24 24",
      "data-encore-id": "icon",
      className: "status-icon"
    }, /* @__PURE__ */ import_react4.default.createElement("path", {
      d: "M14.5 2.134a1 1 0 0 1 1 0l6 3.464a1 1 0 0 1 .5.866V21a1 1 0 0 1-1 1h-6a1 1 0 0 1-1-1V3a1 1 0 0 1 .5-.866zM16 4.732V20h4V7.041l-4-2.309zM3 22a1 1 0 0 1-1-1V3a1 1 0 0 1 2 0v18a1 1 0 0 1-1 1zm6 0a1 1 0 0 1-1-1V3a1 1 0 0 1 2 0v18a1 1 0 0 1-1 1z"
    }));
  };
  var Status = (props) => {
    const [isVisible, setIsVisible] = import_react4.default.useState(false);
    import_react4.default.useEffect(() => {
      const to = setTimeout(() => {
        setIsVisible(true);
      }, 500);
      return () => clearTimeout(to);
    }, []);
    return isVisible ? /* @__PURE__ */ import_react4.default.createElement(import_react4.default.Fragment, null, /* @__PURE__ */ import_react4.default.createElement("div", {
      className: "stats-loadingWrapper"
    }, props.icon === "error" ? /* @__PURE__ */ import_react4.default.createElement(ErrorIcon, null) : /* @__PURE__ */ import_react4.default.createElement(LibraryIcon, null), /* @__PURE__ */ import_react4.default.createElement("h1", null, props.heading), /* @__PURE__ */ import_react4.default.createElement("h3", null, props.subheading))) : /* @__PURE__ */ import_react4.default.createElement(import_react4.default.Fragment, null);
  };
  var status_default = Status;

  // src/components/inline_grid.tsx
  var import_react5 = __toESM(require_react());
  var scrollGrid = (event) => {
    const grid = event.target.parentNode.querySelector("div");
    grid.scrollLeft += grid.clientWidth;
    if (grid.scrollWidth - grid.clientWidth - grid.scrollLeft <= grid.clientWidth) {
      grid.setAttribute("data-scroll", "end");
    } else {
      grid.setAttribute("data-scroll", "both");
    }
  };
  var scrollGridLeft = (event) => {
    const grid = event.target.parentNode.querySelector("div");
    grid.scrollLeft -= grid.clientWidth;
    if (grid.scrollLeft <= grid.clientWidth) {
      grid.setAttribute("data-scroll", "start");
    } else {
      grid.setAttribute("data-scroll", "both");
    }
  };
  var InlineGrid = (props) => {
    return /* @__PURE__ */ import_react5.default.createElement("section", {
      className: "stats-gridInlineSection"
    }, /* @__PURE__ */ import_react5.default.createElement("button", {
      className: "stats-scrollButton",
      onClick: scrollGridLeft
    }, "<"), /* @__PURE__ */ import_react5.default.createElement("button", {
      className: "stats-scrollButton",
      onClick: scrollGrid
    }, ">"), /* @__PURE__ */ import_react5.default.createElement("div", {
      className: `main-gridContainer-gridContainer stats-gridInline${props.special ? " stats-specialGrid" : ""}`,
      "data-scroll": "start"
    }, props.children));
  };
  var inline_grid_default = InlineGrid;

  // src/pages/playlist.tsx
  var PlaylistPage = ({ uri }) => {
    const [library, setLibrary] = import_react6.default.useState(100);
    const fetchData = async () => {
      const start = window.performance.now();
      const playlistMeta = await apiRequest("playlistMeta", `sp://core-playlist/v1/playlist/${uri}`);
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
      audioFeatures = __spreadValues({ popularity, explicitness: explicitCount }, audioFeatures);
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
    import_react6.default.useEffect(() => {
      fetchData();
    }, []);
    switch (library) {
      case 200:
        return /* @__PURE__ */ import_react6.default.createElement(status_default, {
          icon: "error",
          heading: "Failed to Fetch Stats",
          subheading: "Make an issue on Github"
        });
      case 100:
        return /* @__PURE__ */ import_react6.default.createElement(status_default, {
          icon: "library",
          heading: "Analysing the Playlist",
          subheading: "This may take a while"
        });
    }
    const parseVal = (obj) => {
      switch (obj[0]) {
        case "tempo":
          return Math.round(obj[1]) + "bpm";
        case "popularity":
          return Math.round(obj[1]) + "%";
        default:
          return Math.round(obj[1] * 100) + "%";
      }
    };
    const statCards = [];
    Object.entries(library.audioFeatures).forEach((obj) => {
      statCards.push(/* @__PURE__ */ import_react6.default.createElement(stat_card_default, {
        stat: obj[0][0].toUpperCase() + obj[0].slice(1),
        value: parseVal(obj)
      }));
    });
    const artistCards = library.artists.map((artist) => /* @__PURE__ */ import_react6.default.createElement(artist_card_default, {
      name: artist.name,
      image: artist.image,
      uri: artist.uri,
      subtext: `Appears in ${artist.freq} tracks`
    }));
    const albumCards = library.albums.map((album) => {
      return /* @__PURE__ */ import_react6.default.createElement(artist_card_default, {
        name: album.name,
        image: album.image,
        uri: album.uri,
        subtext: `Appears in ${album.freq} tracks`
      });
    });
    return /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "stats-page"
    }, /* @__PURE__ */ import_react6.default.createElement("section", {
      className: "stats-libraryOverview"
    }, /* @__PURE__ */ import_react6.default.createElement(stat_card_default, {
      stat: "Total Tracks",
      value: library.trackCount
    }), /* @__PURE__ */ import_react6.default.createElement(stat_card_default, {
      stat: "Total Artists",
      value: library.artistCount
    }), /* @__PURE__ */ import_react6.default.createElement(stat_card_default, {
      stat: "Total Minutes",
      value: Math.floor(library.totalDuration / 60)
    }), /* @__PURE__ */ import_react6.default.createElement(stat_card_default, {
      stat: "Total Hours",
      value: (library.totalDuration / (60 * 60)).toFixed(1)
    })), /* @__PURE__ */ import_react6.default.createElement("section", null, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-header"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-topRow"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-titleWrapper"
    }, /* @__PURE__ */ import_react6.default.createElement("h2", {
      className: "Type__TypeElement-sc-goli3j-0 TypeElement-canon-textBase-type main-shelf-title"
    }, "Most Frequent Genres")))), /* @__PURE__ */ import_react6.default.createElement(genres_card_default, {
      genres: library.genres,
      total: library.genresDenominator
    }), /* @__PURE__ */ import_react6.default.createElement(inline_grid_default, {
      special: true
    }, statCards)), /* @__PURE__ */ import_react6.default.createElement("section", {
      className: "main-shelf-shelf Shelf"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-header"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-topRow"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-titleWrapper"
    }, /* @__PURE__ */ import_react6.default.createElement("h2", {
      className: "Type__TypeElement-sc-goli3j-0 TypeElement-canon-textBase-type main-shelf-title"
    }, "Most Frequent Artists")))), /* @__PURE__ */ import_react6.default.createElement(inline_grid_default, null, artistCards)), /* @__PURE__ */ import_react6.default.createElement("section", {
      className: "main-shelf-shelf Shelf"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-header"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-topRow"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-titleWrapper"
    }, /* @__PURE__ */ import_react6.default.createElement("h2", {
      className: "Type__TypeElement-sc-goli3j-0 TypeElement-canon-textBase-type main-shelf-title"
    }, "Most Frequent Albums")))), /* @__PURE__ */ import_react6.default.createElement(inline_grid_default, null, albumCards)), /* @__PURE__ */ import_react6.default.createElement("section", {
      className: "main-shelf-shelf Shelf"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-header"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-topRow"
    }, /* @__PURE__ */ import_react6.default.createElement("div", {
      className: "main-shelf-titleWrapper"
    }, /* @__PURE__ */ import_react6.default.createElement("h2", {
      className: "Type__TypeElement-sc-goli3j-0 TypeElement-canon-textBase-type main-shelf-title"
    }, "Release Year Distribution")))), /* @__PURE__ */ import_react6.default.createElement("section", null, /* @__PURE__ */ import_react6.default.createElement(genres_card_default, {
      genres: library.years,
      total: library.yearsDenominator
    }))));
  };
  var playlist_default = import_react6.default.memo(PlaylistPage);

  // package.json
  var version = "0.3.0";

  // src/constants.ts
  var STATS_VERSION = version;

  // src/extensions/extension.tsx
  (async function stats() {
    if (!Spicetify.Platform) {
      setTimeout(stats, 100);
      return;
    }
    const version2 = localStorage.getItem("stats:version");
    if (!version2 || version2 !== STATS_VERSION) {
      for (let i = 0; i < localStorage.length; i++) {
        const key = localStorage.key(i);
        if (key.startsWith("stats:") && !key.startsWith("stats:config:")) {
          localStorage.removeItem(key);
        }
      }
      localStorage.setItem("stats:version", STATS_VERSION);
    }
    Spicetify.LocalStorage.set("stats:cache-info", JSON.stringify([0, 0, 0, 0, 0, 0]));
    const styleLink = document.createElement("link");
    styleLink.rel = "stylesheet";
    styleLink.href = "/spicetify-routes-stats.css";
    document.head.appendChild(styleLink);
    const playlistEdit = new Spicetify.Topbar.Button("playlist-stats", "visualizer", () => {
      const playlistUri = `spotify:playlist:${Spicetify.Platform.History.location.pathname.split("/")[2]}`;
      Spicetify.PopupModal.display({ title: "Playlist Stats", content: /* @__PURE__ */ import_react7.default.createElement(playlist_default, {
        uri: playlistUri
      }), isLarge: true });
    });
    playlistEdit.element.classList.toggle("hidden", true);
    Spicetify.Platform.History.listen(({ pathname }) => {
      const [, type, uid] = pathname.split("/");
      const isPlaylistPage = type === "playlist" && uid;
      playlistEdit.element.classList.toggle("hidden", !isPlaylistPage);
    });
  })();
})();

        })();