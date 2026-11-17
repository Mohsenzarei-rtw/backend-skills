---
name: software-architecture
description: Philosophy and principles of major software architecture styles including Domain-Driven Design, Clean Architecture, Hexagonal, Onion, Explicit Architecture, CQRS, MVC/MVP/MVVM, Clean Code, and REST API design. Use when discussing architectural decisions, separation of concerns, dependency direction, bounded contexts, ports and adapters, use cases, or how to structure complex applications. Prefer conceptual clarity and trade-offs over code examples.
---

# Software Architecture — Philosophy & Principles

This skill focuses on the **ideas, goals, and trade-offs** behind major architectural approaches. Implementation details are secondary; understanding *why* a style exists and *when* it helps is primary.

## Core shared idea (Hexagonal / Onion / Clean)

These three are siblings, not rivals. They all enforce the same fundamental rule:

**Dependencies point inward.**  
Business logic (the core) must not depend on frameworks, databases, UI, or external services. Outer layers depend on inner layers.

- **Hexagonal (Ports & Adapters)** — emphasizes swappable adapters around a core via ports (interfaces).
- **Onion** — emphasizes concentric rings with the domain model at the absolute center.
- **Clean Architecture** — synthesizes the above and makes Use Cases (application-specific business rules) explicit.

You do not need to pick one name. Applying the Dependency Rule correctly means you are effectively using all three.

## Major topics covered

| Topic | Reference file |
|-------|----------------|
| Domain-Driven Design | `references/ddd.md` |
| Hexagonal / Ports & Adapters | `references/hexagonal.md` |
| Onion Architecture | `references/onion.md` |
| Clean Architecture | `references/clean-architecture.md` |
| Explicit Architecture (Herberto Graca) | `references/explicit-architecture.md` |
| CQRS | `references/cqrs.md` |
| MVC / MVP / MVVM | `references/presentation-patterns.md` |
| Clean Code principles | `references/clean-code.md` |
| REST API design philosophy | `references/rest-api.md` |
| Comparison & decision guide | `references/comparison.md` |

## How to answer architecture questions

1. Start from the problem the style is trying to solve.
2. Explain the core principle (especially dependency direction).
3. Clarify what belongs in the center vs the edges.
4. Discuss when the style is worth the complexity and when it is overkill.
5. Relate it to the other styles when helpful (they often complement each other).
6. Avoid deep code; stay at the level of responsibilities, boundaries, and trade-offs.

## Important mindset

- Architecture exists to manage complexity and change.
- Over-architecture is as harmful as under-architecture.
- DDD is primarily about modeling the domain and language, not about folder structure.
- CQRS is about separating read and write models/responsibilities, not about always using event sourcing.
- Most “Clean/Hexagonal/Onion” debates are vocabulary debates around the same Dependency Rule.
