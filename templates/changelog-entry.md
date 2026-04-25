# Keep-a-Changelog entry template

Variables: `{{VERSION}}` `{{DATE}}` `{{REPO_URL}}`

リリースごとに既存の `CHANGELOG.md` の先頭セクションとして挿入する。`gh release create --notes-file` でもそのまま使える。

---

## [{{VERSION}}] — {{DATE}}

### Added

- **<feature 1 — short headline>.** <one paragraph: what shipped, why it matters, where in the code it lives>.
- **<feature 2>.** <...>

### Changed

- **<change 1>.** <what was different before, what's different now, who's affected>.
- **<change 2>.** <...>

### Fixed

- **<fix 1>.** <symptom → root cause → fix, with file:line if useful>.
- **<fix 2>.** <...>

### Deprecated

- **<deprecated thing>.** Will be removed in v<X.Y>. Migrate to <replacement>.

### Removed

- **<removed thing>.** Removed in this version (was deprecated since v<X.Y>).

### Security

- **<vuln class / CVE if any>.** <impact, fix, who needs to upgrade>.

### Internal / docs

- **<doc / infra change>.** <noteworthy but not user-facing>.

---

[{{VERSION}}]: {{REPO_URL}}/releases/tag/v{{VERSION}}

---

## Style notes

- One bullet per change. Don't merge unrelated items.
- Each bullet starts with **bold headline**, then a short body.
- If a bullet is < 12 words, drop the "Why" and keep just the "What".
- If a bullet is > 80 words, split it into two bullets or move it to a separate doc and link.
- Past tense ("Added foo") not future ("will add foo").
- No internal ticket numbers in user-facing CHANGELOG (move those to `## Internal`).
