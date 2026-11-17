---
name: typescript
description: Comprehensive TypeScript language skill based on the official Handbook. Use for any TypeScript question including types, interfaces, generics, narrowing, utility types, classes, modules, type manipulation, tsconfig, best practices, or converting JavaScript to TypeScript. Prefer this skill for accurate modern TypeScript guidance with clear explanations and examples.
---

# TypeScript — Official Handbook Style Skill

This skill provides structured, practical knowledge of modern TypeScript based on the official documentation at https://www.typescriptlang.org/docs/.

Focus areas:
- Everyday typing and type system fundamentals
- Narrowing and control-flow analysis
- Functions, objects, and classes
- Generics and advanced type manipulation
- Utility types
- Modules and project configuration
- Best practices and common pitfalls

## Core philosophy

- Prefer **type inference** where it is clear; add annotations when they improve readability or catch errors.
- Use `unknown` instead of `any` when the type is truly unknown.
- Prefer `interface` for object shapes that may be extended; use `type` for unions, intersections, and mapped/conditional types.
- Keep types close to the values they describe.
- Enable strict mode (`strict: true`) for new projects.

## When to activate

- Any question about TypeScript syntax, types, or type system behavior
- Explaining or fixing type errors
- Writing or reviewing generics, utility types, or advanced types
- Module / import / export questions
- tsconfig.json recommendations
- Migrating JavaScript to TypeScript
- Best practices for typing React, Node, or general application code

## Reference files

- `references/basics.md` — Basic types, everyday types, type annotations
- `references/narrowing.md` — Type guards, narrowing, control flow
- `references/functions.md` — Function types, overloads, `this`, rest parameters
- `references/objects-and-interfaces.md` — Interfaces, type aliases, index signatures, readonly
- `references/generics.md` — Generics, constraints, defaults
- `references/type-manipulation.md` — keyof, typeof, indexed access, conditional, mapped, template literal types
- `references/utility-types.md` — Official utility types with examples
- `references/classes.md` — Classes, members, inheritance, visibility
- `references/modules.md` — ES modules, imports/exports, declaration files overview
- `references/tsconfig.md` — Important compiler options and recommended configs
- `references/best-practices.md` — Dos, don’ts, and common patterns

## How to answer

1. Give a clear, correct explanation in plain language.
2. Show a minimal, modern TypeScript example.
3. Mention related concepts or utility types when helpful.
4. Link to the official Handbook page when deeper reading is useful (e.g. https://www.typescriptlang.org/docs/handbook/2/generics.html).
5. Prefer current recommended style (strict, ES modules, `unknown` over `any`, etc.).

Official Handbook entry point: https://www.typescriptlang.org/docs/handbook/intro.html
