# GitHub Discussions — seed threads template

Variables: `{{PRODUCT_NAME}}` `{{REPO_URL}}` `{{NPM_PACKAGE}}` `{{PAIN_AREA}}` `{{EXTENSION_POINT}}`

リポジトリの Discussions 機能を有効化したら、初期スレを 2 本ほど立てる。空の Discussions は冷たく見える。

---

## Thread A — General / Welcome

### Title
```
Welcome — what brought you to {{PRODUCT_NAME}}?
```

### Body
```md
Thanks for stopping by. {{PRODUCT_NAME}} is <one-line>. The repo has the README + examples + CHANGELOG, but Discussions is the place for stories that don't fit an Issue.

**Question for you:**
What's the worst <pain instance> you've seen in the wild?
(Anonymized examples welcome — paste the offending pattern, not the source.)

Some quick links:
- Install: `npm install -g {{NPM_PACKAGE}}` or `npx -p {{NPM_PACKAGE}} <cli>`
- Pro early-access (no signup, just 👍): {{REPO_URL}}/issues/1
- Roadmap: {{REPO_URL}}/issues/2

Looking forward to reading what you've found.
```

### Category
General (or Welcome / Q&A — whichever is enabled)

---

## Thread B — Ideas / Suggest a rule

### Title
```
Suggest a {{EXTENSION_POINT}} to add
```

### Body
```md
{{PRODUCT_NAME}}'s default <thing being extended> live in `<filepath>`. We're starting with <N>: <list>.

Real ones we've all probably seen:
- "<example pattern A>"
- "<example pattern B>"
- "<example pattern C>"

**If you have a {{EXTENSION_POINT}} that bit you in the past, post it as a top-level comment** (one comment per pattern). Format:

> **Pattern:** <description>
> **Why it's bad:** <one-line consequence>
> **Suggested fix:** <how the linter / tool should respond>

We'll review weekly and turn the most-upvoted ones into PRs.

PRs welcome too — see `<contributing notes>`.
```

### Category
Ideas (or Show and tell / Q&A)

---

## How to actually create them via gh CLI

Discussions API uses GraphQL. Get the repo ID and category IDs, then `createDiscussion`:

```bash
REPO_NODE_ID=$(gh api graphql -f query='{ repository(owner:"OWNER", name:"REPO") { id discussionCategories(first:10){ nodes{ id name slug }}}}' --jq '.data.repository.id')
CAT_GENERAL_ID=$(gh api graphql -f query='{ repository(owner:"OWNER", name:"REPO") { discussionCategories(first:10){ nodes{ id name slug }}}}' --jq '.data.repository.discussionCategories.nodes[] | select(.slug=="general") | .id')

gh api graphql -f query='
mutation($repo: ID!, $category: ID!, $title: String!, $body: String!) {
  createDiscussion(input: {
    repositoryId: $repo,
    categoryId: $category,
    title: $title,
    body: $body
  }) { discussion { url } }
}' -f repo="$REPO_NODE_ID" -f category="$CAT_GENERAL_ID" -f title="..." -f body="..."
```

## Tone

- Conversational, first-person.
- No "Welcome to our community!" energy — feels corporate.
- Pose a specific, answerable question. "What do you think?" gets nothing; "What's the worst contradiction you've seen?" gets stories.
