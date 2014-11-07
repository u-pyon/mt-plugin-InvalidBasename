# MT ValidBasename Plugin

This plugin provides a feature that entries can't have the same basename in the same blog.

このプラグインは同じブログの記事の中で、同じ「出力ファイル名」がある場合にエラーを表示します。

## Install（インストール）

Download and put the following directories into your Movable Type.

* `plugins/ValidBasename` to `$MT_HOME/plugins`

ソースコードをダウンロードして、上記のようにファ言うrをアップロードしてください。

## Specification（仕様）

The one of this plugin can do is to check a basename of entries that were created or updated. 

このプラグインは、記事の新規作成、更新のときに「出力ファイル名」の重複をチェックのみを行います。