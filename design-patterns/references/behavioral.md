# Behavioral Patterns

These patterns are concerned with algorithms and the assignment of responsibilities between objects. They describe not just patterns of objects or classes but also the patterns of communication between them.

## Chain of Responsibility

**Intent**: Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.

**Problem**: You have multiple objects that could handle a request, and you don’t want the sender to know which one will handle it.

**Solution**: Form a chain of handler objects. Each handler decides either to process the request or to pass it to the next handler.

**When to use**
- More than one object may handle a request, and the handler isn’t known a priori.
- You want to issue a request to one of several objects without specifying the receiver explicitly.

**Pros**: Reduced coupling, increased flexibility in assigning responsibilities.  
**Cons**: No guarantee that the request will be handled; can be hard to debug.

**Link**: https://refactoring.guru/design-patterns/chain-of-responsibility

---

## Command

**Intent**: Encapsulate a request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations.

**Problem**: You want to issue requests without knowing the receiver or the operation being requested, or you need undo/redo, queuing, or logging of operations.

**Solution**: Turn the request into a standalone object that contains all information about the request. This object can be stored, passed, logged, or undone.

**When to use**
- You need to parameterize objects with an action to perform.
- You need to queue, schedule, or execute operations at different times.
- You need undo/redo or transactional behavior.

**Pros**: Decouples invoker from receiver, supports undo, macros, logging.  
**Cons**: Increases the number of classes.

**Link**: https://refactoring.guru/design-patterns/command

---

## Iterator

**Intent**: Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.

**Problem**: You need to traverse different data structures in a uniform way without leaking their internal structure.

**Solution**: Extract the traversal behavior into a separate Iterator object.

**When to use**
- You need to access an aggregate object’s contents without exposing its internal structure.
- You want a uniform interface for traversing different aggregate structures.

**Modern note**: Most languages already provide excellent iterator support (`for...of`, generators, etc.). Use the classic pattern mainly when you need a custom traversal algorithm.

**Link**: https://refactoring.guru/design-patterns/iterator

---

## Mediator

**Intent**: Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly.

**Problem**: A set of objects communicate in complex and unstructured ways, leading to tight coupling and hard-to-change code (the “spaghetti” of interactions).

**Solution**: Introduce a Mediator object that centralizes the communication. Objects talk only to the mediator.

**When to use**
- A set of objects communicate in well-defined but complex ways.
- Reusing an object is difficult because it refers to and communicates with many other objects.

**Pros**: Reduced coupling, centralized control.  
**Cons**: The mediator can become a god object / complex itself.

**Link**: https://refactoring.guru/design-patterns/mediator

---

## Memento

**Intent**: Without violating encapsulation, capture and externalize an object’s internal state so that the object can be restored to this state later.

**Problem**: You need to implement undo or snapshots of an object’s state, but the state is private and should stay private.

**Solution**: The originator creates a memento containing a snapshot of its state. A caretaker stores the memento but never inspects or modifies it. Later the originator can restore from the memento.

**When to use**
- A snapshot of an object’s state must be saved so that it can be restored later.
- A direct interface to obtaining the state would expose implementation details.

**Pros**: Preserves encapsulation boundaries, simplifies originator.  
**Cons**: Can be expensive if state is large; caretaker must manage memento lifetime.

**Link**: https://refactoring.guru/design-patterns/memento

---

## Observer

**Intent**: Define a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.

**Problem**: You need to notify many objects about a change without tightly coupling them to the subject.

**Solution**: Subject maintains a list of observers and notifies them of changes. Observers implement a common update interface.

**When to use**
- A change to one object requires changing others, and you don’t know how many objects need to be changed.
- An object should be able to notify other objects without making assumptions about who those objects are.

**Modern note**: Extremely common (event emitters, reactive streams, UI frameworks, pub/sub). In TypeScript you often use EventEmitter, RxJS, or simple callback lists.

**Link**: https://refactoring.guru/design-patterns/observer

---

## State

**Intent**: Allow an object to alter its behavior when its internal state changes. The object will appear to change its class.

**Problem**: An object’s behavior depends on its state, and it must change behavior at runtime based on that state. Large conditional statements become messy.

**Solution**: Extract state-specific behavior into separate State classes. The context delegates behavior to the current state object and can switch states.

**When to use**
- An object’s behavior depends on its state, and it must change behavior at runtime.
- Operations have large, multipart conditional statements that depend on the object’s state.

**Pros**: Localizes state-specific behavior, makes state transitions explicit, avoids large conditionals.  
**Cons**: Can result in many small state classes.

**Link**: https://refactoring.guru/design-patterns/state

---

## Strategy

**Intent**: Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.

**Problem**: You have multiple variants of an algorithm and want to switch between them easily, or you want to isolate algorithm code from the code that uses it.

**Solution**: Extract each algorithm into its own class that implements a common Strategy interface. The context holds a reference to a strategy and delegates the work to it.

**When to use**
- Many related classes differ only in their behavior.
- You need different variants of an algorithm.
- An algorithm uses data that clients shouldn’t know about.

**Pros**: Algorithms are interchangeable, eliminates conditional statements, open for extension.  
**Cons**: Clients must be aware of different strategies; increased number of objects.

**Very common and useful pattern.**

**Link**: https://refactoring.guru/design-patterns/strategy

---

## Template Method

**Intent**: Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm’s structure.

**Problem**: You have an algorithm with invariant parts and some parts that should vary.

**Solution**: Put the invariant parts in a base class method (the template) and make the varying steps abstract or hook methods that subclasses implement.

**When to use**
- You want to implement the invariant parts of an algorithm once and leave it up to subclasses to implement the behavior that can vary.
- Common behavior among subclasses should be factored and localized.

**Pros**: Code reuse, control over the algorithm structure.  
**Cons**: Restricted by the use of inheritance; can violate Liskov if subclasses change the algorithm too much.

**Link**: https://refactoring.guru/design-patterns/template-method

---

## Visitor

**Intent**: Represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation without changing the classes of the elements on which it operates.

**Problem**: You need to perform many unrelated operations on objects in a structure, and you don’t want to pollute the classes with these operations.

**Solution**: Create a Visitor interface with a visit method for each element type. Elements accept a visitor and call the appropriate visit method (double dispatch).

**When to use**
- An object structure contains many classes with differing interfaces, and you want to perform operations that depend on the concrete classes.
- Many distinct and unrelated operations need to be performed on objects in a structure.
- The object structure is stable, but you often need new operations.

**Pros**: Easy to add new operations, gathers related operations, can visit across class hierarchies.  
**Cons**: Hard to add new element types (breaks existing visitors); breaks encapsulation.

**Link**: https://refactoring.guru/design-patterns/visitor
