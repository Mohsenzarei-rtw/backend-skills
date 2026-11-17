# Narrowing

Official: https://www.typescriptlang.org/docs/handbook/2/narrowing.html

Narrowing is how TypeScript refines types inside conditional blocks based on control-flow analysis.

## typeof type guards

```ts
function padLeft(value: string | number) {
  if (typeof value === "string") {
    return value.padStart(10); // value is string here
  }
  return value.toFixed(2);     // value is number here
}
```

## Truthiness narrowing

```ts
function printAll(strs: string | string[] | null) {
  if (strs && typeof strs === "object") {
    for (const s of strs) console.log(s);
  } else if (typeof strs === "string") {
    console.log(strs);
  }
}
```

## Equality narrowing

```ts
function example(x: string | number, y: string | boolean) {
  if (x === y) {
    // x and y are both string
    x.toUpperCase();
    y.toLowerCase();
  }
}
```

## in operator

```ts
type Fish = { swim: () => void };
type Bird = { fly: () => void };

function move(animal: Fish | Bird) {
  if ("swim" in animal) {
    animal.swim();
  } else {
    animal.fly();
  }
}
```

## instanceof

```ts
function log(date: Date | string) {
  if (date instanceof Date) {
    console.log(date.toISOString());
  } else {
    console.log(date.toUpperCase());
  }
}
```

## Custom type predicates

```ts
function isFish(pet: Fish | Bird): pet is Fish {
  return (pet as Fish).swim !== undefined;
}

if (isFish(pet)) {
  pet.swim();
}
```

## Discriminated unions (recommended pattern)

```ts
type Shape =
  | { kind: "circle"; radius: number }
  | { kind: "square"; side: number }
  | { kind: "rectangle"; width: number; height: number };

function area(shape: Shape): number {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2;
    case "square":
      return shape.side ** 2;
    case "rectangle":
      return shape.width * shape.height;
  }
}
```

Using a common literal property (`kind` / `type` / `tag`) is one of the most powerful and readable patterns in TypeScript.
