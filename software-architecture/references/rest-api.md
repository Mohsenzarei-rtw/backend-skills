# REST API Design — Philosophy

## What REST actually emphasizes

REST (Representational State Transfer) is an architectural style for networked systems, described by Roy Fielding. Key ideas:

- **Resources** identified by URIs.
- **Representations** of those resources (JSON, XML, etc.).
- Uniform interface (HTTP methods used consistently).
- Stateless interactions.
- Hypermedia as the engine of application state (HATEOAS) — the most often ignored constraint.

In practice most “REST APIs” are HTTP + JSON APIs that borrow some REST ideas.

## Important philosophical points

### Resources are not necessarily domain entities

A resource can represent:
- A domain entity
- A collection
- A command / business process
- A query / read model
- A file, a report, a session, etc.

Mapping every domain entity 1:1 to a resource and mapping HTTP verbs directly to CRUD often leads to awkward APIs and pushes business logic into clients.

### Commands vs CRUD

In richer domains it is often better to model **intent** (commands / business actions) as resources rather than exposing raw entity mutation:

- `POST /orders/{id}/cancel`
- `POST /shipments/{id}/mark-as-delivered`

instead of generic `PATCH /orders/{id}` with opaque body flags.

This aligns well with CQRS and task-based thinking.

### Separation of read and write models in the API

When using CQRS, the API can (and often should) expose different shapes for reading and for writing. There is no obligation that the resource you POST to is the same shape you GET.

### Consistency and versioning

- Prefer additive, backward-compatible changes.
- Versioning strategy (URL versioning, header versioning, or content negotiation) should be deliberate.
- Breaking changes are expensive; design so that evolution is possible.

## Relation to application architecture

In a Hexagonal/Clean system the REST layer is a **Primary Adapter**. Controllers translate HTTP requests into application commands/queries and translate the results back into HTTP responses. They should stay thin. Business rules belong in the Application Core / Domain, not in controllers.

## Practical philosophy

- Design the API around **use cases and client needs**, not around internal database tables.
- Make the API explicit about intent.
- Keep controllers thin.
- Accept that pure Fielding-style REST (with full HATEOAS) is rare; aim for pragmatic, consistent, evolvable HTTP APIs.
