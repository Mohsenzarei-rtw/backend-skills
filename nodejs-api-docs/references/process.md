# Process (`node:process` / global `process`) — Structured Summary

> Official: https://nodejs.org/docs/latest-v24.x/api/process.html

`process` is a global, also available as `import process from 'node:process'`.

## Essential properties

- `process.argv` — command line arguments
- `process.env` — environment variables (object)
- `process.cwd()` / `process.chdir(dir)`
- `process.pid`, `process.ppid`
- `process.platform`, `process.arch`
- `process.version`, `process.versions`
- `process.stdout`, `process.stderr`, `process.stdin` (streams)
- `process.title`
- `process.exitCode`

## Important methods

- `process.exit([code])` — prefer setting `process.exitCode` and letting the process end naturally when possible
- `process.nextTick(callback[, ...args])` — microtask, runs before next event loop phase
- `process.hrtime.bigint()` — high-resolution time
- `process.memoryUsage()` / `process.cpuUsage()`
- `process.kill(pid[, signal])`
- `process.uptime()`

## Signals

```js
process.on('SIGINT', () => { /* Ctrl+C */ });
process.on('SIGTERM', () => { /* graceful shutdown */ });
process.on('uncaughtException', (err) => { /* last resort */ });
process.on('unhandledRejection', (reason, promise) => { /* ... */ });
```

Handle `SIGINT`/`SIGTERM` for graceful shutdown in long-running services.

## stdio

- `process.stdout` and `process.stderr` are Writable streams
- `process.stdin` is a Readable (paused by default in some contexts)

## Best practices

- Prefer `process.exitCode = 1` over `process.exit(1)` so that pending async work can finish.
- Use `node:events` `once(process, 'SIGINT')` etc. for cleaner async shutdown logic.
- Avoid heavy work in `uncaughtException` — log and exit.
