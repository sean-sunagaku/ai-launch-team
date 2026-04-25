# ai-launch-team

OSS / SaaS / MCP プロダクトの launch（公開・配信・宣伝）を Agent Team で再現可能にする最小ループ。

`ai-auto-improve-app` がプロダクトを **作って磨く**ループ、こちらが **公開して届ける**ループ。
両者を組み合わせると「企画 → 改善 → リリース → 配信」が 1 リポジトリのコマンドで回る。

---

## 5 Agents

| Agent | 担当 |
| ----- | ---- |
| [`launch-strategist`](./agents/launch-strategist.md)         | 全体ディレクション、チャネル順、launch-day timing、収束判定 |
| [`copy-writer`](./agents/copy-writer.md)                     | HN / X / Reddit / PH / Discussions / Issue / CHANGELOG コピー |
| [`asset-designer`](./agents/asset-designer.md)               | avatar / OG / X-header の SVG → PNG 自動生成 |
| [`distribution-publisher`](./agents/distribution-publisher.md) | npm publish / GitHub Release / awesome-mcp PR / Discussions thread の実行 |
| [`metrics-tracker`](./agents/metrics-tracker.md)             | HN points / npm DL / GitHub stars / X impressions の追跡と Day-1 判定 |

各 Agent 定義は Anthropic Sub-Agent 形式（YAML frontmatter + 役割本文）。
Claude Code の `.claude/agents/` に置くか、別 sub-agent runner に渡せばそのまま動く。

---

## 11 Templates

`templates/` 以下、いずれも変数置換 (`{{PRODUCT_NAME}}`, `{{REPO_URL}}`, `{{NPM_PACKAGE}}`, `{{TAGLINE}}` 等) のみで再利用可能。

| Template | 用途 |
| -------- | ---- |
| `show-hn.md`              | Hacker News Show HN タイトル + 本文 + 1st comment |
| `x-single.md`             | X 単発ツイート（〜280 chars） |
| `x-thread.md`             | X 3 ツイートスレッド |
| `x-account-spec.md`       | 専用 X アカウントの handle/bio/header/pinned 設計書 |
| `reddit-claudeai.md`      | r/ClaudeAI 投稿 |
| `reddit-localllama.md`    | r/LocalLLaMA 投稿 |
| `awesome-mcp-pr.md`       | awesome-mcp 系リストへの PR 本文 + bullet |
| `producthunt.md`          | ProductHunt 投稿（タグライン / 説明 / 1st comment） |
| `discussions-welcome.md`  | GitHub Discussions ウェルカムスレ |
| `issue-roadmap.md`        | GitHub Roadmap / Pro early-access Issue |
| `changelog-entry.md`      | Keep-a-Changelog 形式のリリースエントリ |

---

## 3 Playbooks

| Playbook | フェーズ |
| -------- | -------- |
| [`pre-launch.md`](./playbooks/pre-launch.md)  | T-7 〜 T-1: README polish / npm pack / badge / asciinema cast |
| [`launch-day.md`](./playbooks/launch-day.md)  | T-0: HN → X → Reddit → awesome-mcp PR → PH の 5 段階配信、HN は朝 6:30–9:00 PT 月〜木 |
| [`post-launch.md`](./playbooks/post-launch.md) | T+1 〜 T+7: コメント返信、metrics、Day-3 中間レビュー、awesome-mcp 待ち、X 専用アカウント立ち上げ |

---

## Quick start

```sh
git clone https://github.com/sean-sunagaku/ai-launch-team.git
cd ai-launch-team

# 入力: 公開対象のリポジトリ + npm パッケージ名（任意）
./launch.sh \
  --target  /path/to/your-product \
  --repo    your-handle/your-product \
  --package your-product-name \
  --tagline "Static linter for X — does Y, saves Z"
```

`launch.sh` は以下を順番に実行:

1. `pre-launch.md` のチェックリスト（npm pack 確認 / README badge / CHANGELOG 整備）
2. `asset-designer` Agent で avatar / OG / X-header を `target/docs/promo/assets/` に生成
3. `copy-writer` Agent で全テンプレートを実値で埋めて `target/docs/promo/` に保存
4. `launch-strategist` が配信順序とタイミングを提案、Approval を求める
5. `distribution-publisher` が GitHub Release / awesome-mcp PR / Discussions thread を実行
6. `metrics-tracker` が定期的に HN / npm / GitHub の数値を `metrics.jsonl` に記録

各ステップは独立に呼べる（`./launch.sh assets` だけ、`./launch.sh copy` だけ、など）。

---

## 実例: promptlint-mcp v0.1.2

このチームを最初に流して作られた launch:

- npm: https://www.npmjs.com/package/promptlint-mcp
- GitHub: https://github.com/sean-sunagaku/promptlint-mcp
- 改善ループ側のセッションログ: [ai-auto-improve-app/examples/session-promptlint-v0.1.0/](https://github.com/sean-sunagaku/ai-auto-improve-app/tree/main/examples/session-promptlint-v0.1.0)
- このリポジトリ内の参照: [`examples/promptlint-mcp-launch.md`](./examples/promptlint-mcp-launch.md)

---

## カスタマイズ

### 新しい配信チャネルを足す
1. `templates/<channel>.md` を追加（変数: `{{PRODUCT_NAME}}` 等）
2. `agents/distribution-publisher.md` の "Channels" セクションに 1 行追加
3. `playbooks/launch-day.md` の順序リストに位置を決めて挿入

### 別ペルソナで投稿する
`templates/x-account-spec.md` の Persona セクションを書き換える。
Bio / 投稿頻度 / トーン / 関わるアカウントを含む。

### 別ドメイン（OSS 以外）に転用
`agents/launch-strategist.md` の "Channel ranking" 表を書き換える。
B2B SaaS なら HN < ProductHunt < LinkedIn、消費者向けなら X < TikTok など。

---

## License

MIT — see [LICENSE](./LICENSE).
