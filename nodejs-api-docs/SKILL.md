---
name: nodejs-api-docs
description: Official Node.js API reference skill focused on LTS versions (v24, v22, v26). Use when the user asks about Node.js built-in modules, APIs, methods, stability, options, events, classes, or official documentation for fs, http, stream, crypto, path, process, events, buffer, child_process, modules, esm, net, url, util, and any other core module. Prefer this skill over general knowledge for accurate, version-aware answers from the official docs.
---

# Node.js Official API Docs (LTS)

This skill provides structured access to the official Node.js API documentation, prioritized for current LTS releases (v24 Krypton, v22 Jod, and v26 Lithium).

## When to activate

- Any question about a Node.js core module API, method signature, option, event, class, or behavior
- Requests for official examples, stability status, or version differences
- Questions about `node:` protocol imports, CommonJS vs ESM, package.json fields related to Node.js, or built-in test runner
- When the user says "طبق داک رسمی", "official docs", "Node.js API", or names a specific module (fs, http, crypto, etc.)

## Core principles

1. **Prefer official sources**. When precise details (exact options, return values, edge cases, stability) are needed, fetch the live page rather than relying only on memory.
2. **Version awareness**. Default to the latest LTS the user cares about. If unspecified, prefer **v24 LTS**. Mention the version in answers when relevant.
3. **Stability**. Always note Stability index when the API is Experimental (1) or Deprecated (0).
4. **`node:` prefix**. Recommend `import ... from 'node:fs'` / `require('node:fs')` style for clarity and future-proofing.
5. **Do not invent APIs**. If something is not in the official docs, say so.

## Documentation URLs (use these)

Base patterns (replace `{version}` and `{module}`):

- HTML: `https://nodejs.org/docs/latest-v{version}.x/api/{module}.html`
- Markdown source: `https://nodejs.org/docs/latest-v{version}.x/api/{module}.md`
- JSON: `https://nodejs.org/docs/latest-v{version}.x/api/{module}.json`

Recommended versions:

- Primary LTS: `24` → https://nodejs.org/docs/latest-v24.x/api/
- Older Maintenance LTS: `22` → https://nodejs.org/docs/latest-v22.x/api/
- Newest LTS: `26` → https://nodejs.org/docs/latest-v26.x/api/

Index of all modules: see `references/modules-index.md`

## How to answer API questions

1. Identify the module and the specific class/method/event the user needs.
2. If the answer requires exact signatures, options lists, or recent changes → use the `open_page` or `open_page_with_find` tool on the corresponding `.html` or `.md` URL.
3. For common modules, first check the corresponding file under `references/` (if present) for a structured summary.
4. Structure the reply clearly:
   - Short answer / recommended usage
   - Signature + key options
   - Important notes (async vs sync, errors, stability, performance)
   - Minimal working example
   - Link to the official page
5. When the user asks for "کامل" or full details of a large module, summarize the main surface and offer to deep-dive into specific parts, or fetch the live page.

## Fetching live docs

When you need the current official content of a module:

```bash
# Example: fetch fs module markdown
curl -sL "https://nodejs.org/docs/latest-v24.x/api/fs.md"
```

Or prefer the `open_page` / `open_page_with_find` tools for structured extraction.

A helper script is available at `scripts/fetch-module.sh`.

## Important references

- `references/modules-index.md` — complete list of modules with short descriptions and links
- `references/stability.md` — stability index explanation
- `references/fs.md`, `references/http.md`, `references/stream.md`, etc. — structured summaries of major modules (expand as needed)

## Common pitfalls to correct

- Using callback-style APIs when promise / async-await versions exist (`fs.promises`, `util.promisify`, or native promise methods).
- Forgetting that many APIs are available both as `require('fs')` and `import fs from 'node:fs'`.
- Ignoring AbortSignal / AbortController support that most modern async APIs accept.
- Using deprecated modules (domain, punycode, etc.) without warning the user.

## Scripts

- `scripts/fetch-module.sh <module> [version]` — downloads the official markdown for a module (default version 24).
