# Functions

Official: https://www.typescriptlang.org/docs/handbook/2/functions.html

## Parameter & return types

```ts
function add(a: number, b: number): number {
  return a + b;
}

// Arrow function
const multiply = (a: number, b: number): number => a * b;
```

## Optional & default parameters

```ts
function greet(name: string, greeting: string = "Hello"): string {
  return `${greeting}, ${name}`;
}

function log(message: string, level?: "info" | "warn" | "error") {
  // level may be undefined
}
```

## Rest parameters

```ts
function sum(...nums: number[]): number {
  return nums.reduce((a, b) => a + b, 0);
}
```

## Function type expressions

```ts
type MathOp = (a: number, b: number) => number;

const ops: MathOp[] = [
  (a, b) => a + b,
  (a, b) => a * b,
];
```

## Call signatures in object types

```ts
type DescribableFunction = {
  description: string;
  (someArg: number): boolean;
};

function doSomething(fn: DescribableFunction) {
  console.log(fn.description + " returned " + fn(6));
}
```

## Overloads

```ts
function makeDate(timestamp: number): Date;
function makeDate(y: number, m: number, d: number): Date;
function makeDate(yOrTimestamp: number, m?: number, d?: number): Date {
  if (m !== undefined && d !== undefined) {
    return new Date(yOrTimestamp, m, d);
  }
  return new Date(yOrTimestamp);
}
```

Write the implementation signature last. The overload signatures are what callers see.

## `this` parameters

```ts
interface User {
  name: string;
  greet(this: User): void;
}

const user: User = {
  name: "Ada",
  greet() {
    console.log(`Hello, ${this.name}`);
  },
};
```

## void vs undefined

- `void` — function return value is intentionally ignored / not used.
- Prefer explicit `undefined` only when the value is meaningful.

```ts
function log(msg: string): void {
  console.log(msg);
}
```
