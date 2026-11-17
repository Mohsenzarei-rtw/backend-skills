# Events (`node:events`) — Structured Summary

> Stability: 2 - Stable  
> Official: https://nodejs.org/docs/latest-v24.x/api/events.html

```js
import { EventEmitter, once, on } from 'node:events';
```

## EventEmitter basics

```js
class MyEmitter extends EventEmitter {}
const ee = new MyEmitter();

ee.on('event', (a, b) => { /* ... */ });
ee.once('event', handler);          // one-time
ee.emit('event', arg1, arg2);
ee.off('event', handler);           // or removeListener
ee.removeAllListeners('event');
```

## Important methods & properties

- `emitter.on(eventName, listener)` / `addListener`
- `emitter.once(eventName, listener)`
- `emitter.emit(eventName, ...args)` → boolean (had listeners?)
- `emitter.off` / `removeListener`
- `emitter.listeners(eventName)` / `rawListeners`
- `emitter.listenerCount(eventName)`
- `emitter.eventNames()`
- `emitter.prependListener` / `prependOnceListener`
- `emitter.setMaxListeners(n)` (default 10 — warning above that)

## Special events

- `'newListener'` — emitted before adding a listener
- `'removeListener'`
- `'error'` — if no listener is registered, the process may crash. Always handle `'error'` on emitters that can emit it.

## Utility functions

```js
// Wait for a single event (returns promise)
const [value] = await once(ee, 'ready');

// Async iterator over events
for await (const event of on(ee, 'data')) {
  // ...
}
```

## Best practices

- Prefer composition over deep inheritance when possible.
- Always handle the `'error'` event on streams and many other emitters.
- Use `AbortSignal` with `events.once` and `events.on` when available for cancellation.
- Avoid memory leaks: remove listeners when the object is no longer needed.
