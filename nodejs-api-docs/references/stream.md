# Stream (`node:stream`) — Structured Summary

> Stability: 2 - Stable  
> Official: https://nodejs.org/docs/latest-v24.x/api/stream.html

Four fundamental types:

- **Readable** — data source
- **Writable** — data destination
- **Duplex** — both (e.g. TCP socket)
- **Transform** — Duplex that can modify data (e.g. zlib, crypto)

## Modern preferred patterns

### Pipeline (recommended)

```js
import { pipeline } from 'node:stream/promises';
import { createReadStream, createWriteStream } from 'node:fs';
import { createGzip } from 'node:zlib';

await pipeline(
  createReadStream('input.txt'),
  createGzip(),
  createWriteStream('input.txt.gz')
);
```

`pipeline` properly forwards errors and cleans up.

### Async iteration (Readable)

```js
for await (const chunk of readable) {
  // process chunk
}
```

### finished

```js
import { finished } from 'node:stream/promises';
await finished(stream);
```

## Creating streams

```js
import { Readable, Writable, Transform } from 'node:stream';

const readable = new Readable({
  read(size) { /* push data or null to end */ }
});

const writable = new Writable({
  write(chunk, encoding, callback) { /* ... */ callback(); }
});

const transform = new Transform({
  transform(chunk, encoding, callback) {
    this.push(modified);
    callback();
  }
});
```

## Object mode

Set `objectMode: true` to work with any JavaScript value instead of Buffers/strings.

## Important events (classic style)

Readable: `data`, `end`, `error`, `close`, `readable`  
Writable: `drain`, `finish`, `error`, `close`, `pipe`, `unpipe`

## Backpressure

When writing, check the return value of `writable.write(chunk)`. If it returns `false`, wait for the `'drain'` event before writing more.

## Web Streams interop

Node.js has good interop with WHATWG Streams (`ReadableStream`, `WritableStream`, etc.) via utilities in `node:stream` and `node:stream/web`.
