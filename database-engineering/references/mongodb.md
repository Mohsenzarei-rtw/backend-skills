# MongoDB — When It Is a Good Fit

## Ideal for

- Data that is naturally a **document** (nested, hierarchical, variable structure)
- Records that are usually read and written as a whole aggregate
- Content management, product catalogs with many optional attributes, user profiles with flexible preferences, event payloads, form data that changes shape
- Rapidly evolving schemas where adding columns in a relational model would be frequent and painful
- Workloads that benefit from horizontal scaling of document-oriented data

## Strengths

- Flexible schema (different documents in the same collection can have different fields)
- Natural fit for hierarchical / nested data
- Good developer experience when the application already thinks in JSON/objects
- Horizontal scaling model (sharding) is mature for document workloads
- Multi-document transactions exist (use carefully)

## When to prefer PostgreSQL + JSONB instead

Many “document” use cases can be handled well by PostgreSQL’s JSONB type with GIN indexes. Prefer PostgreSQL when:
- You still need strong relations and joins with other entities
- You want foreign keys, rich constraints, and complex transactions
- The team already knows SQL well
- You want one operational system instead of two

## Anti-patterns

- Modeling highly relational data (orders + line items + payments + inventory) primarily in MongoDB and then doing application-level joins
- Using MongoDB as a generic “JSON dump” without thinking about access patterns and indexes
- Expecting the same transactional guarantees and constraint power as a mature RDBMS for complex multi-entity operations

## Design tips if you choose MongoDB

- Design around the queries you need (document shape should serve the most common read patterns)
- Avoid unbounded arrays that grow forever
- Use proper indexes (including compound and multikey)
- Be deliberate about embedding vs referencing
- Treat multi-document transactions as an exception, not the default style
