'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/images/projects/luma_expense/5.jpg": "45d9715addc435c59cbfa13e91b21396",
"assets/assets/images/projects/luma_expense/9.jpg": "a5810173b96e939e0c094e7e50b5bcf0",
"assets/assets/images/projects/luma_expense/4.jpg": "aac55c866887ae5a8cca0e59e718989b",
"assets/assets/images/projects/luma_expense/6.jpg": "ab7fee8e1c0bdb8eb5cc0060bbe62bb2",
"assets/assets/images/projects/luma_expense/8.jpg": "b6a996e9696a0dee42305b4265f7d47d",
"assets/assets/images/projects/luma_expense/10.jpg": "1d536689c0130a22e949e8f8d1e74482",
"assets/assets/images/projects/luma_expense/7.jpg": "9819fe8bad2b57e6957b3033a71be2e1",
"assets/assets/images/projects/luma_expense/3.jpg": "c2eea7ef4de806141eaa97f503496c7b",
"assets/assets/images/projects/luma_expense/1.png": "1c903551d906048c7334b061ee519291",
"assets/assets/images/projects/luma_expense/2.jpg": "eca88e4c61f7dcd607726f0bd811b3a3",
"assets/assets/images/projects/innovated/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/innovated/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/luma_notes/5.jpg": "339176af5c008ed5aabe20e80e0bc3fe",
"assets/assets/images/projects/luma_notes/4.jpg": "4a6b24b7fcef52a70b1da446b22fcaf3",
"assets/assets/images/projects/luma_notes/3.jpg": "4e2f871e7b20fda8546d5e9559261f1e",
"assets/assets/images/projects/luma_notes/1.jpg": "08e7832efe64007b7cee50a048b28cbe",
"assets/assets/images/projects/luma_notes/2.jpg": "aef24de14a6deb06af76259d7e691fb2",
"assets/assets/images/projects/kubrra/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/kubrra/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/spish/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/spish/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/social/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/social/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/puffless/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/puffless/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/shouse/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/shouse/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/sunversum/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/sunversum/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/emp/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/emp/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/s24/2.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/images/projects/s24/1.png": "ab74ab45c04cd3663e28bdfe89bcd862",
"assets/assets/cv/hamza_cv.pdf": "d1bc04268744149b5c2a23274d38ac1a",
"assets/fonts/MaterialIcons-Regular.otf": "ed00536a8b57071f58f3147a5f6e58f7",
"assets/AssetManifest.bin": "16ee86837ff20a6cbc71157d3119a249",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "43def97718b50737bdf1d12c080bc817",
"assets/NOTICES": "ea98afc8905655554ebc3c7e4f1da8dd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "0b8b7b1b69d1fc34e91666f19e7c08c5",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "3dfecf02652ec2354cb849a209fd76d3",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "262525e2081311609d1fdab966c82bfc",
"assets/AssetManifest.json": "791d437e5b3c010ac2836581083ca4ee",
"favicon.png": "560f6a9931f20ba4ee4785f3015afcfc",
"version.json": "00d51c62ce7fb9d2c40c1330a4e0593a",
"index.html": "298eb353e1090557adda3aad69c8bb18",
"/": "298eb353e1090557adda3aad69c8bb18",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"index": "9b0c77c9851cceaf7729e1d5f486a297",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"flutter_bootstrap.js": "d28a417ec9fa6a31df4aa49ee7447941",
"manifest.json": "6ed0e2c82c09ea5c93daec5a8aab04c5",
"main.dart.js": "8060922cd97e62e08a346fdd26021b70"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
