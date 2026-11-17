# File System (`node:fs`) — Structured Summary (LTS)

> Stability: 2 - Stable  
> Official: https://nodejs.org/docs/latest-v24.x/api/fs.html

Three styles are available for almost every operation:

| Style | Import | Notes |
|-------|--------|-------|
| Promises | `import * as fs from 'node:fs/promises'` | Preferred for most application code |
| Callback | `import * as fs from 'node:fs'` | Highest performance in some hot paths |
| Synchronous | `...Sync` methods | Blocks the event loop — use sparingly |

## Recommended modern usage

```js
import { readFile, writeFile, mkdir, readdir, stat, rm } from 'node:fs/promises';
import { join } from 'node:path';

// Read text
const content = await readFile('file.txt', 'utf8');

// Write
await writeFile('out.txt', content, 'utf8');

// Recursive mkdir
await mkdir('a/b/c', { recursive: true });

// List directory
const entries = await readdir('.', { withFileTypes: true });

// Remove (file or recursive directory)
await rm('path', { recursive: true, force: true });
```

## Key promise APIs (most used)

- `fs.readFile(path[, options])` → Buffer | string
- `fs.writeFile(file, data[, options])`
- `fs.appendFile(path, data[, options])`
- `fs.readdir(path[, options])` — supports `withFileTypes`, `recursive`
- `fs.mkdir(path[, options])` — `{ recursive: true }`
- `fs.rm(path[, options])` — `{ recursive, force }` (preferred over rmdir/unlink in many cases)
- `fs.stat(path)` / `fs.lstat(path)` → Stats
- `fs.access(path[, mode])`
- `fs.copyFile(src, dest[, mode])`
- `fs.cp(src, dest[, options])` — recursive copy (stable)
- `fs.rename(oldPath, newPath)`
- `fs.realpath(path)`
- `fs.mkdtemp(prefix)`
- `fs.open(path[, flags[, mode]])` → FileHandle
- `fs.watch(filename[, options][, listener])` — note platform differences

## FileHandle (from `fs.open` or `fs.promises.open`)

Useful for more control (read/write at position, streaming, etc.):

```js
const fh = await fs.open('file.txt', 'r+');
try {
  const { bytesRead, buffer } = await fh.read(/* ... */);
  await fh.write(/* ... */);
  await fh.datasync();
} finally {
  await fh.close();
}
```

## Important options & patterns

- Encoding: pass `'utf8'` (or other) as second argument or in options object.
- AbortSignal: most promise methods accept `{ signal }` for cancellation.
- `fs.constants` for flags and permission bits (`O_RDONLY`, `S_IRUSR`, etc.).
- `recursive: true` is widely supported in modern methods (`mkdir`, `rm`, `readdir`, `cp`).

## Sync versions

All major methods have `*Sync` counterparts. They throw on error and block the event loop. Prefer them only in scripts, startup, or when you truly need synchronous behavior.

## Common pitfalls

- Forgetting `'utf8'` → get Buffer instead of string.
- Using `fs.exists` (callback) or `fs.existsSync` for control flow — prefer `fs.access` or try/catch around the real operation.
- Race conditions when checking existence then acting — just try the operation and handle `ENOENT`.
- Large files: prefer streams (`fs.createReadStream` / `createWriteStream`) instead of `readFile`/`writeFile`.

## Streams

```js
import { createReadStream, createWriteStream } from 'node:fs';
import { pipeline } from 'node:stream/promises';

await pipeline(
  createReadStream('input.txt'),
  createWriteStream('output.txt')
);
```

For full details, options, and edge cases always consult the live page.
