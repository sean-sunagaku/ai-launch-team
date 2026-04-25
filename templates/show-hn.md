# Show HN template

Variables: `{{PRODUCT_NAME}}` `{{TAGLINE}}` `{{REPO_URL}}` `{{NPM_PACKAGE}}` `{{HOOK_LINE}}` `{{CLI_OUTPUT_BAD}}` `{{HOW_BUILT}}`

---

## Title (≤ 80 chars)

```
Show HN: {{PRODUCT_NAME}} – {{TAGLINE}}
```

## URL (preferred — empty body when URL filled)

```
{{REPO_URL}}
```

## First comment (post immediately after submission)

```
I built {{PRODUCT_NAME}} because {{HOOK_LINE}}.

What it does, in ~5 bullets:

- <feature 1 — concrete, with the unit/output that comes back>
- <feature 2>
- <feature 3>
- <feature 4 — what it does NOT do, to set scope>
- <feature 5 — why it's safe to drop into existing pipelines>

Demo (real CLI output):

```text
{{CLI_OUTPUT_BAD}}
```

Install:

```sh
npm install -g {{NPM_PACKAGE}}
```

{{HOW_BUILT}}

Free / OSS / MIT. Repo: {{REPO_URL}}

Open to suggestions — what's <a question that invites the reader's domain expertise>?
```

---

## Tone notes

- **Title**: avoid superlatives ("revolutionary", "world's first") — HN flags them. State the tool's category and one concrete differentiator.
- **No emojis in title.** Body up to 1 acceptable, more reads as marketing.
- **Lead with the demo block, not the bullet list.** HN readers scan top-down; the CLI output is the proof.
- **End with a question.** Forces engagement, lifts comment count, which lifts ranking.

## Anti-patterns (have flagged real Show HN posts)

- Asking for upvotes ("Please upvote!") → instant flag
- Linking to Twitter / Discord above the GitHub repo → looks promo
- Pasting the full README in the body → moderators collapse it
- Submitting before the README is solid → "looks early" bounces in 30 minutes
