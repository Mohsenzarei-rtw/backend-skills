# Structural Patterns

These patterns explain how to assemble objects and classes into larger structures while keeping the structures flexible and efficient.

## Adapter

**Intent**: Convert the interface of a class into another interface clients expect. Adapter lets classes work together that couldn’t otherwise because of incompatible interfaces.

**Problem**: You want to use an existing class, but its interface doesn’t match what you need.

**Solution**: Create a wrapper (the Adapter) that translates calls from the target interface to the adaptee.

**When to use**
- You want to use an existing class whose interface doesn’t match.
- You need to integrate third-party or legacy code.

**Pros**: Single Responsibility, Open/Closed.  
**Cons**: Increases overall complexity with extra classes.

**Link**: https://refactoring.guru/design-patterns/adapter

---

## Bridge

**Intent**: Decouple an abstraction from its implementation so that the two can vary independently.

**Problem**: You have a class hierarchy that is exploding because of multiple dimensions of variation (e.g. shapes × rendering engines).

**Solution**: Split into two hierarchies — Abstraction and Implementation — and connect them via composition.

**When to use**
- You want to avoid a permanent binding between abstraction and implementation.
- Both the abstractions and their implementations should be extensible by subclassing.

**Pros**: Platform independence, improved extensibility.  
**Cons**: Increases complexity.

**Link**: https://refactoring.guru/design-patterns/bridge

---

## Composite

**Intent**: Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.

**Problem**: You need to work with tree-like structures and treat leaves and composites the same way.

**Solution**: Create a common component interface. Both leaf and composite classes implement it. Composite holds children and forwards operations to them.

**When to use**
- You want to represent part-whole hierarchies.
- You want clients to ignore the difference between compositions and individual objects.

**Pros**: Simplifies client code, easy to add new component types.  
**Cons**: Can make the design overly general; hard to restrict the components of a composite.

**Link**: https://refactoring.guru/design-patterns/composite

---

## Decorator

**Intent**: Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.

**Problem**: You need to add behavior to individual objects without affecting other objects of the same class, and inheritance would lead to class explosion.

**Solution**: Create a set of decorator classes that wrap the original object and implement the same interface. Each decorator adds its own behavior before/after delegating to the wrapped object.

**When to use**
- You want to add responsibilities to objects dynamically and transparently.
- Extending by subclassing is impractical.

**Pros**: More flexible than inheritance, responsibilities can be added/removed at runtime.  
**Cons**: Can result in many small objects; order of decorators can matter.

**TypeScript tip**: Very natural with function composition or higher-order functions as well.

**Link**: https://refactoring.guru/design-patterns/decorator

---

## Facade

**Intent**: Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.

**Problem**: A subsystem is complex and clients need a simpler way to interact with it.

**Solution**: Introduce a Facade class that provides a simple interface and delegates to the appropriate subsystem classes.

**When to use**
- You want a simple interface to a complex subsystem.
- There are many dependencies between clients and implementation classes.

**Pros**: Isolates clients from subsystem components, reduces coupling.  
**Cons**: Can become a god object if not careful.

**Link**: https://refactoring.guru/design-patterns/facade

---

## Flyweight

**Intent**: Use sharing to support large numbers of fine-grained objects efficiently.

**Problem**: You need many similar objects and memory usage becomes a problem.

**Solution**: Split object state into intrinsic (shared) and extrinsic (context-dependent). Store intrinsic state in shared flyweight objects and pass extrinsic state when needed.

**When to use**
- An application uses a large number of objects.
- Storage costs are high because of the sheer quantity of objects.
- Most object state can be made extrinsic.

**Pros**: Significant memory savings.  
**Cons**: Complexity; extrinsic state must be calculated or stored elsewhere.

**Link**: https://refactoring.guru/design-patterns/flyweight

---

## Proxy

**Intent**: Provide a surrogate or placeholder for another object to control access to it.

**Problem**: You need additional logic when accessing an object (lazy loading, access control, logging, remote access, etc.).

**Solution**: Create a proxy that implements the same interface as the real subject and adds the extra behavior.

**Common types**
- Virtual Proxy (lazy initialization)
- Protection Proxy (access control)
- Remote Proxy
- Logging / Caching / Smart reference proxies

**Pros**: Controls access, can add responsibilities without changing the subject.  
**Cons**: Extra layer of indirection, potential latency.

**Link**: https://refactoring.guru/design-patterns/proxy
