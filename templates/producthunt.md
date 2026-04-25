# ProductHunt template

Variables: `{{PRODUCT_NAME}}` `{{TAGLINE}}` `{{REPO_URL}}` `{{ONE_PARAGRAPH}}` `{{NPM_PACKAGE}}`

---

## Submission fields

| Field | Value |
| ----- | ----- |
| Name | {{PRODUCT_NAME}} |
| Tagline (≤ 60 chars) | {{TAGLINE}} |
| Topic / Category | Developer Tools, Artificial Intelligence |
| Description (≤ 260 chars) | {{ONE_PARAGRAPH}} |
| Website | {{REPO_URL}} |
| Gallery | `og.png`, `cli-cast.png`, asciinema cast (optional) |

## First comment (post as the maker, immediately after launch goes live)

```md
Hi PH 👋 — I made {{PRODUCT_NAME}} because <one-line origin story>.

If <pain scenario>, the model has to <do bad thing> — but you keep paying tokens for both, every single request.

{{PRODUCT_NAME}} runs <category analysis> on <input>:

- **<rule 1>** (severity) — <one-line>
- **<rule 2>** (severity) — <one-line>
- **<rule 3>** (severity) — <one-line>
- **<rule 4>** (severity) — <one-line>
- **<rule 5>** (severity) — <one-line>

Output: <what comes back>. Pure <impl>, no <network/LLM>, no <state>.

CLI: `<usage>`
MCP: `<registration cmd>`

Repo: {{REPO_URL}}

<honest pricing line — what's free, what's planned>.

<meta detail — interesting backstory>.

Happy to add <feature suggestion type> — drop yours in the comments.
```

## Maker reply templates

### "What inspired you?"

> <a specific incident — a friend's prompt, a billing surprise, a debug session — concrete and short>. {{PRODUCT_NAME}} would have caught it on day one.

### "What's next?"

> Pro tier with <specific Pro features>. Tracking interest at <repo>/issues/<N>.

### "Have you compared with <competitor>?"

> Briefly: <competitor> is <category B>, we're <category A>. Different jobs. <link to a comparison post if one exists>.

## Image / asciinema TODO

- 1280×800 OG image showing colored CLI output with the headline number
- Optional asciinema cast of the primary command

Both go in `target/docs/promo/assets/`. ProductHunt accepts both static and animated.

## Hunter strategy

- Self-hunting OK. Recruit a Hunter only if they're well-known in your domain (mention rate doubles).
- Schedule launch for Tuesday or Wednesday, 00:01 PT (= 16:01 JST).
- First 4 hours determine ranking — recruit 5–10 people for early upvotes.

## Anti-patterns

- "Free during launch only!" gimmicks for OSS — readers see through it
- Paid AI services masquerading as free → "free tier" must be honest
- Generic stock photos in the gallery (use your real CLI output)
