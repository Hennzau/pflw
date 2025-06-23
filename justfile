clean:
    uv venv

sync:
    uv sync --no-install-project

init: sync

build:
    maturin develop --uv

run: build
    uv run --no-sync pydf
