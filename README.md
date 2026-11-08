# qiita-articles

Qiita に投稿する技術記事の企画・調査・執筆・レビューを管理するリポジトリです。

## 構成

```
ideas/                アイディア(1ネタ1ファイル)
articles/<slug>/      1記事=1フォルダ(README / plan / research / draft / review / images)
public/               Qiita CLI 管理。公開する記事のみ(draft.md から生成)
templates/            テンプレート
docs/                 執筆方針、レビュー観点
```

## 流れ

1. `ideas/` にネタを書く
2. `articles/<slug>/` を作り、plan.md で企画する
3. research.md に一次情報の URL と確認日を記録する
4. draft.md を執筆する(画像は `images/` の相対パス)
5. review.md でレビューする
6. draft.md から `public/<slug>.md` を生成する(画像パスの完全 URL 化、メモ除去、検査)
7. `main` へ push すると GitHub Actions が Qiita に投稿する

`public/` に置いた記事は `main` への push で公開されます。公開前の記事を `public/` に置かないでください。
