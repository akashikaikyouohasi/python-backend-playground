## ローカル開発環境
### 環境セットアップ
まずは、uvコマンドのセットアップから行いましょう
```
# uv コマンドのインストール
curl -LsSf https://astral.sh/uv/install.sh | sh
# 動作確認
uv --version
→uv 0.9.11 (8d8aabb88 2025-11-20) のように出ればOK
```

その後に、`make init`でこの環境セットアップ

### 構成
- python実行はuv仮想環境
- DBとRedisはDocker環境


## 参考リンク
- uv
    - https://docs.astral.sh/uv/
- ruff
    - https://docs.astral.sh/ruff/
- FastAPI
    - https://fastapi.tiangolo.com/ja/
- pyright
    - https://microsoft.github.io/pyright/#/