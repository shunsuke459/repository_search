# バージョン
Flutter のバージョン管理に[fvm](https://github.com/leoafarias/fvm)を使用します。
`fvm install`で`.fvm/fvm_config.json`に指定されている Flutter バージョンがインストールされます。
基本的にはstableなバージョンを使用します。（2023/10/24現在で`3.13.8`）

# PR前のチェック
## Formatter
```bash
dart format .
```

## Linter
### コードの解析
```bash
dart analyze
```

### 自動修正
```bash
dart fix --apply 
```