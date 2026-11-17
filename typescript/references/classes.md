# Classes

Official: https://www.typescriptlang.org/docs/handbook/2/classes.html

## Basic class

```ts
class Point {
  x: number;
  y: number;

  constructor(x: number, y: number = 0) {
    this.x = x;
    this.y = y;
  }

  distance(other: Point): number {
    return Math.hypot(this.x - other.x, this.y - other.y);
  }
}
```

## Visibility (TypeScript 3.8+)

```ts
class Animal {
  public name: string;           // default
  private age: number;           // only inside this class
  protected species: string;     // this class + subclasses

  #truePrivate = 42;             // native JS private field (runtime enforced)
}
```

Prefer `private` / `protected` for most TypeScript code. Use `#` when you need hard runtime privacy.

## Readonly & parameter properties

```ts
class User {
  constructor(
    public readonly id: number,
    public name: string,
    private passwordHash: string
  ) {}
}
```

## Getters / Setters

```ts
class C {
  private _length = 0;

  get length() {
    return this._length;
  }
  set length(value: number) {
    if (value < 0) throw new Error("...");
    this._length = value;
  }
}
```

## Inheritance & implements

```ts
interface Movable {
  move(distance: number): void;
}

class Car implements Movable {
  move(distance: number) {
    // ...
  }
}

class Animal {
  constructor(public name: string) {}
  speak() {}
}

class Dog extends Animal {
  speak() {
    console.log("Woof");
  }
}
```

## Abstract classes

```ts
abstract class Base {
  abstract getName(): string;
  printName() {
    console.log(this.getName());
  }
}

class Derived extends Base {
  getName() {
    return "Derived";
  }
}
```

## this types & polymorphic this

Useful for fluent interfaces:

```ts
class Box {
  content: string = "";
  set(value: string): this {
    this.content = value;
    return this;
  }
}
```
