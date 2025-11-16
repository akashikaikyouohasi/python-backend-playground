# ADR作成支援

新しいArchitecture Decision Record（ADR）を作成します。

## 引数

$ARGUMENTS

引数がない場合は、対話形式で以下の情報を収集してください。

## 収集する情報

1. **タイトル**: 何についての決定か（例: 「FastAPIフレームワークの採用」）

2. **コンテキスト**: なぜこの決定が必要か
   - 現在の問題
   - 制約条件
   - 関連する要件

3. **検討した選択肢**: 最低2つ
   - 各選択肢の概要
   - メリット
   - デメリット

4. **決定**: どの選択肢を採用するか

5. **理由**: なぜその選択肢を選んだか

6. **影響**: この決定による影響
   - ポジティブな影響
   - ネガティブな影響
   - トレードオフ

## 実行手順

1. `docs/adr/` の既存ADRを確認し、次の番号を決定
2. `docs/adr/000-template.md` をテンプレートとして使用
3. 収集した情報でADRを作成
4. `docs/adr/README.md` のADR一覧を更新
5. PROGRESS.mdに関連するタスクがあれば、メモ欄に「ADR参照」を追記

## ファイル命名

```
NNN-kebab-case-title.md
```

例:
- `001-use-fastapi-framework.md`
- `002-database-schema-design.md`
- `003-jwt-authentication-strategy.md`

## 出力

1. 作成するADRの内容を表示
2. 確認後、ファイルを作成
3. README.mdを更新
4. 作成完了メッセージ
