# Reddit — r/LocalLLaMA template

Variables: `{{PRODUCT_NAME}}` `{{TAGLINE}}` `{{REPO_URL}}` `{{NPM_PACKAGE}}`

---

## Title

```
{{PRODUCT_NAME}} — {{TAGLINE}}, no API keys, runs offline
```

## Body

```md
Built a small <category> for prompt text. Useful regardless of which model you run — it never calls an LLM, never hits the network.

**What it does:**

- <feature 1>
- <feature 2>
- <feature 3>
- <feature 4>
- <feature 5>

**Output:** <description>. Trimmer is sentence- and verb-aware — short imperatives like \`"<imperative>"\` are kept; only fluff sentences get dropped.

**How it ships:**

- CLI: `<usage>`
- MCP server: tools `<tool name 1>` and `<tool name 2>`, register once with `claude mcp add` and your agent can self-lint subagent prompts

**Constraints:**

- Pure JS, ~<N> lines core
- Only dep: `@modelcontextprotocol/sdk`
- Node 18+
- MIT

**Repo:** {{REPO_URL}}

If you run a local model and have a system prompt you keep tweaking, `<one-line cmd>` is a 5-second sanity check.

Open to rule contributions — open an issue describing the pattern you want flagged.
```

---

## Subreddit-specific notes (r/LocalLLaMA)

- Audience cares about **offline capability, no telemetry, fully local.** Lead with that.
- Mention "no OpenAI / Anthropic API key needed" if applicable. The `--no-LLM-calls` line is gold here.
- Code blocks with concrete commands rank higher than abstract benefit lists.
- "How it integrates with [llama.cpp / ollama / lm-studio]" gets traction; mention if relevant.

## Anti-patterns

- Cross-posting the r/ClaudeAI body verbatim → flag risk
- "Better than <competitor>" claims → r/LocalLLaMA is allergic to marketing
- Mentioning Pro tier in the post body → save it for comments if asked
