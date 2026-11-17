# Creational Patterns

These patterns deal with object creation mechanisms. They help make a system independent of how its objects are created, composed, and represented.

## Factory Method

**Intent**: Define an interface for creating an object, but let subclasses decide which class to instantiate.

**Problem**: You have a class that needs to create objects of different types, but you don’t want it to be tightly coupled to the concrete classes.

**Solution**: Move the creation logic into a separate method (the factory method) that subclasses can override.

**When to use**
- A class can’t anticipate the class of objects it must create.
- A class wants its subclasses to specify the objects it creates.

**Pros**: Loose coupling, Single Responsibility, Open/Closed.  
**Cons**: Can lead to many small subclasses.

**TypeScript sketch**:
```ts
interface Product {
  operation(): string;
}

abstract class Creator {
  abstract factoryMethod(): Product;

  someOperation(): string {
    const product = this.factoryMethod();
    return `Creator: ${product.operation()}`;
  }
}

class ConcreteCreatorA extends Creator {
  factoryMethod(): Product {
    return { operation: () => "Result of ConcreteProductA" };
  }
}
```

**Relations**: Often used with Template Method. Can evolve into Abstract Factory.

**Link**: https://refactoring.guru/design-patterns/factory-method

---

## Abstract Factory

**Intent**: Provide an interface for creating families of related or dependent objects without specifying their concrete classes.

**Problem**: You need to create families of products that must work together (e.g. UI components for different operating systems).

**Solution**: Declare interfaces for each type of product + an Abstract Factory that declares creation methods for each product type. Concrete factories implement these methods for a specific family.

**When to use**
- Your system should be independent of how its products are created.
- You need to enforce that products from one family are used together.

**Pros**: Consistency between products, easy to switch families.  
**Cons**: Hard to add new kinds of products (interface changes).

**Link**: https://refactoring.guru/design-patterns/abstract-factory

---

## Builder

**Intent**: Separate the construction of a complex object from its representation so that the same construction process can create different representations.

**Problem**: Creating an object requires many steps or many optional parameters. Constructors become telescoping or hard to read.

**Solution**: Extract the construction steps into a separate Builder object. A Director can orchestrate the sequence of steps.

**When to use**
- The object construction is complex or has many optional parts.
- You want to create different representations using the same process.

**Pros**: Step-by-step construction, reusable construction code, single responsibility.  
**Cons**: More classes, complexity for simple objects.

**Modern TypeScript note**: Often replaced by a fluent interface or object literal + defaults, but the classic Builder is still valuable for very complex objects or when construction must be controlled.

**Link**: https://refactoring.guru/design-patterns/builder

---

## Prototype

**Intent**: Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.

**Problem**: Creating an object is expensive or complicated, and you already have a similar object.

**Solution**: Clone an existing object instead of constructing a new one from scratch. The prototype object is responsible for knowing how to copy itself.

**When to use**
- Creating objects is costly (database calls, complex setup).
- You want to avoid a hierarchy of factories parallel to a hierarchy of products.

**Pros**: Avoids expensive creation, hides complexity of creation.  
**Cons**: Deep cloning can be tricky (circular references, private fields).

**TypeScript**: Use `structuredClone` or implement a `clone()` method carefully.

**Link**: https://refactoring.guru/design-patterns/prototype

---

## Singleton

**Intent**: Ensure a class has only one instance and provide a global point of access to it.

**Problem**: Exactly one instance of a class is needed (e.g. configuration, logging, database connection pool).

**Solution**: Make the constructor private and provide a static method that returns the single instance.

**When to use**
- There must be exactly one instance of a class.
- The instance needs global access.

**Strong modern warning**: Singleton is frequently an anti-pattern. It introduces hidden global state, makes testing harder, and creates tight coupling. Prefer dependency injection in most modern applications.

**Acceptable cases**: True system-wide resources that are expensive and truly unique (with care).

**Link**: https://refactoring.guru/design-patterns/singleton
