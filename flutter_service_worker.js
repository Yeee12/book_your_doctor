'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "44c942a72948bf4a6202383152762dac",
"assets/AssetManifest.bin.json": "8be27c84cd60aee5596a13af9c1ffd31",
"assets/AssetManifest.json": "dcf6de12aa1db8558de47e91a178223f",
"assets/assets/fonts/Inter_18pt-Bold.ttf": "7ef6f6d68c7fedc103180f2254985e8c",
"assets/assets/fonts/Inter_18pt-Medium.ttf": "8540f35bf8acd509b9ce356f1111e983",
"assets/assets/fonts/Inter_18pt-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/assets/fonts/Inter_18pt-SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/assets/fonts/Inter_24pt-Bold.ttf": "8b04b3bd9435341377d7f4b4d68b6ecc",
"assets/assets/fonts/Inter_24pt-Medium.ttf": "4591e900425d177e6ba268d165bf12e8",
"assets/assets/fonts/Inter_24pt-Regular.ttf": "e48c1217adab2a0e44f8df400d33c325",
"assets/assets/fonts/Inter_24pt-SemiBold.ttf": "c77560a8441d664af3e65dd57026dff9",
"assets/assets/fonts/Poppins-Black.ttf": "62a51d6c865b832053fc7f9066b0935c",
"assets/assets/fonts/Poppins-SemiBold.ttf": "bafbc0b1fb65a719824724dc735ea88c",
"assets/assets/images/1409.png": "a2321f0a6d62484cc2671b7790586b79",
"assets/assets/images/25030.png": "baf722ea721441bbfbbd5a53b0e11792",
"assets/assets/images/aidoc.png": "f47b112e490538fd7bac8c8874a98b9f",
"assets/assets/images/anodagreen.png": "1cf040b6657c7265fc567c07ac761c88",
"assets/assets/images/bench.png": "125aba95c1ac9734723674ee93f0ce20",
"assets/assets/images/bigaidoc.png": "9fdf42ca07fafa89f732f30b64d0beb1",
"assets/assets/images/blakidoc.png": "a13fe6ec1eca5b6ed5d0a8017a605415",
"assets/assets/images/browndoc.png": "ada2de3fff664dcff369c79eb043c2fd",
"assets/assets/images/docwithgreeeninner.png": "5c70ef052e29445434626d140615ea2e",
"assets/assets/images/Faceboo.png": "d2109d04172f901bacd398641dc7982e",
"assets/assets/images/Frame.png": "318a0dd0ef5be9d6f63e404d69fb8de9",
"assets/assets/images/genivivdoc.png": "a3548c206d86fb3612b4b0b1a7a3e62d",
"assets/assets/images/Google%2520.png": "6e46385631a12895e158137cfd49b59c",
"assets/assets/images/green.png": "c6a25adfe08dd41a85fa4cc3524fc483",
"assets/assets/images/greenmandoc.png": "9742b2c417e5546b4d630319059ade24",
"assets/assets/images/Image%2520(1).png": "5c9e7787b9ff8268baec51f0815b77e4",
"assets/assets/images/Image%2520(2).png": "836c313b53803f70a4c7371f12cae256",
"assets/assets/images/Image%2520(3).png": "73d42be4b989cf13a91884490f4073f0",
"assets/assets/images/Image%2520(4).png": "ba2e83872ee5d9bc702352fca2c77ba6",
"assets/assets/images/Image%2520(5).png": "a95929eed4b368a01688e343312525a8",
"assets/assets/images/Image%2520(6).png": "fc93cb50c4e6c8e928736f392e1b9ef9",
"assets/assets/images/Image%2520(7).png": "d25b0bd56bc07d64df31b4063e99cdcd",
"assets/assets/images/Image%252002.png": "a1e94243c520c130231f4a8c3aac0b15",
"assets/assets/images/Image%252004.png": "d6d034054d05d98cfb765ba1674d19ad",
"assets/assets/images/Image%252006.png": "7588e29f2d396023613f0877a526edc5",
"assets/assets/images/Image%252008.png": "e3339aab6c491a5ab52d6a1fa4ffcb2d",
"assets/assets/images/Image.png": "393c02ef289b015fd61ff04db6004180",
"assets/assets/images/interior-re.png": "96629f565448ea46b2be2120eceea635",
"assets/assets/images/lastdoc.png": "c72a17e050a41c2c3164985a303c56d2",
"assets/assets/images/lilacdoc.png": "9dd549664e2dd942b5311db0899330b5",
"assets/assets/images/Logo.png": "66036b7d6fdc94f9608da4e4ddf7513f",
"assets/assets/images/Loogs.png": "2225e6db71250449e619a55185d0bb9f",
"assets/assets/images/mugshotdoc.png": "d96ad1a993cdf97767a425e97e291738",
"assets/assets/images/nosmiledoc.png": "c755f9a08e79a40ebef1ef29a2fe61fc",
"assets/assets/images/okld.png": "683a88220643c705ab32efdbad05e2b5",
"assets/assets/images/olddidoc.png": "199bf0674d49544d882ad2bda7428145",
"assets/assets/images/olddoc.png": "ed8c5315aa3422a8de7842cbf7cc57b6",
"assets/assets/images/oldie.png": "568b2d18732bf6795e580c27c056bd21",
"assets/assets/images/oldmanai.png": "d4233899b3592d90b50bd9eadb5c57c4",
"assets/assets/images/olkd2.png": "5d829b0ca971267059c94f69d611d238",
"assets/assets/images/orangedoc.png": "dcffcd40738109317168a5ae9fa49013",
"assets/assets/images/pinkdoc.png": "036a4bd5963789a61b0bd552e1da71b8",
"assets/assets/images/shinningdoc.png": "ec5eb234e37dd2be37faba93f219c3aa",
"assets/assets/images/smillingdoc.png": "778d945fbdcd8177576ab26f380f2db8",
"assets/assets/images/sunflower.png": "5d8c432e5229983df975c28b46ee6b0c",
"assets/assets/images/sunrisedoc.png": "a77cea2f603aa9a563779829361da5c8",
"assets/assets/images/Vector.png": "9f9021c4587a70be724b3a87078b4dc9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c0de17ecb1b55e3619d8a7f8077139f8",
"assets/NOTICES": "27e3732f740bc1cd7fdea0f3ad5fb5ed",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "d002943f1fefd9703c7735e8a0f3fa27",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8ac7eb8ecffa8fcd16f4aedb9e96f04e",
"/": "8ac7eb8ecffa8fcd16f4aedb9e96f04e",
"main.dart.js": "c5f46f77fd2fc1737d28ca0743485cbf",
"manifest.json": "20455bcd413f30e221a0e11afb1f76f4",
"version.json": "8d5f82760ab21df1bc88aece610ee668"};
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
