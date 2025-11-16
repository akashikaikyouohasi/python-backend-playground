# Python バックエンド学習計画（6ヶ月）

## 概要

SREとしてのバックグラウンドを活かし、パフォーマンスチューニングとDB設計を重点的に学ぶ実践的な学習計画。

**目標**: SRE業務の効率化と質の向上、特にパフォーマンス周りのスキル強化

**学習時間**: 毎日最低1時間（週7時間以上）

---

## 推奨技術スタック

| カテゴリ | 技術 | 理由 |
|---------|------|------|
| フレームワーク | **FastAPI** | 型ヒントベース、非同期対応、高パフォーマンス、自動ドキュメント生成 |
| ORM | SQLAlchemy 2.0 | async対応、成熟したエコシステム |
| マイグレーション | Alembic | SQLAlchemy標準、バージョン管理が容易 |
| バリデーション | Pydantic | FastAPIとの統合、型安全性 |
| 依存性管理 | **uv** | 超高速（Rust製）、モダンな依存性管理、lockファイル対応 |
| Linter/Formatter | Ruff + Pyright | 高速、厳格な型チェック |
| DB | PostgreSQL | 高性能、拡張性、豊富な最適化オプション |
| キャッシュ | Redis | 高速、多様なデータ構造対応 |
| 非同期処理 | FastAPI BackgroundTasks + SQS | 軽量タスクはBackgroundTasks、重いタスクはSQS+Worker |
| ログ | structlog | 構造化ログ、JSON出力対応 |
| トレーシング | OpenTelemetry | ベンダー中立、標準化 |

---

## 実践プロジェクト: SRE向けインシデント管理システム

### プロジェクト選定理由

- 業務に直結する実用的なシステム
- CRUD、認証、非同期処理、パフォーマンス要件をすべてカバー
- 本番運用を想定した設計が必要
- SREとしての知識を活かせる

### 主要機能

1. **インシデント管理**
   - インシデント登録・更新・クローズ
   - 重要度・ステータス管理
   - タイムライン記録

2. **ユーザー管理**
   - 認証（JWT）
   - 権限制御（RBAC）
   - チーム管理

3. **分析・レポート**
   - メトリクス集計
   - ダッシュボード
   - SLI/SLO追跡

4. **通知システム**
   - 非同期通知処理
   - Slack/Email連携
   - エスカレーション

5. **監査・コンプライアンス**
   - 監査ログ
   - 変更履歴追跡

---

## Phase 1: 基盤構築（1ヶ月目）

### Week 1-2: 開発環境とPython基礎強化

#### 目標
- モダンなPython開発環境の構築
- 型システムとPydanticの理解
- コード品質ツールの導入

#### タスク

**開発環境**
- [ ] uvのセットアップ（`curl -LsSf https://astral.sh/uv/install.sh | sh`）
- [ ] `uv init` でプロジェクト初期化
- [ ] pyproject.tomlの設定
- [ ] Docker Compose環境構築（PostgreSQL、Redis）
- [ ] VS Code/PyCharm設定最適化

**Python基礎強化**
- [ ] 型ヒント（typing モジュール）
- [ ] ジェネリクス、Protocol、TypeVar
- [ ] Pydanticモデル定義
- [ ] データクラスとPydanticの使い分け
- [ ] デコレータパターン

**コード品質**
- [ ] pre-commitフック設定
- [ ] Ruff（linter/formatter）導入
- [ ] Pyright（型チェック）導入
- [ ] pytest基本設定
- [ ] Makefile作成（タスクランナー）
  - `make install`, `make test`, `make lint`, `make check` など

#### 成果物
- 開発環境が整ったプロジェクトスケルトン
- Makefile（統一されたコマンド体系）
- サンプルPydanticモデル
- CI用の設定ファイル

### Week 3-4: FastAPI基礎とDB設計

#### 目標
- FastAPIの基本構造理解
- SQLAlchemy 2.0での非同期DB操作
- PostgreSQLの基本設計

#### タスク

**FastAPI基礎**
- [ ] プロジェクト構造設計
- [ ] ルーティングとエンドポイント
- [ ] 依存性注入（Depends）
- [ ] リクエスト/レスポンスモデル
- [ ] 自動ドキュメント（Swagger UI）

