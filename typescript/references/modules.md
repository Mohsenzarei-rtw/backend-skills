# Modules

Official: https://www.typescriptlang.org/docs/handbook/2/modules.html  
and the newer Modules reference section.

## ES Modules (recommended)

```ts
// math.ts
export function add(a: number, b: number) {
  return a + b;
}
export const PI = 3.14;
export default class Calculator {}

// main.ts
import Calculator, { add, PI } from "./math";
import * as math from "./math";
```

## Type-only imports / exports

```ts
import type { User } from "./types";
export type { User };
```

Helps with `verbatimModuleSyntax` and avoids emitting unnecessary runtime imports.

## CommonJS interop

TypeScript can work with both. Prefer ES modules for new code (`"module": "NodeNext"` or `"ESNext"` + bundler).

```ts
import fs from "node:fs";          // with esModuleInterop / NodeNext
import * as fs from "node:fs";
```

## Declaration files (.d.ts)

- Describe the shape of existing JavaScript libraries.
- Contain only types — no runtime code.
- Used by TypeScript for type-checking; not emitted as JS.

Writing high-quality `.d.ts` files is covered in the official Declaration Files section of the Handbook.

## Module resolution

Key `tsconfig` options:
- `moduleResolution`: `"NodeNext"`, `"Bundler"`, `"Node"`…
- `module`: `"NodeNext"`, `"ESNext"`, `"CommonJS"`…
- `esModuleInterop`, `allowSyntheticDefaultImports`
- `resolveJsonModule`
- `verbatimModuleSyntax` (recommended in modern TS)

For Node.js projects prefer `"module": "NodeNext"` and `"moduleResolution": "NodeNext"`.
For bundler-based front-end projects `"moduleResolution": "Bundler"` is often appropriate.
