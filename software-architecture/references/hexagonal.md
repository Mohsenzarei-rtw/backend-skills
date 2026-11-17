# Hexagonal Architecture (Ports & Adapters)

Origin: Alistair Cockburn, 2005

## Core idea

The application is a **hexagon** (or any shape).  
Outside the hexagon are all the technical details: databases, web frameworks, message queues, third-party APIs, UI, etc.

Communication with the outside world happens only through **Ports** (interfaces defined by the application).  
**Adapters** implement those ports and translate between the external technology and the application.

## Two kinds of ports/adapters

- **Driving (Primary) adapters** — initiate interaction with the application (e.g. HTTP controllers, CLI, message listeners). They call the application.
- **Driven (Secondary) adapters** — called by the application (e.g. database repositories, email senders, external API clients). The application calls them through ports.

## Philosophy

- Treat all external systems symmetrically. A database is just another adapter, the same as a REST client or a message broker.
- The application core should be testable without any infrastructure.
- You should be able to replace the database, the web framework, or the UI without changing the core business logic.

## Key benefit

Technology independence and testability. The direction of dependencies is controlled by the ports: the core defines what it needs; the outside provides it.

## Relation to other styles

Hexagonal is the intellectual parent of Onion and Clean Architecture. They all share the same dependency direction; Hexagonal emphasizes the *ports* and the symmetry of adapters.
