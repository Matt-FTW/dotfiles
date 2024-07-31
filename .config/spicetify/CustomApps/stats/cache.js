(async function() {
          while (!Spicetify.React || !Spicetify.ReactDOM) {
            await new Promise(resolve => setTimeout(resolve, 10));
          }
          "use strict";
var stats = (() => {
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
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

  // src/extensions/cache.ts
  var cache_exports = {};
  __export(cache_exports, {
    cacher: () => cacher,
    invalidator: () => invalidator
  });
  var cache = {};
  var set = (key, value) => {
    cache[key] = value;
  };
  var invalidate = (key) => {
    delete cache[key];
  };
  var cacher = (cb) => {
    return async ({ queryKey }) => {
      const key = queryKey.join("-");
      if (cache[key])
        return cache[key];
      const result = await cb();
      set(key, result);
      return result;
    };
  };
  var invalidator = (queryKey, refetch) => {
    invalidate(queryKey.join("-"));
    refetch();
  };
  return __toCommonJS(cache_exports);
})();

        })();