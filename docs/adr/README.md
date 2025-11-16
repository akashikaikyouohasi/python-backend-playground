# Architecture Decision Records (ADR)

このディレクトリには、プロジェクトにおける重要な技術的判断を記録します。

## ADRとは

ADR（Architecture Decision Record）は、重要なアーキテクチャ上の決定とその理由を文書化したものです。

**記録する内容:**
- 何を決定したか
- なぜその決定をしたか
- どのような選択肢を検討したか
- 決定による影響

## ファイル命名規則

```
NNN-title-with-dashes.md
```

例:
- `001-use-fastapi-framework.md`
- `002-database-schema-design.md`
- `003-caching-strategy.md`

## ADRのステータス

- **Proposed** - 提案中、レビュー待ち
- **Accepted** - 採用、実装予定または実装中
- **Deprecated** - 非推奨、新しいADRで置き換え
- **Superseded** - 別のADRで置き換え済み

## ADR一覧

| 番号 | タイトル | ステータス | 日付 |
|------|----------|------------|------|
| [000](./000-template.md) | ADRテンプレート | Accepted | - |

_(新しいADRを追加したらここに記載)_

## 参考リンク

- [ADR GitHub Organization](https://adr.github.io/)
- [Documenting Architecture Decisions - Michael Nygard](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
