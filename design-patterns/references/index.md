# Design Patterns Quick Index

Official deep dives: https://refactoring.guru/design-patterns

## Creational Patterns
Create objects in a flexible way.

| Pattern | Intent (short) | Link |
|---------|----------------|------|
| Factory Method | Let subclasses decide which class to instantiate | [refactoring.guru](https://refactoring.guru/design-patterns/factory-method) |
| Abstract Factory | Create families of related objects without specifying concrete classes | [link](https://refactoring.guru/design-patterns/abstract-factory) |
| Builder | Construct complex objects step by step | [link](https://refactoring.guru/design-patterns/builder) |
| Prototype | Clone existing objects instead of creating from scratch | [link](https://refactoring.guru/design-patterns/prototype) |
| Singleton | Ensure a class has only one instance + global access | [link](https://refactoring.guru/design-patterns/singleton) |

## Structural Patterns
Compose objects and classes into larger structures.

| Pattern | Intent (short) | Link |
|---------|----------------|------|
| Adapter | Make incompatible interfaces work together | [link](https://refactoring.guru/design-patterns/adapter) |
| Bridge | Separate abstraction from implementation so they can vary independently | [link](https://refactoring.guru/design-patterns/bridge) |
| Composite | Treat individual objects and compositions of objects uniformly | [link](https://refactoring.guru/design-patterns/composite) |
| Decorator | Attach new behaviors to objects dynamically via wrappers | [link](https://refactoring.guru/design-patterns/decorator) |
| Facade | Provide a simplified interface to a complex subsystem | [link](https://refactoring.guru/design-patterns/facade) |
| Flyweight | Share common state between many objects to save memory | [link](https://refactoring.guru/design-patterns/flyweight) |
| Proxy | Provide a placeholder/surrogate that controls access to another object | [link](https://refactoring.guru/design-patterns/proxy) |

## Behavioral Patterns
Assign responsibilities and define communication between objects.

| Pattern | Intent (short) | Link |
|---------|----------------|------|
| Chain of Responsibility | Pass a request along a chain of handlers | [link](https://refactoring.guru/design-patterns/chain-of-responsibility) |
| Command | Turn a request into a stand-alone object | [link](https://refactoring.guru/design-patterns/command) |
| Iterator | Traverse a collection without exposing its internal structure | [link](https://refactoring.guru/design-patterns/iterator) |
| Mediator | Reduce chaotic dependencies between objects by centralizing communication | [link](https://refactoring.guru/design-patterns/mediator) |
| Memento | Capture and restore an object's internal state | [link](https://refactoring.guru/design-patterns/memento) |
| Observer | Notify multiple objects about events that happen to the object they observe | [link](https://refactoring.guru/design-patterns/observer) |
| State | Let an object alter its behavior when its internal state changes | [link](https://refactoring.guru/design-patterns/state) |
| Strategy | Define a family of algorithms, encapsulate each one, and make them interchangeable | [link](https://refactoring.guru/design-patterns/strategy) |
| Template Method | Define the skeleton of an algorithm, letting subclasses override specific steps | [link](https://refactoring.guru/design-patterns/template-method) |
| Visitor | Separate an algorithm from the object structure it operates on | [link](https://refactoring.guru/design-patterns/visitor) |

## Recommended reading order for beginners

1. Strategy, Observer, Decorator, Factory Method
2. Adapter, Facade, Command, Template Method
3. Singleton (with strong warnings), Composite, State
4. The rest as needed
