---
name: design-patterns
description: Classic GoF design patterns skill inspired by Refactoring.Guru style. Use when the user asks about design patterns, creational/structural/behavioral patterns, Factory, Singleton, Observer, Strategy, Decorator, Adapter, Command, State, or any of the 22 classic patterns. Also trigger for questions about when to use a pattern, pros/cons, relations between patterns, refactoring toward patterns, or TypeScript implementations of patterns. Prefer conceptual clarity and practical guidance over pure theory.
---

# Design Patterns (GoF + Refactoring.Guru style)

This skill provides structured, practical knowledge of the 22 classic design patterns. Focus is on **understanding the problem each pattern solves**, when it is appropriate, trade-offs, and clean TypeScript examples.

Primary reference site: https://refactoring.guru/design-patterns

## Core principles when answering

1. **Start with the problem**, not the pattern name. Explain the real-world design pain that leads to the pattern.
2. **Intent in one clear sentence**.
3. **When to use / When not to use** — be honest about over-engineering.
4. **Structure** (participants and relationships) in simple terms.
5. **Pros & Cons**.
6. **Relations** to other patterns (very important — patterns rarely live in isolation).
7. **TypeScript example** only when it clarifies the idea. Keep examples short and modern (prefer composition, interfaces, and clear naming).
8. Always link to the corresponding page on refactoring.guru for deeper reading and diagrams.

## Catalog of patterns

### Creational
- Factory Method
- Abstract Factory
- Builder
- Prototype
- Singleton

### Structural
- Adapter
- Bridge
- Composite
- Decorator
- Facade
- Flyweight
- Proxy

### Behavioral
- Chain of Responsibility
- Command
- Iterator
- Mediator
- Memento
- Observer
- State
- Strategy
- Template Method
- Visitor

Detailed structured notes live in `references/`:

- `references/creational.md`
- `references/structural.md`
- `references/behavioral.md`
- `references/index.md` — quick overview + links

## How to respond

When the user asks about a specific pattern:

1. Give a clear **Intent**.
2. Describe the **Problem** it solves (in plain language).
3. Explain the **Solution** and main participants.
4. List **Pros / Cons**.
5. Mention important **relations** with other patterns.
6. Provide a **concise TypeScript example** if helpful.
7. Link to https://refactoring.guru/design-patterns/{pattern-slug}

When the user asks “which pattern should I use for X?”:

- Analyze the real problem first.
- Suggest 1–2 candidates with reasons.
- Explicitly say when a simpler solution (no pattern) is better.

## Important warnings to include when relevant

- Patterns are tools, not goals. Using a pattern just because you know it is a common mistake.
- Many modern languages and frameworks already implement several patterns (e.g. iterators, observers/events, dependency injection).
- Prefer composition over inheritance where the pattern allows it.
- Singleton is often an anti-pattern in modern applications (prefer dependency injection).

## TypeScript style guidelines for examples

- Use interfaces and type aliases.
- Prefer `readonly` and immutability where it makes sense.
- Keep classes small and focused.
- Show both the pattern structure and a realistic usage example.
- Avoid overly abstract “Animal / Dog / Cat” examples when a more practical domain is possible.
