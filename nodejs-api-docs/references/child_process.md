# Child Process (`node:child_process`) — Structured Summary

> Stability: 2 - Stable  
> Official: https://nodejs.org/docs/latest-v24.x/api/child_process.html

## Main APIs

| Method | Description | Returns |
|--------|-------------|---------|
| `spawn(command[, args][, options])` | Launch a process (streaming stdio) | ChildProcess |
| `exec(command[, options][, callback])` | Run command in shell, buffer output | ChildProcess |
| `execFile(file[, args][, options][, callback])` | Like exec but no shell | ChildProcess |
| `fork(modulePath[, args][, options])` | Special spawn for Node.js modules (IPC) | ChildProcess |
| `spawnSync` / `execSync` / `execFileSync` | Synchronous versions | results object |

## Promise versions

```js
import { exec, execFile, spawn } from 'node:child_process';
import { promisify } from 'node:util';

const execAsync = promisify(exec);
const { stdout, stderr } = await execAsync('ls -la');
```

Or use the newer promise-friendly patterns carefully with `spawn`.

## ChildProcess

- Streams: `child.stdout`, `child.stderr`, `child.stdin`
- Events: `exit`, `close`, `error`, `message` (for IPC), `disconnect`
- `child.kill([signal])`
- `child.send(message)` (when IPC is enabled, e.g. with `fork` or `stdio: ['pipe','pipe','pipe','ipc']`)

## Common options

- `cwd`, `env`, `shell`, `timeout`, `maxBuffer`
- `stdio`: `'pipe' | 'ignore' | 'inherit' | Stream | number | array`
- `detached`, `uid`, `gid`
- `signal` (AbortSignal) — modern way to cancel

## Best practices

- Prefer `spawn` + streams over `exec` when output can be large (avoids buffering limits).
- Always handle the `'error'` event (e.g. command not found).
- Use `AbortSignal` for cancellation instead of manual `kill` when possible.
- Be extremely careful with user input and `shell: true` (command injection risk).
- For Node-to-Node communication prefer `fork` + `process.send`.
