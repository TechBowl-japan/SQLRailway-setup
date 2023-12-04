# SQLRailway setup

SQLRailwayに取り組む際のSQLのインストールなどのセットアップのスクリプト

## 環境構築

### 1. dockerコンテナの立ち上げ

ColaboratoryのDockerイメージを使うのでDockerが必須です。

```shell
docker compose up -d --wait

// or

task up
```

コンテナが立ち上がるまで結構時間かかります。

### 2. Colaboratoryのノートブックからローカルランタイムに接続

> [!TIP]
>
> ローカルランタイムへの接続
>
> 公式Docs: https://research.google.com/colaboratory/local-runtimes.html

[GoogleColaboratoryのノートブックを新規作成](https://colab.research.google.com/?hl=ja#create=true)

※既にcolaboratoryのファイルを作成済でそっちを使う場合はそれで問題ないです。

Colaboratoryをローカルのランタイムと接続します。



```shell
docker logs sql_railway_setup_container

// or

task logs
```

ログに認証に使用する初期バックエンド URL(`http://127.0.0.1:9000/?token={token}` の形式)が表示されるのでそれをコピーします。

Colab で、[接続] ボタンをクリックして [ローカル ランタイムに接続...] を選択します。表示されたダイアログに、前のステップでコピーしておいたポートを入力して [接続] ボタンをクリックします。これでローカル ランタイムに接続されます。

### 3. セットアップスクリプトの実行

セルに下記コマンドを追加して実行します

```shell
!sudo sh ./SQLRailway-setup/setup.sh
%load_ext sql
%sql mysql+pymysql://root:root@localhost:3306/sql_railway
```

## その他

あるとちょっと便利なツール
- [Task](https://taskfile.dev/ja-JP/)
