# Prisma Schema Best Practices

Prisma is excellent for schema-as-code and type-safe access. Apply the same engineering principles inside the Prisma schema.

## Naming

```prisma
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  posts     Post[]

  @@map("users")
}
```

- Models: singular PascalCase.
- Fields: camelCase.
- Use `@map` / `@@map` when the underlying database uses different names.

## Relations

Always declare both sides of a relation.

```prisma
model Post {
  id       String @id @default(cuid())
  title    String
  authorId String
  author   User   @relation(fields: [authorId], references: [id], onDelete: Cascade)

  @@index([authorId])
}
```

- Put the foreign key scalar + the relation field on the same model.
- Make the FK `@unique` for true 1:1.
- Be explicit about `onDelete` / `onUpdate`. Prefer `Restrict` or `NoAction` for important data; use `Cascade` only when appropriate.

## Indexes

Declare indexes that match your query patterns:

```prisma
@@index([authorId, createdAt(sort: Desc)])
@@index([status])
@@unique([organizationId, slug])
```

## Recommended defaults for most models

- Surrogate primary key (`cuid()`, `uuid()`, or autoincrement).
- `createdAt` + `updatedAt`.
- Explicit relation actions.
- Indexes on every foreign key.
- `Decimal` for money.
- Enums for closed sets of values when the database supports them well.

## Soft deletes

```prisma
deletedAt DateTime?

@@index([deletedAt])
```

Filter `deletedAt: null` in queries (or use Prisma middleware / client extensions). Consider partial indexes where the engine supports them.

## Multi-tenancy

Common pattern:

```prisma
model Project {
  id             String @id @default(cuid())
  organizationId String
  name           String

  organization   Organization @relation(...)

  @@unique([organizationId, name])
  @@index([organizationId])
}
```

Always scope queries by tenant.

## Migrations

- Review the generated SQL.
- Prefer additive, backward-compatible changes when possible.
- Never rely on the application alone to keep data valid — put constraints in the schema.
