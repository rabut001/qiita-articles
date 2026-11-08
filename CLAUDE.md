# このリポジトリについて

Qiita に投稿する技術記事の企画・調査・執筆・レビューを支援するリポジトリ。記事の正本は GitHub (rabut001) で管理し、Git 操作と Qiita CLI の実行は Claude が担当する。

## 記事作成の方針

- 技術的な正確性を優先する。不確かな内容は断定しない。
- 製品仕様や料金など変化する情報は、必要に応じて最新の一次情報で確認し、research.md に URL と確認日を残す。
- 手順紹介だけでなく、他の開発者にも役立つ知見を意識する。
- 一次資料は著者の個別 GitHub リポジトリ(コードはこのリポジトリでは管理しない)。research.md には URL と commit を記録する。
- Qiita 向けの読みやすい日本語で書く。文体と体裁の目安は `docs/style-guide.md` を参照する。
- 会社の業務データや機密は一切使わない。

## 参照元(元ネタ)

- 著者の GitHub リポジトリ(`rabut001`)は、記事の元ネタとして使ってよい。一覧は `gh repo list rabut001`、中身は `gh api repos/rabut001/<repo>/...` で読む(ホストで実行)。
  - 非公開リポジトリの内容は、記事に載せる前にユーザーに確認する。
  - 会社の業務に関わるリポジトリ(例: `qatools`)は元ネタにしない。迷うものは確認する。
  - 記事で根拠にしたリポジトリは、URL と commit を research.md に記録する。
- 著者の過去の Qiita 記事は、ユーザー ID `rabut`(https://qiita.com/rabut)。公開 API `https://qiita.com/api/v2/users/rabut/items?per_page=100&page=<N>` で、一覧と本文を取得できる。認証なしでは閲覧数は取れない(null)。
  - ネタ出しや執筆の前に、既出の題材との重複を確認する。同じリポジトリから書く場合は、観点を変える。
  - 関連する過去記事は、冒頭か末尾でリンクする。
  - 既出の題材との対応は `ideas/README.md` にまとめる。
- 記事の反応(閲覧数・LGTM・ストック)の日次データは `ideas/data/` に置く。`qiita-dashboard` が毎朝記録したもの。

## 構成と流れ

- `ideas/`: アイディア。`articles/<slug>/`: 1記事1フォルダ(slug は `YYYYMMDD-topic-name`)。
- 本文の正本は `articles/<slug>/draft.md`。画像は `images/` の相対パスで書く。
- `public/<slug>.md` は draft.md から生成する(生成物)。画像パスは `https://raw.githubusercontent.com/rabut001/<repo>/main/articles/<slug>/images/...` に置換する。
- 生成時、`public/` 側の front matter の `id` と `updated_at` は Qiita CLI が管理するため触らず、本文だけを差し替える。
- 生成時に、下書きメモの除去と検査(画像の存在、TODO の残存、機密になりうる文字列など)を行う。

## 運用ルール

- `public/` には公開してよい記事だけを置く。`main` への push で自動投稿されるため、作業は `main` 以外のブランチで行う。
- push、`main` へのマージ、Qiita への公開など外部に影響する操作は、実行前にユーザーへ確認する。
- トークン(`QIITA_TOKEN`、`credentials.json`)をコミットしない。
- Qiita CLI は `@qiita/qiita-cli`(別名のパッケージに注意)。

## 実行環境

- Git と `gh` はホストで実行する。Node.js、Qiita CLI、変換スクリプトは Docker コンテナ内で実行する(ホストに Node.js は入れない)。
- コマンドは `docker compose run --rm app <command>` で実行する(例: `docker compose run --rm app npx qiita version`)。
- プレビューは `docker compose run --rm --service-ports app npx qiita preview`(ホストの `http://localhost:8888`)。`qiita.config.json` の `host` はコンテナ公開のため `0.0.0.0`。
- `credentials.json` は名前付きボリューム `qiita-cli-config` に保存される。
