# CLAUDE.md

このファイルはClaude Codeがこのリポジトリで作業する際のガイダンスを提供します。

## 最初に読むべきドキュメント

**必ず最初に以下のドキュメントを読み込んでください:**

1. `LEARNING_PLAN.md` - 6ヶ月の学習計画（目標と全体像）
2. `PROGRESS.md` - 現在の進捗と成果物の対応表
3. `docs/adr/` - 技術的判断の記録（Architecture Decision Records）

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

## カスタムスラッシュコマンド

学習管理用のカスタムコマンドが用意されています。

| コマンド | 用途 | 説明 |
|----------|------|------|
| `/review` | 進捗レビュー | 現在のPhaseと完了率、成果物を確認 |
| `/sync-progress` | 進捗同期 | ファイル構造からPROGRESS.mdを自動更新 |
| `/next-task` | 次タスク提案 | 依存関係を考慮して次にやるべきことを推奨 |
| `/adr-create` | ADR作成 | 技術判断を対話形式で記録 |
| `/weekly-report` | 週次レポート | 今週の成果をサマリー生成 |

**推奨ワークフロー:**
1. **毎日の開始時**: `/next-task` で今日やることを確認
2. **技術判断時**: `/adr-create` で理由を記録
3. **作業後**: `/sync-progress` で進捗を反映
4. **週末**: `/weekly-report` で振り返り
5. **定期的に**: `/review` で全体進捗を確認

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
├── .claude/
│   └── commands/       # カスタムスラッシュコマンド
├── CLAUDE.md           # このファイル
├── LEARNING_PLAN.md    # 学習計画（目標）
├── PROGRESS.md         # 進捗管理（実績）
├── README.md           # プロジェクト説明
├── Makefile            # タスクランナー
├── pyproject.toml      # 依存性管理
├── src/                # アプリケーションコード
├── tests/              # テストコード
├── docker/             # Docker関連ファイル
├── terraform/          # IaCコード
└── docs/
    ├── adr/            # Architecture Decision Records
    ├── performance/    # パフォーマンスレポート
    └── benchmarks/     # ベンチマーク結果
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
2. **タスク完了時は必ず PROGRESS.md を更新する**
3. **重要な技術判断は ADR として記録する**
4. パフォーマンス計測は数値で記録する
5. セキュリティベストプラクティスを常に意識する
6. コードには適切なコメントと型ヒントを付ける
7. テストカバレッジを意識する（目標: 80%以上）
8. PRを作成する前に全チェック（lint、型、テスト）を通す
9. 大きな変更は小さなPRに分割する

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
