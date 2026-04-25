# Pre-launch playbook (T-7 to T-1)

公開直前の 1 週間でやること。`launch-strategist` がこのチェックリストを実行 → 全項目 pass で `launch-day.md` に進む。

---

## T-7: アセット完成度チェック

- [ ] `README.md` を初見ユーザーとして読む。10 秒で「これは何の道具か」が分かるか。
- [ ] `README.md` の最初の 3 行に **タグライン** + **install コマンド 1 行** がある。
- [ ] `## Quick demo` セクションがあり、実コマンド + 実出力が貼ってある。
- [ ] CHANGELOG.md が Keep-a-Changelog 形式で、直近版に `### Added/Changed/Fixed` のいずれかが入っている。
- [ ] LICENSE ファイルがリポジトリ root にある。
- [ ] `package.json` (or `pyproject.toml`) の `description` / `homepage` / `repository.url` / `keywords` が埋まっている。

## T-5: install pathway 検証

- [ ] **Source clone** で動く: `git clone … && npm install && npm run lint:self`
- [ ] **`npm pack --dry-run`** が想定どおりのファイル一覧を返す（`docs/` 含まれていない、`node_modules/` 含まれていない、`.git/` 含まれていない）。
- [ ] サイズ < 100 KB（unpacked）。超えたら `package.json#files` で絞り込む。
- [ ] `prepublishOnly` script が動く（self-lint と smoke を回す）。
- [ ] **Empty temp dir** で `npm install -g <pkg>` が成功し、`which <bin>` が PATH を返す。

## T-3: 配信アセット生成

- [ ] `docs/promo/assets/` に `avatar-256.png` `avatar-400.png` `og.png` `x-header.png` がある。
- [ ] 各 PNG のサイズ < 200 KB。
- [ ] OG image が GitHub の link unfurl で正しく表示される（push 後 `gh repo view --web` で確認）。
- [ ] `docs/promo/show-hn.md` `x-single.md` `x-thread.md` `reddit-*.md` `awesome-mcp-pr.md` が `copy-writer` で render 済み。
- [ ] それぞれの「数字」が実値（`npm view`, `gh release view` から）。捏造ゼロ。

## T-2: GitHub repo polish

- [ ] About: tagline + 5–10 topics 設定済み（`gh repo edit --description ... --add-topic ...`）。
- [ ] Releases: 直前バージョンの release が GitHub Release として存在し、notes に CHANGELOG 抜粋がある。
- [ ] Issues: `#1 Pro early-access` が pin されている。`#2 Roadmap` `#3 Known issues` が立っている。
- [ ] Discussions: 有効化されている。`Welcome` と `Ideas` の各カテゴリに seed thread 1 つずつ。
- [ ] CONTRIBUTING.md（任意）と CODE_OF_CONDUCT.md（任意）。

## T-1: 最終 dry run

- [ ] **Customer-AI Round** を 1 ラウンド回す（[ai-auto-improve-app](https://github.com/sean-sunagaku/ai-auto-improve-app) を使って）。
  - Customer の感想で「Promote NOW: NO」が出たら blocker を直し T-1 に戻る。
  - 「YES」なら次へ。
- [ ] HN タイトルを **A/B で 2 つ用意** して、`launch-strategist` が一方を選ぶ。
- [ ] X の単発 tweet を実時間で読む。280 chars 内、URL 含めて。
- [ ] Reddit のタイトルが疑問文になっていないか（"Anyone tried this?" → flag リスク）。

## T-0 (launch day) 直前 30 分

- [ ] HN account の karma 確認（理想 > 50、最低 > 10）。0 だと flag 即死。
- [ ] X account にログイン済み。pinned tweet が前日に投稿済みなら理想。
- [ ] `launch-log.md` の T-0 行を埋める準備完了。
- [ ] 監視タブを開く: HN front page / X 自分のホーム / GitHub repo の traffic タブ。

## Go / No-Go gate

すべて pass で `playbooks/launch-day.md` に進む。
1 つでも fail したら 24h 延期して直す。launch は 1 度きり、第一印象は塗り直しが利かない。
