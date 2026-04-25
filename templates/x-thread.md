# X — 3-tweet thread template

Variables: `{{PRODUCT_NAME}}` `{{TAGLINE}}` `{{REPO_URL}}` `{{HOOK_LINE}}` `{{KILLER_FEATURE}}` `{{HOW_BUILT_LINK}}`

---

## Tweet 1 (hook)

```
Most "<problem area>" advice is vibes.

So I wrote {{PRODUCT_NAME}} — {{TAGLINE}}.

It catches the boring, repeatable stuff: <bullet1>, <bullet2>, <bullet3>, <bullet4>, <bullet5>.

{{REPO_URL}}
```

## Tweet 2 (one killer feature)

```
The fun rule: {{KILLER_FEATURE}}.

Real {{NOUN}} ship pairs like:
- "<antipattern A>"
- "<antipattern B>"
- "<antipattern C>"

{{PRODUCT_NAME}} flags them as <severity>. {{NUMBER}}/100 if any exist.
```

## Tweet 3 (meta / process)

```
Meta: I built this with <process — e.g. AI auto-improvement loop>.
<one short data point — e.g. 3 rounds of customer feedback → developer fix>.

{{HOW_BUILT_LINK}}
```

---

## Notes

- **Tweet 1 must stand alone.** People often only read the first tweet. Make sure it has the value prop + URL.
- **Tweet 2 should be visually scannable.** Bullet list with concrete examples > abstract claims.
- **Tweet 3 is the "humanity" tweet.** Tells the story behind the product. This is what gets retweets.
- Each tweet ≤ 280 chars including URL (23-char compression).
- No hashtags inside thread (clutter). Use 1–2 hashtags at the end of Tweet 1 only if essential.

## Image strategy

- Tweet 1: attach `og.png` for the link card preview.
- Tweet 2: optional screenshot of the killer feature in action (CLI output, before/after).
- Tweet 3: skip image; the thread should land on the meta narrative.
