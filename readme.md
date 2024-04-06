# grepmsfile

#### MS OfficeのファイルやPDFを検索できる仕組の提案

Excel, Word, PowerPointファイルやpdfファイルは検索が難しい。複数のファイルや複数階層のディレクトリにあるファイル群のどのファイルに目的の文字列があるかを検索できない。

そのため、各ファイルを一度テキストに変換し検索対象のディレクトリ構造のファイルを作りそのテキストファイルを検索する。

## テキストファイル作成手順

### 1. 事前準備

必要とされるパッケージ

#####  1. bash

Mac, Linuxをお使いの場合はインストールする必要ありません。
Windowsをお使いの場合Git for Windowsをインストールしましょう。

#####  2. java
 Apache Tikaを実行するために必要です。

##### 3. Apache Tika

[Apache Tika](https://tika.apache.org/) 色々なフォーマットのファイルからメタ情報やテキストを取得できます。

[download](https://tika.apache.org/download.html)から
tika-app-x.x.x.jar をダウンロードし、任意のパス (usr/local/libなど) に配置。これを実行できるようにシェルを作ります。パスも通しておきましょう。

**~/bin/tika.sh**

```
#!/bin/sh
java -jar /usr/local/lib/tika-app-x.x.x.jar --text $@
```

### 2. Officeファイル群からテキストファイルを作成

本、リポジトリをcloneし、リポジトリのディレクトリ内で次のコマンドを実行してください。

bin/rmktxt.sh <target_dir> <text_dir>

* **target_dir** Officeファイルのディレクトリ
* **text_dir** テキストファイルを保存するディレクトリ

### 3. grepで検索する

grep -r keyword <text_dir>



