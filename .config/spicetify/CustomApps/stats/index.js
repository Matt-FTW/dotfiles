var stats = (() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
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
  var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
    isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
    mod
  ));
  var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

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

  // ../../../AppData/Local/Temp/spicetify-creator/index.jsx
  var spicetify_creator_exports = {};
  __export(spicetify_creator_exports, {
    default: () => render
  });

  // src/app.tsx
  var import_react29 = __toESM(require_react());

  // ../node_modules/spcr-navigation-bar/useNavigationBar.tsx
  var import_react3 = __toESM(require_react());

  // ../node_modules/spcr-navigation-bar/navBar.tsx
  var import_react2 = __toESM(require_react());
  var import_react_dom = __toESM(require_react_dom());

  // ../node_modules/spcr-navigation-bar/optionsMenu.tsx
  var import_react = __toESM(require_react());
  var OptionsMenuItemIcon = /* @__PURE__ */ import_react.default.createElement("svg", {
    width: 16,
    height: 16,
    viewBox: "0 0 16 16",
    fill: "currentColor"
  }, /* @__PURE__ */ import_react.default.createElement("path", {
    d: "M13.985 2.383L5.127 12.754 1.388 8.375l-.658.77 4.397 5.149 9.618-11.262z"
  }));
  var OptionsMenuItem = import_react.default.memo((props) => {
    return /* @__PURE__ */ import_react.default.createElement(Spicetify.ReactComponent.MenuItem, {
      onClick: props.onSelect,
      icon: props.isSelected ? OptionsMenuItemIcon : null
    }, props.value);
  });
  var OptionsMenu = import_react.default.memo((props) => {
    const menuRef = import_react.default.useRef(null);
    const menu = /* @__PURE__ */ import_react.default.createElement(Spicetify.ReactComponent.Menu, null, props.options.map(
      (option) => /* @__PURE__ */ import_react.default.createElement(OptionsMenuItem, {
        value: option.link,
        isSelected: option.isActive,
        onSelect: () => {
          props.onSelect(option.link);
          menuRef.current?.click();
        }
      })
    ));
    return /* @__PURE__ */ import_react.default.createElement(Spicetify.ReactComponent.ContextMenu, {
      menu,
      trigger: "click",
      action: "toggle",
      renderInLine: true
    }, /* @__PURE__ */ import_react.default.createElement("button", {
      className: navBar_module_default.optionsMenuDropBox,
      ref: menuRef
    }, /* @__PURE__ */ import_react.default.createElement("span", {
      className: props.bold ? "main-type-mestoBold" : "main-type-mesto"
    }, props.options.find((o) => o.isActive)?.link || props.defaultValue), /* @__PURE__ */ import_react.default.createElement("svg", {
      width: 16,
      height: 16,
      viewBox: "0 0 16 16",
      fill: "currentColor"
    }, /* @__PURE__ */ import_react.default.createElement("path", {
      d: "M3 6l5 5.794L13 6z"
    }))));
  });
  var optionsMenu_default = OptionsMenu;

  // postcss-module:C:\Users\user\AppData\Local\Temp\tmp-17120-n3iWRzissBjg\18f3cbbb4bc3\navBar.module.css
  var navBar_module_default = { "topBarHeaderItem": "navBar-module__topBarHeaderItem___piw4C_stats", "topBarHeaderItemLink": "navBar-module__topBarHeaderItemLink___xA4uv_stats", "topBarActive": "navBar-module__topBarActive___XhWpm_stats", "topBarNav": "navBar-module__topBarNav___qWGeZ_stats", "optionsMenuDropBox": "navBar-module__optionsMenuDropBox___pzfNI_stats" };

  // ../node_modules/spcr-navigation-bar/navBar.tsx
  var NavbarItem2 = class {
    constructor(link, isActive) {
      this.link = link;
      this.isActive = isActive;
    }
  };
  var NavbarItemComponent = (props) => {
    return /* @__PURE__ */ import_react2.default.createElement("li", {
      className: navBar_module_default.topBarHeaderItem,
      onClick: (e) => {
        e.preventDefault();
        props.switchTo(props.item.link);
      }
    }, /* @__PURE__ */ import_react2.default.createElement("a", {
      className: `${navBar_module_default.topBarHeaderItemLink} ${props.item.isActive ? navBar_module_default.topBarActive : ""}`,
      "aria-current": "page",
      draggable: false,
      href: ""
    }, /* @__PURE__ */ import_react2.default.createElement("span", {
      className: "main-type-mestoBold"
    }, props.item.link)));
  };
  var NavbarMore = import_react2.default.memo(({ items, switchTo }) => {
    return /* @__PURE__ */ import_react2.default.createElement("li", {
      className: `${navBar_module_default.topBarHeaderItem} ${items.find((item) => item.isActive) ? navBar_module_default.topBarActive : ""}`
    }, /* @__PURE__ */ import_react2.default.createElement(optionsMenu_default, {
      options: items,
      onSelect: switchTo,
      defaultValue: "More",
      bold: true
    }));
  });
  var NavbarContent = (props) => {
    const resizeHost = document.querySelector(".Root__main-view .os-resize-observer-host") ?? document.querySelector(".Root__main-view .os-size-observer");
    const [windowSize, setWindowSize] = (0, import_react2.useState)(resizeHost.clientWidth);
    const resizeHandler = () => setWindowSize(resizeHost.clientWidth);
    (0, import_react2.useEffect)(() => {
      const observer = new ResizeObserver(resizeHandler);
      observer.observe(resizeHost);
      return () => {
        observer.disconnect();
      };
    }, [resizeHandler]);
    return /* @__PURE__ */ import_react2.default.createElement(NavbarContext, null, /* @__PURE__ */ import_react2.default.createElement(Navbar, {
      ...props,
      windowSize
    }));
  };
  var NavbarContext = (props) => {
    return import_react_dom.default.createPortal(
      /* @__PURE__ */ import_react2.default.createElement("div", {
        className: "main-topbar-topbarContent"
      }, props.children),
      document.querySelector(".main-topBar-topbarContentWrapper")
    );
  };
  var Navbar = (props) => {
    const navBarListRef = import_react2.default.useRef(null);
    const [childrenSizes, setChildrenSizes] = (0, import_react2.useState)([]);
    const [availableSpace, setAvailableSpace] = (0, import_react2.useState)(0);
    const [outOfRangeItemIndexes, setOutOfRangeItemIndexes] = (0, import_react2.useState)([]);
    let items = props.links.map((link) => new NavbarItem2(link, link === props.activeLink));
    (0, import_react2.useEffect)(() => {
      if (!navBarListRef.current)
        return;
      const children = Array.from(navBarListRef.current.children);
      const navBarItemSizes = children.map((child) => child.clientWidth);
      setChildrenSizes(navBarItemSizes);
    }, []);
    (0, import_react2.useEffect)(() => {
      if (!navBarListRef.current)
        return;
      setAvailableSpace(navBarListRef.current.clientWidth);
    }, [props.windowSize]);
    (0, import_react2.useEffect)(() => {
      if (!navBarListRef.current)
        return;
      let totalSize = childrenSizes.reduce((a, b) => a + b, 0);
      if (totalSize <= availableSpace) {
        setOutOfRangeItemIndexes([]);
        return;
      }
      const viewMoreButtonSize = Math.max(...childrenSizes);
      const itemsToHide = [];
      let stopWidth = viewMoreButtonSize;
      childrenSizes.forEach((childWidth, i) => {
        if (availableSpace >= stopWidth + childWidth) {
          stopWidth += childWidth;
        } else if (i !== items.length) {
          itemsToHide.push(i);
        }
      });
      setOutOfRangeItemIndexes(itemsToHide);
    }, [availableSpace, childrenSizes]);
    return /* @__PURE__ */ import_react2.default.createElement("nav", {
      className: navBar_module_default.topBarNav
    }, /* @__PURE__ */ import_react2.default.createElement("ul", {
      className: navBar_module_default.topBarHeader,
      ref: navBarListRef
    }, items.filter((_, id) => !outOfRangeItemIndexes.includes(id)).map(
      (item) => /* @__PURE__ */ import_react2.default.createElement(NavbarItemComponent, {
        item,
        switchTo: props.switchCallback
      })
    ), outOfRangeItemIndexes.length ? /* @__PURE__ */ import_react2.default.createElement(NavbarMore, {
      items: outOfRangeItemIndexes.map((i) => items[i]),
      switchTo: props.switchCallback
    }) : null));
  };
  var navBar_default = NavbarContent;

  // ../node_modules/spcr-navigation-bar/useNavigationBar.tsx
  var useNavigationBar = (links) => {
    const [activeLink, setActiveLink] = (0, import_react3.useState)(links[0]);
    const navbar = /* @__PURE__ */ import_react3.default.createElement(navBar_default, {
      links,
      activeLink,
      switchCallback: (link) => setActiveLink(link)
    });
    return [navbar, activeLink, setActiveLink];
  };
  var useNavigationBar_default = useNavigationBar;

  // src/pages/top_artists.tsx
  var import_react17 = __toESM(require_react());

  // ../shared/dropdown/useDropdownMenu.tsx
  var import_react5 = __toESM(require_react());

  // ../shared/dropdown/dropdown.tsx
  var import_react4 = __toESM(require_react());
  function CheckIcon() {
    return /* @__PURE__ */ import_react4.default.createElement(Spicetify.ReactComponent.IconComponent, {
      iconSize: 16,
      semanticColor: "textBase",
      dangerouslySetInnerHTML: {
        __html: '<svg xmlns="http://www.w3.org/2000/svg"><path d="M15.53 2.47a.75.75 0 0 1 0 1.06L4.907 14.153.47 9.716a.75.75 0 0 1 1.06-1.06l3.377 3.376L14.47 2.47a.75.75 0 0 1 1.06 0z"/></svg>'
      }
    });
  }
  var MenuItem = (props) => {
    const { ReactComponent } = Spicetify;
    const { option, isActive, switchCallback } = props;
    const activeStyle = {
      backgroundColor: "rgba(var(--spice-rgb-selected-row),.1)"
    };
    return /* @__PURE__ */ import_react4.default.createElement(ReactComponent.MenuItem, {
      trigger: "click",
      onClick: () => switchCallback(option),
      "data-checked": isActive,
      trailingIcon: isActive ? /* @__PURE__ */ import_react4.default.createElement(CheckIcon, null) : void 0,
      style: isActive ? activeStyle : void 0
    }, option.name);
  };
  var DropdownMenu = (props) => {
    const { ContextMenu, Menu, TextComponent } = Spicetify.ReactComponent;
    const { options, activeOption, switchCallback } = props;
    const optionItems = options.map((option) => {
      return /* @__PURE__ */ import_react4.default.createElement(MenuItem, {
        option,
        isActive: option === activeOption,
        switchCallback
      });
    });
    const MenuWrapper2 = (props2) => {
      return /* @__PURE__ */ import_react4.default.createElement(Menu, {
        ...props2
      }, optionItems);
    };
    return /* @__PURE__ */ import_react4.default.createElement(ContextMenu, {
      menu: /* @__PURE__ */ import_react4.default.createElement(MenuWrapper2, null),
      trigger: "click"
    }, /* @__PURE__ */ import_react4.default.createElement("button", {
      className: "x-sortBox-sortDropdown",
      type: "button",
      role: "combobox",
      "aria-expanded": "false"
    }, /* @__PURE__ */ import_react4.default.createElement(TextComponent, {
      variant: "mesto",
      semanticColor: "textSubdued"
    }, activeOption.name), /* @__PURE__ */ import_react4.default.createElement("svg", {
      role: "img",
      height: "16",
      width: "16",
      "aria-hidden": "true",
      className: "Svg-img-16 Svg-img-16-icon Svg-img-icon Svg-img-icon-small",
      viewBox: "0 0 16 16",
      "data-encore-id": "icon"
    }, /* @__PURE__ */ import_react4.default.createElement("path", {
      d: "m14 6-6 6-6-6h12z"
    }))));
  };
  var dropdown_default = DropdownMenu;

  // ../shared/dropdown/useDropdownMenu.tsx
  var useDropdownMenu = (options, storageVariable) => {
    const initialOptionID = storageVariable && Spicetify.LocalStorage.get(`${storageVariable}:active-option`);
    const initialOption = initialOptionID && options.find((e) => e.id === initialOptionID);
    const [activeOption, setActiveOption] = (0, import_react5.useState)(initialOption || options[0]);
    const [availableOptions, setAvailableOptions] = (0, import_react5.useState)(options);
    const dropdown = /* @__PURE__ */ import_react5.default.createElement(dropdown_default, {
      options: availableOptions,
      activeOption,
      switchCallback: (option) => {
        setActiveOption(option);
        if (storageVariable)
          Spicetify.LocalStorage.set(`${storageVariable}:active-option`, option.id);
      }
    });
    return [dropdown, activeOption, setActiveOption, setAvailableOptions];
  };
  var useDropdownMenu_default = useDropdownMenu;

  // ../library/src/components/collection_menu.tsx
  var import_react8 = __toESM(require_react());

  // ../library/src/components/text_input_dialog.tsx
  var import_react6 = __toESM(require_react());
  var TextInputDialog = (props) => {
    const { ButtonPrimary } = Spicetify.ReactComponent;
    const { def, placeholder, onSave } = props;
    const [value, setValue] = import_react6.default.useState(def);
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

  // ../library/src/components/leading_icon.tsx
  var import_react7 = __toESM(require_react());
  var LeadingIcon = ({ path }) => {
    return /* @__PURE__ */ import_react7.default.createElement(Spicetify.ReactComponent.IconComponent, {
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
    const { Menu, MenuItem: MenuItem2 } = Spicetify.ReactComponent;
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
        content: /* @__PURE__ */ import_react8.default.createElement(text_input_dialog_default, {
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
        content: /* @__PURE__ */ import_react8.default.createElement(text_input_dialog_default, {
          def: image,
          placeholder: "Image URL",
          onSave: setImg
        })
      });
    };
    const removeImage = () => {
      SpicetifyLibrary.CollectionWrapper.removeCollectionImage(id);
    };
    return /* @__PURE__ */ import_react8.default.createElement(Menu, null, /* @__PURE__ */ import_react8.default.createElement(MenuItem2, {
      leadingIcon: /* @__PURE__ */ import_react8.default.createElement(leading_icon_default, {
        path: editIconPath
      }),
      onClick: renameCollection
    }, "Rename"), /* @__PURE__ */ import_react8.default.createElement(MenuItem2, {
      leadingIcon: /* @__PURE__ */ import_react8.default.createElement(leading_icon_default, {
        path: deleteIconPath
      }),
      onClick: deleteCollection
    }, "Delete"), /* @__PURE__ */ import_react8.default.createElement(MenuItem2, {
      leadingIcon: /* @__PURE__ */ import_react8.default.createElement(leading_icon_default, {
        path: editIconPath
      }),
      onClick: setCollectionImage
    }, "Set Collection Image"), image && /* @__PURE__ */ import_react8.default.createElement(MenuItem2, {
      leadingIcon: /* @__PURE__ */ import_react8.default.createElement(leading_icon_default, {
        path: deleteIconPath
      }),
      onClick: removeImage
    }, "Remove Collection Image"));
  };
  var collection_menu_default = CollectionMenu;

  // ../library/src/components/folder_menu.tsx
  var import_react9 = __toESM(require_react());
  var editIconPath2 = '<path d="M11.838.714a2.438 2.438 0 0 1 3.448 3.448l-9.841 9.841c-.358.358-.79.633-1.267.806l-3.173 1.146a.75.75 0 0 1-.96-.96l1.146-3.173c.173-.476.448-.909.806-1.267l9.84-9.84zm2.387 1.06a.938.938 0 0 0-1.327 0l-9.84 9.842a1.953 1.953 0 0 0-.456.716L2 14.002l1.669-.604a1.95 1.95 0 0 0 .716-.455l9.841-9.841a.938.938 0 0 0 0-1.327z"></path>';
  var deleteIconPath2 = '<path d="M8 1.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"></path><path d="M12 8.75H4v-1.5h8v1.5z"></path>';
  var FolderMenu = ({ uri }) => {
    const { MenuItem: MenuItem2, Menu } = Spicetify.ReactComponent;
    const image = SpicetifyLibrary.FolderImageWrapper.getFolderImage(uri);
    const setImage = () => {
      const setNewImage = (newUrl) => {
        SpicetifyLibrary.FolderImageWrapper.setFolderImage({ uri, url: newUrl });
      };
      Spicetify.PopupModal.display({
        title: "Set Folder Image",
        content: /* @__PURE__ */ import_react9.default.createElement(text_input_dialog_default, {
          def: image,
          onSave: setNewImage
        })
      });
    };
    const removeImage = () => {
      SpicetifyLibrary.FolderImageWrapper.removeFolderImage(uri);
    };
    return /* @__PURE__ */ import_react9.default.createElement(Menu, null, /* @__PURE__ */ import_react9.default.createElement(MenuItem2, {
      leadingIcon: /* @__PURE__ */ import_react9.default.createElement(leading_icon_default, {
        path: editIconPath2
      }),
      onClick: setImage
    }, "Set Folder Image"), image && /* @__PURE__ */ import_react9.default.createElement(MenuItem2, {
      leadingIcon: /* @__PURE__ */ import_react9.default.createElement(leading_icon_default, {
        path: deleteIconPath2
      }),
      onClick: removeImage
    }, "Remove Folder Image"));
  };
  var folder_menu_default = FolderMenu;

  // ../shared/components/spotify_card.tsx
  var import_react11 = __toESM(require_react());

  // ../shared/components/folder_fallback.tsx
  var import_react10 = __toESM(require_react());
  var FolderSVG = (e) => {
    return /* @__PURE__ */ import_react10.default.createElement(Spicetify.ReactComponent.IconComponent, {
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
          return /* @__PURE__ */ import_react11.default.createElement(ArtistMenu, {
            uri
          });
        case "album":
          return /* @__PURE__ */ import_react11.default.createElement(AlbumMenu, {
            uri,
            artistUri,
            canRemove: true
          });
        case "playlist":
          return /* @__PURE__ */ import_react11.default.createElement(PlaylistMenu, {
            uri
          });
        case "show":
          return /* @__PURE__ */ import_react11.default.createElement(PodcastShowMenu, {
            uri
          });
        case "collection":
          return /* @__PURE__ */ import_react11.default.createElement(collection_menu_default, {
            id: uri
          });
        case "folder":
          return /* @__PURE__ */ import_react11.default.createElement(folder_menu_default, {
            uri
          });
        default:
          return /* @__PURE__ */ import_react11.default.createElement(import_react11.default.Fragment, null);
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
    return /* @__PURE__ */ import_react11.default.createElement(ContextMenu, {
      menu: Menu(),
      trigger: "right-click"
    }, /* @__PURE__ */ import_react11.default.createElement(Card, {
      featureIdentifier: type,
      headerText: header,
      renderCardImage: () => /* @__PURE__ */ import_react11.default.createElement(CardImage, {
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
      renderSubHeaderContent: () => /* @__PURE__ */ import_react11.default.createElement(TextComponent, {
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

  // src/endpoints.ts
  var lfmperiods = {
    short_term: "1month",
    medium_term: "6month",
    long_term: "overall"
  };
  var LASTFM = {
    toptracks: (user, key, range) => `http://ws.audioscrobbler.com/2.0/?method=user.gettoptracks&user=${user}&api_key=${key}&format=json&period=${lfmperiods[range]}`,
    topalbums: (user, key, range) => `https://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=${user}&api_key=${key}&format=json&period=${lfmperiods[range]}`,
    topartists: (user, key, range) => `https://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=${user}&api_key=${key}&format=json&period=${lfmperiods[range]}`,
    charts: (key, type) => `http://ws.audioscrobbler.com/2.0/?method=chart.gettop${type}&api_key=${key}&format=json`
  };
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
  var updatePageCache = (i, callback, activeOption, lib = false) => {
    let cacheInfo = Spicetify.LocalStorage.get("stats:cache-info");
    if (!cacheInfo)
      return;
    let cacheInfoArray = JSON.parse(cacheInfo);
    if (!cacheInfoArray[i]) {
      if (!lib) {
        ["short_term", "medium_term", "long_term"].filter((option) => option !== activeOption).forEach((option) => callback(option, true, false));
      }
      if (lib === "charts") {
        ["artists", "tracks"].filter((option) => option !== activeOption).forEach((option) => callback(option, true, false));
      }
      callback(activeOption, true);
      cacheInfoArray[i] = true;
      Spicetify.LocalStorage.set("stats:cache-info", JSON.stringify(cacheInfoArray));
    }
  };
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
  var convertTrackData = async (data) => {
    return await Promise.all(
      data.map(async (item) => {
        const spotifyItem = await Spicetify.CosmosAsync.get(SPOTIFY.search(item.name, item.artist.name)).then(
          (res) => res.tracks?.items[0]
        );
        if (!spotifyItem) {
          console.log(`couldn't find track: ${item.name} by ${item.artist.name}`);
          return {
            name: item.name,
            image: PLACEHOLDER,
            uri: item.url,
            artists: [{ name: item.artist.name, uri: item.artist.url }],
            duration: 0,
            album: "N/A",
            popularity: 0,
            explicit: false,
            album_uri: item.url
          };
        }
        return {
          name: item.name,
          image: spotifyItem.album.images[0].url,
          uri: spotifyItem.uri,
          id: spotifyItem.id,
          artists: spotifyItem.artists.map((artist) => ({ name: artist.name, uri: artist.uri })),
          duration: spotifyItem.duration_ms,
          album: spotifyItem.album.name,
          popularity: spotifyItem.popularity,
          explicit: spotifyItem.explicit,
          album_uri: spotifyItem.album.uri,
          release_year: spotifyItem.album.release_date.slice(0, 4)
        };
      })
    );
  };
  var convertAlbumData = async (data) => {
    return await Promise.all(
      data.map(async (item) => {
        const spotifyItem = await Spicetify.CosmosAsync.get(SPOTIFY.searchalbum(item.name, item.artist.name)).then(
          (res) => res.albums?.items[0]
        );
        if (!spotifyItem) {
          console.log(`couldn't find album: ${item.name} by ${item.artist.name}`);
          return {
            name: item.name,
            image: PLACEHOLDER,
            uri: item.url,
            id: item.mbid
          };
        }
        return {
          name: item.name,
          image: spotifyItem.images[0].url,
          uri: spotifyItem.uri,
          id: spotifyItem.id
        };
      })
    );
  };
  var convertArtistData = async (data) => {
    return await Promise.all(
      data.map(async (item) => {
        const spotifyItem = await Spicetify.CosmosAsync.get(SPOTIFY.searchartist(item.name)).then(
          (res) => res.artists?.items[0]
        );
        if (!spotifyItem) {
          console.log(`couldn't find artist: ${item.name}`);
          return {
            name: item.name,
            image: PLACEHOLDER,
            uri: item.url,
            id: item.mbid
          };
        }
        return {
          name: item.name,
          image: spotifyItem.images[0].url,
          uri: spotifyItem.uri,
          id: spotifyItem.id,
          genres: spotifyItem.genres
        };
      })
    );
  };
  var checkLiked = async (tracks) => {
    const nullIndexes = [];
    tracks.forEach((track, index) => {
      if (track === null) {
        nullIndexes.push(index);
      }
    });
    const apiResponse = await apiRequest("checkLiked", SPOTIFY.queryliked(tracks.filter((e) => e).join(",")));
    if (!apiResponse)
      return;
    const response = [];
    let nullIndexesIndex = 0;
    for (let i = 0; i < tracks.length; i++) {
      if (nullIndexes.includes(i)) {
        response.push(false);
      } else {
        response.push(apiResponse[nullIndexesIndex]);
        nullIndexesIndex++;
      }
    }
    return response;
  };
  async function queue(list, context = null) {
    list.push("spotify:delimiter");
    const { _queue, _client } = Spicetify.Platform.PlayerAPI._queue;
    const { prevTracks, queueRevision } = _queue;
    const nextTracks = list.map((uri) => ({
      contextTrack: {
        uri,
        uid: "",
        metadata: {
          is_queued: "false"
        }
      },
      removed: [],
      blocked: [],
      provider: "context"
    }));
    _client.setQueue({
      nextTracks,
      prevTracks,
      queueRevision
    });
    if (context) {
      const { sessionId } = Spicetify.Platform.PlayerAPI.getState();
      Spicetify.Platform.PlayerAPI.updateContext(sessionId, {
        uri: `spotify:user:${Spicetify.Platform.LibraryAPI._currentUsername}:top:tracks`,
        url: ""
      });
    }
    Spicetify.Player.next();
  }

  // ../shared/components/status.tsx
  var import_react12 = __toESM(require_react());
  var ErrorIcon = () => {
    return /* @__PURE__ */ import_react12.default.createElement("svg", {
      "data-encore-id": "icon",
      role: "img",
      "aria-hidden": "true",
      viewBox: "0 0 24 24",
      className: "status-icon"
    }, /* @__PURE__ */ import_react12.default.createElement("path", {
      d: "M11 18v-2h2v2h-2zm0-4V6h2v8h-2z"
    }), /* @__PURE__ */ import_react12.default.createElement("path", {
      d: "M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12z"
    }));
  };
  var LibraryIcon = () => {
    return /* @__PURE__ */ import_react12.default.createElement("svg", {
      role: "img",
      height: "46",
      width: "46",
      "aria-hidden": "true",
      viewBox: "0 0 24 24",
      "data-encore-id": "icon",
      className: "status-icon"
    }, /* @__PURE__ */ import_react12.default.createElement("path", {
      d: "M14.5 2.134a1 1 0 0 1 1 0l6 3.464a1 1 0 0 1 .5.866V21a1 1 0 0 1-1 1h-6a1 1 0 0 1-1-1V3a1 1 0 0 1 .5-.866zM16 4.732V20h4V7.041l-4-2.309zM3 22a1 1 0 0 1-1-1V3a1 1 0 0 1 2 0v18a1 1 0 0 1-1 1zm6 0a1 1 0 0 1-1-1V3a1 1 0 0 1 2 0v18a1 1 0 0 1-1 1z"
    }));
  };
  var Status = (props) => {
    const [isVisible, setIsVisible] = import_react12.default.useState(false);
    import_react12.default.useEffect(() => {
      const to = setTimeout(() => {
        setIsVisible(true);
      }, 500);
      return () => clearTimeout(to);
    }, []);
    return isVisible ? /* @__PURE__ */ import_react12.default.createElement(import_react12.default.Fragment, null, /* @__PURE__ */ import_react12.default.createElement("div", {
      className: "loadingWrapper"
    }, props.icon === "error" ? /* @__PURE__ */ import_react12.default.createElement(ErrorIcon, null) : /* @__PURE__ */ import_react12.default.createElement(LibraryIcon, null), /* @__PURE__ */ import_react12.default.createElement("h1", null, props.heading), /* @__PURE__ */ import_react12.default.createElement("h3", null, props.subheading))) : /* @__PURE__ */ import_react12.default.createElement(import_react12.default.Fragment, null);
  };
  var status_default = Status;

  // ../shared/components/page_container.tsx
  var import_react14 = __toESM(require_react());

  // src/components/buttons/create_playlist_button.tsx
  var import_react13 = __toESM(require_react());
  async function createPlaylistAsync(infoToCreatePlaylist) {
    const { Platform, showNotification } = Spicetify;
    const { RootlistAPI, PlaylistAPI } = Platform;
    try {
      const { playlistName, itemsUris } = infoToCreatePlaylist;
      const playlistUri = await RootlistAPI.createPlaylist(playlistName, { before: "start" });
      await PlaylistAPI.add(playlistUri, itemsUris, { before: "start" });
    } catch (error) {
      console.error(error);
      showNotification("Failed to create playlist", true, 1e3);
    }
  }
  function CreatePlaylistButton(props) {
    const { TooltipWrapper, ButtonSecondary } = Spicetify.ReactComponent;
    const { infoToCreatePlaylist } = props;
    return /* @__PURE__ */ import_react13.default.createElement(TooltipWrapper, {
      label: "Turn Into Playlist",
      renderInline: true,
      placement: "top"
    }, /* @__PURE__ */ import_react13.default.createElement(ButtonSecondary, {
      "aria-label": "Turn Into Playlist",
      children: "Turn Into Playlist",
      semanticColor: "textBase",
      buttonSize: "sm",
      onClick: () => createPlaylistAsync(infoToCreatePlaylist),
      className: "stats-make-playlist-button"
    }));
  }
  var create_playlist_button_default = CreatePlaylistButton;

  // ../shared/components/page_container.tsx
  var PageContainer = (props) => {
    const { title, infoToCreatePlaylist, headerEls, children } = props;
    const { TextComponent } = Spicetify.ReactComponent;
    return /* @__PURE__ */ import_react14.default.createElement("section", {
      className: "contentSpacing"
    }, /* @__PURE__ */ import_react14.default.createElement("div", {
      className: "page-header"
    }, /* @__PURE__ */ import_react14.default.createElement("div", {
      className: "header-left"
    }, /* @__PURE__ */ import_react14.default.createElement(TextComponent, {
      children: title,
      as: "h1",
      variant: "canon",
      semanticColor: "textBase"
    }), infoToCreatePlaylist ? /* @__PURE__ */ import_react14.default.createElement(create_playlist_button_default, {
      infoToCreatePlaylist
    }) : null), /* @__PURE__ */ import_react14.default.createElement("div", {
      className: "header-right"
    }, headerEls)), /* @__PURE__ */ import_react14.default.createElement("div", {
      className: "page-content"
    }, children));
  };
  var page_container_default = PageContainer;

  // ../shared/components/settings_button.tsx
  var import_react15 = __toESM(require_react());
  function SettingsIcon() {
    return /* @__PURE__ */ import_react15.default.createElement(Spicetify.ReactComponent.IconComponent, {
      semanticColor: "textSubdued",
      dangerouslySetInnerHTML: {
        __html: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M24 13.616v-3.232c-1.651-.587-2.694-.752-3.219-2.019v-.001c-.527-1.271.1-2.134.847-3.707l-2.285-2.285c-1.561.742-2.433 1.375-3.707.847h-.001c-1.269-.526-1.435-1.576-2.019-3.219h-3.232c-.582 1.635-.749 2.692-2.019 3.219h-.001c-1.271.528-2.132-.098-3.707-.847l-2.285 2.285c.745 1.568 1.375 2.434.847 3.707-.527 1.271-1.584 1.438-3.219 2.02v3.232c1.632.58 2.692.749 3.219 2.019.53 1.282-.114 2.166-.847 3.707l2.285 2.286c1.562-.743 2.434-1.375 3.707-.847h.001c1.27.526 1.436 1.579 2.019 3.219h3.232c.582-1.636.75-2.69 2.027-3.222h.001c1.262-.524 2.12.101 3.698.851l2.285-2.286c-.744-1.563-1.375-2.433-.848-3.706.527-1.271 1.588-1.44 3.221-2.021zm-12 2.384c-2.209 0-4-1.791-4-4s1.791-4 4-4 4 1.791 4 4-1.791 4-4 4z"/></svg>'
      },
      iconSize: 16
    });
  }
  function SettingsButton(props) {
    const { TooltipWrapper, ButtonTertiary } = Spicetify.ReactComponent;
    const { configWrapper } = props;
    return /* @__PURE__ */ import_react15.default.createElement(TooltipWrapper, {
      label: "Settings",
      renderInline: true,
      placement: "top"
    }, /* @__PURE__ */ import_react15.default.createElement(ButtonTertiary, {
      buttonSize: "sm",
      onClick: configWrapper.launchModal,
      "aria-label": "Settings",
      iconOnly: SettingsIcon
    }));
  }
  var settings_button_default = SettingsButton;

  // src/components/buttons/refresh_button.tsx
  var import_react16 = __toESM(require_react());
  function RefreshIcon() {
    return /* @__PURE__ */ import_react16.default.createElement(Spicetify.ReactComponent.IconComponent, {
      semanticColor: "textSubdued",
      iconSize: 16,
      dangerouslySetInnerHTML: {
        __html: '<svg xmlns="http://www.w3.org/2000/svg"><path d="M0 4.75A3.75 3.75 0 0 1 3.75 1h8.5A3.75 3.75 0 0 1 16 4.75v5a3.75 3.75 0 0 1-3.75 3.75H9.81l1.018 1.018a.75.75 0 1 1-1.06 1.06L6.939 12.75l2.829-2.828a.75.75 0 1 1 1.06 1.06L9.811 12h2.439a2.25 2.25 0 0 0 2.25-2.25v-5a2.25 2.25 0 0 0-2.25-2.25h-8.5A2.25 2.25 0 0 0 1.5 4.75v5A2.25 2.25 0 0 0 3.75 12H5v1.5H3.75A3.75 3.75 0 0 1 0 9.75v-5z"/></svg>'
      }
    });
  }
  function RefreshButton(props) {
    const { ButtonTertiary, TooltipWrapper } = Spicetify.ReactComponent;
    const { callback } = props;
    return /* @__PURE__ */ import_react16.default.createElement(TooltipWrapper, {
      label: "Refresh",
      renderInline: true,
      placement: "top"
    }, /* @__PURE__ */ import_react16.default.createElement(ButtonTertiary, {
      buttonSize: "sm",
      onClick: callback,
      "aria-label": "Refresh",
      iconOnly: RefreshIcon
    }));
  }
  var refresh_button_default = RefreshButton;

  // src/pages/top_artists.tsx
  var topArtistsReq = async (time_range, configWrapper) => {
    const { config } = configWrapper;
    if (config["use-lastfm"] === true) {
      if (!config["api-key"] || !config["lastfm-user"])
        return 300;
      const { ["lastfm-user"]: user, ["api-key"]: key } = config;
      const response = await apiRequest("lastfm", LASTFM.topartists(user, key, time_range));
      if (!response)
        return 200;
      return await convertArtistData(response.topartists.artist);
    } else {
      const response = await apiRequest("topArtists", SPOTIFY.topartists(time_range));
      if (!response)
        return 200;
      return response.items.map((artist) => {
        const image = artist.images[2]?.url || artist.images[1]?.url || PLACEHOLDER;
        return {
          id: artist.id,
          name: artist.name,
          image,
          uri: artist.uri,
          genres: artist.genres
        };
      });
    }
  };
  var DropdownOptions = [
    { id: "short_term", name: "Past Month" },
    { id: "medium_term", name: "Past 6 Months" },
    { id: "long_term", name: "All Time" }
  ];
  var ArtistsPage = ({ configWrapper }) => {
    const [topArtists, setTopArtists] = import_react17.default.useState(100);
    const [dropdown, activeOption, setActiveOption] = useDropdownMenu_default(DropdownOptions, "stats:top-artists");
    const fetchTopArtists2 = async (time_range, force, set = true) => {
      if (!force) {
        let storedData = Spicetify.LocalStorage.get(`stats:top-artists:${time_range}`);
        if (storedData)
          return setTopArtists(JSON.parse(storedData));
      }
      const start = window.performance.now();
      const topArtists2 = await topArtistsReq(time_range, configWrapper);
      if (set)
        setTopArtists(topArtists2);
      Spicetify.LocalStorage.set(`stats:top-artists:${time_range}`, JSON.stringify(topArtists2));
      console.log("total artists fetch time:", window.performance.now() - start);
    };
    import_react17.default.useEffect(() => {
      updatePageCache(0, fetchTopArtists2, activeOption.id);
    }, []);
    import_react17.default.useEffect(() => {
      fetchTopArtists2(activeOption.id);
    }, [activeOption]);
    const refresh = () => {
      fetchTopArtists2(activeOption.id, true);
    };
    const props = {
      title: "Top Artists",
      headerEls: [dropdown, /* @__PURE__ */ import_react17.default.createElement(refresh_button_default, {
        callback: refresh
      }), /* @__PURE__ */ import_react17.default.createElement(settings_button_default, {
        configWrapper
      })]
    };
    switch (topArtists) {
      case 300:
        return /* @__PURE__ */ import_react17.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react17.default.createElement(status_default, {
          icon: "error",
          heading: "No API Key or Username",
          subheading: "Please enter these in the settings menu"
        }));
      case 200:
        return /* @__PURE__ */ import_react17.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react17.default.createElement(status_default, {
          icon: "error",
          heading: "Failed to Fetch Top Artists",
          subheading: "An error occurred while fetching the data"
        }));
      case 100:
        return /* @__PURE__ */ import_react17.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react17.default.createElement(status_default, {
          icon: "library",
          heading: "Loading",
          subheading: "Fetching data..."
        }));
    }
    const artistCards = topArtists.map((artist, index) => /* @__PURE__ */ import_react17.default.createElement(spotify_card_default, {
      type: artist.uri.includes("last") ? "lastfm" : "artist",
      uri: artist.uri,
      header: artist.name,
      subheader: `#${index + 1} Artist`,
      imageUrl: artist.image
    }));
    return /* @__PURE__ */ import_react17.default.createElement(import_react17.default.Fragment, null, /* @__PURE__ */ import_react17.default.createElement(page_container_default, {
      ...props
    }, /* @__PURE__ */ import_react17.default.createElement("div", {
      className: `main-gridContainer-gridContainer grid`
    }, artistCards)));
  };
  var top_artists_default = import_react17.default.memo(ArtistsPage);

  // src/pages/top_tracks.tsx
  var import_react20 = __toESM(require_react());

  // src/components/track_row.tsx
  var import_react18 = __toESM(require_react());
  var ArtistLink = ({ name, uri, index, length }) => {
    return /* @__PURE__ */ import_react18.default.createElement(import_react18.default.Fragment, null, /* @__PURE__ */ import_react18.default.createElement("a", {
      draggable: "true",
      dir: "auto",
      href: uri,
      tabIndex: -1
    }, name), index === length ? null : ", ");
  };
  var ExplicitBadge = import_react18.default.memo(() => {
    return /* @__PURE__ */ import_react18.default.createElement(import_react18.default.Fragment, null, /* @__PURE__ */ import_react18.default.createElement("span", {
      className: "TypeElement-ballad-textSubdued-type main-trackList-rowBadges",
      "data-encore-id": "type"
    }, /* @__PURE__ */ import_react18.default.createElement("span", {
      "aria-label": "Explicit",
      className: "main-tag-container",
      title: "Explicit"
    }, "E")));
  });
  var LikedIcon = ({ active, uri }) => {
    const [liked, setLiked] = import_react18.default.useState(active);
    const toggleLike = () => {
      if (liked) {
        Spicetify.Platform.LibraryAPI.remove(uri);
      } else {
        Spicetify.Platform.LibraryAPI.add(uri);
      }
      setLiked(!liked);
    };
    import_react18.default.useEffect(() => {
      setLiked(active);
    }, [active]);
    return /* @__PURE__ */ import_react18.default.createElement(Spicetify.ReactComponent.TooltipWrapper, {
      label: liked ? `Remove from Your Library` : "Save to Your Library",
      placement: "top"
    }, /* @__PURE__ */ import_react18.default.createElement("button", {
      type: "button",
      role: "switch",
      "aria-checked": liked,
      "aria-label": "Remove from Your Library",
      onClick: toggleLike,
      className: liked ? "main-addButton-button main-trackList-rowHeartButton main-addButton-active" : "main-addButton-button main-trackList-rowHeartButton",
      tabIndex: -1
    }, /* @__PURE__ */ import_react18.default.createElement("svg", {
      role: "img",
      height: "16",
      width: "16",
      "aria-hidden": "true",
      viewBox: "0 0 16 16",
      "data-encore-id": "icon",
      className: "Svg-img-16 Svg-img-16-icon Svg-img-icon Svg-img-icon-small"
    }, /* @__PURE__ */ import_react18.default.createElement("path", {
      d: liked ? "M15.724 4.22A4.313 4.313 0 0 0 12.192.814a4.269 4.269 0 0 0-3.622 1.13.837.837 0 0 1-1.14 0 4.272 4.272 0 0 0-6.21 5.855l5.916 7.05a1.128 1.128 0 0 0 1.727 0l5.916-7.05a4.228 4.228 0 0 0 .945-3.577z" : "M1.69 2A4.582 4.582 0 0 1 8 2.023 4.583 4.583 0 0 1 11.88.817h.002a4.618 4.618 0 0 1 3.782 3.65v.003a4.543 4.543 0 0 1-1.011 3.84L9.35 14.629a1.765 1.765 0 0 1-2.093.464 1.762 1.762 0 0 1-.605-.463L1.348 8.309A4.582 4.582 0 0 1 1.689 2zm3.158.252A3.082 3.082 0 0 0 2.49 7.337l.005.005L7.8 13.664a.264.264 0 0 0 .311.069.262.262 0 0 0 .09-.069l5.312-6.33a3.043 3.043 0 0 0 .68-2.573 3.118 3.118 0 0 0-2.551-2.463 3.079 3.079 0 0 0-2.612.816l-.007.007a1.501 1.501 0 0 1-2.045 0l-.009-.008a3.082 3.082 0 0 0-2.121-.861z"
    }))));
  };
  var DraggableComponent = ({
    uri,
    title,
    ...props
  }) => {
    const dragHandler = Spicetify.ReactHook.DragHandler?.([uri], title);
    return /* @__PURE__ */ import_react18.default.createElement("div", {
      onDragStart: dragHandler,
      draggable: "true",
      ...props
    }, props.children);
  };
  function playAndQueue(uri, uris) {
    uris = uris.filter((u) => !u.includes("last"));
    uris = uris.concat(uris.splice(0, uris.indexOf(uri)));
    queue(uris);
  }
  var MenuWrapper = import_react18.default.memo((props) => /* @__PURE__ */ import_react18.default.createElement(Spicetify.ReactComponent.AlbumMenu, {
    ...props
  }));
  var TrackRow = (props) => {
    const ArtistLinks = props.artists.map((artist, index) => {
      return /* @__PURE__ */ import_react18.default.createElement(ArtistLink, {
        index,
        length: props.artists.length - 1,
        name: artist.name,
        uri: artist.uri
      });
    });
    return /* @__PURE__ */ import_react18.default.createElement(import_react18.default.Fragment, null, /* @__PURE__ */ import_react18.default.createElement(Spicetify.ReactComponent.ContextMenu, {
      menu: /* @__PURE__ */ import_react18.default.createElement(MenuWrapper, {
        uri: props.uri
      }),
      trigger: "right-click"
    }, /* @__PURE__ */ import_react18.default.createElement("div", {
      role: "row",
      "aria-rowindex": 2,
      "aria-selected": "false"
    }, /* @__PURE__ */ import_react18.default.createElement(DraggableComponent, {
      uri: props.uri,
      title: `${props.name} \u2022 ${props.artists.map((artist) => artist.name).join(", ")}`,
      className: "main-trackList-trackListRow main-trackList-trackListRowGrid",
      role: "presentation",
      onClick: (event) => event.detail === 2 && playAndQueue(props.uri, props.uris),
      style: { height: 56 }
    }, /* @__PURE__ */ import_react18.default.createElement("div", {
      className: "main-trackList-rowSectionIndex",
      role: "gridcell",
      "aria-colindex": 1,
      tabIndex: -1
    }, /* @__PURE__ */ import_react18.default.createElement("div", {
      uri: props.uri,
      className: "main-trackList-rowMarker"
    }, /* @__PURE__ */ import_react18.default.createElement("span", {
      className: "TypeElement-ballad-type main-trackList-number",
      "data-encore-id": "type"
    }, props.index), /* @__PURE__ */ import_react18.default.createElement(Spicetify.ReactComponent.TooltipWrapper, {
      label: `Play ${props.name} by ${props.artists.map((artist) => artist.name).join(", ")}`,
      placement: "top"
    }, /* @__PURE__ */ import_react18.default.createElement("button", {
      className: "main-trackList-rowImagePlayButton",
      "aria-label": `Play ${props.name}`,
      tabIndex: -1,
      onClick: () => playAndQueue(props.uri, props.uris)
    }, /* @__PURE__ */ import_react18.default.createElement("svg", {
      role: "img",
      height: "24",
      width: "24",
      "aria-hidden": "true",
      className: "Svg-img-24 Svg-img-24-icon main-trackList-rowPlayPauseIcon",
      viewBox: "0 0 24 24",
      "data-encore-id": "icon"
    }, /* @__PURE__ */ import_react18.default.createElement("path", {
      d: "m7.05 3.606 13.49 7.788a.7.7 0 0 1 0 1.212L7.05 20.394A.7.7 0 0 1 6 19.788V4.212a.7.7 0 0 1 1.05-.606z"
    })))))), /* @__PURE__ */ import_react18.default.createElement("div", {
      className: "main-trackList-rowSectionStart",
      role: "gridcell",
      "aria-colindex": 2,
      tabIndex: -1
    }, /* @__PURE__ */ import_react18.default.createElement("img", {
      "aria-hidden": "false",
      draggable: "false",
      loading: "eager",
      src: props.image,
      alt: "",
      className: "main-image-image main-trackList-rowImage main-image-loaded",
      width: "40",
      height: "40"
    }), /* @__PURE__ */ import_react18.default.createElement("div", {
      className: "main-trackList-rowMainContent"
    }, /* @__PURE__ */ import_react18.default.createElement("div", {
      dir: "auto",
      className: "TypeElement-ballad-textBase TypeElement-ballad-textBase-type main-trackList-rowTitle standalone-ellipsis-one-line",
      "data-encore-id": "type"
    }, props.name), props.explicit && /* @__PURE__ */ import_react18.default.createElement(ExplicitBadge, null), /* @__PURE__ */ import_react18.default.createElement("span", {
      className: "TypeElement-mesto-textSubdued TypeElement-mesto-textSubdued-type main-trackList-rowSubTitle standalone-ellipsis-one-line",
      "data-encore-id": "type"
    }, ArtistLinks))), /* @__PURE__ */ import_react18.default.createElement("div", {
      className: "main-trackList-rowSectionVariable",
      role: "gridcell",
      "aria-colindex": 3,
      tabIndex: -1
    }, /* @__PURE__ */ import_react18.default.createElement("span", {
      "data-encore-id": "type",
      className: "TypeElement-mesto TypeElement-mesto-type"
    }, /* @__PURE__ */ import_react18.default.createElement("a", {
      draggable: "true",
      className: "standalone-ellipsis-one-line",
      dir: "auto",
      href: props.album_uri,
      tabIndex: -1
    }, props.album))), /* @__PURE__ */ import_react18.default.createElement("div", {
      className: "main-trackList-rowSectionEnd",
      role: "gridcell",
      "aria-colindex": 5,
      tabIndex: -1
    }, /* @__PURE__ */ import_react18.default.createElement(LikedIcon, {
      active: props.liked || false,
      uri: props.uri
    }), /* @__PURE__ */ import_react18.default.createElement("div", {
      className: "TypeElement-mesto-textSubdued TypeElement-mesto-textSubdued-type main-trackList-rowDuration",
      "data-encore-id": "type"
    }, Spicetify.Player.formatTime(props.duration)), /* @__PURE__ */ import_react18.default.createElement(Spicetify.ReactComponent.ContextMenu, {
      menu: /* @__PURE__ */ import_react18.default.createElement(MenuWrapper, {
        uri: props.uri
      }),
      trigger: "click"
    }, /* @__PURE__ */ import_react18.default.createElement("button", {
      type: "button",
      "aria-haspopup": "menu",
      "aria-label": `More options for ${props.name}`,
      className: "main-moreButton-button Button-sm-16-buttonTertiary-iconOnly-condensed-useBrowserDefaultFocusStyle Button-small-small-buttonTertiary-iconOnly-condensed-useBrowserDefaultFocusStyle main-trackList-rowMoreButton",
      tabIndex: -1
    }, /* @__PURE__ */ import_react18.default.createElement(Spicetify.ReactComponent.TooltipWrapper, {
      label: `More options for ${props.name} by ${props.artists.map((artist) => artist.name).join(", ")}`,
      placement: "top"
    }, /* @__PURE__ */ import_react18.default.createElement("span", null, /* @__PURE__ */ import_react18.default.createElement("svg", {
      role: "img",
      height: "16",
      width: "16",
      "aria-hidden": "true",
      viewBox: "0 0 16 16",
      "data-encore-id": "icon",
      className: "Svg-img-16 Svg-img-16-icon Svg-img-icon Svg-img-icon-small"
    }, /* @__PURE__ */ import_react18.default.createElement("path", {
      d: "M3 8a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm6.5 0a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zM16 8a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"
    })))))))))));
  };
  var track_row_default = import_react18.default.memo(TrackRow);

  // src/components/tracklist.tsx
  var import_react19 = __toESM(require_react());
  var Tracklist = ({ minified = false, children }) => {
    return /* @__PURE__ */ import_react19.default.createElement("div", {
      role: "grid",
      "aria-rowcount": minified ? 5 : 50,
      "aria-colcount": 4,
      className: "main-trackList-trackList main-trackList-indexable",
      tabIndex: 0
    }, !minified && /* @__PURE__ */ import_react19.default.createElement("div", {
      className: "main-trackList-trackListHeader",
      role: "presentation"
    }, /* @__PURE__ */ import_react19.default.createElement("div", {
      className: "main-trackList-trackListHeaderRow main-trackList-trackListRowGrid",
      role: "row",
      "aria-rowindex": 1
    }, /* @__PURE__ */ import_react19.default.createElement("div", {
      className: "main-trackList-rowSectionIndex",
      role: "columnheader",
      "aria-colindex": 1,
      "aria-sort": "none",
      tabIndex: -1
    }, "#"), /* @__PURE__ */ import_react19.default.createElement("div", {
      className: "main-trackList-rowSectionStart",
      role: "columnheader",
      "aria-colindex": 2,
      "aria-sort": "none",
      tabIndex: -1
    }, /* @__PURE__ */ import_react19.default.createElement("button", {
      className: "main-trackList-column main-trackList-sortable",
      tabIndex: -1
    }, /* @__PURE__ */ import_react19.default.createElement("span", {
      className: "TypeElement-mesto-type standalone-ellipsis-one-line",
      "data-encore-id": "type"
    }, "Title"))), /* @__PURE__ */ import_react19.default.createElement("div", {
      className: "main-trackList-rowSectionVariable",
      role: "columnheader",
      "aria-colindex": 3,
      "aria-sort": "none",
      tabIndex: -1
    }, /* @__PURE__ */ import_react19.default.createElement("button", {
      className: "main-trackList-column main-trackList-sortable",
      tabIndex: -1
    }, /* @__PURE__ */ import_react19.default.createElement("span", {
      className: "TypeElement-mesto-type standalone-ellipsis-one-line",
      "data-encore-id": "type"
    }, "Album"))), /* @__PURE__ */ import_react19.default.createElement("div", {
      className: "main-trackList-rowSectionEnd",
      role: "columnheader",
      "aria-colindex": 5,
      "aria-sort": "none",
      tabIndex: -1
    }, /* @__PURE__ */ import_react19.default.createElement(Spicetify.ReactComponent.TooltipWrapper, {
      label: "Duration",
      placement: "top"
    }, /* @__PURE__ */ import_react19.default.createElement("button", {
      "aria-label": "Duration",
      className: "main-trackList-column main-trackList-durationHeader main-trackList-sortable",
      tabIndex: -1
    }, /* @__PURE__ */ import_react19.default.createElement("svg", {
      role: "img",
      height: "16",
      width: "16",
      "aria-hidden": "true",
      viewBox: "0 0 16 16",
      "data-encore-id": "icon",
      className: "Svg-img-16 Svg-img-16-icon Svg-img-icon Svg-img-icon-small"
    }, /* @__PURE__ */ import_react19.default.createElement("path", {
      d: "M8 1.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"
    }), /* @__PURE__ */ import_react19.default.createElement("path", {
      d: "M8 3.25a.75.75 0 0 1 .75.75v3.25H11a.75.75 0 0 1 0 1.5H7.25V4A.75.75 0 0 1 8 3.25z"
    }))))))), /* @__PURE__ */ import_react19.default.createElement("div", {
      className: "main-rootlist-wrapper",
      role: "presentation",
      style: { height: (minified ? 5 : 50) * 56 }
    }, /* @__PURE__ */ import_react19.default.createElement("div", {
      role: "presentation"
    }, children)));
  };
  var tracklist_default = Tracklist;

  // src/pages/top_tracks.tsx
  var topTracksReq = async (time_range, configWrapper) => {
    const { config } = configWrapper;
    if (config["use-lastfm"] === true) {
      if (!config["api-key"] || !config["lastfm-user"])
        return 300;
      const { ["lastfm-user"]: user, ["api-key"]: key } = config;
      const lastfmData = await apiRequest("lastfm", LASTFM.toptracks(user, key, time_range));
      if (!lastfmData)
        return 200;
      const spotifyData = await convertTrackData(lastfmData.toptracks.track);
      const likedArray2 = await checkLiked(spotifyData.map((track) => track.id));
      if (!likedArray2)
        return 200;
      spotifyData.forEach((track, index) => {
        track.liked = likedArray2[index];
      });
      return spotifyData;
    }
    const response = await apiRequest("topTracks", SPOTIFY.toptracks(time_range));
    if (!response)
      return 200;
    const likedArray = await checkLiked(response.items.map((track) => track.id));
    if (!likedArray)
      return 200;
    return response.items.map((track, index) => {
      const images = track.album.images;
      const image = images[2]?.url || images[1]?.url || PLACEHOLDER;
      return {
        liked: likedArray[index],
        name: track.name,
        image,
        uri: track.uri,
        id: track.id,
        artists: track.artists.map((artist) => ({
          name: artist.name,
          uri: artist.uri
        })),
        duration: track.duration_ms,
        album: track.album.name,
        album_uri: track.album.uri,
        popularity: track.popularity,
        explicit: track.explicit,
        release_year: track.album.release_date.slice(0, 4)
      };
    });
  };
  var DropdownOptions2 = [
    { id: "short_term", name: "Past Month" },
    { id: "medium_term", name: "Past 6 Months" },
    { id: "long_term", name: "All Time" }
  ];
  var TracksPage = ({ configWrapper }) => {
    const { LocalStorage } = Spicetify;
    const [topTracks, setTopTracks] = import_react20.default.useState(100);
    const [dropdown, activeOption] = useDropdownMenu_default(DropdownOptions2, "stats:top-tracks");
    const fetchTopTracks = async (time_range, force, set = true) => {
      if (!force) {
        const storedData = LocalStorage.get(`stats:top-tracks:${time_range}`);
        if (storedData)
          return setTopTracks(JSON.parse(storedData));
      }
      const start = window.performance.now();
      const topTracks2 = await topTracksReq(time_range, configWrapper);
      if (set)
        setTopTracks(topTracks2);
      LocalStorage.set(`stats:top-tracks:${time_range}`, JSON.stringify(topTracks2));
      console.log("total tracks fetch time:", window.performance.now() - start);
    };
    import_react20.default.useEffect(() => {
      updatePageCache(1, fetchTopTracks, activeOption.id);
    }, []);
    import_react20.default.useEffect(() => {
      fetchTopTracks(activeOption.id);
    }, [activeOption]);
    const refresh = () => {
      fetchTopTracks(activeOption.id, true);
    };
    const props = {
      title: "Top Tracks",
      headerEls: [dropdown, /* @__PURE__ */ import_react20.default.createElement(refresh_button_default, {
        callback: refresh
      }), /* @__PURE__ */ import_react20.default.createElement(settings_button_default, {
        configWrapper
      })]
    };
    switch (topTracks) {
      case 300:
        return /* @__PURE__ */ import_react20.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react20.default.createElement(status_default, {
          icon: "error",
          heading: "No API Key or Username",
          subheading: "Please enter these in the settings menu"
        }));
      case 200:
        return /* @__PURE__ */ import_react20.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react20.default.createElement(status_default, {
          icon: "error",
          heading: "Failed to Fetch Top Tracks",
          subheading: "An error occurred while fetching the data"
        }));
      case 100:
        return /* @__PURE__ */ import_react20.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react20.default.createElement(status_default, {
          icon: "library",
          heading: "Loading",
          subheading: "Fetching data..."
        }));
    }
    const infoToCreatePlaylist = {
      playlistName: `Top Songs - ${activeOption}`,
      itemsUris: topTracks.map((track) => track.uri)
    };
    const trackRows = topTracks.map((track, index) => /* @__PURE__ */ import_react20.default.createElement(track_row_default, {
      index: index + 1,
      ...track,
      uris: topTracks.map((track2) => track2.uri)
    }));
    return /* @__PURE__ */ import_react20.default.createElement(page_container_default, {
      ...props,
      infoToCreatePlaylist
    }, /* @__PURE__ */ import_react20.default.createElement(tracklist_default, null, trackRows));
  };
  var top_tracks_default = import_react20.default.memo(TracksPage);

  // src/pages/top_genres.tsx
  var import_react25 = __toESM(require_react());

  // src/components/cards/stat_card.tsx
  var import_react21 = __toESM(require_react());
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
    return /* @__PURE__ */ import_react21.default.createElement("div", {
      className: "main-card-card"
    }, /* @__PURE__ */ import_react21.default.createElement(TextComponent, {
      as: "div",
      semanticColor: "textBase",
      variant: "alto",
      children: typeof value === "number" ? formatValue(label, value) : value
    }), /* @__PURE__ */ import_react21.default.createElement(TextComponent, {
      as: "div",
      semanticColor: "textBase",
      variant: "balladBold",
      children: normalizeString(label)
    }));
  }
  var stat_card_default = StatCard;

  // src/components/cards/genres_card.tsx
  var import_react22 = __toESM(require_react());
  var genreLine = (name, value, limit, total) => {
    return /* @__PURE__ */ import_react22.default.createElement("div", {
      className: "stats-genreRow"
    }, /* @__PURE__ */ import_react22.default.createElement("div", {
      className: "stats-genreRowFill",
      style: {
        width: `calc(${value / limit * 100}% + ${(limit - value) / (limit - 1) * 100}px)`
      }
    }, /* @__PURE__ */ import_react22.default.createElement("span", {
      className: "stats-genreText"
    }, name)), /* @__PURE__ */ import_react22.default.createElement("span", {
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
    return /* @__PURE__ */ import_react22.default.createElement("div", {
      className: `main-card-card stats-genreCard`
    }, genreLines(genresArray, total));
  };
  var genres_card_default = genresCard;

  // src/components/inline_grid.tsx
  var import_react23 = __toESM(require_react());
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
    return /* @__PURE__ */ import_react23.default.createElement("section", {
      className: "stats-gridInlineSection"
    }, /* @__PURE__ */ import_react23.default.createElement("button", {
      className: "stats-scrollButton",
      onClick: scrollGridLeft
    }, "<"), /* @__PURE__ */ import_react23.default.createElement("button", {
      className: "stats-scrollButton",
      onClick: scrollGrid
    }, ">"), /* @__PURE__ */ import_react23.default.createElement("div", {
      className: `main-gridContainer-gridContainer stats-gridInline${special ? " stats-specialGrid" : ""}`,
      "data-scroll": "start"
    }, children));
  }
  var inline_grid_default = import_react23.default.memo(InlineGrid);

  // src/components/shelf.tsx
  var import_react24 = __toESM(require_react());
  function Shelf(props) {
    const { TextComponent } = Spicetify.ReactComponent;
    const { title, children } = props;
    return /* @__PURE__ */ import_react24.default.createElement("section", {
      className: "main-shelf-shelf Shelf"
    }, /* @__PURE__ */ import_react24.default.createElement("div", {
      className: "main-shelf-header"
    }, /* @__PURE__ */ import_react24.default.createElement("div", {
      className: "main-shelf-topRow"
    }, /* @__PURE__ */ import_react24.default.createElement("div", {
      className: "main-shelf-titleWrapper"
    }, /* @__PURE__ */ import_react24.default.createElement(TextComponent, {
      children: title,
      as: "h2",
      variant: "canon",
      semanticColor: "textBase"
    })))), /* @__PURE__ */ import_react24.default.createElement("section", null, children));
  }
  var shelf_default = import_react24.default.memo(Shelf);

  // src/pages/top_genres.tsx
  var DropdownOptions3 = [
    { id: "short_term", name: "Past Month" },
    { id: "medium_term", name: "Past 6 Months" },
    { id: "long_term", name: "All Time" }
  ];
  var GenresPage = ({ configWrapper }) => {
    const { LocalStorage } = Spicetify;
    const [topGenres, setTopGenres] = import_react25.default.useState(100);
    const [dropdown, activeOption] = useDropdownMenu_default(DropdownOptions3, "stats:top-genres");
    const fetchTopGenres = async (time_range, force, set = true, force_refetch) => {
      if (!force) {
        let storedData = LocalStorage.get(`stats:top-genres:${time_range}`);
        if (storedData)
          return setTopGenres(JSON.parse(storedData));
      }
      const start = window.performance.now();
      const cacheInfo = JSON.parse(LocalStorage.get("stats:cache-info"));
      const fetchedItems = await Promise.all(
        ["artists", "tracks"].map(async (type, index) => {
          if (cacheInfo[index] === true && !force_refetch) {
            return await JSON.parse(LocalStorage.get(`stats:top-${type}:${time_range}`));
          }
          const fetchedItems2 = await (type === "artists" ? topArtistsReq(time_range, configWrapper) : topTracksReq(time_range, configWrapper));
          cacheInfo[index] = true;
          cacheInfo[2] = true;
          LocalStorage.set(`stats:top-${type}:${time_range}`, JSON.stringify(fetchedItems2));
          LocalStorage.set("stats:cache-info", JSON.stringify(cacheInfo));
          return fetchedItems2;
        })
      );
      for (let i = 0; i < 2; i++) {
        if (fetchedItems[i] === 200 || fetchedItems[i] === 300)
          return setTopGenres(fetchedItems[i]);
      }
      const fetchedArtists = fetchedItems[0].filter((artist) => artist?.genres);
      const fetchedTracks = fetchedItems[1].filter((track) => track?.id);
      const genres = fetchedArtists.reduce((acc, artist) => {
        artist.genres.forEach((genre) => {
          const index = acc.findIndex(([g]) => g === genre);
          if (index !== -1) {
            acc[index][1] += 1 * Math.abs(fetchedArtists.indexOf(artist) - 50);
          } else {
            acc.push([genre, 1 * Math.abs(fetchedArtists.indexOf(artist) - 50)]);
          }
        });
        return acc;
      }, []);
      let trackPopularity = 0;
      let explicitness = 0;
      let releaseData = [];
      const topTracks = fetchedTracks.map((track) => {
        trackPopularity += track.popularity;
        if (track.explicit)
          explicitness++;
        if (track.release_year) {
          const year = track.release_year;
          const index = releaseData.findIndex(([y]) => y === year);
          if (index !== -1) {
            releaseData[index][1] += 1;
          } else {
            releaseData.push([year, 1]);
          }
        }
        return track.id;
      });
      async function testDupe(track) {
        const spotifyItem = await apiRequest(
          "track",
          SPOTIFY.search(track.name, track.artists[0].name),
          1,
          false
        ).then((res) => res.tracks?.items);
        if (!spotifyItem)
          return false;
        return spotifyItem.some((item) => {
          return item.name === track.name && item.popularity > track.popularity;
        });
      }
      let obscureTracks2 = [];
      for (let i = 0; i < fetchedTracks.length; i++) {
        let track = fetchedTracks[i];
        if (!track?.popularity)
          continue;
        if (obscureTracks2.length < 5) {
          const dupe = await testDupe(track);
          if (dupe)
            continue;
          obscureTracks2.push(track);
          obscureTracks2.sort((a, b) => b.popularity - a.popularity);
          continue;
        }
        for (let j = 0; j < 5; j++) {
          if (track.popularity < obscureTracks2[j].popularity) {
            const dupe = await testDupe(track);
            if (dupe)
              break;
            obscureTracks2.splice(j, 0, track);
            obscureTracks2 = obscureTracks2.slice(0, 5);
            break;
          }
        }
      }
      const fetchedFeatures = await fetchAudioFeatures(topTracks);
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
        popularity: trackPopularity,
        explicitness,
        ...audioFeatures
      };
      for (let key in audioFeatures) {
        audioFeatures[key] = audioFeatures[key] / 50;
      }
      console.log("total genres fetch time:", window.performance.now() - start);
      if (set)
        setTopGenres({
          genres,
          features: audioFeatures,
          years: releaseData,
          obscureTracks: obscureTracks2
        });
      LocalStorage.set(
        `stats:top-genres:${time_range}`,
        JSON.stringify({
          genres,
          features: audioFeatures,
          years: releaseData,
          obscureTracks: obscureTracks2
        })
      );
    };
    import_react25.default.useEffect(() => {
      updatePageCache(2, fetchTopGenres, activeOption.id);
    }, []);
    import_react25.default.useEffect(() => {
      fetchTopGenres(activeOption.id);
    }, [activeOption]);
    const refresh = () => {
      fetchTopGenres(activeOption.id, true);
    };
    const props = {
      title: "Top Genres",
      headerEls: [dropdown, /* @__PURE__ */ import_react25.default.createElement(refresh_button_default, {
        callback: refresh
      }), /* @__PURE__ */ import_react25.default.createElement(settings_button_default, {
        configWrapper
      })]
    };
    switch (topGenres) {
      case 300:
        return /* @__PURE__ */ import_react25.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react25.default.createElement(status_default, {
          icon: "error",
          heading: "No API Key or Username",
          subheading: "Please enter these in the settings menu"
        }));
      case 200:
        return /* @__PURE__ */ import_react25.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react25.default.createElement(status_default, {
          icon: "error",
          heading: "Failed to Fetch Top Genres",
          subheading: "An error occurred while fetching the data"
        }));
      case 100:
        return /* @__PURE__ */ import_react25.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react25.default.createElement(status_default, {
          icon: "library",
          heading: "Loading",
          subheading: "Fetching data..."
        }));
    }
    const statCards = Object.entries(topGenres.features).map(([key, value]) => {
      return /* @__PURE__ */ import_react25.default.createElement(stat_card_default, {
        label: key,
        value
      });
    });
    const obscureTracks = topGenres.obscureTracks.map((track, index) => /* @__PURE__ */ import_react25.default.createElement(track_row_default, {
      index: index + 1,
      ...track,
      uris: topGenres.obscureTracks.map((track2) => track2.uri)
    }));
    return /* @__PURE__ */ import_react25.default.createElement(page_container_default, {
      ...props
    }, /* @__PURE__ */ import_react25.default.createElement("section", {
      className: "main-shelf-shelf Shelf"
    }, /* @__PURE__ */ import_react25.default.createElement(genres_card_default, {
      genres: topGenres.genres,
      total: 1275
    }), /* @__PURE__ */ import_react25.default.createElement(inline_grid_default, {
      special: true
    }, statCards)), /* @__PURE__ */ import_react25.default.createElement(shelf_default, {
      title: "Release Year Distribution"
    }, /* @__PURE__ */ import_react25.default.createElement(genres_card_default, {
      genres: topGenres.years,
      total: 50
    })), /* @__PURE__ */ import_react25.default.createElement(shelf_default, {
      title: "Most Obscure Tracks"
    }, /* @__PURE__ */ import_react25.default.createElement(tracklist_default, {
      minified: true
    }, obscureTracks)));
  };
  var top_genres_default = import_react25.default.memo(GenresPage);

  // src/pages/library.tsx
  var import_react26 = __toESM(require_react());
  var DropdownOptions4 = [
    { id: "owned", name: "My Playlists" },
    { id: "all", name: "All Playlists" }
  ];
  var LibraryPage = ({ configWrapper }) => {
    const [library, setLibrary] = import_react26.default.useState(100);
    const [dropdown, activeOption, setActiveOption] = useDropdownMenu_default(DropdownOptions4, "stats:library");
    const fetchData = async (option, force, set = true) => {
      try {
        if (!force) {
          let storedData = Spicetify.LocalStorage.get(`stats:library:${option}`);
          if (storedData)
            return setLibrary(JSON.parse(storedData));
        }
        const start = window.performance.now();
        const rootlistItems = await apiRequest("rootlist", SPOTIFY.rootlist);
        const flattenPlaylists = (items) => {
          const playlists2 = [];
          items.forEach((row) => {
            if (row.type === "playlist") {
              playlists2.push(row);
            } else if (row.type === "folder") {
              if (!row.rows)
                return;
              const folderPlaylists = flattenPlaylists(row.rows);
              playlists2.push(...folderPlaylists);
            }
          });
          return playlists2;
        };
        let playlists = flattenPlaylists(rootlistItems?.rows);
        playlists = playlists.sort((a, b) => a.ownedBySelf === b.ownedBySelf ? 0 : a.ownedBySelf ? -1 : 1);
        let indexOfFirstNotOwned = -1;
        let playlistUris = [];
        let trackCount = 0;
        let ownedTrackCount = 0;
        playlists.forEach((playlist) => {
          if (playlist.totalLength === 0)
            return;
          if (!playlist.ownedBySelf && indexOfFirstNotOwned === -1)
            indexOfFirstNotOwned = playlistUris.length;
          playlistUris.push(playlist.link);
          trackCount += playlist.totalLength;
          if (playlist.ownedBySelf)
            ownedTrackCount += playlist.totalLength;
        }, 0);
        const playlistsMeta = await Promise.all(
          playlistUris.map((uri) => {
            return apiRequest("playlistsMetadata", SPOTIFY.playlist(uri), 5, false);
          })
        );
        let duration = 0;
        let trackIDs = [];
        let popularity = 0;
        let albums = {};
        let artists = {};
        let explicitCount = 0;
        let ownedDuration = 0;
        let ownedArtists = {};
        let ownedPopularity = 0;
        let ownedAlbums = {};
        let ownedExplicitCount = 0;
        for (let i = 0; i < playlistsMeta.length; i++) {
          const playlist = playlistsMeta[i];
          if (!playlist)
            continue;
          if (i === indexOfFirstNotOwned) {
            ownedDuration = duration;
            ownedArtists = Object.assign({}, artists);
            ownedPopularity = popularity;
            ownedExplicitCount = explicitCount;
            ownedAlbums = Object.assign({}, albums);
          }
          duration += playlist.playlist.duration;
          playlist.items.forEach((track) => {
            if (!track?.album)
              return;
            if (track.link.includes("local"))
              return;
            trackIDs.push(track.link.split(":")[2]);
            if (track.isExplicit)
              explicitCount++;
            popularity += track.popularity;
            const albumID = track.album.link.split(":")[2];
            albums[albumID] = albums[albumID] ? albums[albumID] + 1 : 1;
            track.artists.forEach((artist) => {
              const artistID = artist.link.split(":")[2];
              artists[artistID] = artists[artistID] ? artists[artistID] + 1 : 1;
            });
          });
        }
        const [topArtists, topGenres, topGenresTotal] = await fetchTopArtists(artists);
        const [ownedTopArtists, ownedTopGenres, ownedTopGenresTotal] = await fetchTopArtists(ownedArtists);
        const [topAlbums, releaseYears, releaseYearsTotal] = await fetchTopAlbums(albums);
        const [ownedTopAlbums, ownedReleaseYears, ownedReleaseYearsTotal] = await fetchTopAlbums(
          ownedAlbums,
          topAlbums
        );
        const fetchedFeatures = await fetchAudioFeatures(trackIDs);
        const audioFeatures = {
          danceability: 0,
          energy: 0,
          valence: 0,
          speechiness: 0,
          acousticness: 0,
          instrumentalness: 0,
          liveness: 0,
          tempo: 0
        };
        let ownedAudioFeatures = {};
        for (let i = 0; i < fetchedFeatures.length; i++) {
          if (i === ownedTrackCount) {
            ownedAudioFeatures = {
              popularity: ownedPopularity,
              explicitness: ownedExplicitCount,
              ...audioFeatures
            };
          }
          if (!fetchedFeatures[i])
            continue;
          const track = fetchedFeatures[i];
          Object.keys(audioFeatures).forEach((feature) => {
            audioFeatures[feature] += track[feature];
          });
        }
        const allAudioFeatures = {
          popularity,
          explicitness: explicitCount,
          ...audioFeatures
        };
        for (let key in allAudioFeatures) {
          allAudioFeatures[key] /= fetchedFeatures.length;
        }
        for (let key in ownedAudioFeatures) {
          ownedAudioFeatures[key] /= ownedTrackCount;
        }
        const ownedStats = {
          audioFeatures: ownedAudioFeatures,
          trackCount: ownedTrackCount,
          totalDuration: ownedDuration,
          artists: ownedTopArtists,
          artistCount: Object.keys(ownedArtists).length,
          genres: ownedTopGenres,
          genresDenominator: ownedTopGenresTotal,
          playlistCount: indexOfFirstNotOwned > 0 ? indexOfFirstNotOwned : 0,
          albums: ownedTopAlbums,
          years: ownedReleaseYears,
          yearsDenominator: ownedReleaseYearsTotal
        };
        const allStats = {
          playlistCount: playlists.length,
          audioFeatures: allAudioFeatures,
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
        if (set) {
          if (option === "all" && allStats.playlistCount)
            setLibrary(allStats);
          else if (option === "owned" && ownedStats.playlistCount)
            setLibrary(ownedStats);
          else
            return setLibrary(300);
        }
        Spicetify.LocalStorage.set(`stats:library:all`, JSON.stringify(allStats));
        Spicetify.LocalStorage.set(`stats:library:owned`, JSON.stringify(ownedStats));
        console.log("total library fetch time:", window.performance.now() - start);
      } catch (e) {
        console.error(e);
        setLibrary(200);
      }
    };
    import_react26.default.useEffect(() => {
      updatePageCache(3, fetchData, activeOption.id, true);
    }, []);
    import_react26.default.useEffect(() => {
      fetchData(activeOption.id);
    }, [activeOption]);
    const refresh = () => {
      fetchData(activeOption.id, true);
    };
    const props = {
      title: "Library Analysis",
      headerEls: [dropdown, /* @__PURE__ */ import_react26.default.createElement(refresh_button_default, {
        callback: refresh
      }), /* @__PURE__ */ import_react26.default.createElement(settings_button_default, {
        configWrapper
      })]
    };
    switch (library) {
      case 300:
        return /* @__PURE__ */ import_react26.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react26.default.createElement(status_default, {
          icon: "error",
          heading: "No Playlists In Your Library",
          subheading: "Try adding some playlists first"
        }));
      case 200:
        return /* @__PURE__ */ import_react26.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react26.default.createElement(status_default, {
          icon: "error",
          heading: "Failed to Fetch Stats",
          subheading: "Make an issue on Github"
        }));
      case 100:
        return /* @__PURE__ */ import_react26.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react26.default.createElement(status_default, {
          icon: "library",
          heading: "Analysing your Library",
          subheading: "This may take a while"
        }));
    }
    const statCards = Object.entries(library.audioFeatures).map(([key, value]) => {
      return /* @__PURE__ */ import_react26.default.createElement(stat_card_default, {
        label: key,
        value
      });
    });
    const artistCards = library.artists.slice(0, 10).map((artist) => {
      return /* @__PURE__ */ import_react26.default.createElement(spotify_card_default, {
        type: "artist",
        uri: artist.uri,
        header: artist.name,
        subheader: `Appears in ${artist.freq} tracks`,
        imageUrl: artist.image
      });
    });
    const albumCards = library.albums.map((album) => {
      return /* @__PURE__ */ import_react26.default.createElement(spotify_card_default, {
        type: "album",
        uri: album.uri,
        header: album.name,
        subheader: `Appears in ${album.freq} tracks`,
        imageUrl: album.image
      });
    });
    return /* @__PURE__ */ import_react26.default.createElement(page_container_default, {
      ...props
    }, /* @__PURE__ */ import_react26.default.createElement("section", {
      className: "stats-libraryOverview"
    }, /* @__PURE__ */ import_react26.default.createElement(stat_card_default, {
      label: "Total Playlists",
      value: library.playlistCount.toString()
    }), /* @__PURE__ */ import_react26.default.createElement(stat_card_default, {
      label: "Total Tracks",
      value: library.trackCount.toString()
    }), /* @__PURE__ */ import_react26.default.createElement(stat_card_default, {
      label: "Total Artists",
      value: library.artistCount.toString()
    }), /* @__PURE__ */ import_react26.default.createElement(stat_card_default, {
      label: "Total Minutes",
      value: Math.floor(library.totalDuration / 60).toString()
    }), /* @__PURE__ */ import_react26.default.createElement(stat_card_default, {
      label: "Total Hours",
      value: (library.totalDuration / (60 * 60)).toFixed(1)
    })), /* @__PURE__ */ import_react26.default.createElement(shelf_default, {
      title: "Most Frequent Genres"
    }, /* @__PURE__ */ import_react26.default.createElement(genres_card_default, {
      genres: library.genres,
      total: library.genresDenominator
    }), /* @__PURE__ */ import_react26.default.createElement(inline_grid_default, {
      special: true
    }, statCards)), /* @__PURE__ */ import_react26.default.createElement(shelf_default, {
      title: "Most Frequent Artists"
    }, /* @__PURE__ */ import_react26.default.createElement(inline_grid_default, null, artistCards)), /* @__PURE__ */ import_react26.default.createElement(shelf_default, {
      title: "Most Frequent Albums"
    }, /* @__PURE__ */ import_react26.default.createElement(inline_grid_default, null, albumCards)), /* @__PURE__ */ import_react26.default.createElement(shelf_default, {
      title: "Release Year Distribution"
    }, /* @__PURE__ */ import_react26.default.createElement(genres_card_default, {
      genres: library.years,
      total: library.yearsDenominator
    })));
  };
  var library_default = import_react26.default.memo(LibraryPage);

  // src/pages/charts.tsx
  var import_react27 = __toESM(require_react());
  var DropdownOptions5 = [
    { id: "artists", name: "Top Artists" },
    { id: "tracks", name: "Top Tracks" }
  ];
  var ChartsPage = ({ configWrapper }) => {
    const [chartData, setChartData] = import_react27.default.useState(100);
    const [dropdown, activeOption, setActiveOption] = useDropdownMenu_default(DropdownOptions5, "stats:charts");
    async function fetchChartData(type, force, set = true) {
      if (!force) {
        let storedData = Spicetify.LocalStorage.get(`stats:charts:${type}`);
        if (storedData)
          return setChartData(JSON.parse(storedData));
      }
      const api_key = configWrapper.config["api-key"];
      if (!api_key)
        return setChartData(200);
      const response = await apiRequest("charts", LASTFM.charts(api_key, type));
      if (!response)
        return setChartData(500);
      const data = response[type].track || response[type].artist;
      const cardData = await (type == "artists" ? convertArtistData(data) : convertTrackData(data));
      if (type === "tracks") {
        const likedArray = await checkLiked(cardData.map((track) => track.id));
        if (!likedArray)
          return setChartData(200);
        cardData.forEach((track, index) => {
          track.liked = likedArray[index];
        });
      }
      if (set)
        setChartData(cardData);
      Spicetify.LocalStorage.set(`stats:charts:${type}`, JSON.stringify(cardData));
    }
    import_react27.default.useEffect(() => {
      updatePageCache(4, fetchChartData, activeOption.id, "charts");
    }, []);
    import_react27.default.useEffect(() => {
      fetchChartData(activeOption.id);
    }, [activeOption]);
    const refresh = () => {
      fetchChartData(activeOption.id, true);
    };
    const props = {
      title: "Top Albums",
      headerEls: [dropdown, /* @__PURE__ */ import_react27.default.createElement(refresh_button_default, {
        callback: refresh
      }), /* @__PURE__ */ import_react27.default.createElement(settings_button_default, {
        configWrapper
      })]
    };
    switch (chartData) {
      case 200:
        return /* @__PURE__ */ import_react27.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react27.default.createElement(status_default, {
          icon: "error",
          heading: "No API Key",
          subheading: "Please enter your Last.fm API key in the settings menu."
        }));
      case 500:
        return /* @__PURE__ */ import_react27.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react27.default.createElement(status_default, {
          icon: "error",
          heading: "Error",
          subheading: "An error occurred while fetching the data."
        }));
      case 100:
        return /* @__PURE__ */ import_react27.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react27.default.createElement(status_default, {
          icon: "library",
          heading: "Loading",
          subheading: "Fetching data from Last.fm..."
        }));
    }
    if (!chartData[0]?.album) {
      const artistCards = chartData.map((artist, index) => {
        const type = artist.uri.startsWith("https") ? "lastfm" : "artist";
        return /* @__PURE__ */ import_react27.default.createElement(spotify_card_default, {
          type,
          uri: artist.uri,
          header: artist.name,
          subheader: `#${index + 1} Artist`,
          imageUrl: artist.image
        });
      });
      props.title = `Charts - Top Artists`;
      return /* @__PURE__ */ import_react27.default.createElement(page_container_default, {
        ...props
      }, /* @__PURE__ */ import_react27.default.createElement("div", {
        className: `main-gridContainer-gridContainer grid`
      }, artistCards));
    } else {
      const date = new Date().toLocaleDateString("en-US", {
        year: "numeric",
        month: "2-digit",
        day: "2-digit"
      });
      const infoToCreatePlaylist = {
        playlistName: `Charts - Top Tracks - ${date}`,
        itemsUris: chartData.map((track) => track.uri)
      };
      const trackRows = chartData.map((track, index) => /* @__PURE__ */ import_react27.default.createElement(track_row_default, {
        index: index + 1,
        ...track,
        uris: chartData.map((track2) => track2.uri)
      }));
      props.title = `Charts - Top Tracks`;
      return /* @__PURE__ */ import_react27.default.createElement(page_container_default, {
        ...props,
        infoToCreatePlaylist
      }, /* @__PURE__ */ import_react27.default.createElement(tracklist_default, null, trackRows));
    }
  };
  var charts_default = import_react27.default.memo(ChartsPage);

  // src/pages/top_albums.tsx
  var import_react28 = __toESM(require_react());
  var topAlbumsReq = async (time_range, configWrapper) => {
    const { config } = configWrapper;
    if (!config["api-key"] || !config["lastfm-user"])
      return 300;
    const { ["lastfm-user"]: user, ["api-key"]: key } = config;
    const response = await apiRequest("lastfm", LASTFM.topalbums(user, key, time_range));
    if (!response)
      return 200;
    return await convertAlbumData(response.topalbums.album);
  };
  var DropdownOptions6 = [
    { id: "short_term", name: "Past Month" },
    { id: "medium_term", name: "Past 6 Months" },
    { id: "long_term", name: "All Time" }
  ];
  var AlbumsPage = ({ configWrapper }) => {
    const { LocalStorage } = Spicetify;
    const [topAlbums, setTopAlbums] = import_react28.default.useState(100);
    const [dropdown, activeOption] = useDropdownMenu_default(DropdownOptions6, "stats:top-albums");
    const fetchTopAlbums2 = async (time_range, force, set = true) => {
      if (!force) {
        let storedData = LocalStorage.get(`stats:top-albums:${time_range}`);
        if (storedData)
          return setTopAlbums(JSON.parse(storedData));
      }
      const start = window.performance.now();
      const topAlbums2 = await topAlbumsReq(time_range, configWrapper);
      if (set)
        setTopAlbums(topAlbums2);
      LocalStorage.set(`stats:top-albums:${time_range}`, JSON.stringify(topAlbums2));
      console.log("total albums fetch time:", window.performance.now() - start);
    };
    import_react28.default.useEffect(() => {
      updatePageCache(5, fetchTopAlbums2, activeOption.id);
    }, []);
    import_react28.default.useEffect(() => {
      fetchTopAlbums2(activeOption.id);
    }, [activeOption]);
    const refresh = () => {
      fetchTopAlbums2(activeOption.id, true);
    };
    const props = {
      title: "Top Albums",
      headerEls: [dropdown, /* @__PURE__ */ import_react28.default.createElement(refresh_button_default, {
        callback: refresh
      }), /* @__PURE__ */ import_react28.default.createElement(settings_button_default, {
        configWrapper
      })]
    };
    switch (topAlbums) {
      case 300:
        return /* @__PURE__ */ import_react28.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react28.default.createElement(status_default, {
          icon: "error",
          heading: "No API Key or Username",
          subheading: "Please enter these in the settings menu"
        }));
      case 200:
        return /* @__PURE__ */ import_react28.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react28.default.createElement(status_default, {
          icon: "error",
          heading: "Failed to Fetch Top Artists",
          subheading: "An error occurred while fetching the data"
        }));
      case 100:
        return /* @__PURE__ */ import_react28.default.createElement(page_container_default, {
          ...props
        }, /* @__PURE__ */ import_react28.default.createElement(status_default, {
          icon: "library",
          heading: "Loading",
          subheading: "Fetching data..."
        }));
    }
    const albumCards = topAlbums.map((album, index) => {
      const type = album.uri.startsWith("https") ? "lastfm" : "album";
      return /* @__PURE__ */ import_react28.default.createElement(spotify_card_default, {
        type,
        uri: album.uri,
        header: album.name,
        subheader: `#${index + 1} Album`,
        imageUrl: album.image
      });
    });
    return /* @__PURE__ */ import_react28.default.createElement(page_container_default, {
      ...props
    }, /* @__PURE__ */ import_react28.default.createElement("div", {
      className: `main-gridContainer-gridContainer grid`
    }, albumCards));
  };
  var top_albums_default = import_react28.default.memo(AlbumsPage);

  // package.json
  var version = "0.3.3";

  // src/app.tsx
  var checkForUpdates = (setNewUpdate) => {
    fetch("https://api.github.com/repos/harbassan/spicetify-apps/releases").then((res) => res.json()).then(
      (result) => {
        const releases = result.filter((release) => release.name.startsWith("stats"));
        setNewUpdate(releases[0].name.slice(7) !== version);
      },
      (error) => {
        console.log("Failed to check for updates", error);
      }
    );
  };
  var App = () => {
    const [config, setConfig] = import_react29.default.useState({ ...SpicetifyStats.ConfigWrapper.Config });
    const launchModal = () => {
      SpicetifyStats.ConfigWrapper.launchModal(setConfig);
    };
    const configWrapper = {
      config,
      launchModal
    };
    const pages = {
      ["Artists"]: /* @__PURE__ */ import_react29.default.createElement(top_artists_default, {
        configWrapper
      }),
      ["Tracks"]: /* @__PURE__ */ import_react29.default.createElement(top_tracks_default, {
        configWrapper
      }),
      ["Albums"]: /* @__PURE__ */ import_react29.default.createElement(top_albums_default, {
        configWrapper
      }),
      ["Genres"]: /* @__PURE__ */ import_react29.default.createElement(top_genres_default, {
        configWrapper
      }),
      ["Library"]: /* @__PURE__ */ import_react29.default.createElement(library_default, {
        configWrapper
      }),
      ["Charts"]: /* @__PURE__ */ import_react29.default.createElement(charts_default, {
        configWrapper
      })
    };
    const tabPages = ["Artists", "Tracks", "Albums", "Genres", "Library", "Charts"].filter(
      (page) => configWrapper.config[`show-${page.toLowerCase()}`]
    );
    const [navBar, activeLink, setActiveLink] = useNavigationBar_default(tabPages);
    const [hasPageSwitched, setHasPageSwitched] = import_react29.default.useState(false);
    const [newUpdate, setNewUpdate] = import_react29.default.useState(false);
    import_react29.default.useEffect(() => {
      setActiveLink(Spicetify.LocalStorage.get("stats:active-link") || "Artists");
      checkForUpdates(setNewUpdate);
      setHasPageSwitched(true);
    }, []);
    import_react29.default.useEffect(() => {
      Spicetify.LocalStorage.set("stats:active-link", activeLink);
    }, [activeLink]);
    if (!hasPageSwitched) {
      return /* @__PURE__ */ import_react29.default.createElement(import_react29.default.Fragment, null);
    }
    return /* @__PURE__ */ import_react29.default.createElement("div", {
      id: "stats-app"
    }, navBar, newUpdate && /* @__PURE__ */ import_react29.default.createElement("div", {
      className: "new-update"
    }, "New app update available! Visit", " ", /* @__PURE__ */ import_react29.default.createElement("a", {
      href: "https://github.com/harbassan/spicetify-apps/releases"
    }, "harbassan/spicetify-apps"), " to install."), pages[activeLink]);
  };
  var app_default = App;

  // ../../../AppData/Local/Temp/spicetify-creator/index.jsx
  var import_react30 = __toESM(require_react());
  function render() {
    return /* @__PURE__ */ import_react30.default.createElement(app_default, null);
  }
  return __toCommonJS(spicetify_creator_exports);
})();
const render=()=>stats.default();
