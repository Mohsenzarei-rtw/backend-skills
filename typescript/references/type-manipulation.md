# Type Manipulation

Official pages under https://www.typescriptlang.org/docs/handbook/2/

## keyof

```ts
type Person = { name: string; age: number };
type PersonKeys = keyof Person; // "name" | "age"
```

## typeof

```ts
const config = { host: "localhost", port: 3000 };
type Config = typeof config; // { host: string; port: number }

function f() {
  return { x: 10, y: 3 };
}
type P = ReturnType<typeof f>; // { x: number; y: number }
```

## Indexed Access Types

```ts
type Person = { name: string; age: number; alive: boolean };
type Age = Person["age"];           // number
type NameOrAge = Person["name" | "age"]; // string | number
type All = Person[keyof Person];    // string | number | boolean
```

## Conditional Types

```ts
type IsString<T> = T extends string ? true : false;

type A = IsString<"hello">; // true
type B = IsString<number>;  // false

// Useful with infer
type Flatten<T> = T extends Array<infer U> ? U : T;
type Str = Flatten<string[]>; // string
```

## Mapped Types

```ts
type Readonly<T> = {
  readonly [P in keyof T]: T[P];
};

type Optional<T> = {
  [P in keyof T]?: T[P];
};

type Nullable<T> = {
  [P in keyof T]: T[P] | null;
};
```

You can add/remove modifiers:

```ts
type CreateMutable<T> = {
  -readonly [P in keyof T]: T[P];
};

type Concrete<T> = {
  [P in keyof T]-?: T[P];
};
```

## Template Literal Types

```ts
type EventName<T extends string> = `on${Capitalize<T>}`;
type T0 = EventName<"click">; // "onClick"

type PropEventSource<T> = {
  on<K extends string & keyof T>(
    eventName: `${K}Changed`,
    callback: (newValue: T[K]) => void
  ): void;
};
```

These features combine powerfully with generics and utility types to create precise, reusable type-level logic.
