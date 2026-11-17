# Other Specialized Stores

## Elasticsearch / OpenSearch

**Good for:**
- Full-text search with relevance ranking
- Log and event analytics
- Faceted search / aggregations over large text corpora

**Not good as:**
- Primary system of record (eventual consistency, no strong multi-document transactions in the same way)

Best practice: keep the source of truth in PostgreSQL (or similar) and project/index into Elasticsearch. Design for rebuildability of the index.

## Cassandra / Scylla / DynamoDB (Wide-column / Key-value at scale)

**Good for:**
- Very high write throughput
- Multi-datacenter / multi-region availability with tunable consistency
- Simple access patterns (mostly by partition key)
- Time-series or event data at extreme scale

**Not good for:**
- Complex relational queries and joins
- Strong multi-row ACID transactions across arbitrary keys
- Ad-hoc reporting

Data modeling is query-driven (you design tables around the queries you need).

## Time-series databases (TimescaleDB, InfluxDB, etc.)

**Good for:**
- Metrics, sensor data, monitoring, IoT, financial ticks
- High ingest rate of timestamped data
- Time-based aggregations and retention policies

TimescaleDB is attractive because it builds on PostgreSQL.

## Object Storage (S3, Cloudflare R2, GCS, MinIO…)

**Good for:**
- Images, videos, PDFs, backups, large files, static assets
- Data lake / archival storage

**Always** store only metadata + URL/key in your main database. Never put large blobs in the OLTP database if you can avoid it.

## Graph databases (Neo4j, etc.)

**Good for:**
- Deep relationship traversal (“friends of friends”, recommendation graphs, network analysis)

For many applications, PostgreSQL recursive CTEs or careful relational modeling are enough. Introduce a graph database only when the traversal patterns are central and measured to be painful in SQL.

## Vector databases / pgvector

For embeddings and semantic search:
- Start with **pgvector** inside PostgreSQL if scale is moderate and you already use Postgres.
- Move to a dedicated vector store when the vector workload becomes large enough to justify the operational cost.

## Summary mindset

Most systems need:
1. A solid system of record (usually PostgreSQL)
2. Optionally Redis for speed/ephemeral needs
3. Optionally a search index or analytics store derived from the system of record
4. Object storage for files

Add further specialized databases only when a concrete, measured need appears.
