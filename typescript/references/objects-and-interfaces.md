# Object Types, Interfaces & Type Aliases

Official: https://www.typescriptlang.org/docs/handbook/2/objects.html

## Interface

```ts
interface User {
  id: number;
  name: string;
  email?: string;          // optional
  readonly createdAt: Date; // cannot be reassigned
}

const u: User = {
  id: 1,
  name: "Ada",
  createdAt: new Date(),
};
```

Interfaces can be extended:

```ts
interface Animal {
  name: string;
}

interface Dog extends Animal {
  breed: string;
}
```

Interfaces can also be merged (declaration merging) — useful for augmenting existing types.

## Type alias

```ts
type Point = {
  x: number;
  y: number;
};

type ID = string | number;
type Nullable<T> = T | null;
```

`type` is more general: it can describe unions, intersections, primitives, tuples, mapped types, etc.

## When to use which

- **interface** — object shapes that may be extended or merged; public API contracts.
- **type** — unions, intersections, mapped/conditional types, tuples, and when you need the full power of the type system.

Both work for simple object shapes. Consistency within a codebase matters more than the theoretical difference.

## Index signatures

```ts
interface StringMap {
  [key: string]: string;
}

interface NumberOrStringDictionary {
  [index: string]: number | string;
  length: number; // ok — length is number, which is part of the value type
}
```

## Excess property checking

```ts
interface Options {
  title: string;
  dark?: boolean;
}

// Error — 'colour' does not exist
const bad: Options = { title: "Home", colour: "blue" };

// Workaround when you intentionally want extra properties
const good = { title: "Home", colour: "blue" } satisfies Options;
```

## Readonly arrays & tuples

```ts
const ro: ReadonlyArray<number> = [1, 2, 3];
// ro.push(4); // error

function doSomething(pair: readonly [string, number]) {
  // pair[0] = "hello"; // error
}
```
