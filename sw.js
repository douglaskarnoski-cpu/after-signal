/* AFTER SIGNAL — service worker
   © 2026 Douglas Karnoski
   Estratégia: rede primeiro para a página (para a versão nova chegar sempre
   que houver internet), cache só como rede de segurança para abrir offline.
   Streams de áudio, API e tiles nunca são cacheados. */
const V = 'aftersignal-v5';
const SHELL = ['./','./index.html','./manifest.webmanifest','./icon.svg'];

self.addEventListener('install', e=>{
  e.waitUntil(caches.open(V).then(c=>c.addAll(SHELL)).then(()=>self.skipWaiting()));
});
self.addEventListener('activate', e=>{
  e.waitUntil(caches.keys()
    .then(k=>Promise.all(k.filter(x=>x!==V).map(x=>caches.delete(x))))
    .then(()=>self.clients.claim()));
});
self.addEventListener('message', e=>{ if (e.data && e.data.type==='SKIP_WAITING') self.skipWaiting(); });

self.addEventListener('fetch', e=>{
  const u = new URL(e.request.url);
  if (e.request.method !== 'GET') return;
  if (u.origin !== location.origin) return;          // API, relays, tiles e streams passam direto

  e.respondWith(
    fetch(e.request)
      .then(res=>{
        const copy = res.clone();
        caches.open(V).then(c=>c.put(e.request, copy)).catch(()=>{});
        return res;
      })
      .catch(()=> caches.match(e.request).then(r=> r || caches.match('./index.html')))
  );
});
