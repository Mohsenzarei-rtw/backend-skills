# Basic & Everyday Types

Official: https://www.typescriptlang.org/docs/handbook/2/basic-types.html  
https://www.typescriptlang.org/docs/handbook/2/everyday-types.html

## Primitives

```ts
let str: string = "hello";
let num: number = 42;
let bool: boolean = true;
let n: null = null;
let u: undefined = undefined;
let sym: symbol = Symbol("id");
let big: bigint = 100n;
```

Prefer the lowercase forms (`string`, `number`, `boolean`).  
Never use the wrapper types `String`, `Number`, `Boolean` for annotations.

## Arrays & Tuples

```ts
let list: number[] = [1, 2, 3];
let list2: Array<number> = [1, 2, 3]; // same

// Tuple — fixed length and known types at each position
let pair: [string, number] = ["age", 30];
let optionalTuple: [string, number?] = ["only-string"];
```

## any vs unknown

```ts
let a: any = 123;
a.foo.bar; // no error — dangerous

let b: unknown = 123;
// b.foo; // error
if (typeof b === "number") {
  b.toFixed(2); // ok after narrowing
}
```

**Rule**: Prefer `unknown` over `any`. Use `any` only as a temporary escape hatch during migration.

## Type annotations & inference

```ts
// Annotation
function greet(name: string): string {
  return `Hello, ${name}`;
}

// Inference
const message = greet("World"); // message is string
const nums = [1, 2, 3];         // number[]
```

Annotate function parameters and public API boundaries. Let the compiler infer local variables when the type is obvious.

## Union & Intersection

```ts
type ID = string | number;

function printId(id: ID) {
  if (typeof id === "string") {
    console.log(id.toUpperCase());
  } else {
    console.log(id);
  }
}

type A = { a: number };
type B = { b: string };
type C = A & B; // { a: number; b: string }
```

## Literal types

```ts
type Direction = "left" | "right" | "up" | "down";
type Dice = 1 | 2 | 3 | 4 | 5 | 6;

const go: Direction = "left";
```

Combined with unions they give very precise APIs.

## Type aliases vs Interfaces

- `type` — can represent unions, intersections, primitives, tuples, mapped types…
- `interface` — primarily for object shapes; can be extended and merged

Both are useful. See objects-and-interfaces.md for details.
