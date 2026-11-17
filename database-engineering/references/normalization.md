# Normalization & Denormalization

## Why normalize?

Normalization reduces redundancy and prevents anomalies:

- **Update anomaly** — same fact stored in many places; one copy is updated, others stay stale.
- **Insertion anomaly** — cannot insert a fact without inventing unrelated data.
- **Deletion anomaly** — deleting one fact accidentally removes another needed fact.

## Normal Forms (practical view)

### 1NF — Atomic values, no repeating groups
- Every column holds a single value of its domain.
- No arrays or comma-separated lists that you intend to query as individual items.
- Each row is uniquely identifiable (has a key).

### 2NF — Full dependency on the whole key
- Table is in 1NF.
- Every non-key attribute depends on the **entire** primary key (relevant mainly for composite keys).
- Partial dependencies are removed by splitting tables.

### 3NF — No transitive dependencies
- Table is in 2NF.
- Non-key attributes depend only on the key, not on other non-key attributes.
- Classic summary: “the key, the whole key, and nothing but the key.”

### BCNF (Boyce-Codd)
- Stronger than 3NF.
- Every determinant is a candidate key.
- Use when 3NF still leaves subtle redundancy caused by overlapping candidate keys.

**Default target for most OLTP applications: 3NF (or BCNF when it matters).**

## When to denormalize

Only after you have:

1. A correctly normalized design.
2. Measured evidence that a specific query is too slow or too complex.
3. A clear plan for how the duplicated data stays consistent (triggers, application logic, eventual consistency, or materialized views).

Common legitimate denormalization cases:
- Read-heavy reporting / analytics (separate OLAP model or materialized views).
- Calculated fields that are expensive and change rarely.
- Carefully chosen summary columns with documented refresh rules.

Document every deliberate denormalization in the schema comments or migration notes.

## Practical advice

- Design normalized first.
- Use joins + proper indexes for most application queries.
- For heavy analytics, prefer a separate analytical model (star schema, etc.) rather than destroying the OLTP schema.
