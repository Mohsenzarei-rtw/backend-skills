# Architecture Styles — Comparison & Decision Guide

## The family of inward-dependency architectures

| Style | Origin | Core emphasis | Key vocabulary |
|-------|--------|---------------|----------------|
| Hexagonal | Alistair Cockburn, 2005 | Ports (interfaces) and Adapters; symmetric treatment of external systems | Port, Adapter, Driving / Driven side |
| Onion | Jeffrey Palermo, 2008 | Concentric rings; domain model at the absolute center | Domain Model, Domain Services, Application Services, Infrastructure |
| Clean | Robert C. Martin, 2012 | Explicit Use Cases + Dependency Rule | Entities, Use Cases, Interface Adapters, Frameworks & Drivers |
| Explicit | Herberto Graca | Practical synthesis of DDD + Hexagonal + Onion + Clean + CQRS | Application Core, Primary/Secondary Adapters, explicit boundaries |

**They solve the same problem**: keep business rules independent of technical details so that frameworks, databases, and delivery mechanisms can change without rewriting the heart of the system.

## DDD vs the architectural styles

- **DDD** is a *design and modeling approach* (ubiquitous language, bounded contexts, aggregates…).
- Hexagonal / Onion / Clean are *structural* approaches for protecting the domain.
- They work extremely well together: use DDD to discover and model the domain, then protect that model with an inward-dependency architecture.

## CQRS relationship

CQRS can be used *inside* any of the above. It is orthogonal: it separates the model used for writing from the model(s) used for reading. It does not replace Clean/Hexagonal; it can live comfortably inside them.

## When complexity is justified

| Situation | Recommendation |
|-----------|----------------|
| Simple CRUD, low domain complexity | Classic layered or even modular monolith is often enough |
| Complex business rules, long-lived system, multiple teams | DDD + Hexagonal/Clean style becomes valuable |
| Need to swap databases, UIs, or external services easily | Ports & Adapters / Hexagonal shines |
| Heavy read vs write asymmetry or complex queries | Consider CQRS |
| UI-heavy applications | MVC / MVP / MVVM for the presentation side |

## Practical advice

1. Do not start a project by choosing “Clean Architecture” as a badge. Start by understanding the domain and the expected axes of change.
2. Apply the Dependency Rule first. The specific names of layers matter less than the direction of dependencies.
3. Keep the architecture *explicit* in the codebase (folder structure, naming, and boundaries should communicate intent).
4. Add CQRS, Event Sourcing, or other advanced patterns only when the problem demands them.
