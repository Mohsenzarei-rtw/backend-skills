# Onion Architecture

Origin: Jeffrey Palermo, 2008

## Core idea

Visualize the system as an **onion** with concentric layers. The innermost layer is the **Domain Model**. All dependencies point toward the center.

Typical rings (from inside out):

1. **Domain Model** — entities, value objects, domain logic
2. **Domain Services**
3. **Application Services** (use cases / orchestration)
4. **Infrastructure + UI** (outermost)

The key rule: outer layers can depend on inner layers; inner layers know nothing about outer layers.

## Philosophy

- The domain model is the most important and most stable part of the system.
- Infrastructure (database, file system, web) is a detail that should be pushed outward.
- Interfaces needed by the inner layers are defined *inside* those layers; implementations live outside (Dependency Inversion).

## Difference in emphasis vs Hexagonal

- Hexagonal talks more about ports and the symmetry of adapters.
- Onion talks more about the centrality of the domain model and the layered rings around it.

In practice the resulting systems look very similar.
