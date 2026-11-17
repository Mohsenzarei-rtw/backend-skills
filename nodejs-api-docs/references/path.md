# Path (`node:path`) — Structured Summary

> Stability: 2 - Stable  
> Official: https://nodejs.org/docs/latest-v24.x/api/path.html

Cross-platform path utilities. Use `path.posix` or `path.win32` when you need a specific style.

```js
import path from 'node:path';
// or
import { join, resolve, dirname, basename, extname, parse, format } from 'node:path';
```

## Most used methods

| Method | Purpose | Example |
|--------|---------|---------|
| `path.join(...paths)` | Join with correct separator, normalize | `path.join('/foo', 'bar', 'baz/asdf', 'quux', '..')` → `/foo/bar/baz/asdf` |
| `path.resolve(...paths)` | Resolve to absolute path | `path.resolve('foo/bar', '/tmp/file')` → `/tmp/file` |
| `path.dirname(p)` | Directory name | `path.dirname('/foo/bar/baz')` → `/foo/bar` |
| `path.basename(p[, ext])` | Last portion | `path.basename('/foo/bar/baz.html', '.html')` → `baz` |
| `path.extname(p)` | Extension | `path.extname('index.html')` → `.html` |
| `path.parse(p)` | Object with root, dir, base, ext, name | |
| `path.format(obj)` | Inverse of parse | |
| `path.normalize(p)` | Resolve `.` and `..` | |
| `path.isAbsolute(p)` | Boolean | |
| `path.relative(from, to)` | Relative path from → to | |

## Platform specifics

- On Windows `path.sep` is `\`, on POSIX `/`.
- `path.delimiter` is `;` (Windows) or `:` (POSIX) — useful for `PATH`.
- Prefer `path.join` / `path.resolve` over string concatenation.

## Common pattern with `import.meta`

```js
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
```
