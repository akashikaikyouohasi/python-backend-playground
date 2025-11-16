# CLAUDE.md

このファイルはClaude Codeがこのリポジトリで作業する際のガイダンスを提供します。

## 最初に読むべきドキュメント

**必ず最初に `LEARNING_PLAN.md` を読み込んでください。**

このプロジェクトはPythonバックエンド開発の学習用リポジトリです。学習計画に沿った支援を行ってください。

## プロジェクト概要

- **目的**: SREエンジニアがPythonバックエンド開発スキルを習得する
- **重点分野**: DBパフォーマンスチューニング、API設計、オブザーバビリティ
- **技術スタック**: FastAPI、PostgreSQL、Redis、AWS ECS
- **期間**: 6ヶ月の学習計画

## よく使うコマンド

プロジェクトのコマンドはMakefileで管理します。

```bash
# 環境セットアップ
make install

# 開発サーバー起動
make run

# テスト実行
make test
make test-cov  # カバレッジ付き

# コード品質チェック
make lint      # Ruffでlint
make format    # Ruffでformat
make typecheck # Pyrightで型チェック
make check     # lint + typecheck + test を全部実行

# DBマイグレーション
make migrate        # マイグレーション実行
make migrate-create # 新規マイグレーション作成

# Docker環境
make up    # PostgreSQL、Redis起動
make down  # Docker環境停止

# クリーンアップ
make clean  # キャッシュ削除

# パッケージ追加（直接uvを使用）
uv add fastapi
uv add --dev pytest  # 開発依存
```

**Makefileを使う理由:**
- 短いコマンドで複雑な操作を実行
- チーム全体で統一されたワークフロー
- `make check` で CI相当のチェックをローカルで実行

## コーディング規約

- 型ヒントを必ず使用する
- Pydanticでデータバリデーション
- Ruffでlint/format
- Pyrightで型チェック
- pytestでテスト
- 関数・クラスにはdocstringを書く
- 変数名は明確で説明的に（省略形を避ける）
- 1ファイル300行以下を目安に
- インポートは標準ライブラリ → サードパーティ → ローカルの順

## ディレクトリ構造（予定）

```
.
├── CLAUDE.md           # このファイル
├── LEARNING_PLAN.md    # 学習計画
├── README.md           # プロジェクト説明
├── Makefile            # タスクランナー
├── pyproject.toml      # 依存性管理
├── src/                # アプリケーションコード
├── tests/              # テストコード
├── docker/             # Docker関連ファイル
├── terraform/          # IaCコード
└── docs/               # ドキュメント
```

## コミットメッセージ規約

```
<type>: <subject>

<body>
```

**Type:**
- `feat`: 新機能
- `fix`: バグ修正
- `refactor`: リファクタリング
- `test`: テスト追加・修正
- `docs`: ドキュメント
- `chore`: ビルド、設定変更
- `perf`: パフォーマンス改善

**例:**
```
feat: インシデント作成APIを実装

- POST /api/v1/incidents エンドポイント追加
- Pydanticモデルでバリデーション
- 重要度とステータスの初期値設定
```

## 禁止事項・避けるべきパターン

- **絶対禁止**
  - 機密情報（パスワード、APIキー）のハードコーディング
  - SQLの文字列結合（SQLインジェクション脆弱性）
  - `# type: ignore` の乱用
  - テストなしの本番デプロイ

- **避けるべき**
  - `Any` 型の多用
  - グローバル変数
  - 巨大な関数（50行以上）
  - 過度なネスト（3段階以上）
  - マジックナンバー/マジックストリング

## 環境変数

```bash
# .env.example
DATABASE_URL=postgresql+asyncpg://user:pass@localhost:5432/dbname
REDIS_URL=redis://localhost:6379/0
SECRET_KEY=your-secret-key-here
DEBUG=true
LOG_LEVEL=INFO
```

**注意**: `.env` ファイルは `.gitignore` に含め、コミットしない

## 作業時の注意事項

1. 学習計画のPhaseに沿って段階的に進める
2. パフォーマンス計測は数値で記録する
3. セキュリティベストプラクティスを常に意識する
4. コードには適切なコメントと型ヒントを付ける
5. テストカバレッジを意識する（目標: 80%以上）
6. PRを作成する前に全チェック（lint、型、テスト）を通す
7. 大きな変更は小さなPRに分割する

## トラブルシューティング

**よくある問題:**

- **DB接続エラー**: `make up` でDocker環境が起動しているか確認
- **Import エラー**: `make install` を再実行
- **型エラー**: `make typecheck` または `uv run pyright src` で詳細確認
- **テスト失敗**: `uv run pytest -xvs` で詳細出力
- **PRを出す前**: 必ず `make check` を実行して全チェックを通す

## 学習記録

重要な学びや決定事項はここに追記:

- (日付) 学んだこと、決定事項を記録
