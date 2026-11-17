# Modules — CommonJS, ESM, Packages (LTS)

Official pages:
- CommonJS: https://nodejs.org/docs/latest-v24.x/api/modules.html
- ESM: https://nodejs.org/docs/latest-v24.x/api/esm.html
- Packages: https://nodejs.org/docs/latest-v24.x/api/packages.html
- `node:module` API: https://nodejs.org/docs/latest-v24.x/api/module.html

## Recommendation (2024+)

Prefer **ES Modules** for new code:

```js
// package.json
{
  "type": "module"
}
```

```js
import fs from 'node:fs/promises';
import { join } from 'node:path';
export function helper() {}
```

## Dual packages / package.json fields

Important fields:

- `"type": "module"` | `"commonjs"`
- `"main"`
- `"exports"` (modern, preferred for controlling public API)
- `"imports"` (internal package aliases)
- `"module"`, `"browser"` etc. (ecosystem, not core Node)

`"exports"` allows:

```json
{
  "exports": {
    ".": {
      "import": "./esm/index.js",
      "require": "./cjs/index.js"
    },
    "./package.json": "./package.json"
  }
}
```

## Interop

- ESM can import CommonJS (default export is `module.exports`)
- CommonJS can load ESM only via dynamic `import()` (or `module.createRequire` in limited cases)
- `createRequire(import.meta.url)` is useful inside ESM to load CJS

## TypeScript

Node.js has growing built-in TypeScript support (type stripping). See the TypeScript module page for the current status in your LTS version.

## Loaders / customization hooks

Advanced: `module.register()` and customization hooks allow intercepting resolution and loading. Still evolving — check stability.
