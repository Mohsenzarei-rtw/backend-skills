# Redis — Correct Uses

Redis is an in-memory data structure store. It is excellent at a few things and the wrong choice for many others.

## Ideal for

- **Caching** — results of expensive queries or computed data (with TTL)
- **Session storage**
- **Rate limiting / throttling**
- **Distributed locks**
- **Real-time counters and leaderboards**
- **Simple queues / pub-sub** (for moderate scale)
- **Short-lived tokens, feature flags, temporary state**

## Strengths

- Extremely low latency (microseconds to low milliseconds)
- Rich data structures (strings, hashes, lists, sets, sorted sets, streams, etc.)
- Atomic operations
- Pub/Sub and streams for simple messaging patterns
- Optional persistence (AOF / RDB), but treat durability carefully

## What Redis is NOT

- Not a primary system of record for important business data
- Not a replacement for a relational or document database
- Not ideal for complex queries, joins, or ad-hoc reporting
- Not the place to store large binary objects or long-term historical data

## Rules of thumb

1. If the data can be lost or rebuilt and you need extreme speed → Redis is a strong candidate.
2. If the data must survive and stay consistent as the source of truth → keep it in PostgreSQL (or another durable store) and use Redis only as a cache or ephemeral layer.
3. Always set TTLs on cache keys unless you have a very deliberate invalidation strategy.
4. Be careful with memory: Redis keeps data in RAM (with optional eviction policies).

## Common good patterns

- Cache-aside or read-through caching of PostgreSQL query results
- Session store with sliding expiration
- Rate limiter using sliding window or token bucket on sorted sets / strings
- Leaderboard with sorted sets
- Distributed lock with Redlock or simpler single-instance patterns (understand the trade-offs)

## Persistence note

Redis can be configured for durability, but many teams still treat it as ephemeral or semi-ephemeral. Design so that losing the Redis data is recoverable from the system of record.
