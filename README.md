# AFTER SIGNAL

*o que sobrou no ar*

Por **Douglas Karnoski** — [github.com/douglaskarnoski-cpu](https://github.com/douglaskarnoski-cpu)
· © 2026, todos os direitos reservados ([LICENSE](LICENSE))

Uma rede paralela de rádios ao vivo. Milhares de estações reais transmitindo
agora num mapa do mundo, e gente do outro lado. Sem algoritmo, sem feed, sem
cadastro — e sem nenhum servidor nosso, porque não existe nenhum.

## Rodar

Duplo clique em **`abrir.bat`** (serve em `http://localhost:8777` com o Python
que você já tem). Sem Python, abra `index.html` — funciona, mas a rede de
relays e a localização preferem `localhost` ou `https`.

## Publicar de graça

Duplo clique em **`publicar.bat`** e siga os três passos: ele sobe a pasta para
um repositório seu e abre a tela do GitHub Pages. Resultado:
`https://SEU-USUARIO.github.io/after-signal/` — no ar 24h, sem custo, sem pausa
por inatividade. É um site estático e nenhum áudio passa por lá.

## Como a rede funciona (sem servidor)

A parte social não usa backend próprio. Cada cópia do app fala com **relays
Nostr públicos** — servidores abertos, gratuitos, espalhados pelo mundo, que
qualquer um pode rodar. Se um cai, os outros seguem.

- **Identidade**: um par de chaves gerado no seu navegador, guardado só aí.
  Sem e-mail, sem senha, sem conta. Apagar os dados do site apaga a identidade.
- **Assinatura**: schnorr BIP-340, implementada em JS puro dentro do
  `index.html` — sem dependência de CDN, validada contra os vetores oficiais.
- **Presença** (kind 20100, efêmero): quem está no ar e o que está ouvindo.
  Sua posição só é enviada se você marcar, e vai arredondada para ~50 km.
- **Conversa** (kind 1, com a hashtag do app): canal global e sala por estação.
- **Mural e sua rádio** (kind 30078, NIP-78): persistem nos relays. Um bilhete
  por pessoa por estação, editável.

Consequência honesta: o que você escreve fica em relays públicos, legível por
qualquer cliente Nostr. É uma praça, não uma sala trancada.

## O que tem dentro

| | |
|---|---|
| **mapa** | até ~32 mil estações com coordenadas reais, em levas |
| **três cores** | âmbar = catálogo · verde = a sua rádio · roxo = rádios de outras pessoas · ciano = gente |
| **player** | mp3/aac direto, HLS via hls.js, anterior/próxima |
| **sincronizador** | viaja sozinho: vizinhas, mesmo país, mesmo gênero, aleatória |
| **expandir** | tela cheia estilo protetor de tela, com 6 visualizadores: ondas, anéis, osciloscópio, aurora, túnel, cinzas |
| **a torre** | paisagem animada da sua rádio: céu na hora real, névoa, bosque, vagalumes, e as ondas pulsando quando você está no ar |
| **ambiente** | chuva, vento, fogueira e grilos sintetizados na hora |
| **dormir** | temporizador que desliga tudo |
| **transmissão** | o "último sinal": mensagem ao mundo com foto, que acende um farol no mapa |
| **miniaturas** | logo de cada estação na lista e na aba |
| **PWA** | instalável, abre offline, avisa quando há versão nova |
| **8 idiomas** | pt · en · es · fr · zh · ru · uk · ar (com RTL) |

Atalhos: `espaço` play · `n` próxima · `b` anterior · `s` sincronizador ·
`f` expandir · `r` torre · `g` canal global · `esc` sair · `/` buscar.

## Idiomas

Oito, escolhidos na tela de entrada e lembrados depois: português, inglês,
espanhol, francês, chinês, russo, ucraniano e árabe — este último com a
interface espelhada da direita para a esquerda.

## Como ter a sua própria rádio

A aba **minha** pergunta de onde vem o som e oferece três caminhos:

1. **Já tenho um link** — cole o endereço de um stream que já existe (Icecast,
   Shoutcast, AzuraCast num servidor seu, ou um provedor pago). É a única forma
   de transmitir ao vivo de verdade, porque um navegador não pode servir áudio
   para outras pessoas.
2. **Montar uma programação** — sem servidor nenhum: você lista os endereços das
   suas músicas (hospedadas onde quiser: archive.org, um repositório no GitHub
   Pages, Cloudflare R2, qualquer link direto) e o app mede a duração de cada
   uma. A partir daí ele calcula, pelo relógio, o que estaria tocando neste
   instante — então **todo mundo que sintonizar ouve o mesmo trecho ao mesmo
   tempo**, sem nada no meio. É uma rádio de verdade, feita só de aritmética.
3. **Só para mim** — arquivos do seu computador, tocados em sequência. Não sai
   daqui e some quando você fecha.

Dá para editar nome, link, faixas e posição depois, sem recomeçar.

Aviso honesto: Zeno.fm, que era a saída gratuita mais conhecida, encerrou o
plano grátis em janeiro de 2025. Hoje transmitir ao vivo de graça significa
hospedar você mesmo (AzuraCast numa VM gratuita, por exemplo) — ou usar o
caminho 2, que não precisa de servidor.

## Batida real

Os visualizadores vêm em modo simulado. No topo do modo expandido há
**batida real**: o app testa se o servidor da estação libera CORS e, se liberar,
abre um segundo fluxo silencioso só para analisar as frequências — daí as
ondas, anéis e o túnel passam a seguir a batida de verdade. O som que você
escuta nunca passa por esse caminho, então se o teste falhar nada acontece
além de continuar simulado. A maioria das rádios não libera CORS; algumas
liberam.

## Atualizar depois de publicado

É um site: você altera os arquivos, dá `git push`, e a versão nova está no ar.
Ninguém precisa baixar nada de novo. O service worker procura versão nova a
cada 30 minutos e, quando encontra, mostra uma faixa **"nova versão disponível
— recarregar"** no topo do app.

Para avisar melhorias com as suas palavras, existe o canal de recados: cole a
sua chave pública em `AUTHOR_PUBKEY` dentro do `index.html` (o ⧉ na aba
**minha** copia a sua) e qualquer nota que você publicar com a etiqueta
`aftersignal-news` aparece como faixa no topo do app de todo mundo. Como só
eventos assinados por essa chave são aceitos, ninguém pode se passar por você.

## Transmitir ao mundo

Na aba **global** existe a caixa **último sinal**: uma transmissão que vai para
todo mundo que estiver no ar e, se você tiver marcado sua posição, acende um
farol magenta no mapa exatamente de onde ela saiu — e fica ecoando por seis
horas. Aceita foto.

## Fotos

Qualquer mensagem, transmissão ou bilhete de mural aceita uma imagem. Ela é
reduzida e comprimida no seu navegador até caber em ~30 KB e viaja dentro do
próprio evento — nenhum serviço de hospedagem envolvido. É pouco espaço de
propósito: relays são para texto, e uma foto pesada seria recusada.

## Licença, em uma frase

Você pode baixar, instalar, usar e conectar à rede sem pedir nada a ninguém.
Redistribuir, publicar versões modificadas ou vender exige autorização escrita.
Detalhes em [LICENSE](LICENSE), componentes de terceiros em [CREDITS.md](CREDITS.md).

## Fontes

- Estações: [Radio Browser](https://api.radio-browser.info) — catálogo aberto, sem chave.
- Rede: relays [Nostr](https://nips.nostr.com/1) públicos.
- Mapa: OpenStreetMap via tiles CARTO (atribuição obrigatória — não remova).
- Tradução: [MyMemory](https://mymemory.translated.net).

## HTTP x HTTPS

Muitas rádios antigas só transmitem em HTTP puro, e uma página HTTPS bloqueia
esse áudio. O filtro **HTTPS** vem ligado por isso. Em `localhost` dá para
desligar e ouvir todas. As rádios pessoais nunca são escondidas pelo filtro.
