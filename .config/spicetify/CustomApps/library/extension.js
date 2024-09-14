(async function() {
          while (!Spicetify.React || !Spicetify.ReactDOM) {
            await new Promise(resolve => setTimeout(resolve, 10));
          }
          "use strict";
var library = (() => {
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

  // external-global-plugin:react-dom
  var require_react_dom = __commonJS({
    "external-global-plugin:react-dom"(exports, module) {
      module.exports = Spicetify.ReactDOM;
    }
  });

  // ../shared/config/config_wrapper.tsx
  var import_react2 = __toESM(require_react());

  // ../shared/config/config_modal.tsx
  var import_react = __toESM(require_react());
  var TextInput = (props) => {
    const handleTextChange = (event) => {
      props.callback(event.target.value);
    };
    return /* @__PURE__ */ import_react.default.createElement("label", {
      className: "text-input-wrapper"
    }, /* @__PURE__ */ import_react.default.createElement("input", {
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
    return /* @__PURE__ */ import_react.default.createElement("label", {
      className: "dropdown-wrapper"
    }, /* @__PURE__ */ import_react.default.createElement("select", {
      className: "dropdown-input",
      value: props.value,
      "data-storage-key": props.storageKey,
      id: `dropdown:${props.storageKey}`,
      title: `Dropdown for ${props.storageKey}`,
      onChange: handleDropdownChange
    }, props.options.map((option, index) => /* @__PURE__ */ import_react.default.createElement("option", {
      key: index,
      value: option
    }, option))));
  };
  var ToggleInput = (props) => {
    const { Toggle } = Spicetify.ReactComponent;
    const handleToggleChange = (newValue) => {
      props.callback(newValue);
    };
    return /* @__PURE__ */ import_react.default.createElement(Toggle, {
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
    return /* @__PURE__ */ import_react.default.createElement(Slider, {
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
    return /* @__PURE__ */ import_react.default.createElement("svg", {
      role: "img",
      height: "16",
      width: "16",
      className: "Svg-sc-ytk21e-0 uPxdw nW1RKQOkzcJcX6aDCZB4",
      viewBox: "0 0 16 16"
    }, /* @__PURE__ */ import_react.default.createElement("path", {
      d: "M8 1.5a6.5 6.5 0 100 13 6.5 6.5 0 000-13zM0 8a8 8 0 1116 0A8 8 0 010 8z"
    }), /* @__PURE__ */ import_react.default.createElement("path", {
      d: "M7.25 12.026v-1.5h1.5v1.5h-1.5zm.884-7.096A1.125 1.125 0 007.06 6.39l-1.431.448a2.625 2.625 0 115.13-.784c0 .54-.156 1.015-.503 1.488-.3.408-.7.652-.973.818l-.112.068c-.185.116-.26.203-.302.283-.046.087-.097.245-.097.57h-1.5c0-.47.072-.898.274-1.277.206-.385.507-.645.827-.846l.147-.092c.285-.177.413-.257.526-.41.169-.23.213-.397.213-.602 0-.622-.503-1.125-1.125-1.125z"
    }));
  };
  var ConfigRow = (props) => {
    return /* @__PURE__ */ import_react.default.createElement("div", {
      className: "setting-row"
    }, /* @__PURE__ */ import_react.default.createElement("label", {
      className: "col description"
    }, props.name, props.desc && /* @__PURE__ */ import_react.default.createElement(Spicetify.ReactComponent.TooltipWrapper, {
      label: /* @__PURE__ */ import_react.default.createElement("div", {
        dangerouslySetInnerHTML: { __html: props.desc }
      }),
      renderInline: true,
      showDelay: 10,
      placement: "top",
      labelClassName: "tooltip",
      disabled: false
    }, /* @__PURE__ */ import_react.default.createElement("div", {
      className: "tooltip-icon"
    }, /* @__PURE__ */ import_react.default.createElement(TooltipIcon, null)))), /* @__PURE__ */ import_react.default.createElement("div", {
      className: "col action"
    }, props.children));
  };
  var ConfigModal = (props) => {
    const { config, structure, appKey, updateAppConfig } = props;
    const [modalConfig, setModalConfig] = import_react.default.useState({ ...config });
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
            return /* @__PURE__ */ import_react.default.createElement(ToggleInput, {
              storageKey: key,
              value: currentValue,
              callback: updateItem
            });
          case "text":
            return /* @__PURE__ */ import_react.default.createElement(TextInput, {
              storageKey: key,
              value: currentValue,
              callback: updateItem
            });
          case "dropdown":
            return /* @__PURE__ */ import_react.default.createElement(Dropdown, {
              storageKey: key,
              value: currentValue,
              options: modalRow.options,
              callback: updateItem
            });
          case "slider":
            return /* @__PURE__ */ import_react.default.createElement(SliderInput, {
              storageKey: key,
              value: currentValue,
              min: modalRow.min,
              max: modalRow.max,
              step: modalRow.step,
              callback: updateItem
            });
        }
      };
      return /* @__PURE__ */ import_react.default.createElement(import_react.default.Fragment, null, header && index !== 0 && /* @__PURE__ */ import_react.default.createElement("br", null), header && /* @__PURE__ */ import_react.default.createElement("h2", {
        className: "section-header"
      }, modalRow.sectionHeader), /* @__PURE__ */ import_react.default.createElement(ConfigRow, {
        name: modalRow.name,
        desc: modalRow.desc
      }, element()));
    });
    return /* @__PURE__ */ import_react.default.createElement("div", {
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
          content: /* @__PURE__ */ import_react2.default.createElement(config_modal_default, {
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
  var import_react10 = __toESM(require_react());
  var import_react_dom = __toESM(require_react_dom());

  // src/components/toggle_filters.tsx
  var import_react3 = __toESM(require_react());
  var UpIcon = () => {
    const { IconComponent } = Spicetify.ReactComponent;
    return /* @__PURE__ */ import_react3.default.createElement(IconComponent, {
      semanticColor: "textSubdued",
      dangerouslySetInnerHTML: {
        __html: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path d="M.998 8.81A.749.749 0 0 1 .47 7.53L7.99 0l7.522 7.53a.75.75 0 1 1-1.06 1.06L8.74 2.87v12.38a.75.75 0 1 1-1.498 0V2.87L1.528 8.59a.751.751 0 0 1-.53.22z"></path></svg>'
      },
      iconSize: 16
    });
  };
  var DownIcon = () => {
    const { IconComponent } = Spicetify.ReactComponent;
    return /* @__PURE__ */ import_react3.default.createElement(IconComponent, {
      semanticColor: "textSubdued",
      dangerouslySetInnerHTML: {
        __html: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path d="M.998 7.19A.749.749 0 0 0 .47 8.47L7.99 16l7.522-7.53a.75.75 0 1 0-1.06-1.06L8.74 13.13V.75a.75.75 0 1 0-1.498 0v12.38L1.528 7.41a.749.749 0 0 0-.53-.22z"></path></svg>'
      },
      iconSize: 16
    });
  };
  var ToggleFiltersButton = () => {
    const [direction, setDirection] = import_react3.default.useState(
      document.body.classList.contains("show-ylx-filters") ? "up" : "down"
    );
    const { ButtonTertiary } = Spicetify.ReactComponent;
    const toggleDirection = () => {
      if (direction === "down") {
        document.body.classList.add("show-ylx-filters");
        setDirection("up");
      } else {
        setDirection("down");
        document.body.classList.remove("show-ylx-filters");
      }
    };
    const Icon = direction === "down" ? DownIcon : UpIcon;
    return /* @__PURE__ */ import_react3.default.createElement(ButtonTertiary, {
      buttonSize: "sm",
      "aria-label": "Show Filters",
      iconOnly: Icon,
      onClick: toggleDirection
    });
  };
  var toggle_filters_default = ToggleFiltersButton;

  // src/components/collapse_button.tsx
  var import_react4 = __toESM(require_react());
  var collapseLibrary = () => {
    Spicetify.Platform.LocalStorageAPI.setItem("ylx-sidebar-state", 1);
  };
  var CollapseIcon = () => {
    const { IconComponent } = Spicetify.ReactComponent;
    return /* @__PURE__ */ import_react4.default.createElement(IconComponent, {
      semanticColor: "textSubdued",
      dangerouslySetInnerHTML: {
        __html: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path d="M8.81 1A.749.749 0 0 0 7.53.47L0 7.99l7.53 7.521a.75.75 0 0 0 1.234-.815.75.75 0 0 0-.174-.243L2.87 8.74h12.38a.75.75 0 1 0 0-1.498H2.87l5.72-5.713c.14-.14.22-.331.22-.53z"></path></svg>'
      },
      iconSize: 16
    });
  };
  var CollapseButton = () => {
    const { ButtonTertiary } = Spicetify.ReactComponent;
    return /* @__PURE__ */ import_react4.default.createElement(ButtonTertiary, {
      buttonSize: "sm",
      "aria-label": "Show Filters",
      iconOnly: CollapseIcon,
      onClick: collapseLibrary
    });
  };
  var collapse_button_default = CollapseButton;

  // src/components/album_menu_item.tsx
  var import_react8 = __toESM(require_react());

  // src/components/leading_icon.tsx
  var import_react5 = __toESM(require_react());
  var LeadingIcon = ({ path }) => {
    return /* @__PURE__ */ import_react5.default.createElement(Spicetify.ReactComponent.IconComponent, {
      semanticColor: "textSubdued",
      dangerouslySetInnerHTML: {
        __html: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">${path}</svg>`
      },
      iconSize: 16
    });
  };
  var leading_icon_default = LeadingIcon;

  // src/components/text_input_dialog.tsx
  var import_react6 = __toESM(require_react());
  var TextInputDialog = (props) => {
    const { def, placeholder, onSave } = props;
    const [value, setValue] = import_react6.default.useState(def || "");
    const onSubmit = (e) => {
      e.preventDefault();
      Spicetify.PopupModal.hide();
      onSave(value);
    };
    return /* @__PURE__ */ import_react6.default.createElement(import_react6.default.Fragment, null, /* @__PURE__ */ import_react6.default.createElement("form", {
      className: "text-input-form",
      onSubmit
    }, /* @__PURE__ */ import_react6.default.createElement("label", {
      className: "text-input-wrapper"
    }, /* @__PURE__ */ import_react6.default.createElement("input", {
      className: "text-input",
      type: "text",
      value,
      placeholder,
      onChange: (e) => setValue(e.target.value)
    })), /* @__PURE__ */ import_react6.default.createElement("button", {
      type: "submit",
      "data-encore-id": "buttonPrimary",
      className: "Button-sc-qlcn5g-0 Button-small-buttonPrimary"
    }, /* @__PURE__ */ import_react6.default.createElement("span", {
      className: "ButtonInner-sc-14ud5tc-0 ButtonInner-small encore-bright-accent-set"
    }, "Save"))));
  };
  var text_input_dialog_default = TextInputDialog;

  // src/components/searchbar.tsx
  var import_react7 = __toESM(require_react());
  var SearchBar = (props) => {
    const { setSearch, placeholder } = props;
    const handleChange = (e) => {
      setSearch(e.target.value);
    };
    return /* @__PURE__ */ import_react7.default.createElement("div", {
      className: "x-filterBox-filterInputContainer x-filterBox-expandedOrHasFilter",
      role: "search"
    }, /* @__PURE__ */ import_react7.default.createElement("input", {
      type: "text",
      className: "x-filterBox-filterInput",
      role: "searchbox",
      maxLength: 80,
      autoCorrect: "off",
      autoCapitalize: "off",
      spellCheck: "false",
      placeholder: `Search ${placeholder}`,
      "aria-hidden": "false",
      onChange: handleChange
    }), /* @__PURE__ */ import_react7.default.createElement("div", {
      className: "x-filterBox-overlay"
    }, /* @__PURE__ */ import_react7.default.createElement("span", {
      className: "x-filterBox-searchIconContainer"
    }, /* @__PURE__ */ import_react7.default.createElement("svg", {
      "data-encore-id": "icon",
      role: "img",
      "aria-hidden": "true",
      className: "Svg-sc-ytk21e-0 Svg-img-icon-small x-filterBox-searchIcon",
      viewBox: "0 0 16 16"
    }, /* @__PURE__ */ import_react7.default.createElement("path", {
      d: "M7 1.75a5.25 5.25 0 1 0 0 10.5 5.25 5.25 0 0 0 0-10.5zM.25 7a6.75 6.75 0 1 1 12.096 4.12l3.184 3.185a.75.75 0 1 1-1.06 1.06L11.304 12.2A6.75 6.75 0 0 1 .25 7z"
    })))), /* @__PURE__ */ import_react7.default.createElement("button", {
      className: "x-filterBox-expandButton",
      "aria-hidden": "false",
      "aria-label": "Search Playlists",
      type: "button"
    }, /* @__PURE__ */ import_react7.default.createElement("svg", {
      "data-encore-id": "icon",
      role: "img",
      "aria-hidden": "true",
      className: "Svg-sc-ytk21e-0 Svg-img-icon-small x-filterBox-searchIcon",
      viewBox: "0 0 16 16"
    }, /* @__PURE__ */ import_react7.default.createElement("path", {
      d: "M7 1.75a5.25 5.25 0 1 0 0 10.5 5.25 5.25 0 0 0 0-10.5zM.25 7a6.75 6.75 0 1 1 12.096 4.12l3.184 3.185a.75.75 0 1 1-1.06 1.06L11.304 12.2A6.75 6.75 0 0 1 .25 7z"
    }))));
  };
  var searchbar_default = SearchBar;

  // src/components/album_menu_item.tsx
  var createCollection = () => {
    const onSave = (value) => {
      CollectionsWrapper.createCollection(value);
    };
    Spicetify.PopupModal.display({
      title: "Create Collection",
      content: /* @__PURE__ */ import_react8.default.createElement(text_input_dialog_default, {
        def: "New Collection",
        placeholder: "Collection Name",
        onSave
      })
    });
  };
  var CollectionSearchMenu = () => {
    const { MenuItem } = Spicetify.ReactComponent;
    const { SVGIcons } = Spicetify;
    const [textFilter, setTextFilter] = import_react8.default.useState("");
    const [collections, setCollections] = import_react8.default.useState(null);
    const context = import_react8.default.useContext(Spicetify.ContextMenuV2._context);
    const uri = context?.props?.uri;
    import_react8.default.useEffect(() => {
      const fetchCollections = async () => {
        setCollections(await CollectionsWrapper.getContents({ textFilter, limit: 20, offset: 0 }));
      };
      fetchCollections();
    }, [textFilter]);
    if (!collections)
      return /* @__PURE__ */ import_react8.default.createElement(import_react8.default.Fragment, null);
    const addToCollection = (collectionUri) => {
      CollectionsWrapper.addAlbumToCollection(collectionUri, uri);
    };
    const activeCollections = CollectionsWrapper.getCollectionsWithAlbum(uri);
    const hasCollections = activeCollections.length > 0;
    const removeFromCollections = () => {
      for (const collection of activeCollections) {
        CollectionsWrapper.removeAlbumFromCollection(collection.uri, uri);
      }
    };
    const allCollectionsLength = collections.totalLength;
    const menuItems = collections.items.map((collection, index) => {
      return /* @__PURE__ */ import_react8.default.createElement(MenuItem, {
        key: collection.uri,
        onClick: () => {
          addToCollection(collection.uri);
        },
        divider: index === 0 ? "before" : void 0
      }, collection.name);
    });
    const menuLength = allCollectionsLength + (hasCollections ? 1 : 0);
    return /* @__PURE__ */ import_react8.default.createElement("div", {
      className: "main-contextMenu-filterPlaylistSearchContainer",
      style: { "--context-menu-submenu-length": `${menuLength}` }
    }, /* @__PURE__ */ import_react8.default.createElement("li", {
      role: "presentation",
      className: "main-contextMenu-filterPlaylistSearch"
    }, /* @__PURE__ */ import_react8.default.createElement("div", {
      role: "menuitem"
    }, /* @__PURE__ */ import_react8.default.createElement(searchbar_default, {
      setSearch: setTextFilter,
      placeholder: "collections"
    }))), /* @__PURE__ */ import_react8.default.createElement(MenuItem, {
      key: "new-collection",
      leadingIcon: /* @__PURE__ */ import_react8.default.createElement(leading_icon_default, {
        path: SVGIcons.plus2px
      }),
      onClick: createCollection
    }, "Create collection"), hasCollections && /* @__PURE__ */ import_react8.default.createElement(MenuItem, {
      key: "remove-collection",
      leadingIcon: /* @__PURE__ */ import_react8.default.createElement(leading_icon_default, {
        path: SVGIcons.minus
      }),
      onClick: removeFromCollections
    }, "Remove from all"), menuItems);
  };
  var AlbumMenuItem = () => {
    const { MenuSubMenuItem } = Spicetify.ReactComponent;
    const { SVGIcons } = Spicetify;
    return /* @__PURE__ */ import_react8.default.createElement(MenuSubMenuItem, {
      displayText: "Add to collection",
      divider: "after",
      leadingIcon: /* @__PURE__ */ import_react8.default.createElement(leading_icon_default, {
        path: SVGIcons.plus2px
      })
    }, /* @__PURE__ */ import_react8.default.createElement(CollectionSearchMenu, null));
  };
  var album_menu_item_default = AlbumMenuItem;

  // src/components/artist_menu_item.tsx
  var import_react9 = __toESM(require_react());
  var ArtistMenuItem = () => {
    const { MenuItem } = Spicetify.ReactComponent;
    const { SVGIcons } = Spicetify;
    const context = import_react9.default.useContext(Spicetify.ContextMenuV2._context);
    const uri = context?.props?.uri;
    return /* @__PURE__ */ import_react9.default.createElement(MenuItem, {
      divider: "after",
      leadingIcon: /* @__PURE__ */ import_react9.default.createElement(leading_icon_default, {
        path: SVGIcons.plus2px
      }),
      onClick: () => CollectionsWrapper.createCollectionFromDiscog(uri)
    }, "Create Discog Collection");
  };
  var artist_menu_item_default = ArtistMenuItem;

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
  var CollectionsWrapper2 = _CollectionsWrapper;
  __publicField(CollectionsWrapper2, "INSTANCE", new _CollectionsWrapper());
  window.CollectionsWrapper = CollectionsWrapper2.INSTANCE;

  // src/extensions/folder_image_wrapper.ts
  var _FolderImageWrapper = class extends EventTarget {
    _folderImages;
    constructor() {
      super();
      this._folderImages = JSON.parse(localStorage.getItem("library:folderImages") || "{}");
    }
    getFolderImage(uri) {
      return this._folderImages[uri];
    }
    getFolderImages() {
      return this._folderImages;
    }
    setFolderImage({ uri, url }) {
      this._folderImages[uri] = url;
      this.saveFolderImages();
      Spicetify.showNotification("Folder image updated");
    }
    removeFolderImage(uri) {
      delete this._folderImages[uri];
      this.saveFolderImages();
      Spicetify.showNotification("Folder image removed");
    }
    saveFolderImages() {
      this.dispatchEvent(new CustomEvent("update", { detail: this._folderImages }));
      localStorage.setItem("library:folderImages", JSON.stringify(this._folderImages));
    }
  };
  var FolderImageWrapper2 = _FolderImageWrapper;
  __publicField(FolderImageWrapper2, "INSTANCE", new _FolderImageWrapper());
  window.FolderImageWrapper = FolderImageWrapper2.INSTANCE;

  // src/extensions/extension.tsx
  var styleLink = document.createElement("link");
  styleLink.rel = "stylesheet";
  styleLink.href = "/spicetify-routes-library.css";
  document.head.appendChild(styleLink);
  var setCardSize = (size) => {
    document.documentElement.style.setProperty("--library-card-size", `${size}px`);
  };
  var setSearchBarSize = (enlarged) => {
    const size = enlarged ? 300 : 200;
    document.documentElement.style.setProperty("--library-searchbar-size", `${size}px`);
  };
  var FolderImage = ({ url }) => {
    return /* @__PURE__ */ import_react10.default.createElement("img", {
      alt: "Folder Image",
      "aria-hidden": "true",
      draggable: "false",
      loading: "eager",
      src: url,
      className: "main-image-image x-entityImage-image main-image-loading main-image-loaded"
    });
  };
  var FolderPlaceholder = () => {
    return /* @__PURE__ */ import_react10.default.createElement("div", {
      className: "x-entityImage-imagePlaceholder"
    }, /* @__PURE__ */ import_react10.default.createElement("svg", {
      "data-encore-id": "icon",
      role: "img",
      "aria-hidden": "true",
      className: "Svg-sc-ytk21e-0 Svg-img-icon-medium",
      viewBox: "0 0 24 24"
    }, /* @__PURE__ */ import_react10.default.createElement("path", {
      d: "M1 4a2 2 0 0 1 2-2h5.155a3 3 0 0 1 2.598 1.5l.866 1.5H21a2 2 0 0 1 2 2v13a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4zm7.155 0H3v16h18V7H10.464L9.021 4.5a1 1 0 0 0-.866-.5z"
    })));
  };
  var SpicetifyLibrary = class {
    ConfigWrapper = new config_wrapper_default(
      [
        {
          name: "Card Size",
          key: "cardSize",
          type: "slider",
          min: 100,
          max: 200,
          step: 0.05,
          def: 180,
          callback: setCardSize
        },
        {
          name: "Extend Search Bar",
          key: "extendSearchBar",
          type: "toggle",
          def: false,
          callback: setSearchBarSize
        },
        {
          name: "Playlists Page",
          key: "show-playlists",
          type: "toggle",
          def: true,
          sectionHeader: "Pages"
        },
        { name: "Albums Page", key: "show-albums", type: "toggle", def: true },
        { name: "Collections Page", key: "show-collections", type: "toggle", def: true },
        { name: "Artists Page", key: "show-artists", type: "toggle", def: true },
        { name: "Shows Page", key: "show-shows", type: "toggle", def: true }
      ],
      "library"
    );
  };
  window.SpicetifyLibrary = new SpicetifyLibrary();
  (function wait() {
    const { LocalStorageAPI } = Spicetify.Platform;
    if (!LocalStorageAPI) {
      setTimeout(wait, 100);
      return;
    }
    main(LocalStorageAPI);
  })();
  function main(LocalStorageAPI) {
    const isAlbum = (props) => props.uri?.includes("album");
    const isArtist = (props) => props.uri?.includes("artist");
    Spicetify.ContextMenuV2.registerItem(/* @__PURE__ */ import_react10.default.createElement(album_menu_item_default, null), isAlbum);
    Spicetify.ContextMenuV2.registerItem(/* @__PURE__ */ import_react10.default.createElement(artist_menu_item_default, null), isArtist);
    Spicetify.Platform.LibraryAPI.getEvents()._emitter.addListener("update", () => CollectionsWrapper.cleanCollections());
    function injectFolderImages() {
      const rootlist = document.querySelector(".main-rootlist-wrapper > div:nth-child(2)");
      if (!rootlist)
        return setTimeout(injectFolderImages, 100);
      setTimeout(() => {
        for (const el of Array.from(rootlist.children)) {
          const uri = el.querySelector("[aria-labelledby]")?.getAttribute("aria-labelledby")?.slice(14);
          if (uri?.includes("folder")) {
            const imageBox = el.querySelector(".x-entityImage-imageContainer");
            if (!imageBox)
              return;
            const imageUrl = FolderImageWrapper.getFolderImage(uri);
            if (!imageUrl)
              import_react_dom.default.render(/* @__PURE__ */ import_react10.default.createElement(FolderPlaceholder, null), imageBox);
            else
              import_react_dom.default.render(/* @__PURE__ */ import_react10.default.createElement(FolderImage, {
                url: imageUrl
              }), imageBox);
          }
        }
      }, 500);
    }
    injectFolderImages();
    FolderImageWrapper.addEventListener("update", injectFolderImages);
    function injectYLXButtons() {
      const ylx_filter = document.querySelector(".main-yourLibraryX-libraryRootlist > .main-yourLibraryX-libraryFilter");
      if (!ylx_filter) {
        return setTimeout(injectYLXButtons, 100);
      }
      injectFiltersButton(ylx_filter);
      injectCollapseButton(ylx_filter);
    }
    function injectFiltersButton(ylx_filter) {
      const toggleFiltersButton = document.createElement("span");
      toggleFiltersButton.classList.add("toggle-filters-button");
      ylx_filter.appendChild(toggleFiltersButton);
      import_react_dom.default.render(/* @__PURE__ */ import_react10.default.createElement(toggle_filters_default, null), toggleFiltersButton);
    }
    function injectCollapseButton(ylx_filter) {
      const collapseButton = document.createElement("span");
      collapseButton.classList.add("collapse-button");
      ylx_filter.appendChild(collapseButton);
      import_react_dom.default.render(
        /* @__PURE__ */ import_react10.default.createElement(Spicetify.ReactComponent.TooltipWrapper, {
          label: "Collapse Sidebar",
          placement: "top"
        }, /* @__PURE__ */ import_react10.default.createElement(collapse_button_default, null)),
        collapseButton
      );
    }
    const state = LocalStorageAPI.getItem("ylx-sidebar-state");
    if (state === 0)
      injectYLXButtons();
    LocalStorageAPI.getEvents()._emitter.addListener("update", (e) => {
      const { key, value } = e.data;
      if (key === "ylx-sidebar-state" && value === 0) {
        injectFolderImages();
        injectYLXButtons();
      }
      if (key === "ylx-sidebar-state" && value === 1) {
        injectFolderImages();
      }
    });
  }
})();

        })();