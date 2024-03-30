var staticCacheName = "pwa-v1"; // Update cache name with versioning
self.addEventListener("install", function (e) {
e.waitUntil(
caches.open(staticCacheName).then(function (cache) {
return cache.addAll([
'/', // Add your homepage and other important routes here
'/index.html',
'/assets/images/payment-img.png',
]);
})
);
});
self.addEventListener('activate', function(event) {
event.waitUntil(
caches.keys().then(function(cacheNames) {
return Promise.all(
cacheNames.filter(function(cacheName) {
// Return true if you want to remove this cache, false otherwise
return cacheName.startsWith('pwa-') && cacheName !== staticCacheName;
}).map(function(cacheName) {
return caches.delete(cacheName);
})
);
})
);
});
self.addEventListener("fetch", function (event) {
event.respondWith(
caches.match(event.request).then(function (response) {
return response || fetch(event.request);
})
);
});