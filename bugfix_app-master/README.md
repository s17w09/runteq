### スライドのURL
<details><summary></summary>

```
https://docs.google.com/presentation/d/1k17529b6w1AvygcRPHnI28xqzjZWbZdcizeq8GBscDI/edit?usp=sharing
```

</details>

<br /><br />

# 環境構築
## 1. リポジトリのダウンロード
以下のURLにアクセスしてダウンロードを実行してください。
bugfix_app-master.zipのダウンロードが完了したら、解凍してください。
解答したフォルダは、任意の場所に移動してください。

```
https://github.com/runteq/bugfix_app/archive/refs/heads/master.zip
```

## 2.コンテナの起動
Docker Desktopアプリを起動してください。

ターミナルアプリを起動し、以下のコマンドを実行して解答したフォルダまで移動してください。
```
=== bugfix_app-masterのあるディレクトリまで移動してください） ===

$ cd bugfix_app-master
```

移動が完了したら、以下のコマンドを実行してください。
```
$ docker compose build
$ docker compose up
```

## 3.データベースの作成とマイグレーション
別ターミナルを開き、以下のコマンドを実行してデータベースの作成とマイグレーションを実行してください。
```
$ docker compose exec web rails db:create
$ docker compose exec web rails db:migrate
$ docker compose exec web rails db:migrate:status
```

## 4.アプリケーションの起動
ターミナルで以下のコマンドを実行してください。
```
$ docker compose exec web bundle install
$ docker compose exec web yarn install
$ docker compose exec web bin/dev
```

## 5.attachコマンドの実行
以下のコマンドを実行してください。
```
$ docker attach bugifx_app_container
```

## 6.Railsコンソールを立ち上げる
別ターミナルを開き、以下のコマンドを実行してRailsコンソールを立ち上げてください。
```
$ docker compose exec web rails c
```

## 7.ブラウザでアプリケーションにアクセス
以下のURLにアクセスしてください。
```
http://localhost:3000/
```

<br /><br /><br />

# 課題
## ポイント
- サーバーのログの見方を学ぶ
- Railsの仕組みを理解した上での仮説を立てることを学ぶ
- 1つ1つ解決していくことを学ぶ

## 内容
bugfix_appには複数のバグが存在します。
それらのバグを修正してください。

```
■ バグを解消するためのお助けツール
- ログ
- binding.pry ＆ docker attach コンテナ名
- Railsコンソール（docker compose exec web rails c）
```

## 理想
[![Image from Gyazo](https://t.gyazo.com/teams/startup-technology/58915d70b5714056cd08fd7833b141fe.gif)](https://startup-technology.gyazo.com/58915d70b5714056cd08fd7833b141fe)

## ユーザー登録ができない？
[![Image from Gyazo](https://t.gyazo.com/teams/startup-technology/34472f7fa78fefd4df2deba07c2f876d.gif)](https://startup-technology.gyazo.com/34472f7fa78fefd4df2deba07c2f876d)

## ログアウトができない？
[![Image from Gyazo](https://t.gyazo.com/teams/startup-technology/87be47641ab755807b160b3b8ec67d55.gif)](https://startup-technology.gyazo.com/87be47641ab755807b160b3b8ec67d55)

## Post編集の画面がおかしい？
[![Image from Gyazo](https://t.gyazo.com/teams/startup-technology/999939030f7988817d1ee4db586b78d0.gif)](https://startup-technology.gyazo.com/999939030f7988817d1ee4db586b78d0)

## Postを削除するとエラー画面が出る?
[![Image from Gyazo](https://t.gyazo.com/teams/startup-technology/759562375a89b39ec124fdc2aa013ce0.gif)](https://startup-technology.gyazo.com/759562375a89b39ec124fdc2aa013ce0)


<br /><br /><br /><br /><br />


### 解答コード

<details><summary></summary>

```
https://github.com/runteq/bugfix_app/archive/refs/heads/answer.zip
```

</details>
