# Supabase の SECURITY DEFINER 関数を CI で検査する

状態: アイディア(未着手。主張の再現が前提)
作成日: 2026-11-08

## 一言

`our-mahjong-history` の `supabase/ci/` にある、SECURITY DEFINER 関数の検査を CI に組み込む方法。手順系の記事で、ストックされやすい型。

## 想定読者

- Supabase(PostgreSQL + RLS)で、RPC 関数(`SECURITY DEFINER`)を使う人

## 材料(読了:`check-definer-auth-uid.sql`、`check-definer-grants.sql`、`allowlist.json`、`ci.yml` の一部)

- `check-definer-auth-uid.sql`:`public` / `private` の SECURITY DEFINER 関数(sql / plpgsql)を全件検査する。
  - 本体で `auth.uid()` を使っているか。
  - ユーザーIDを引数に取っていないか(禁止する引数名は設定で渡す)。
  - 除外は設定で指定する。
- `check-definer-grants.sql`:`anon` / `authenticated` の EXECUTE 権限を検査する。`anon` は許可リストでも除外しない。`authenticated` は許可リスト(`allowlist.json`)にある関数のみ可。
- `ci.yml` の `db` ジョブ:`supabase db lint`(warning で失敗)、セキュリティ advisors、上記の検査、`supabase test db`、PostgREST のスモークテスト。

## 要点になりうる主張(未検証)

`check-definer-grants.sql` のコメント:

> `supabase db advisors` の 0028/0029 は `pgrst.db_schemas` 依存で、CLI 接続では空になり見逃す。

**事実なら有用な知見だが、再現するまで記事では断定しない。** 再現手順:

1. 検査対象の SECURITY DEFINER 関数に `authenticated` の EXECUTE を付けた状態を作る。
2. `supabase db advisors`(CLI)の出力を確認する。
3. 自作の検査 SQL の結果と比べる。
4. Supabase のバージョンと確認日を記録する(Supabase CLI は更新が速いため)。

## 想定する構成

1. なぜ SECURITY DEFINER が危ないか(`auth.uid()` を使わない関数は、呼び出し元の権限を越える)
2. 標準の advisors で見逃すもの(再現できた場合のみ)
3. 検査 SQL の解説
4. CI への組み込み
5. 許可リストの運用

## 未確認事項

- `check-definer-auth-uid.sh`、`run-security-advisors.sh`、`postgrest-smoke.sh` は未読。
- migration 側の関数定義(`20260818120200_functions.sql`)と検査の対応。
- 同種の記事の有無。

## 関連

- [20261108-mahjong-db-design.md](20261108-mahjong-db-design.md)(DB設計の記事。この検査は別記事として切り出す想定)