**データベース**
- [ ] SQLAlchemy 2.0 asyncセットアップ
- [ ] モデル定義（Declarative Base）
- [ ] リレーションシップ設計
- [ ] Alembicマイグレーション設定
- [ ] PostgreSQL正規化（1NF〜3NF）
- [ ] 基本インデックス設計

**CRUD実装**
- [ ] インシデントCRUD API
- [ ] ページネーション
- [ ] フィルタリング・ソート

#### 成果物
- 基本的なCRUD API
- PostgreSQLとの接続
- マイグレーションスクリプト

---

## Phase 2: 実装深掘り（2-3ヶ月目）

### Month 2: API設計とアーキテクチャ

#### 目標
- RESTful API設計の習得
- クリーンなコードアーキテクチャ
- SOLID原則の実践

#### タスク

**API設計**
- [ ] RESTful設計原則
- [ ] HTTPメソッドとステータスコードの適切な使用
- [ ] エラーハンドリング標準化（RFC 7807）
- [ ] APIバージョニング戦略（URL/Header）
- [ ] ペイロード設計ガイドライン

**アーキテクチャパターン**
- [ ] リポジトリパターン実装
- [ ] サービスレイヤー分離
- [ ] 依存性注入の活用
- [ ] ユースケース設計
- [ ] DTOパターン

**SOLID原則**
- [ ] 単一責任の原則（SRP）
- [ ] 開放閉鎖の原則（OCP）
- [ ] リスコフの置換原則（LSP）
- [ ] インターフェース分離の原則（ISP）
- [ ] 依存性逆転の原則（DIP）

#### 成果物
- リファクタリングされたクリーンなコードベース
- API設計ドキュメント
- エラーレスポンス標準

### Month 3: 認証・セキュリティ

#### 目標
- JWT認証の実装
- 権限管理システムの構築
- セキュリティベストプラクティス

#### タスク

**認証**
- [ ] JWTトークン生成・検証
- [ ] アクセストークン・リフレッシュトークン
- [ ] パスワードハッシュ（bcrypt/argon2）
- [ ] ログイン/ログアウトフロー

**認可**
- [ ] RBAC（Role-Based Access Control）
- [ ] パーミッションシステム
- [ ] FastAPI依存性での権限チェック
- [ ] リソースベースアクセス制御

**OWASP Top 10対策**
- [ ] A01: アクセス制御の不備
- [ ] A02: 暗号化の失敗
- [ ] A03: インジェクション（SQL、NoSQL）
- [ ] A04: 安全でない設計
- [ ] A05: セキュリティ設定ミス
- [ ] A06: 脆弱なコンポーネント
- [ ] A07: 認証の失敗
- [ ] A08: ソフトウェアとデータの整合性
- [ ] A09: ログとモニタリングの不足
- [ ] A10: SSRF

**具体的対策**
- [ ] 入力バリデーション強化
- [ ] SQLインジェクション防止（パラメータ化クエリ）
- [ ] XSS対策（出力エスケープ）
- [ ] CSRF対策
- [ ] Rate Limiting
- [ ] セキュリティヘッダー設定

#### 成果物
- 完全な認証システム
- 権限管理機能
- セキュリティチェックリスト

---

## Phase 3: パフォーマンスとオブザーバビリティ（4-5ヶ月目）

### Month 4: DBパフォーマンスチューニング（重点フェーズ）

#### 目標
- PostgreSQLクエリ最適化
- キャッシュ戦略の実装
- パフォーマンス計測と改善

#### タスク

**PostgreSQL最適化**
- [ ] EXPLAIN ANALYZEの読み方
- [ ] クエリプラン理解
- [ ] シーケンシャルスキャン vs インデックススキャン
- [ ] インデックス戦略
  - [ ] B-treeインデックス
  - [ ] GINインデックス（全文検索）
  - [ ] GiSTインデックス（地理空間）
  - [ ] 部分インデックス
  - [ ] 複合インデックス
- [ ] パーティショニング（Range、List、Hash）
- [ ] テーブル統計の理解（ANALYZE）
- [ ] バキューム戦略
- [ ] pg_stat_statementsの活用
- [ ] pgBadgerでのログ分析

**SQLAlchemy最適化**
- [ ] N+1問題の検出と解決
- [ ] Eager Loading（joinedload、selectinload）
- [ ] クエリ最適化
- [ ] バッチ処理
- [ ] 非同期処理の効率化

