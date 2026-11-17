# HTTP (`node:http`) — Structured Summary

> Stability: 2 - Stable  
> Official: https://nodejs.org/docs/latest-v24.x/api/http.html

## Creating a server

```js
import http from 'node:http';

const server = http.createServer((req, res) => {
  // req = IncomingMessage (Readable)
  // res = ServerResponse (Writable)
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello World\n');
});

server.listen(3000, () => {
  console.log('listening on 3000');
});
```

## Key classes

### `http.Server`
- `server.listen(...)`
- `server.close()`
- Events: `request`, `connection`, `close`, `error`, `upgrade`, `checkContinue`...

### `http.IncomingMessage` (request)
- `req.method`, `req.url`, `req.headers`, `req.httpVersion`
- Readable stream — consume with async iteration or `req.on('data')` + `'end'`
- `req.socket`

### `http.ServerResponse` (response)
- `res.writeHead(statusCode[, statusMessage][, headers])`
- `res.setHeader` / `getHeader` / `removeHeader`
- `res.write(chunk)` / `res.end([data])`
- `res.statusCode`, `res.statusMessage`
- Events: `finish`, `close`

## Client requests

```js
import http from 'node:http';

const req = http.request({
  hostname: 'example.com',
  port: 80,
  path: '/',
  method: 'GET',
  headers: { /* ... */ }
}, (res) => {
  // res is IncomingMessage
  console.log(res.statusCode);
  res.on('data', chunk => { /* ... */ });
});

req.on('error', (e) => console.error(e));
req.end();
```

Or the convenience methods: `http.get(url[, options][, callback])`

## HTTPS

Use `node:https` — almost identical API, plus TLS options.

## HTTP/2

Use `node:http2` for HTTP/2 (different, more complex API).

## Best practices

- Always handle `'error'` on both server and client requests.
- Prefer `res.end()` over multiple `write` + `end` when possible.
- For high performance, consider frameworks (Fastify, Hono, etc.) or the built-in patterns carefully.
- Use `AbortController` / `AbortSignal` with modern request helpers when available.
- Be careful with header case sensitivity and multiple values (`set-cookie` is special).
