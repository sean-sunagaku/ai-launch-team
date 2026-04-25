# awesome-* list PR template

Variables: `{{PRODUCT_NAME}}` `{{REPO_URL}}` `{{TAGLINE}}` `{{ONE_LINER_FUNC}}`

---

## Target lists (probe order)

Open a PR per repo (succeed on at least 2):

- https://github.com/punkpeye/awesome-mcp-servers
- https://github.com/punkpeye/awesome-mcp-devtools
- https://github.com/wong2/awesome-mcp-servers
- https://github.com/appcypher/awesome-mcp-servers
- https://github.com/modelcontextprotocol/servers (community section if applicable)

For non-MCP products, swap to:

- https://github.com/sindresorhus/awesome
- https://github.com/sindresorhus/awesome-nodejs
- ドメイン特化 awesome-* リスト

## PR title

```
Add {{PRODUCT_NAME}} ({{ONE_LINER_FUNC}})
```

## PR body

```md
Adds [{{PRODUCT_NAME}}]({{REPO_URL}}), {{ONE_LINER_FUNC}}.

It detects <feature list, comma-separated, ≤ 6>. Returns <output description>. Zero network, zero LLM calls. <CLI/server/library mode>. <license>.

Tools / commands exposed:
- `<thing 1>` → <what it does>
- `<thing 2>` → <what it does>

Tested with <integration target — Claude Code via `claude mcp add`, etc.>.

Closes <issue number> / Refs <discussion>.
```

## Bullet to insert in the README

Insert in the most-fitting category (e.g. Developer Tools, Code Analysis, Linters, Productivity). If the list is alphabetical, insert in alphabetical order.

```md
- [{{PRODUCT_NAME}}]({{REPO_URL}}) - {{TAGLINE}}. <key feature>. <license>.
```

例: `- [promptlint-mcp](https://github.com/sean-sunagaku/promptlint-mcp) - Static linter for AI prompts. Catches contradictions, redundancy, ambiguity, long examples, and politeness fluff. CLI + MCP server. Zero network, MIT.`

## Alternative shorter bullet (for tight lists)

```md
- [{{PRODUCT_NAME}}]({{REPO_URL}}) - {{TAGLINE_SHORT}}.
```

## Repo-specific gotchas (real, observed)

- **`punkpeye/awesome-mcp-servers`**: PRs require a `🤖🤖🤖` suffix in the title for fast-track review (per their CONTRIBUTING).
- **`wong2/awesome-mcp-servers`**: PRs from forks are blocked at the API level. Push to a fork branch but the PR cannot be opened. Skip.
- **`appcypher/awesome-mcp-servers`**: Same as wong2. Skip.
- **`modelcontextprotocol/servers`**: README structure is reference servers + frameworks/SDKs only. No "community / third-party" section. Skip unless your product fits one of the official categories.

## Workflow (for distribution-publisher)

```bash
upstream="punkpeye/awesome-mcp-servers"
gh repo fork "$upstream" --clone=false --remote=false
sleep 2
git clone "https://github.com/$GITHUB_USER/$(basename $upstream)" "/tmp/$(basename $upstream)-fork"
cd "/tmp/$(basename $upstream)-fork"
git checkout -b "add-$PACKAGE"
# edit README.md, insert bullet in correct section
git commit -am "Add $PRODUCT_NAME"
git push -u origin "add-$PACKAGE"
gh pr create --repo "$upstream" --title "Add $PRODUCT_NAME 🤖🤖🤖" --body-file ./PR_BODY.md
```
