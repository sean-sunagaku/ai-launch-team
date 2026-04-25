# Launch day playbook (T-0)

公開当日の数時間で配信を完了する。`distribution-publisher` が実行、`launch-strategist` がライブモデレート、`metrics-tracker` が並行で計測開始。

---

## 推奨タイミング (OSS / dev tool)

- **HN**: 平日（火・水・木）の **6:30–9:00 PT** （= 22:30–01:00 JST 翌日 / もしくは 11:30–14:00 JST 同日に欧州・米東海岸が起き始める）
- **金土日は避ける** — エンジニア層が見ないので front-page に乗らない。

## 順序（offsets は HN 投稿時刻 = T+0 起点）

| T+   | チャネル                       | 自動化 | 担当                 |
| ---- | ------------------------------ | ------ | -------------------- |
| -2h  | awesome-mcp PR (punkpeye 系)  | ✅ 自動 | distribution-publisher |
| -1h  | GitHub Discussions welcome     | ✅ 自動 | distribution-publisher |
| -30m | GitHub Discussions ideas thread | ✅ 自動 | distribution-publisher |
| **0**    | **Show HN submit**             | 🟡 半自動 (claude-in-chrome) or 30s 手作業 | human |
| +5m  | HN 1st comment 投下             | 🟡 半自動 | human |
| +10m | X single tweet (HN URL 同梱)   | 🟡 半自動 | human |
| +1h  | Reddit r/ClaudeAI              | 🟡 半自動 | human |
| +2h  | Reddit r/LocalLLaMA            | 🟡 半自動 | human |
| +24h | X thread (meta narrative)      | 🟡 半自動 | human |
| +T+7 | ProductHunt                    | 🟡 半自動 | human (要 100+ stars) |

## 各チャネルの実行手順

### awesome-mcp PR

```bash
for upstream in punkpeye/awesome-mcp-servers punkpeye/awesome-mcp-devtools; do
  gh repo fork "$upstream" --clone=false --remote=false
  sleep 2
  git clone "https://github.com/$GITHUB_USER/$(basename $upstream)" "/tmp/$(basename $upstream)-fork"
  cd "/tmp/$(basename $upstream)-fork"
  git checkout -b "add-$PACKAGE"
  # README に bullet 追加（適切な section / アルファベット順）
  git commit -am "Add $PRODUCT_NAME"
  git push -u origin "add-$PACKAGE"
  gh pr create --repo "$upstream" \
    --title "Add $PRODUCT_NAME 🤖🤖🤖" \
    --body-file "$TARGET/docs/promo/awesome-mcp-pr.md"
done
```

### GitHub Discussions

```bash
REPO_ID=$(gh api graphql -f query='{ repository(owner:"OWNER", name:"REPO") { id }}' --jq '.data.repository.id')
GENERAL_CAT=$(gh api graphql -f query='{ repository(owner:"OWNER", name:"REPO") { discussionCategories(first:10){ nodes{ id slug }}}}' --jq '.data.repository.discussionCategories.nodes[] | select(.slug=="general") | .id')

gh api graphql -f query='
mutation($r:ID!,$c:ID!,$t:String!,$b:String!){
  createDiscussion(input:{repositoryId:$r,categoryId:$c,title:$t,body:$b}){discussion{url}}
}' -f r="$REPO_ID" -f c="$GENERAL_CAT" -f t="Welcome — what brought you to {{PRODUCT_NAME}}?" -f b="$(cat $TARGET/docs/promo/discussions-welcome.md)"
```

### Show HN (半自動)

claude-in-chrome 拡張がある場合:

```
mcp__claude-in-chrome__tabs_create_mcp
mcp__claude-in-chrome__navigate https://news.ycombinator.com/submit
mcp__claude-in-chrome__form_input #title "Show HN: ${PRODUCT_NAME} – ${TAGLINE}"
mcp__claude-in-chrome__form_input #url "${REPO_URL}"
# screenshot で人間に確認 → click submit
```

拡張なしの場合、`docs/promo/handoff/hn.md` を生成:

```md
# Hacker News submit (30s)

1. https://news.ycombinator.com/submit
2. Title: Show HN: {{PRODUCT_NAME}} – {{TAGLINE}}
3. URL:   {{REPO_URL}}
4. Submit.
5. Paste the resulting HN URL back here so I can post the 1st comment.
```

### X / Reddit / ProductHunt

すべて claude-in-chrome 経由か `docs/promo/handoff/<channel>.md` の手作業手順書で。

## ライブモニタリング (launch-strategist 担当)

T+0 から T+12h は 30 分間隔でチェック:

- HN points / rank / front-page 入り
- X impressions
- npm DL リアルタイム（`npm view <pkg> dist-tags` を 5 分おき）
- GitHub stars 増分

## トラブルシューティング

### HN 30 分で 1 pt 未満
- タイトル弱い。明日朝の同時刻に **タイトル変えて再投稿**（重複 URL は 24h NG なので URL に `?v=2` を足してもエラーになる場合は本文 URL 形式に切り替え）

### HN 投稿が flag された
- 14 日待って再挑戦。本文の URL 数を 1 つだけに絞る、絵文字を消す、感嘆符を消す。

### X tweet が 1 時間で impressions < 50
- リプを 1 つ自分で追加（demo gif や追加 stat）。
- それでも伸びなければ 翌日 thread として再供給。

### Reddit が 1 時間で 0 upvote
- TL;DR コメント 1 つを自分で top-level に追加（簡潔な箇条書き）。
- どうしても伸びないサブレは諦め、別サブレ（r/programming, r/javascript 等）を試す。

### GitHub repo に Issue が来た
- Bug → 24h 以内に triage、48h 以内に対応 or 「v0.1.x で対応予定」コメント。
- Question → 24h 以内に Discussions に誘導。

## 終わったら

- `launch-log.md` に時系列で実 URL / point / impression を記録
- `metrics-tracker` を起動（6h 間隔ポーリング）
- `playbooks/post-launch.md` に進む
