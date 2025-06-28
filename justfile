set quiet

clean:
    rm -rf .venv .pytest_cache .ropeproject .ruff_cache dist
    cargo clean

init:
    uv python install

sync:
    uv sync --no-install-project --managed-python --link-mode symlink

check-gil:
    uv run --no-sync python -c "import sysconfig; print(sysconfig.get_config_var('Py_GIL_DISABLED'))"

format:
    uv run --no-sync ruff format

check:
    uv run --no-sync ruff check

build: sync
    uv run --no-sync maturin develop

release:
    uv run --no-sync maturin build --release --out dist

run: format build
    uv run --no-sync pflw

jrun:
    uv run --no-sync pflw

test: format build
    uv run --no-sync pytest tests

jtest:
    uv run --no-sync pytest tests
