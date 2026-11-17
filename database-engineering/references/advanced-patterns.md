# Advanced Modeling Patterns

## Soft Deletes

Instead of physically deleting rows, set a `deleted_at` timestamp.

**Pros**: Easy recovery, audit trail, simple “trash” feature.  
**Cons**: Every query must remember to filter; unique constraints become more complex; storage grows.

Recommendations:
- Add `deleted_at DateTime?`
- Create a partial index on active rows when possible.
- Decide early whether unique constraints should ignore soft-deleted rows.
- Prefer hard deletes for pure log/event data that has no recovery value.

## Multi-tenancy

Common approaches:

1. **Shared database, shared schema + tenant_id column** (most common for SaaS).
2. **Shared database, separate schema per tenant**.
3. **Database per tenant** (strong isolation, higher operational cost).

For the shared-schema approach:
- Put `tenant_id` / `organization_id` on almost every table.
- Make composite unique constraints include the tenant (`@@unique([tenantId, email])`).
- Index `tenant_id` (usually as the leading column of composite indexes).
- Enforce tenant isolation in the application and, where possible, with row-level security.

## Hierarchical data

| Technique | Pros | Cons |
|-----------|------|------|
| Adjacency list (`parent_id`) | Simple | Expensive deep queries |
| Materialized path | Easy subtree queries | Path updates on move |
| Nested sets | Fast subtree | Complex updates |
| Closure table | Very flexible queries | Extra storage + write cost |

Choose based on read/write ratio and depth of the tree.

## Temporal / history data

When you need to know “what was the value at time T”:

- System-versioned tables (if the engine supports them).
- Explicit history / audit tables.
- Event sourcing for complex domains.

Do not try to overload a single table with both current state and full history unless the access patterns are carefully designed.

## Inheritance / polymorphism

SQL has no native inheritance. Common patterns:

- **Single Table Inheritance** — one table + type discriminator (simple, nullable columns).
- **Class Table Inheritance** — base table + subtype tables (normalized, more joins).
- **Concrete Table Inheritance** — separate tables per type (no shared queries easily).

Prefer composition over deep inheritance hierarchies when possible.

## JSON columns

Useful for genuinely semi-structured or highly variable attributes.

Rules of thumb:
- Do not put core relational data into JSON just because it is convenient.
- Add check constraints or generated columns when you need to query/index inside the JSON.
- Prefer real columns for anything you filter, join, or aggregate on regularly.
