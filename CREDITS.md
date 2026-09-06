# Créditos e licenças de terceiros

**AFTER SIGNAL** © 2026 Douglas Karnoski — o código do aplicativo está sob a
licença descrita em `LICENSE`. O que está listado aqui **não** é meu, tem dono
e licença próprios, e continua regido por eles.

## Bibliotecas

| Componente | Uso | Licença |
|---|---|---|
| [Leaflet](https://leafletjs.com) 1.9.4 | mapa | BSD 2-Clause |
| [hls.js](https://github.com/video-dev/hls.js) 1.5.x | streams .m3u8 | Apache 2.0 |
| [Monoton](https://fonts.google.com/specimen/Monoton), [Share Tech Mono](https://fonts.google.com/specimen/Share+Tech+Mono), [Space Grotesk](https://fonts.google.com/specimen/Space+Grotesk) | tipografia | SIL Open Font License 1.1 |

SHA-256 e a assinatura schnorr (BIP-340) foram **escritos do zero** para este
projeto, em JavaScript puro, e são cobertos pela licença do aplicativo.

## Dados e serviços

| Serviço | Uso | Termos |
|---|---|---|
| [Radio Browser](https://api.radio-browser.info) | catálogo de estações | banco de dados comunitário, uso livre; peça-se um user-agent identificável |
| [OpenStreetMap](https://www.openstreetmap.org/copyright) | geografia do mapa | ODbL — **a atribuição no rodapé do mapa é obrigatória, não remova** |
| [CARTO](https://carto.com/basemaps/) | estilo dos tiles | uso gratuito com atribuição |
| [Nostr](https://nips.nostr.com/1) | protocolo da rede | protocolo aberto, sem dono |
| relays públicos | transporte das mensagens | cada relay tem seus próprios termos |
| [MyMemory](https://mymemory.translated.net) | tradução | gratuito com cota diária por IP |

## Obrigações que acompanham o projeto

1. **Manter a atribuição do OpenStreetMap/CARTO** visível no mapa. É condição
   da ODbL, não enfeite.
2. **Manter os avisos de licença** de Leaflet e hls.js se você redistribuir os
   arquivos deles.
3. As **rádios não são suas**: o app aponta para os streams originais, não os
   rehospeda. Se um dia você quiser retransmitir ou gravar alguma, isso é outro
   assunto jurídico (direitos conexos de radiodifusão) e precisa de acordo com
   a emissora.
4. **Não modere o que não hospeda** — mas se um dia o projeto crescer, um canal
   público sem moderação nenhuma vira um problema seu de reputação, mesmo que
   não seja de responsabilidade legal.
