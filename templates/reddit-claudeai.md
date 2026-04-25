# Reddit — r/ClaudeAI template

Variables: `{{PRODUCT_NAME}}` `{{TAGLINE}}` `{{REPO_URL}}` `{{NPM_PACKAGE}}` `{{ONE_COMMAND_INSTALL}}` `{{ONE_COMMAND_USE}}`

---

## Title

```
I built an MCP server that {{TAGLINE_VERB_FORM}} for Claude Code
```

例: "I built an MCP server that lints your Claude system prompts (catches contradictions, saves tokens)"

## Body

```md
Sharing a small open-source thing: **{{PRODUCT_NAME}}**.

It's a Model Context Protocol server (and CLI) that <does what>:

- **<rule/feature 1>** — <concrete pain it solves>
- **<rule/feature 2>** — <concrete pain>
- **<rule/feature 3>** — <concrete pain>
- **<rule/feature 4>** — <what it does NOT do, scope limit>
- **<rule/feature 5>** — <safety guarantee, e.g. zero network>

Output is <what it returns: score / list / trimmed text>. The <safety feature> means <safe drop-in claim>.

Zero network. Zero LLM calls. MIT.

### Use it

\`\`\`sh
{{ONE_COMMAND_INSTALL}}
{{ONE_COMMAND_USE}}
\`\`\`

Then your Claude Code session can call <tool names> on its own subagent prompts before spawning them.

### Repo
{{REPO_URL}}

### How it was built (meta — optional)
End-to-end via an AI auto-improvement loop: one Claude session plays "Customer AI" and writes feedback after using the tool; another plays "Developer AI" and patches code. <N> rounds. Each round is a commit in the history.

What's the <a question that invites the reader's domain knowledge>?
```

---

## Subreddit-specific notes (r/ClaudeAI)

- Audience is **already familiar with MCP and Claude Code.** Don't over-explain MCP.
- Do explain the **specific Claude Code workflow** the tool fits into (subagent spawn, prompt review, etc).
- Mods don't tolerate `[buy now]` energy. The "free / OSS / MIT" line near the top is essential.
- Comments often ask for "what about <competitor>?" — be ready with a 1-line honest comparison.

## Anti-patterns

- Posting the same body to multiple subs (r/ClaudeAI + r/LocalLLaMA) within an hour → cross-post detector flags both
- Linking to your X / Discord above the GitHub repo
- Title in question form ("Anyone tried this?") — sounds like solicitation
