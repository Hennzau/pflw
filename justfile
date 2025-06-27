set quiet

clean:
    rm -rf .venv
    cargo clean

init:
    uv python install

sync:
    uv sync --no-install-project --managed-python --link-mode symlink

format:
    uv run --no-sync ruff format

check:
    uv run --no-sync ruff check

build: sync
    uv run --no-sync maturin develop

run: format build
    uv run --no-sync pydf

jrun:
    uv run --no-sync pydf

test: format build
    uv run --no-sync pytest tests

jtest:
    uv run --no-sync pytest tests
