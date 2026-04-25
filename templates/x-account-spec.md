# X — dedicated account spec

Variables: `{{PRODUCT_NAME}}` `{{NPM_PACKAGE}}` `{{REPO_URL}}` `{{TAGLINE}}` `{{LAUNCH_DATE}}`

ユーザー個人アカウントとは別に、製品専用 X アカウントを立てる場合の設計書。
電話番号認証だけは AI 不可なので、その部分は人間が手作業。

---

## Account fields

| Field | Value |
| ----- | ----- |
| Display name | {{PRODUCT_NAME}} |
| Handle (1st) | `@{{NPM_PACKAGE}}` |
| Handle (fallback) | `@{{NPM_PACKAGE}}_dev`, `@{{NPM_PACKAGE}}hq`, `@{{NPM_PACKAGE}}app` |
| Bio (≤ 160 chars) | `{{TAGLINE}}. CLI + MCP server. OSS · MIT.` |
| Location | `Open Source` |
| Website | {{REPO_URL}} |
| Birthday | {{LAUNCH_DATE}} |

## Visuals

| Slot | File (in target/docs/promo/assets/) | Size |
| ---- | ----------------------------------- | ---- |
| Profile picture | `avatar-400.png` | 400×400 |
| Header image    | `x-header.png`   | 1500×500 |
| Pinned tweet image | `og.png`      | 1200×630 |

## Pinned tweet

Use `target/docs/promo/x-single.md` rendered output.
画像添付: `og.png`.

## Posting policy

| Field | Default |
| ----- | ------- |
| Frequency | 週 2–3 (火・木・土の 9:00 JST = 17:00 PT 前夜が無難) |
| Topics | 1) "<problem-area> の罠" シリーズ ／ 2) リリース告知 ／ 3) 連携 Tip ／ 4) メタ・舞台裏 |
| Tone | データドリブン、淡々、罵倒なし |
| Hashtags | 1〜2 個まで（`#AI` `#OSS` `#PromptEngineering` `#MCP` `#DevTools`） |
| Mentions OK | `@AnthropicAI`, `@simonw`, ドメイン関係者のみ |
| Mentions NG | 競合のディスり、フォロワー買い、自動 like / フォロー |

## Day-0 to Day-7 launch sequence

| Day | Action |
| --- | ------ |
| 0   | アカウント作成（電話・メール認証）→ プロフィール設定 → pinned tweet 投稿 |
| 1   | 「<problem-area> の罠 #1」 |
| 3   | 「<problem-area> の罠 #2」 |
| 5   | 連携 Tip（CLI / MCP の使い方デモ） |
| 7   | メタ投稿（どう作ったか、auto-improve loop の話） |

## Semi-auto operation via claude-in-chrome MCP

人間が事前に X にログイン済み前提で:

1. AI が `target/docs/promo/x-*.md` の最新ドラフトを取得
2. claude-in-chrome MCP で `https://x.com/compose/post` を開く
3. テキストエリアに本文を入力
4. 画像が必要なら添付
5. **送信ボタン直前で停止 → screenshot で人間に確認**
6. 人間 OK → クリック送信。NG → ドラフトを `sent-history/` にアーカイブ

> ⚠ X の Automation Rules 遵守：自動投稿は API 経由か明示的な人間操作のみ。当面は半手動投稿。

## Phase 2: 完全自動化（オプション）

- **X API v2 Free tier** — 月 1,500 ツイート上限、Developer App 申請必要
- **Buffer / Typefully** — サードパーティ予約投稿、OAuth 連携
- **GitHub Actions cron** — 上記いずれかの API キーを secrets に入れて週次自動投稿

最初の 1 ヶ月は手動運用でフィードバック観察、安定してから検討。

## Hand-off checklist (人間作業)

- [ ] X で新規アカウント作成（電話・メール認証）
- [ ] handle 取得
- [ ] bio / location / website 入力
- [ ] avatar / header アップロード
- [ ] pinned tweet 投稿
- [ ] Day-1 投稿の予約 / 即時実行