**コネクション管理**
- [ ] コネクションプーリング（asyncpg）
- [ ] プールサイズ最適化
- [ ] コネクションライフサイクル
- [ ] デッドロック回避

**キャッシュ戦略**
- [ ] Redis/ElastiCache導入
- [ ] キャッシュパターン（Cache-Aside、Write-Through）
- [ ] TTL戦略
- [ ] キャッシュ無効化
- [ ] 分散キャッシュ考慮事項

**読み書き分離**
- [ ] リードレプリカ活用
- [ ] 読み取りクエリの分散
- [ ] レプリケーションラグ対応

#### 成果物
- パフォーマンス改善レポート（Before/After）
- インデックス設計ドキュメント
- キャッシュ戦略ドキュメント
- ベンチマーク結果

### Month 5: オブザーバビリティと負荷試験

#### 目標
- 完全な可観測性の実現
- 負荷試験による性能検証
- SLI/SLO定義

#### タスク

**構造化ロギング**
- [ ] structlog導入
- [ ] JSONログフォーマット
- [ ] コンテキスト情報付与
- [ ] ログレベル戦略
- [ ] リクエストID追跡
- [ ] センシティブデータマスキング

**分散トレーシング**
- [ ] OpenTelemetry SDK導入
- [ ] スパン作成とコンテキスト伝播
- [ ] カスタム計装
- [ ] Jaeger/Zipkinでの可視化
- [ ] NewRelic連携設定

**メトリクス**
- [ ] Prometheus形式メトリクス
- [ ] REDメトリクス（Rate、Error、Duration）
- [ ] カスタムビジネスメトリクス
- [ ] Grafanaダッシュボード
- [ ] アラート設定

**負荷試験**
- [ ] Locustスクリプト作成
- [ ] シナリオ設計（通常/ピーク/スパイク）
- [ ] 性能ベースライン測定
- [ ] ボトルネック特定手法
- [ ] 負荷試験レポート作成

**SLI/SLO**
- [ ] SLI定義（可用性、レイテンシ、スループット）
- [ ] SLO目標設定
- [ ] エラーバジェット計算
- [ ] アラート閾値設定
- [ ] SLOダッシュボード

#### 成果物
- 完全に計装されたシステム
- Grafanaダッシュボード
- 負荷試験レポート
- SLI/SLO定義書

---

## Phase 4: 本番運用（6ヶ月目）

### Week 1-2: CI/CDとデプロイ

#### 目標
- 自動化されたCI/CDパイプライン
- AWSインフラのIaC化
- ECSへのデプロイ

#### タスク

**CI/CD**
- [ ] GitHub Actions設定
  - [ ] Lint/Type check
  - [ ] ユニットテスト
  - [ ] 統合テスト
  - [ ] セキュリティスキャン
  - [ ] Docker イメージビルド
- [ ] テストカバレッジレポート
- [ ] 自動マージルール

**Terraformインフラ**
- [ ] VPC/サブネット設計
- [ ] ECSクラスター
- [ ] Fargateタスク定義
- [ ] ALB設定
- [ ] RDS PostgreSQL
- [ ] ElastiCache Redis
- [ ] CloudWatch Logs
- [ ] IAMロール/ポリシー

**設定管理**
- [ ] Secrets Manager（機密情報）
- [ ] Parameter Store（設定値）
- [ ] 環境変数管理
- [ ] 設定の12-Factor App準拠

#### 成果物
- 完全なCI/CDパイプライン
- Terraformモジュール
- AWS上の稼働環境

### Week 3-4: 発展的トピック

#### 目標
- 非同期処理の実装
- 高度なデプロイ戦略
- マイクロサービス基礎

#### タスク

**非同期処理**
- [ ] FastAPI BackgroundTasks
  - [ ] 軽量タスクの実装（通知送信、ログ記録など）
  - [ ] 使いどころの理解
- [ ] SQS + Worker パターン
  - [ ] aiobotocore/boto3でのSQS操作
  - [ ] メッセージ送信（Producer）
  - [ ] Workerプロセスの実装（Consumer）
  - [ ] ECSタスクまたはLambdaでのWorker実行
- [ ] 非同期パターン（Fan-out、Saga）

**メッセージキュー（SQS/SNS）**
- [ ] SQSキュー設計
  - [ ] Standard Queue vs FIFO Queue
  - [ ] Visibility Timeout設定
  - [ ] メッセージ属性の活用
