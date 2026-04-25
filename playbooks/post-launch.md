# Post-launch playbook (T+1 to T+7)

launch 翌日から 1 週間の運用。`metrics-tracker` の数値と `launch-strategist` の判断で次のアクションを決める。

---

## T+1 (24h)

- [ ] **Day-1 retrospective** を `target/docs/promo/day-1.md` に書く。
  - 各 metric vs target の達成度
  - チャネル別 ROI
  - 想定外の反応（コメント、bug 報告）
- [ ] HN コメントに 1 件ずつ返信（質問は 24h 以内、批判は 48h 以内）。
- [ ] Reddit に追加コメント（投稿後 1h で TL;DR コメント、24h で「最新 update」コメント）。
- [ ] X thread (meta narrative) を投下。HN URL + 結果を含めて。

### 判断ポイント
- HN ≥ 50 pts → "Good launch". X thread 投下、Reddit 追加 sub に展開、ProductHunt は 1 週間後。
- HN 20–50 pts → "OK launch". X / Reddit を予定通り、PR 進捗を待つ。
- HN < 20 pts or flagged → "Soft launch". 14 日後に第二弾（タイトル変更）を計画。

## T+2 (48h)

- [ ] **Issues triage**: 来た Issue を `bug` / `enhancement` / `question` に分類。`bug` は v0.1.1 patch にまとめる。
- [ ] **awesome-* PR の状態確認**: コメント来てたら対応。merge 待ちならそのまま。
- [ ] **GitHub traffic 確認**: `gh api repos/OWNER/REPO/traffic/views` で referrer 内訳。HN / Reddit / X からどれだけ来たか。

## T+3

- [ ] **Day-3 retrospective** を `target/docs/promo/day-3.md` に書く（フォーマットは `metrics-tracker.md` 参照）。
- [ ] **v0.1.1 patch release を準備**: T+1 で集まった bug を fix → CHANGELOG に v0.1.1 セクション → npm publish。
- [ ] **Reddit cross-post を別 sub に**: r/programming, r/javascript, ドメイン別 sub に。同じ本文じゃなく、各 sub のトーンに合わせて書き直す。

### 判断ポイント
- patch release は **launch から 3–7 日以内** が理想。新規ユーザーの第一印象が「メンテされてる」になる。
- patch release のリリースノートに「これらは launch 後の HN / Reddit フィードバックから」と明記すると signal of life が伝わる。

## T+5

- [ ] **dev.to / hashnode / Zenn 記事公開**: 「Building <product> with an AI auto-improve loop」のような meta 記事。
- [ ] **mastodon / fosstodon 投稿**: 別オーディエンス。
- [ ] **MCP / domain-specific newsletter** に提出（あれば）。

## T+7 (1 week)

- [ ] **Day-7 総括** を `target/docs/promo/day-7.md` に書く。
  - What worked / What didn't
  - Per-channel ROI 表
  - 次の release で繰り返す施策、捨てる施策
- [ ] **ProductHunt** を準備（このタイミングで stars 50+ なら投稿、未満なら更に 1 週間延期）。
- [ ] **次の機能リリース計画** を Roadmap Issue に反映。
- [ ] **X 専用アカウント**（持っていれば）の最初の "<problem-area> の罠" 投稿。

## T+14 (2 weeks)

- [ ] **HN 第二弾**（必要なら）: タイトル変更、別ストーリー（例: "How we used <product> to find a bug in our system prompt"）。
- [ ] **コミュニティ醸成**: Discord / Slack / Discussions の活発度を見て、スレを立てる or 既存スレに返信。
- [ ] **競合比較投稿**: 別 OSS と並べて「どれをいつ使うべきか」を中立に書く。投稿前に競合のメンテナにメンションして review してもらう。

## T+30 (1 month)

- [ ] **Pro tier 早期アクセス Issue の状況確認**: 👍 が 30+ なら開発開始、未満なら scope を狭めて再アナウンス。
- [ ] **記事メトリクス再集計**: 1 ヶ月で何ができ、何ができなかったかを公開（透明性は信頼を生む）。
- [ ] **次の launch のための学び**: `ai-launch-team` の templates / playbooks を更新。

---

## やってはいけないこと

- 期待を煽る ("v0.2 next month!") → 守れないと信用喪失
- 競合のレビューに匿名で割り込む → 必ずバレる
- HN / Reddit のコメントで「これは Pro tier で」と返答 → 即 spam フラグ
- launch から 7 日間 silent → "abandoned" と判定される

## やるべきこと

- 来た反応を全部「signal of life」として返信する。返信内容より「返信してくる」事実が信用を作る。
- v0.1.1 patch をなる早で出す。launch 直後の patch は「動いてる証拠」。
- launch 1 ヶ月後の振り返り記事を必ず書く。次の launch のテンプレが磨かれる。
