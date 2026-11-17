# Keys & Constraints

## Primary Keys

**Prefer surrogate keys** for records created by the application:

| Type | Pros | Cons | Typical use |
|------|------|------|-------------|
| Auto-increment integer (`SERIAL` / `BIGSERIAL` / `IDENTITY`) | Small, fast, sequential | Can leak counts, harder in distributed systems | Internal IDs |
| UUID (especially v7) | Globally unique, sortable (v7), no coordination | Larger (16 bytes), slightly slower indexes | Public IDs, distributed systems, multi-tenant |
| CUID / ULID | URL-friendly, sortable | Larger than int | Public-facing IDs |

**Natural keys** (email, ISBN, country code…) are fine for true reference data that is stable and assigned outside your system. Even then, keep a surrogate PK and put a `UNIQUE` constraint on the natural value.

Never use a mutable business value as the primary key.

## Foreign Keys

- Always declare foreign keys when the database supports them.
- Index every foreign key column (most engines do not do this automatically for performance).
- Choose referential actions deliberately:
  - `ON DELETE RESTRICT` / `NO ACTION` — safest default for important data.
  - `ON DELETE CASCADE` — only when the child truly has no independent life (e.g. order line items).
  - `ON DELETE SET NULL` — when the relationship is optional.
- Prefer explicit actions over relying on engine defaults.

## Other constraints

- `UNIQUE` — enforce business uniqueness (email, username, slug, composite business keys).
- `NOT NULL` — make required fields required at the database level.
- `CHECK` — domain rules (price > 0, status in allowed set, date ranges…).
- Prefer database constraints over “the application will never write bad data”.

## Composite keys

Use composite primary keys only when they are truly natural and stable (e.g. many-to-many junction tables that need no extra attributes). For most entity tables prefer a single surrogate key + unique constraints on the business combination.

## Multi-column uniqueness

```sql
UNIQUE (tenant_id, email)
UNIQUE (organization_id, slug)
```

This pattern is extremely common and valuable for multi-tenant and hierarchical data.
