# はじめての知識グラフ構築ガイド

「はじめての知識グラフ構築ガイド」（Jesús Barrasa (著), Jim Webber (著), 櫻井亮佑 (翻訳), 安井雄一郎 (監訳) (2024), マイナビ出版）をお手に取っていただき、ありがとうございます。

本書のサンプルコードを実行する場合は Neo4j version 5 系をご利用ください。[^1]

書籍内で発見した誤植、質問等は Issues にてお気軽にお問い合わせください。

<a href="https://amzn.asia/d/7gw1kGT">
  <img src="https://c.media-amazon.com/images/I/61Fi9c4yvoL._SL1114_.jpg" width=360 alt="はじめての知識グラフ構築ガイド"/>
</a>

## Appendix について

./appendix のコードを実行するには、[poetry を導入](https://python-poetry.org/docs/#installation) し、依存パッケージのインストールをお願いします。

```
poetry install --no-root
```

[^1]: 第 6 章で "yolo" というパスワードを前提としたコードが存在しますが、Neo4j version 5.3 以降では 8 文字以上のパスワードの設定が必要です。version 5.3 以降を利用されている場合、8 文字以上の任意のパスワードを設定した上で、"yolo" の部分を書き換えてサンプルコードを実行してください。
