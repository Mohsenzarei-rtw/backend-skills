# Crypto (`node:crypto`) — Structured Summary

> Stability: 2 - Stable (most of it)  
> Official: https://nodejs.org/docs/latest-v24.x/api/crypto.html

Also includes the Web Crypto API via `globalThis.crypto` / `import { webcrypto } from 'node:crypto'`.

## Common high-level operations

### Hashing

```js
import { createHash, hash } from 'node:crypto'; // hash is newer convenience

const h = createHash('sha256');
h.update('some data');
h.update('more data');
console.log(h.digest('hex'));

// One-shot (newer)
const digest = hash('sha256', 'some data', 'hex');
```

### HMAC

```js
import { createHmac } from 'node:crypto';
const hmac = createHmac('sha256', 'secret');
hmac.update('message');
console.log(hmac.digest('hex'));
```

### Random data

```js
import { randomBytes, randomUUID, randomInt } from 'node:crypto';

const buf = randomBytes(32);
const id = randomUUID();
const n = randomInt(1, 100);
```

### Symmetric encryption (modern recommendation: use `createCipheriv` / `createDecipheriv`)

Prefer authenticated modes (GCM, ChaCha20-Poly1305). Avoid the old `createCipher` / `createDecipher`.

```js
import { createCipheriv, createDecipheriv, randomBytes } from 'node:crypto';

const key = randomBytes(32); // 256-bit
const iv = randomBytes(12);  // for GCM
const cipher = createCipheriv('aes-256-gcm', key, iv);
// ... update + final + getAuthTag
```

## Certificates & keys

- `generateKeyPair` / `generateKeyPairSync` (RSA, EC, Ed25519, etc.)
- `createPublicKey`, `createPrivateKey`, `createSecretKey`
- `X509Certificate` class
- `verify` / `sign` for digital signatures

## Web Crypto API

Available as `crypto.webcrypto` or global `crypto` (subtle). Prefer it when writing code that should also run in browsers.

## Security notes

- Never use `Math.random()` for security-sensitive values.
- Prefer `randomBytes`, `randomUUID`, `randomFill`.
- Use authenticated encryption.
- Keep key material out of logs and version control.
- Check official docs for algorithm support and recommended practices — they evolve.
