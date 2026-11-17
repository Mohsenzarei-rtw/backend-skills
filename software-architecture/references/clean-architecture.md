# Clean Architecture

Origin: Robert C. Martin (Uncle Bob), 2012 (blog) and 2017 (book)

## Core idea

Clean Architecture is a synthesis and popularization of Hexagonal, Onion, and related ideas under a clear **Dependency Rule**:

> Source code dependencies must point only inward, toward higher-level policies.

The concentric circles represent different levels of policy:

- **Entities** (Enterprise Business Rules) — the most general and high-level rules.
- **Use Cases** (Application Business Rules) — application-specific business rules.
- **Interface Adapters** — convert data between use cases/entities and external formats (controllers, presenters, gateways).
- **Frameworks & Drivers** — the outermost layer: UI, database, devices, external agencies.

## Philosophy

- Business rules should be independent of frameworks, UI, database, and any external agency.
- The system should be testable without the UI, database, web server, or any external element.
- UI and database are details; they can be replaced without changing the business rules.
- Use Cases are first-class citizens. They orchestrate the flow of data to and from entities.

## Key contribution

Making **Use Cases** explicit and giving a clear vocabulary (Entities, Use Cases, Interface Adapters, Frameworks & Drivers) that many teams find practical.

## Relation to others

Clean Architecture is not a radical departure from Hexagonal or Onion. It is largely the same idea expressed with different emphasis and naming. Many teams use “Clean Architecture” as the umbrella term while applying ports & adapters and domain-centric thinking.
