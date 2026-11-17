# Explicit Architecture

Origin: Herberto Graca (synthesis of DDD + Hexagonal + Onion + Clean + CQRS)

## Core idea

Make the architecture and the domain **visible and explicit** in the codebase so that developers can understand, respect, and evolve the intended structure.

Explicit Architecture is not a new competing style. It is a practical way of combining the previous ideas and reflecting them clearly in code organization, naming, and boundaries.

## High-level structure

Three main areas:

1. **User Interface / Primary Adapters** — delivery mechanisms (HTTP, CLI, messaging consumers…) that translate external requests into application actions.
2. **Application Core** — Use Cases / Application Services + Domain Model. This is the protected heart.
3. **Infrastructure / Secondary Adapters** — implementations of ports needed by the core (persistence, external APIs, email, search…).

Dependencies always point inward: UI and Infrastructure know about the Core; the Core does not know about them.

## Philosophy

- Architecture should communicate intent. Folder structure and naming should make the boundaries obvious.
- The domain and the architectural roles should be discoverable by looking at the code.
- Combine the best of DDD (modeling), Hexagonal (ports/adapters), Onion/Clean (dependency direction), and optionally CQRS (separating reads and writes).
- “Understand all of this, but use only what you need.”

## Value

It helps teams avoid the Big Ball of Mud by making the intended structure hard to ignore and easy to follow.