- [ ] Dead Letter Queue（DLQ）
  - [ ] 失敗メッセージの管理
  - [ ] リトライ戦略
- [ ] SNS連携（Pub/Sub）
- [ ] CloudWatchでのキュー監視
- [ ] イベント駆動アーキテクチャ基礎

**デプロイ戦略**
- [ ] Blue/Greenデプロイ
- [ ] カナリアリリース
- [ ] Feature Flags
- [ ] ロールバック戦略

**マイクロサービス入門**
- [ ] サービス分割の考え方
- [ ] API Gateway パターン
- [ ] サービス間通信
- [ ] 分散トランザクション基礎

#### 成果物
- SQS + Workerによる非同期処理システム
- 高度なデプロイ設定
- マイクロサービス設計ドキュメント

---

## 推奨リソース

### 書籍

**必読**
- 『SQLパフォーマンス詳解』- DB最適化の必読書
- 『詳解PostgreSQL』- PostgreSQL深掘り
- 『Clean Architecture』- Robert C. Martin

**推奨**
- 『Building Microservices』- Sam Newman
- 『Designing Data-Intensive Applications』- Martin Kleppmann
- 『The SRE Book』- Google（無料オンライン版あり）

### オンラインリソース

**ドキュメント**
- [FastAPI公式](https://fastapi.tiangolo.com/) - 非常に良質
- [uv公式](https://docs.astral.sh/uv/) - 依存性管理ツール
- [SQLAlchemy 2.0](https://docs.sqlalchemy.org/)
- [PostgreSQL公式](https://www.postgresql.org/docs/)
- [Pydantic](https://docs.pydantic.dev/)

**コース・チュートリアル**
- [testdriven.io](https://testdriven.io) - FastAPI実践コース（有料）
- [Use The Index, Luke](https://use-the-index-luke.com/) - インデックス設計（無料）
- [FastAPI Full Stack Template](https://github.com/tiangolo/full-stack-fastapi-template) - 参考実装

**ツール**
- pgBadger - PostgreSQLログ分析
- pgAdmin / DataGrip - DBクライアント
- Postman / Insomnia - APIテスト
- k6 / Locust - 負荷試験

---

## 学習の進め方

### 毎週のルーティン（7時間以上）

| 曜日 | 活動 | 時間 |
|------|------|------|
| 月〜木 | コーディング実践 | 1時間×4日 |
| 金 | ドキュメント・書籍読み込み | 1時間 |
| 土 | 振り返り・リファクタリング | 1時間 |
| 日 | 次週計画・学習記録更新 | 1時間 |

### 重要なポイント

1. **動くものを作り続ける**
   - 各Phaseで必ず動作するものを完成させる
   - 完璧を目指さず、イテレーティブに改善
   - 「Done is better than perfect」

2. **記録を残す**
   - GitHubでコード管理
   - PRを自分で作成・レビュー
   - READMEに学んだことを記録
   - パフォーマンス計測は数値で記録

3. **SRE経験を活かす**
   - インフラ知識をアプリ設計に反映
   - 運用観点での設計判断
   - 障害シナリオを想定した実装
   - モニタリングファーストの思考

4. **Makefileを活用する**
   - `make check` でCI相当のチェックをローカル実行
   - PRを出す前に必ず全チェックを通す
   - 新しいタスクはMakefileに追加して統一

5. **AIツールの活用**
   - GitHub Copilotでの効率的コーディング
   - ChatGPT/Claudeでの問題解決
   - コードレビューの補助
   - ドキュメント生成

### 進捗管理

- [ ] Phase 1完了（1ヶ月目）
- [ ] Phase 2完了（3ヶ月目）
- [ ] Phase 3完了（5ヶ月目）
- [ ] Phase 4完了（6ヶ月目）

---

## 次のアクション

1. uvをインストール（`curl -LsSf https://astral.sh/uv/install.sh | sh`）
2. `uv init` でプロジェクト初期化
3. Makefile作成（タスクランナー）
4. Docker Compose設定（PostgreSQL、Redis）
5. Week 1のタスクを開始

---

## 備考

- この計画は固定ではなく、進捗に応じて調整すること
- 詰まった場合は早めに方向転換
- 興味のある分野は深掘りしてOK
- SREとしての実務に応用できる部分を優先
