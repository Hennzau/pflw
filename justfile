set quiet

clean:
    rm -rf .venv
    cargo clean

sync:
    uv sync --no-install-project

init: sync

build: sync
    maturin develop --uv

run: build
    uv run --no-sync pydf
