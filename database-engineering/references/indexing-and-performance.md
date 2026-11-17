# Indexing & Performance

## Golden rules

1. Index every foreign key.
2. Index columns that appear in `WHERE`, `JOIN`, and `ORDER BY` for your important queries.
3. Do not index everything — every index slows writes and consumes storage.
4. Measure with realistic data volumes and the real query plans (`EXPLAIN` / `EXPLAIN ANALYZE`).

## Common useful index types

- **B-tree** (default in PostgreSQL/MySQL) — equality and range queries, sorting.
- **Composite indexes** — order of columns matters. Put the most selective / equality columns first.
- **Covering indexes** — include columns needed by the query so the database can answer from the index alone.
- **Partial indexes** — index only a subset of rows (e.g. `WHERE deleted_at IS NULL`).
- **Unique indexes** — enforce uniqueness and give the query planner useful information.

## Practical patterns

```sql
-- Foreign key
CREATE INDEX idx_posts_author_id ON posts(author_id);

-- Common filter + sort
CREATE INDEX idx_posts_status_created ON posts(status, created_at DESC);

-- Soft-delete friendly
CREATE INDEX idx_users_active ON users(id) WHERE deleted_at IS NULL;
```

## Anti-patterns

- Indexing low-cardinality columns alone (boolean flags) without combining them with higher-cardinality columns.
- Creating many overlapping indexes.
- Forgetting to index the columns used in joins.
- Relying on the application to “just be careful” instead of constraints + indexes.

## Read vs Write trade-off

More indexes → faster reads, slower writes and higher storage.

For write-heavy tables keep indexes minimal and purposeful. For read-heavy tables (or reporting replicas) you can afford more indexes.

## Normalization and performance

A well-normalized schema with proper indexes often outperforms a denormalized schema full of redundant data, especially as the dataset grows. Denormalize only after measuring.
