# PostgreSQL — When and How to Use It

PostgreSQL is the default recommendation for most new applications in 2026.

## Ideal for

- Core business data with relationships (users, accounts, orders, products, permissions…)
- Any data that needs strong ACID transactions
- Data that must stay consistent under concurrent writes
- Applications that need good reporting / ad-hoc queries
- Systems that will grow in complexity over time
- SaaS, e-commerce, fintech, internal tools, most backend services

## Strengths

- Excellent SQL + rich data types (JSONB, arrays, ranges, geometric, etc.)
- Strong constraints and referential integrity
- Mature indexing (B-tree, GIN, GiST, BRIN, partial, expression indexes)
- Extensions: PostGIS, pgvector, TimescaleDB, pg_cron, full-text search, etc.
- Can often replace specialized tools for moderate scale (JSON documents, simple search, light queues, vectors)

## Good patterns inside PostgreSQL

- **JSONB** for genuinely semi-structured or highly variable attributes (instead of jumping to MongoDB too early)
- **pgvector** for embeddings / semantic search at moderate scale
- **Full-text search** (`tsvector` + GIN) for many content-search needs
- **Partitioning** for large tables (by time or tenant)
- **UNLOGGED tables** or materialized views for certain cache-like or derived data

## When PostgreSQL may not be enough alone

- Sub-millisecond latency at very high QPS for simple key lookups → add Redis
- Extremely large full-text / log analytics workloads → add Elasticsearch/OpenSearch
- Massive multi-datacenter write scaling with simple access patterns → consider Cassandra/DynamoDB
- Very large binary objects → object storage

## Practical advice

For a new project: start with PostgreSQL as the system of record. Add Redis only when you have a concrete caching, session, or rate-limiting need. Evaluate MongoDB only when the data is truly document-oriented and relational modeling becomes painful.
