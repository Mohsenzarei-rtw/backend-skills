# Utility Types

Official: https://www.typescriptlang.org/docs/handbook/utility-types.html

These are built-in generic types that transform other types.

## Partial<T>
Makes all properties optional.

```ts
interface Todo {
  title: string;
  description: string;
  completed: boolean;
}

function updateTodo(todo: Todo, fields: Partial<Todo>) {
  return { ...todo, ...fields };
}
```

## Required<T>
Opposite of Partial — all properties required.

## Readonly<T>
All properties become `readonly`.

## Pick<T, K>
```ts
type TodoPreview = Pick<Todo, "title" | "completed">;
```

## Omit<T, K>
```ts
type TodoInfo = Omit<Todo, "completed">;
```

## Record<K, T>
```ts
type PageInfo = { title: string };
type Pages = Record<"home" | "about" | "contact", PageInfo>;
```

## Exclude<T, U> / Extract<T, U>
```ts
type T0 = Exclude<"a" | "b" | "c", "a">; // "b" | "c"
type T1 = Extract<"a" | "b" | "c", "a" | "f">; // "a"
```

## NonNullable<T>
Removes `null` and `undefined`.

## ReturnType<T> / Parameters<T> / ConstructorParameters<T>
```ts
function f(a: string, b: number) {
  return true;
}
type R = ReturnType<typeof f>;     // boolean
type P = Parameters<typeof f>;     // [string, number]
```

## Awaited<T>
Unwraps Promise types (recursively).

```ts
type A = Awaited<Promise<string>>; // string
type B = Awaited<Promise<Promise<number>>>; // number
```

## InstanceType<T>
Gives the instance type of a constructor function/class.

## Other useful ones
- `Uppercase<S>`, `Lowercase<S>`, `Capitalize<S>`, `Uncapitalize<S>` — template literal helpers
- `NoInfer<T>` — prevents inference in certain positions (TS 5.4+)

Prefer these built-in utilities before writing your own mapped types for common transformations.
