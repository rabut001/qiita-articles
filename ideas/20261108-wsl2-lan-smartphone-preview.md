# WSL2 上の開発サーバを、同じ Wi-Fi のスマホから開く

状態: アイディア(未着手。スクリプトの中身は未読)
作成日: 2026-11-08

## 一言

WSL2 は NAT のため、`localhost:3000` だけでは同じ Wi-Fi のスマホから届かない。`our-mahjong-history` で実際に使った手順(Windows の管理者 PowerShell で portproxy とファイアウォールを設定し、確認後に元へ戻す)を、トラブルシュート寄りの手順記事にする。

## 想定読者

- Windows + WSL2(+ Docker / Dev Container)で Web アプリを開発し、実機のスマホで表示確認したい人

## なぜ候補にしたか

- 手元のデータで、タグ `WSL` の3本は合計28,915 views で、自作記事の中で最大の系統。環境構築・エラー解決の記事が閲覧数を取ってきた。
- ただし、**検索流入型は公開直後の伸びが遅い**傾向がある(UNION は30日で257、LINE 認証は120)。累積では強くなりうるが、短期の閲覧数は保証がない。

## 材料(`our-mahjong-history`)

- `.cursor/skills/expose-lan/SKILL.md`(読了)
  - 公開(expose)と元に戻す(unexpose)の2オプション。
  - エージェントがやること:`web/package.json` の `dev` を `--hostname 0.0.0.0` にする、`web/next.config.ts` に `allowedDevOrigins` を入れる、開発サーバを再起動する。
  - ユーザーがやること:Windows の管理者 PowerShell で `.devcontainer/expose-lan.ps1` / `unexpose-lan.ps1`。エージェントは `.ps1` を実行しない(管理者権限と portproxy / ファイアウォールが必要なため)。
- `.devcontainer/expose-lan.ps1`、`unexpose-lan.ps1`、`docs/development.md` の「同一 LAN のスマホから見る」(いずれも未読)

## 想定する切り口

- 「設定して終わり」ではなく**後始末まで**含める(公開したままだと LAN に開発サーバが露出する)。
- AI エージェントに任せる範囲と、人が管理者権限で行う範囲の線引き。

## 未確認事項

- `.ps1` の中身と、WSL2 のミラーモード等、別解の有無。
- 同種の記事がすでに多数ある可能性(競合の確認)。
- 検索需要。
- Next.js 以外(Vite 等)への一般化。

## 注意

- 実際のIPアドレス、ホスト名は記事に載せない。
- ファイアウォール規則は、戻す手順を必ず書く。
