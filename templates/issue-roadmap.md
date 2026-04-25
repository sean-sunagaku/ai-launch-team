# GitHub Issues — Roadmap / Pro / Known issues template

Variables: `{{PRODUCT_NAME}}` `{{REPO_URL}}` `{{NPM_PACKAGE}}`

リリース直後に立てる 3 つの初期 Issue。最初の 1 つは Pin する（README から導線を引く）。

---

## Issue #1 — Pro tier early access (Pin this)

### Title
```
Pro tier — early access interest thread
```

### Body
```md
## Status
**Pro is planned, not shipped.** This issue collects interest signals while we scope the feature set.

## Free tier (today, MIT)
- <feature list — everything in v0.1.0>

## Pro tier (planned, ~$9/mo or team license)
Tentative scope:
- **<Pro feature 1>** — <one-line>
- **<Pro feature 2>** — <one-line>
- **<Pro feature 3>** — <one-line>
- **<Pro feature 4>** — <one-line>
- **<Pro feature 5>** — <one-line>

## How to express interest
Drop a 👍 on this issue and a one-liner about the workflow you'd plug it into. We'll DM early-access invites in 👍 order.

## Decision criteria
We'll move forward when ≥ 30 thumbs-up here AND ≥ 3 teams describe a concrete <integration> use case.

(Pricing and scope are still in discussion — feedback in the comments shapes both.)
```

### Label
`enhancement`, `pro-tier`

---

## Issue #2 — Roadmap

### Title
```
Roadmap — v0.2 / v0.3 candidates
```

### Body
```md
## Status
This issue tracks **candidate** features for upcoming versions. Items move into a release when they land in a milestone.

## v0.1.x — patches (immediate)
- <bullet>
- <bullet>
- <bullet>

## v0.2 — <thematic name>
- <bullet>
- <bullet>
- <bullet>

## v0.3 — <thematic name>
- <bullet>
- <bullet>

## v0.4 — distribution
- <bullet>
- <bullet>

## v1.0 — stability
- Frozen <contract> and <severity contract>. Add new <things>; never break existing ones in minor versions.

Comments / 👍 reorder priorities. Pull requests welcome — open an issue first for new <category>.
```

### Label
`enhancement`

---

## Issue #3 — Known issues / day-2 polish backlog

### Title
```
Known issues — day-2 polish backlog
```

### Body
```md
Tracking small polish items surfaced after v0.1.0 ship. Each is non-blocking and will be batched into v0.1.1.

## Confirmed
- [ ] **<bug 1 short title>.** <repro / file:line>
- [ ] **<bug 2 short title>.** <repro / file:line>
- [ ] **<doc gap>.** <where>

## To investigate
- [ ] <hypothesis 1>
- [ ] <hypothesis 2>
- [ ] <hypothesis 3>

PRs welcome. If unsure, leave a comment first.
```

### Label
`bug`, `polish`

---

## Pin Issue #1 via gh + GraphQL

```bash
ISSUE_ID=$(gh api graphql -f query='{ repository(owner:"OWNER", name:"REPO") { issue(number: 1) { id } } }' --jq '.data.repository.issue.id')

gh api graphql -f query='
mutation($issueId: ID!) {
  pinIssue(input: { issueId: $issueId }) {
    issue { id }
  }
}' -f issueId="$ISSUE_ID"
```
