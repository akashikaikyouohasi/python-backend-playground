
# 開発環境セットアップ
init:
	uv init 
# 開発サーバー起動
run:
	docker-compose up -d
	make migrate

# パッケージ追加
add:
	uv add $(PACKAGE)

# 各種チェック
test:
	echo "テスト実行"
	uv run pytest
test-cov:
	echo "カバレッジ付きテスト実行"
	echo "test-cov"
lint:
	echo "RuffでLint"
	uv run ruff check
	uv run ruff check --fix
format:
	echo "Ruffでformat"
	uv run ruff format
typecheck:
	echo "pyrightで型チェック"
	echo "typecheck"
check:
	echo "lint + typecheck + test を実行"
	echo "check"

# マイグレーション実行
migrate:
	echo "migrate"


# Dockerコンテナ起動・停止
start:
	docker-compose up -d --build
stop:
	docker-compose down
down:
	docker-compose down -v