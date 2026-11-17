# Choosing the Right Database — Decision Guide

## The most important rule

**Start with the workload, not the database brand.**

Ask:
- How is the data written and read?
- How strong must consistency be?
- How flexible must the schema be?
- What is the expected volume and latency?

## Quick recommendation table (2026)

| Workload / Data type | Best primary choice | Often used together with |
|----------------------|---------------------|---------------------------|
| Users, orders, payments, billing, permissions, most SaaS core data | **PostgreSQL** | Redis (cache/sessions) |
| Strong relations + reporting + constraints | **PostgreSQL** | — |
| Flexible / nested documents that change shape often | **MongoDB** or PostgreSQL JSONB | — |
| Sessions, cache, rate limiting, leaderboards, distributed locks | **Redis** | PostgreSQL (source of truth) |
| Full-text search, faceted search, log search | Elasticsearch / OpenSearch or PostgreSQL FTS | PostgreSQL (source of truth) |
| High-volume metrics, sensor data, events over time | TimescaleDB / InfluxDB / ClickHouse | — |
| Extremely high write throughput, multi-datacenter, simple key access | Cassandra / Scylla / DynamoDB | — |
| Large binary files (images, videos, documents) | Object storage (S3, R2, GCS) | Metadata in PostgreSQL/MongoDB |
| Graph-heavy “friends of friends” style queries | Neo4j or PostgreSQL recursive queries | — |
| Vector / semantic search for AI | pgvector (PostgreSQL) or dedicated vector DB | — |

## SQL vs NoSQL — practical view

**Use a relational database (SQL) when:**
- Data has clear relationships
- You need transactions that touch multiple records
- You want the database to enforce integrity (foreign keys, unique, check)
- You need flexible ad-hoc queries and reporting
- The schema is relatively stable or changes in a controlled way

**Consider a document store when:**
- The natural unit of work is a whole document (e.g. a product with varying attributes, a CMS page, a user profile with nested preferences)
- Different records legitimately have different fields
- You mostly fetch and save the entire aggregate at once
- You can live with weaker multi-document transaction guarantees (or use them carefully)

**Never choose NoSQL just because “it’s modern” or “schema-less is easier”.** Schema-less often means the schema moves into the application code and becomes harder to reason about.

## Polyglot persistence guidelines

It is normal and often correct to use more than one store. Follow these rules:

1. **One system of record** per piece of business data (usually PostgreSQL).
2. Other stores are **derivatives** (cache, search index, analytics copy) or hold truly ephemeral data.
3. Be explicit about consistency: how stale can the cache/search index be? How is it rebuilt?
4. Every additional database adds operational cost (backups, monitoring, failure modes). Add it only when the benefit is clear.

## Anti-patterns to avoid

- Using Redis as the main database for important business data
- Putting highly relational data into MongoDB and then suffering with joins/application-level consistency
- Using Elasticsearch as the primary store for data that must stay consistent
- Storing large files inside the database instead of object storage
- Choosing a database because a tutorial used it, without matching the access pattern
