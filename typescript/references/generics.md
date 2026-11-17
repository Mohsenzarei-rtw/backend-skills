# Generics

Official: https://www.typescriptlang.org/docs/handbook/2/generics.html

Generics let you write reusable, type-safe components that work over a variety of types.

## Basic generic function

```ts
function identity<T>(arg: T): T {
  return arg;
}

const n = identity(42);        // number
const s = identity("hello");   // string
const explicit = identity<string>("hello");
```

## Generic interfaces & types

```ts
interface Box<T> {
  value: T;
}

type ApiResponse<T> = {
  data: T;
  error?: string;
};
```

## Constraints

```ts
interface Lengthwise {
  length: number;
}

function logLength<T extends Lengthwise>(arg: T): T {
  console.log(arg.length);
  return arg;
}

logLength("hello");     // ok
logLength([1, 2, 3]);   // ok
// logLength(123);      // error
```

## Using type parameters in constraints

```ts
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const person = { name: "Ada", age: 36 };
getProperty(person, "name"); // string
// getProperty(person, "unknown"); // error
```

## Generic classes

```ts
class Container<T> {
  private value: T;
  constructor(value: T) {
    this.value = value;
  }
  get(): T {
    return this.value;
  }
}

const c = new Container("hello");
```

## Default type parameters

```ts
type MyResponse<T = string> = {
  data: T;
};

type A = MyResponse;          // data: string
type B = MyResponse<number>;  // data: number
```

## Common patterns

```ts
// Factory
function createPair<T, U>(first: T, second: U): [T, U] {
  return [first, second];
}

// Constraining to a constructor
function createInstance<T>(Ctor: new () => T): T {
  return new Ctor();
}
```

Generics shine when the relationship between inputs and outputs matters. Avoid over-using them for simple cases where a concrete type is clearer.
