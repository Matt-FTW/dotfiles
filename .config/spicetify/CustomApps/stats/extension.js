"use strict";
var stats = (() => {
  // src/extensions/extension.tsx
  (async () => {
    while (!(Spicetify == null ? void 0 : Spicetify.LocalStorage)) {
      await new Promise((resolve) => setTimeout(resolve, 100));
    }
    Spicetify.LocalStorage.set("stats:cache-info", JSON.stringify([0, 0, 0, 0]));
  })();
})();
