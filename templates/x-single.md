# X — single tweet template

Variables: `{{PRODUCT_NAME}}` `{{HOOK_LINE}}` `{{ONE_LINE_VALUE}}` `{{REPO_URL}}` `{{HASHTAGS}}`

---

```
Built {{PRODUCT_NAME}}: {{ONE_LINE_VALUE}}.

{{HOOK_LINE}}

{{REPO_URL}}

{{HASHTAGS}}
```

---

## Constraints

- **280 chars total** (URL counts as 23 chars regardless of length).
- **0–2 hashtags** max. More reads as spam. `#OSS` `#MCP` `#PromptEngineering` `#AI` `#DevTools` are safe; choose the most relevant 1–2.
- **No "🚀 just launched"** opener — anti-pattern, scrolls past.
- **No "@mention" of accounts you don't have a relationship with** — silent drop.

## Variants

### Variant A: feature-led
```
{{PRODUCT_NAME}}: {{ONE_LINE_VALUE}}.
{{REPO_URL}}
```

### Variant B: pain-led
```
{{HOOK_LINE}}
That's why I built {{PRODUCT_NAME}}: {{ONE_LINE_VALUE}}.
{{REPO_URL}}
```

### Variant C: stat-led (only if you have a striking number)
```
{{PRODUCT_NAME}} cuts our average prompt by {{N}}% on real system prompts.
{{REPO_URL}}
```

Pick A by default. Use B if your audience is mostly developers who'd nod at a pain. Use C only if the number is verifiable and impressive.

## Image attachment (optional, recommended)

`docs/promo/assets/og.png` (1200×630) — shows up as a large card.
