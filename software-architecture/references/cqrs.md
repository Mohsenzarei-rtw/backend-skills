# CQRS — Command Query Responsibility Segregation

Origin: Greg Young (building on earlier CQS ideas by Bertrand Meyer)

## Core idea

Separate the model and responsibilities used for **changing state** (Commands) from the model(s) used for **reading state** (Queries).

- A **Command** represents an intention to change the system. It is handled by a command handler / write side.
- A **Query** asks for data and should not change state. It is served by a read model optimized for the query.

## Philosophy

- The needs of writing and reading are often very different. Trying to serve both with a single model leads to compromise.
- Write side can focus on consistency, invariants, and domain logic.
- Read side can focus on performance, denormalization, and query shapes.
- The two sides can evolve independently and even use different storage technologies.

## Important clarifications

- CQRS does **not** require Event Sourcing (though they are often used together).
- CQRS does **not** require multiple databases (though it enables that).
- Simple CQRS can live inside a single database with separate write and read models or even separate tables/views.
- Over-using CQRS on simple CRUD problems adds complexity without benefit.

## When it helps

- Complex domains where write invariants are hard and read requirements are varied.
- Systems with significantly different read vs write load or shape.
- When you want to scale reads independently of writes.
- Task-based UIs that naturally map to commands rather than entity CRUD.

## Relation to other architectures

CQRS fits naturally inside Hexagonal / Clean / Onion architectures. Commands and queries become the primary way the outside world talks to the application core.
