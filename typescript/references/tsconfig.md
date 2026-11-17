# tsconfig.json Essentials

Official: https://www.typescriptlang.org/tsconfig  
https://www.typescriptlang.org/docs/handbook/tsconfig-json.html

## Recommended baseline for new projects (2025–2026)

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "lib": ["ES2022"],
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "noImplicitOverride": true,
    "verbatimModuleSyntax": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "outDir": "dist",
    "rootDir": "src",
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true
  },
  "include": ["src"],
  "exclude": ["node_modules", "dist"]
}
```

Adjust `module` / `moduleResolution` according to the environment (Node vs bundler).

## Important option groups

### Type checking
- `strict` (umbrella for several strictness flags) — **always enable for new code**
- `noUncheckedIndexedAccess` — indexed access includes `undefined`
- `exactOptionalPropertyTypes` — distinguishes missing vs explicit `undefined`
- `noImplicitOverride`
- `noImplicitReturns`, `noFallthroughCasesInSwitch`

### Modules
- `module`, `moduleResolution`
- `verbatimModuleSyntax`
- `esModuleInterop`
- `resolveJsonModule`
- `allowImportingTsExtensions` (with bundlers / NodeNext)

### Emit
- `outDir`, `rootDir`
- `declaration`, `declarationMap`
- `sourceMap`, `inlineSourceMap`
- `noEmit` (when using a bundler that handles transpilation)

### Path mapping
```json
"baseUrl": ".",
"paths": {
  "@/*": ["src/*"]
}
```

## Project references

For monorepos, use TypeScript Project References (`composite: true` + `references` array) for faster builds and clearer dependency boundaries.

## Practical advice

- Start with `"strict": true`.
- Prefer modern module settings (`NodeNext` or bundler-friendly options) over old `"CommonJS"` + `"Node"` unless you have a specific reason.
- Use `skipLibCheck: true` for faster builds (it skips type-checking of declaration files).
- Keep `tsconfig.json` under version control and document any non-obvious options.
