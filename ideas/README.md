# アイディア一覧

1ネタ1ファイル。ファイル名は `YYYYMMDD-topic-name.md`。おすすめ度と状態は、最終更新時点の見立て。

最終更新: 2026-11-08

## 記事候補

| 順位 | アイディア | 概要 | おすすめ度 | 状態 |
|---|---|---|---|---|
| 1 | [麻雀成績アプリの業務設計とDB設計](20261108-mahjong-db-design.md) | 「業務設計がテーブル設計になるまで」。前作「業務データベース設計の基本」の実践版。業務の決めごとが設計に落ちる過程と、前作の目で自分の設計を読み直す | ★★★★★ | 未着手(マイグレーションと pgTAP が未読) |
| 2 | [28本の分析](20261108-qiita-28-articles-analysis.md) | 閲覧数と LGTM・ストックは別物、LGTM は外れ値で決まる、伸び方は2種類、など。自分の実データで書く | ★★★★ | 初回集計済み |
| 3 | [SECURITY DEFINER 検査](20261108-supabase-security-definer-ci.md) | Supabase の SECURITY DEFINER 関数を CI で検査する手順。「advisors が見逃す」という主張は要再現 | ★★★½ | 未着手(再現が前提) |
| 4 | [WSL2 のスマホ確認](20261108-wsl2-lan-smartphone-preview.md) | WSL2 上の開発サーバを同じ Wi-Fi のスマホから開く手順と後始末 | ★★★ | 未着手(`.ps1` 未読) |
| 5 | [run 間のばらつき](20261108-same-instruction-run-variance.md) | 同じ指示を6回出した成果物から、複数回で再現した差だけを抜き出す | ★★½ | 簡易計測のみ |
| 6 | [Qiita 統計のしくみ](20261108-qiita-stats-dashboard.md) | GAS から GitHub Actions + Workload Identity Federation への移行。単独より、2 の一節にする方が良い | ★★ | 未着手(リポジトリが非公開) |
| 7 | [解説の突き合わせ](20261108-ai-explanation-cross-check.md) | 6通りの AI 解説の食い違いから誤りを探す | ★½ | 優先度低 |

## 別枠

| アイディア | 概要 |
|---|---|
| [Claude Code 対 Codex の記録](20261108-claude-vs-codex-article-contest.md) | 評価条件と運用上の注意を含む、進行中の記録。記事化は結果が出てから |

## データ

- `data/`:Qiita 記事の日次スナップショット(GAS 版)。2・6 の元データ。
- 元データに含まれない、Windows が付ける `*:Zone.Identifier` ファイルはコミット対象外。

## 作成済みの記事(重複確認用)

過去記事28本の一覧は、https://qiita.com/rabut で確認する。同じリポジトリから記事を作る場合は、既出の題材を避ける。

| リポジトリ | 既出の記事 |
|---|---|
| project-manager-training-5 / -6 | Claude Code vs Codex(2026-10-25) |
| ci-cd-study | CI/CD 入門(2026-05-31) |
| our-mahjong-history | プロンプト全公開、全会話の解説(2026-08-31)、LINE 認証(2026-09-30) |
| text-to-sql-sample | Text to SQL をさっくり動かす(2026-01-30) |
| SQLSvrExtEventExtractor | 拡張イベント(.xel)の CSV 抽出(2025-07-03) |
