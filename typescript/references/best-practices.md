# TypeScript Best Practices

## Prefer

- `unknown` over `any`
- `interface` for extensible object shapes; `type` for unions and advanced types
- Type inference for local variables; explicit types at API boundaries
- Discriminated unions for variants
- `readonly` and `ReadonlyArray` when mutation is not needed
- Strict compiler options
- ES modules
- `satisfies` operator when you want to check a value against a type without widening it

```ts
const palette = {
  red: [255, 0, 0],
  green: "#00ff00",
} satisfies Record<string, string | number[]>;
```

## Avoid

- `any` (except temporary migration)
- Using `Number`, `String`, `Boolean`, `Object` as types
- Overly complex conditional/mapped types when a simpler model exists
- Enums when a union of string/number literals is sufficient (or use `const enum` / `as const` objects carefully)
- Non-null assertions (`!`) unless you have proven the value exists
- Suppressing errors with `// @ts-ignore` instead of fixing the types

## Common patterns

### Exhaustiveness checking

```ts
function assertNever(x: never): never {
  throw new Error("Unexpected: " + x);
}

function handle(shape: Shape) {
  switch (shape.kind) {
    case "circle": ...
    case "square": ...
    default:
      assertNever(shape); // compile error if a case is missing
  }
}
```

### Branded / nominal types (lightweight)

```ts
type UserId = string & { readonly __brand: "UserId" };
type PostId = string & { readonly __brand: "PostId" };

function getUser(id: UserId) { /* ... */ }
```

### Const assertions

```ts
const directions = ["left", "right", "up", "down"] as const;
type Direction = typeof directions[number]; // "left" | "right" | "up" | "down"
```

## Migration from JavaScript

1. Rename `.js` → `.ts` gradually.
2. Enable `allowJs` + `checkJs` if needed.
3. Start with `strict: false` only if necessary, then tighten.
4. Replace `any` with better types over time.
5. Add `noImplicitAny` early.

## React / Node notes

- React: prefer typing props with interfaces or `type`, use `React.FC` sparingly (many teams prefer explicit return types or just function components).
- Node: use `@types/node`, prefer `node:` protocol imports, and modern module settings.

Official resources remain the best source of truth:
https://www.typescriptlang.org/docs/handbook/intro.html
