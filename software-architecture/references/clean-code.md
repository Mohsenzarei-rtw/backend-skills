# Clean Code — Philosophy

Origin: Robert C. Martin (*Clean Code*, 2008) and the broader software craftsmanship movement.

## Core idea

Code is written primarily for humans to read and secondarily for machines to execute.  
Clean code is code that is easy to understand, easy to change, and hard to break.

## Key principles (philosophical level)

- **Meaningful names** — names should reveal intent. If a name needs a comment, the name is wrong.
- **Small functions** — functions should do one thing, do it well, and do it only.
- **Prefer clarity over cleverness**.
- **DRY** (Don’t Repeat Yourself) — but not at the cost of creating the wrong abstraction.
- **Single Responsibility** — a module/class/function should have one reason to change.
- **Avoid side effects** where possible; make them obvious when necessary.
- **Error handling is important** — but it should not obscure the main logic.
- **Comments** — good code mostly documents itself. Comments should explain *why*, not *what*.
- **Formatting and consistency** matter because they reduce cognitive load.

## Relation to architecture

Clean Code is about the *micro* level (functions, classes, naming).  
Clean/Hexagonal/Onion Architecture is about the *macro* level (boundaries and dependency direction).

Both are needed. Beautiful architecture with unreadable code still fails; clean functions inside a Big Ball of Mud also fail.

## Mindset

- Leave the code better than you found it (Boy Scout Rule).
- Optimize for the next reader (which is often future you).
- Fear of changing code is a design smell.
