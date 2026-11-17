---
name: database-engineering
description: Principles of database engineering, optimal data storage, and choosing the right database technology. Use when designing schemas, deciding SQL vs NoSQL, choosing between PostgreSQL, MongoDB, Redis, Cassandra, Elasticsearch, or discussing what kind of data belongs in which store, data types, polyglot persistence, indexing, normalization, Prisma schemas, soft deletes, multi-tenancy, or storage trade-offs.
---

# Database Engineering & Optimal Data Storage

This skill covers two complementary areas:

1. **How to design data correctly** (normalization, keys, constraints, relations, indexes).
2. **Where to store different kinds of data** (SQL vs document vs key-value vs search vs time-series, and concrete guidance for PostgreSQL, MongoDB, Redis, etc.).

Core philosophy:
- Choose storage technology based on **workload and access patterns**, not fashion.
- Design for **integrity first**, then optimize for measured needs.
- Prefer one well-understood primary database; add specialized stores only when they solve a clear problem.
- Enforce important rules in the database itself.

## When to activate

- Designing or reviewing any database schema
- Questions like “Should I use MongoDB or PostgreSQL for this?”
- “What should I store in Redis?”
- Choosing data types / storage format
- Polyglot persistence decisions
- Normalization, keys, indexing, relations
- Soft deletes, multi-tenancy, hierarchical or temporal data
- Prisma schema design

## Decision framework (start here)

Ask these questions in order:

1. Does the data have strong relationships and need ACID transactions? → **Relational (PostgreSQL preferred)**
2. Is the natural unit a flexible, nested document that is usually read/written as a whole? → **Document store (MongoDB)**
3. Do you need sub-millisecond reads by key, caching, sessions, rate limits, or simple queues? → **Redis**
4. Do you need full-text search, faceting, or log analytics at scale? → **Search engine (Elasticsearch / OpenSearch)** or PostgreSQL full-text for simpler cases
5. Is it high-volume sequential time-series / metrics / events? → **Time-series DB** or specialized store
6. Extremely high write throughput across many nodes with simple access patterns? → **Wide-column (Cassandra / Scylla)**

Default recommendation for most new applications in 2026: **PostgreSQL as the system of record + Redis for cache/sessions when needed**.

## Reference files

### Design fundamentals
- `references/normalization.md`
- `references/keys-and-constraints.md`
- `references/relationships.md`
- `references/indexing-and-performance.md`
- `references/naming-and-types.md`
- `references/prisma-patterns.md`
- `references/advanced-patterns.md`

### Choosing the right store
- `references/choosing-database.md` — Decision guide + comparison
- `references/postgresql.md` — When and how to use PostgreSQL
- `references/mongodb.md` — When MongoDB is a good fit
- `references/redis.md` — Correct uses of Redis
- `references/other-stores.md` — Cassandra, Elasticsearch, time-series, object storage, etc.

## How to answer storage questions

1. Identify the **primary access pattern** and consistency needs.
2. Recommend the simplest technology that satisfies them.
3. Explain what should *not* go into that store.
4. If polyglot is justified, clearly separate responsibilities (system of record vs cache vs search index vs analytics).
5. Always warn against using a specialized store as the main source of truth when a relational database would be simpler and safer.
