# Qiita記事の閲覧数を毎日記録する(qiita-dashboard)

状態: アイディア(未着手)
作成日: 2026-11-08

## 一言

自分の Qiita 記事の閲覧数・LGTM・ストックを、GitHub Actions で毎日スプレッドシートに記録している。そのしくみを記事にする。**蓄積したデータの分析は別ネタ**([20261108-qiita-28-articles-analysis.md](20261108-qiita-28-articles-analysis.md))。

## 想定読者

- Qiita の投稿者(自分の記事の推移を記録したい人)
- GitHub Actions から Google Cloud を鍵なしで使いたい人(Workload Identity Federation)

## 切り口

- GAS から GitHub Actions + Workload Identity Federation への移行(サービスアカウントの鍵を作らない構成)。
- 分析記事の「取得のしくみ」の節として、簡潔に載せる使い方もある。

## 手元で確認済みの事実

- 閲覧数(`page_views_count`)は、トークンなしの Qiita API では null だった。認証ありでの挙動は未確認。
- GAS 版のデータは `ideas/data/` に受領済み(142日分、取得時刻は毎朝4時台)。

## 未確認事項

- `qiita-dashboard` の `AGENTS.md`、`src/collector.ts`、`docs/setup-gcp-github.md` は未読。
- `handoff-assets/`(GAS 版のコードと指示書)の内容。
- GitHub Actions 版のデータ(GAS 版との二重記録期間の有無)。

## 注意

- リポジトリは**非公開**。記事で参照させるなら、公開版(整理版)を用意するか、コードを記事内に必要最小限で載せる。
- `SPREADSHEET_ID`、`QIITA_TOKEN`、GCP のプロジェクト識別子、サービスアカウント名は記事に載せない。
- スプレッドシートのスクリーンショットを使う場合、個人情報やトークンの写り込みを確認する。

## 参照元

- https://github.com/rabut001/qiita-dashboard (非公開)
