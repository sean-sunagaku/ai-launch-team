# Example: promptlint-mcp v0.1.0 → v0.1.2 launch

このリポジトリの 5 Agents で実際に走らせた最初の launch の記録。

## Product

[promptlint-mcp](https://github.com/sean-sunagaku/promptlint-mcp) — Static linter for AI prompts.

## Timeline

| Date | Event |
| ---- | ----- |
| 2026-04-24 | Round 1–4 で v0.1.0 をビルド → GitHub public + tag v0.1.0 |
| 2026-04-25 | Round 5–7 で Day-2 polish → v0.1.1 → v0.1.2 npm publish |

## Agents

このリポジトリ内の 5 Agents 全員が回った:

- **launch-strategist**: 配信順 (awesome-mcp → Discussions → HN → X → Reddit) を決定
- **copy-writer**: `docs/promo/show-hn.md` `x-*.md` `reddit-*.md` `awesome-mcp-pr.md` `producthunt.md` を render
- **asset-designer**: `avatar-256.png` `avatar-400.png` `og.png` `x-header.png` を生成
- **distribution-publisher**: npm publish, gh release, awesome-mcp PR ×2, Discussions thread ×2 を実行
- **metrics-tracker**: 計測開始（HN 投稿は人間タスクのため pause 中）

## 自動化された範囲

| アクション | 結果 |
| ---------- | ---- |
| `npm publish promptlint-mcp@0.1.2` | ✅ https://www.npmjs.com/package/promptlint-mcp |
| `gh release create v0.1.0` / `v0.1.1` / `v0.1.2` | ✅ |
| `gh repo edit --description` + 10 topics | ✅ |
| Discussions welcome + ideas thread | ✅ #4 #5 |
| Issue #1 (Pro early-access) を pin | ✅ |
| awesome-mcp-servers (punkpeye) PR | ✅ #5350 |
| awesome-mcp-devtools (punkpeye) PR | ✅ #145 |
| README quick demo + badges + npm badge | ✅ |
| Asset SVG + PNG 一式 | ✅ |
| 投稿ドラフト 9 本 | ✅ `docs/promo/` |

## 半自動 / 人間タスクで残った範囲

| アクション | 状態 |
| ---------- | ---- |
| Show HN submit | 30s 手作業（claude-in-chrome 拡張 or `news.ycombinator.com/submit`） |
| X dedicated account 作成 | 電話番号認証は手作業 |
| Reddit submit | 本人アカウントから |
| ProductHunt | T+7 まで延期 |

## ループ側 (ai-auto-improve-app) との連携

ai-launch-team は **公開 / 配信** だけ担当。プロダクト本体の改善は別チーム
[ai-auto-improve-app](https://github.com/sean-sunagaku/ai-auto-improve-app)
の Customer/Developer ループで回った（promptlint-mcp は Customer × 7 / Developer × 5 ラウンド）。

両方のラウンド原本: [ai-auto-improve-app/examples/session-promptlint-v0.1.0/](https://github.com/sean-sunagaku/ai-auto-improve-app/tree/main/examples/session-promptlint-v0.1.0)

## ハマったところ・直したところ

1. **npm publish に 2FA OTP が要求される** → Granular Access Token の "Bypass 2FA when publishing" を ON にして `~/.npmrc` に置く方式が正解。`npm config set //registry.npmjs.org/:_authToken=...` で設定。
2. **wong2 / appcypher の awesome-mcp-servers は fork からの PR がブロックされている** → API レベルで弾く設定。punkpeye 系に集中するのが正解。
3. **claude-in-chrome 拡張なしだと HN 投稿が完全自動にならない** → 拡張インストール（3 分の 1 回手作業）で次回以降は完全自動可能。
4. **Customer Round 5 で trim() が空文字を返す regression** → verb-aware sentence drop で解決。launch 前の Day-2 polish ループで catch できた。
5. **Quote 内のピリオドが sentence splitter を切る** → quote-aware splitter で解決。

## 学び（次の launch に持ち込む）

- pre-launch で **Customer-AI Round を必ず 1 回挟む**。「Promote NOW: NO」が出たら blocker を直してからにする。
- README の **Quick demo は title/tagline 直下に置く**。Why/Install より上。離脱が起きるのは「これ何のためのもの？」が分からない瞬間。
- **awesome-* PR は launch 当日の 2h 前に出す**。merge は数日かかるが、merge 時点で当日の余韻にフリーライドできる。
- Discussions の seed thread は **質問を必ず含める**。welcome だけだと反応 0。
- npm publish は **Granular Access Token + Bypass 2FA を最初から作る**。OTP 1 行は今回限り。
