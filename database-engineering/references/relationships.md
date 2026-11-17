# Modeling Relationships

## One-to-Many (1:N)

Most common relationship.

- Put the foreign key on the “many” side.
- The child cannot exist without the parent (or the FK is nullable if the relationship is optional).

Example: User → Posts

```
User (id)
Post (id, author_id → User.id)
```

## One-to-One (1:1)

- Put the foreign key on the dependent side and make it `UNIQUE`.
- Classic cases: User ↔ Profile, Order ↔ Payment details.

If both sides are optional or the ownership is unclear, reconsider whether it is truly 1:1.

## Many-to-Many (N:N)

Resolve with a junction (join) table.

Two styles:

1. **Implicit / pure junction** — only the two foreign keys (and maybe timestamps). Good when the relationship itself has no attributes.
2. **Explicit junction with attributes** — when the relationship carries data (quantity, role, assigned_at, etc.). Give the junction table its own primary key or a composite unique constraint.

Example:

```
Student (id)
Course (id)
Enrollment (id, student_id, course_id, enrolled_at, grade)
  UNIQUE (student_id, course_id)
```

## Self-referencing relationships

- Adjacency list is the simplest (parent_id on the same table). Easy to write, harder for deep trees.
- For complex hierarchies consider path enumeration, nested sets, or closure tables (see advanced patterns).

## Polymorphic associations

Avoid when possible. They usually sacrifice referential integrity.

If you must have them, document the trade-off clearly and consider separate tables or a proper type hierarchy instead.

## Ownership rule of thumb

Put the foreign key on the side that **cannot exist independently**.
