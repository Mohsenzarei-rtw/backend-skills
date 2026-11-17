# Naming Conventions & Data Types

## Naming (recommended defaults)

**Database level (SQL):**
- Tables: `snake_case`, usually plural (`users`, `order_items`) or singular — pick one and be consistent.
- Columns: `snake_case` (`created_at`, `user_id`, `is_active`).
- Primary key: `id` or `{table}_id`.
- Foreign key: `{referenced_table}_id` (`user_id`, `organization_id`).
- Indexes / constraints: descriptive names (`idx_posts_author_id`, `uq_users_email`).

**Application / Prisma level:**
- Models: `PascalCase`, singular (`User`, `OrderItem`).
- Fields: `camelCase` (`createdAt`, `userId`).
- Use `@map` / `@@map` to keep nice application names while matching existing database naming.

Consistency across the whole schema is more important than any single style.

## Data type choices

| Domain | Preferred type | Avoid |
|--------|----------------|-------|
| Money / precise decimals | `DECIMAL` / `NUMERIC` | `FLOAT` / `DOUBLE` |
| Primary keys | `BIGINT` or UUID | unnecessarily wide types |
| Short codes / status | `ENUM` or small lookup table + FK | free-form strings when the set is closed |
| Flags | `BOOLEAN` | `0/1` integers or `'Y'/'N'` strings |
| Timestamps | `TIMESTAMPTZ` (with time zone) | `TIMESTAMP` without time zone for global apps |
| Text / long content | `TEXT` | fixed-length `CHAR` or overly large `VARCHAR` |
| Binary files | Store in object storage; keep metadata + URL in DB | large BLOBs in the main OLTP tables |

## Useful columns almost every entity table should have

- `id` (PK)
- `created_at`
- `updated_at`
- Optionally: `created_by`, `updated_by`, `deleted_at` (soft delete)

Add them from day one — adding them later is painful.
