set quiet

clean:
    rm -rf .venv
    cargo clean

sync:
    uv sync --no-install-project --managed-python --link-mode symlink

init:
    uv python install

build: sync
    maturin develop --uv

run: build
    uv run --no-sync pydf

test: build
    uv run --no-sync pytest tests
