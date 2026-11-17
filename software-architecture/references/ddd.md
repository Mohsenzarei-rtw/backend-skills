# Domain-Driven Design (DDD)

Origin: Eric Evans, *Domain-Driven Design: Tackling Complexity in the Heart of Software* (2003)

## What DDD actually is

DDD is **not** an architecture style or a folder structure.  
It is a way of thinking about and modeling complex software systems so that the software closely reflects the business domain.

The primary goal is to create a **shared understanding** between domain experts and developers through a **Ubiquitous Language**.

## Strategic Design (the most important part)

- **Bounded Context** — a clear boundary within which a particular model is defined and applicable. The same word can mean different things in different contexts.
- **Context Mapping** — how different bounded contexts relate to each other (Shared Kernel, Customer/Supplier, Conformist, Anti-Corruption Layer, etc.).
- **Ubiquitous Language** — the language used by both domain experts and the code. The code should speak the language of the domain.

Strategic design is about *where* models apply and how teams communicate. It is often more valuable than the tactical patterns.

## Tactical patterns (building blocks)

- **Entity** — object with a distinct identity that runs through time.
- **Value Object** — defined by its attributes; immutable; no identity of its own.
- **Aggregate** — cluster of entities and value objects treated as a single unit for consistency. Has a root entity.
- **Domain Event** — something that happened that domain experts care about.
- **Repository** — mechanism for retrieving and persisting aggregates ( abstraction, not a database detail).
- **Domain Service** — operations that don’t naturally belong to a single entity or value object.
- **Application Service** — orchestration of use cases; thin; no business rules.

## Philosophy

- The heart of the software is the domain model.
- Technical concerns (persistence, UI, messaging) should not leak into the domain.
- Complexity should be managed by making the model explicit and by drawing clear boundaries.
- Not every system needs full DDD. Use it when the domain is complex enough that the cost of careful modeling pays off.

## Common misconceptions

- DDD ≠ using entities, repositories, and services everywhere.
- DDD ≠ microservices (though bounded contexts often become service boundaries).
- You can (and often should) use DDD ideas without adopting every tactical pattern.
