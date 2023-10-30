# バージョン
Flutter のバージョン管理に[fvm](https://github.com/leoafarias/fvm)を使用します。
`fvm install`で`.fvm/fvm_config.json`に指定されている Flutter バージョンがインストールされます。
基本的にはstableなバージョンを使用します。（2023/10/24現在で`3.13.8`）

# アプリの実行
```
fvm flutter run -d {端末の指定}
```

# PR前のチェック
## Formatter
```bash
fvm dart format .
```

## Linter
### コードの解析
```bash
fvm flutter analyze
```

### 自動修正
```bash
fvm dart fix --apply 
```

### テスト
```bash
fvm flutter test
```

# コーディング規約
## 命名
- ディレクトリ・ファイル名は単数系
- ファイル名とクラス名を一致させる
- 複数系の場合は、suffix に `_list` をつける

## ディレクトリ構成
- entity
  - データクラス
- page
  - 画面の表示
  - ルーティングで使う Widget は、suffix に`_page`をつける
  - widget
    - 汎用の widget
  - 各ページ内
    - presenter
      - presenter と state を置く
    - widget
      - 各ページ内の Widget
- gateway
  - データ取得クラス
  - APIリクエストを行う

# freezed変更時
```bash
fvm dart run build_runner build --delete-conflicting-outputs
```
