# ホームランダービー移植版

`homerun.swf` を [Ruffle](https://ruffle.rs/) でブラウザ再生できるようにしたローカル移植版です。

## 構成

- `index.html`: ゲーム表示ページ
- `homerun.swf`: 元の SWF
- `ruffle/`: Ruffle self-hosted package
- `play.ps1`: ローカルサーバー起動スクリプト

## 起動方法

PowerShell で以下を実行します。

```powershell
powershell -ExecutionPolicy Bypass -File .\play.ps1
```

起動後、ブラウザで `http://localhost:8000/` を開くと遊べます。

## メモ

- `file://` 直開きではなく、ローカル HTTP サーバー経由で起動します。
- Ruffle は self-hosted package を同梱しています。
