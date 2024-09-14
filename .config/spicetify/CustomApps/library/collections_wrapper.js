(async function() {
          while (!Spicetify.React || !Spicetify.ReactDOM) {
            await new Promise(resolve => setTimeout(resolve, 10));
          }
          "use strict";
var library = (() => {
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
  var __export = (target, all) => {
    for (var name in all)
      __defProp(target, name, { get: all[name], enumerable: true });
  };
  var __copyProps = (to, from, except, desc) => {
    if (from && typeof from === "object" || typeof from === "function") {
      for (let key of __getOwnPropNames(from))
        if (!__hasOwnProp.call(to, key) && key !== except)
          __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
    }
    return to;
  };
  var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);
  var __publicField = (obj, key, value) => {
    __defNormalProp(obj, typeof key !== "symbol" ? key + "" : key, value);
    return value;
  };

  // src/extensions/collections_wrapper.ts
  var collections_wrapper_exports = {};
  __export(collections_wrapper_exports, {
    default: () => collections_wrapper_default
  });

  // ../node_modules/uuid/dist/esm-browser/rng.js
  var getRandomValues;
  var rnds8 = new Uint8Array(16);
  function rng() {
    if (!getRandomValues) {
      getRandomValues = typeof crypto !== "undefined" && crypto.getRandomValues && crypto.getRandomValues.bind(crypto);
      if (!getRandomValues) {
        throw new Error("crypto.getRandomValues() not supported. See https://github.com/uuidjs/uuid#getrandomvalues-not-supported");
      }
    }
    return getRandomValues(rnds8);
  }

  // ../node_modules/uuid/dist/esm-browser/stringify.js
  var byteToHex = [];
  for (let i = 0; i < 256; ++i) {
    byteToHex.push((i + 256).toString(16).slice(1));
  }
  function unsafeStringify(arr, offset = 0) {
    return byteToHex[arr[offset + 0]] + byteToHex[arr[offset + 1]] + byteToHex[arr[offset + 2]] + byteToHex[arr[offset + 3]] + "-" + byteToHex[arr[offset + 4]] + byteToHex[arr[offset + 5]] + "-" + byteToHex[arr[offset + 6]] + byteToHex[arr[offset + 7]] + "-" + byteToHex[arr[offset + 8]] + byteToHex[arr[offset + 9]] + "-" + byteToHex[arr[offset + 10]] + byteToHex[arr[offset + 11]] + byteToHex[arr[offset + 12]] + byteToHex[arr[offset + 13]] + byteToHex[arr[offset + 14]] + byteToHex[arr[offset + 15]];
  }

  // ../node_modules/uuid/dist/esm-browser/native.js
  var randomUUID = typeof crypto !== "undefined" && crypto.randomUUID && crypto.randomUUID.bind(crypto);
  var native_default = {
    randomUUID
  };

  // ../node_modules/uuid/dist/esm-browser/v4.js
  function v4(options, buf, offset) {
    if (native_default.randomUUID && !buf && !options) {
      return native_default.randomUUID();
    }
    options = options || {};
    const rnds = options.random || (options.rng || rng)();
    rnds[6] = rnds[6] & 15 | 64;
    rnds[8] = rnds[8] & 63 | 128;
    if (buf) {
      offset = offset || 0;
      for (let i = 0; i < 16; ++i) {
        buf[offset + i] = rnds[i];
      }
      return buf;
    }
    return unsafeStringify(rnds);
  }
  var v4_default = v4;

  // src/extensions/collections_wrapper.ts
  var _CollectionsWrapper = class extends EventTarget {
    _collections;
    constructor() {
      super();
      this._collections = JSON.parse(localStorage.getItem("library:collections") || "[]");
    }
    saveCollections() {
      localStorage.setItem("library:collections", JSON.stringify(this._collections));
      this.dispatchEvent(new CustomEvent("update", { detail: this._collections }));
    }
    getCollection(uri) {
      return this._collections.find((collection) => collection.uri === uri);
    }
    async getCollectionContents(uri) {
      const collection = this.getCollection(uri);
      if (!collection)
        throw new Error("Collection not found");
      const items = this._collections.filter((collection2) => collection2.parentCollection === uri);
      const albums = await Spicetify.Platform.LibraryAPI.getContents({
        filters: ["0"],
        offset: 0,
        limit: 9999
      });
      items.push(...albums.items.filter((album) => collection.items.includes(album.uri)));
      return items;
    }
    async getContents(props) {
      const { collectionUri, offset, limit, textFilter } = props;
      let items = collectionUri ? await this.getCollectionContents(collectionUri) : this._collections;
      const openedCollectionName = collectionUri ? this.getCollection(collectionUri)?.name : void 0;
      if (textFilter) {
        const regex = new RegExp(`\\b${textFilter}`, "i");
        items = items.filter((collection) => regex.test(collection.name));
      }
      items = items.slice(offset, offset + limit);
      return { items, totalLength: this._collections.length, offset, openedCollectionName };
    }
    async cleanCollections() {
      for (const collection of this._collections) {
        const boolArray = await Spicetify.Platform.LibraryAPI.contains(...collection.items);
        if (boolArray.includes(false)) {
          collection.items = collection.items.filter((_, i) => boolArray[i]);
          this.saveCollections();
          Spicetify.showNotification("Album removed from collection");
          this.syncCollection(collection.uri);
        }
      }
    }
    async syncCollection(uri) {
      const collection = this.getCollection(uri);
      if (!collection)
        return;
      const { PlaylistAPI } = Spicetify.Platform;
      if (!collection.syncedPlaylistUri)
        return;
      const playlist = await PlaylistAPI.getPlaylist(collection.syncedPlaylistUri);
      const playlistTracks = playlist.contents.items.filter((t) => t.type === "track").map((t) => t.uri);
      const collectionTracks = await this.getTracklist(uri);
      const wanted = collectionTracks.filter((track) => !playlistTracks.includes(track));
      const unwanted = playlistTracks.filter((track) => !collectionTracks.includes(track)).map((uri2) => ({ uri: uri2, uid: [] }));
      if (wanted.length)
        await PlaylistAPI.add(collection.syncedPlaylistUri, wanted, { before: "end" });
      if (unwanted.length)
        await PlaylistAPI.remove(collection.syncedPlaylistUri, unwanted);
    }
    unsyncCollection(uri) {
      const collection = this.getCollection(uri);
      if (!collection)
        return;
      collection.syncedPlaylistUri = void 0;
      this.saveCollections();
    }
    async getTracklist(collectionUri) {
      const collection = this.getCollection(collectionUri);
      if (!collection)
        return [];
      return Promise.all(
        collection.items.map(async (uri) => {
          const album = await Spicetify.Platform.LibraryAPI.getAlbum(uri);
          return album.items.map((t) => t.uri);
        })
      ).then((tracks) => tracks.flat());
    }
    async convertToPlaylist(uri) {
      const collection = this.getCollection(uri);
      if (!collection)
        return;
      const { Platform, showNotification } = Spicetify;
      const { RootlistAPI, PlaylistAPI } = Platform;
      if (collection.syncedPlaylistUri) {
        showNotification("Synced Playlist already exists", true);
        return;
      }
      try {
        const playlistUri = await RootlistAPI.createPlaylist(collection.name, { before: "start" });
        const items = await this.getTracklist(uri);
        await PlaylistAPI.add(playlistUri, items, { before: "start" });
        collection.syncedPlaylistUri = playlistUri;
      } catch (error) {
        console.error(error);
        showNotification("Failed to create playlist", true);
      }
    }
    async createCollectionFromDiscog(artistUri) {
      const [raw, info] = await Promise.all([
        Spicetify.GraphQL.Request(Spicetify.GraphQL.Definitions.queryArtistDiscographyAlbums, {
          uri: artistUri,
          offset: 0,
          limit: 50
        }),
        Spicetify.GraphQL.Request(Spicetify.GraphQL.Definitions.queryArtistOverview, {
          uri: artistUri,
          locale: Spicetify.Locale.getLocale(),
          includePrerelease: false
        })
      ]);
      const items = raw?.data?.artistUnion.discography.albums?.items;
      const name = info?.data?.artistUnion.profile.name;
      const image = info?.data?.artistUnion.visuals.avatarImage?.sources?.[0]?.url;
      if (!name || !items?.length) {
        Spicetify.showNotification("Artist not found or has no albums");
        return;
      }
      const collectionUri = this.createCollection(`${name} Albums`);
      if (image)
        this.setCollectionImage(collectionUri, image);
      for (const album of items) {
        this.addAlbumToCollection(collectionUri, album.releases.items[0].uri);
      }
    }
    createCollection(name, parentCollection = "") {
      const id = v4_default();
      this._collections.push({
        type: "collection",
        uri: id,
        name,
        items: [],
        addedAt: new Date(),
        lastPlayedAt: new Date(),
        parentCollection
      });
      this.saveCollections();
      Spicetify.showNotification("Collection created");
      return id;
    }
    deleteCollection(uri) {
      this._collections = this._collections.filter((collection) => collection.uri !== uri);
      this.saveCollections();
      Spicetify.showNotification("Collection deleted");
    }
    deleteCollectionAndAlbums(uri) {
      const collection = this.getCollection(uri);
      if (!collection)
        return;
      for (const album of collection.items) {
        Spicetify.Platform.LibraryAPI.remove({ uris: [album] });
      }
      this.deleteCollection(uri);
    }
    async addAlbumToCollection(collectionUri, albumUri) {
      const collection = this.getCollection(collectionUri);
      if (!collection)
        return;
      await Spicetify.Platform.LibraryAPI.add({ uris: [albumUri] });
      collection.items.push(albumUri);
      this.saveCollections();
      Spicetify.showNotification("Album added to collection");
      this.syncCollection(collectionUri);
    }
    removeAlbumFromCollection(collectionUri, albumUri) {
      const collection = this.getCollection(collectionUri);
      if (!collection)
        return;
      collection.items = collection.items.filter((item) => item !== albumUri);
      this.saveCollections();
      Spicetify.showNotification("Album removed from collection");
      this.syncCollection(collectionUri);
    }
    getCollectionsWithAlbum(albumUri) {
      return this._collections.filter((collection) => {
        return collection.items.some((item) => item === albumUri);
      });
    }
    renameCollection(uri, name) {
      const collection = this.getCollection(uri);
      if (!collection)
        return;
      collection.name = name;
      this.saveCollections();
      Spicetify.showNotification("Collection renamed");
    }
    setCollectionImage(uri, url) {
      const collection = this.getCollection(uri);
      if (!collection)
        return;
      collection.image = url;
      this.saveCollections();
      Spicetify.showNotification("Collection image set");
    }
    removeCollectionImage(uri) {
      const collection = this.getCollection(uri);
      if (!collection)
        return;
      collection.image = void 0;
      this.saveCollections();
      Spicetify.showNotification("Collection image removed");
    }
  };
  var CollectionsWrapper = _CollectionsWrapper;
  __publicField(CollectionsWrapper, "INSTANCE", new _CollectionsWrapper());
  window.CollectionsWrapper = CollectionsWrapper.INSTANCE;
  var collections_wrapper_default = CollectionsWrapper;
  return __toCommonJS(collections_wrapper_exports);
})();

        })();