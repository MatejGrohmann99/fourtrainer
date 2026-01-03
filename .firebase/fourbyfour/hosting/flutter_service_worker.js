'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"v1/twistysim.js": "4ccf3bce9c41edafc6262c4e17b7b9b7",
"v1/algSpeed.js": "2ab089b744b31ffc494476f6b4135c39",
"v1/worker.js": "8444d58b3ab58ae2ee2cfec01bf928e7",
"v1/solver.html": "6f46627ee23112ff7fd77b05d3e7edc5",
"flutter_bootstrap.js": "6307d735af0bc5ff413d48e57c6bfe23",
"version.json": "53b24d1af9ec02d1128e49b799b74fd5",
"index.html": "23f88c1f5378506cde4875152fc2340f",
"/": "23f88c1f5378506cde4875152fc2340f",
"v1.zip": "10b9f77bbc2f2bb6363f207eef650be4",
"icon_original.png": "103043e32e2f56ece6dd53872f84ffa0",
"main.dart.js": "7f73fc15babb0ee51f98b0d738ead5a5",
"koni/twistysim.js": "4ccf3bce9c41edafc6262c4e17b7b9b7",
"koni/flower.gif": "a71beed6f2358f9e09b932ae6429b82c",
"koni/rychlejsi": "c3ff553ec46e99bd91f5e6061b3b5a46",
"koni/algSpeed.js": "2ab089b744b31ffc494476f6b4135c39",
"koni/worker.js": "6c9a1fb791b5bed463f80792d762f002",
"koni/prdel.html": "c1d7e886c91a777d672121e53a61b2bc",
"koni/ilii.gif": "597b6a038c2153a266184e3e5a66ab06",
"koni/opicka.gif": "2090655b4e4b60a853134a3368d322ea",
"koni/kokosak.gif": "e823a908de343a229ab5b5f3c2aad8b0",
"koni/homere.gif": "9b31c7d3410cfac7ecd2ad2421ab3fa1",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "a19d16cafc83ba12f4026de4aa5ca341",
"bird/compile.sh": "6a5e2de09e76710bee5c22b43d038b14",
"bird/puzzle_wasm.js": "e769afbdaf33e5f7b54ab3db4a2b0460",
"bird/funccopy": "7061f520e537303d06d59ef8e310264f",
"bird/worker.js": "0227aafc4c323318163c8361c9d0a0db",
"bird/puzzle_wasm.c": "b23df864d8fa23e66894ea8e3b739ba9",
"bird/is-the-word.html": "e7a0221a5fea0ac6fbebc71964da8853",
"bird/puzzle_wasm_wrapper_sync.js": "aaecc7c99faf9761f8597eff98c7b7d5",
"bird/puzzle_wasm_wrapper_simple.js": "407223c18a486bdecf9d5eb4d1acf576",
"bird/puzzle_wasm.wasm": "d37f752f481d4b27d6ef5caaa6fc771e",
"icons/Icon-192.png": "2e98d369c0091ec417cf690e375758c6",
"icons/Icon-maskable-192.png": "ec1b8a56fb7ba784f20960d706b84c22",
"icons/Icon-maskable-512.png": "4b74a7373249dbb816b966bde4b6edad",
"icons/Icon-512.png": "4b74a7373249dbb816b966bde4b6edad",
"manifest.json": "b22344095c5496f9a7cbe0e240b59376",
"assets/images/yu.png": "c99444fa285eb532715c01e30748e4a7",
"assets/images/kara.png": "23310304b316b78417f924dda19072d2",
"assets/AssetManifest.json": "a74b0e56245ea95fc554b66225df43b9",
"assets/NOTICES": "ba0cf2adee08906d4a7bf6148114385d",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "81d88fc2aff947c72ca788c03a83b42b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "5c04fa142fa10fcc2b08450285bab633",
"assets/fonts/MaterialIcons-Regular.otf": "b23ed06650cdd25ae1846454f4f0c307",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
