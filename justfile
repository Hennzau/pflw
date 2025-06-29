set quiet

clean:
    rm -rf .venv .pytest_cache .ropeproject .ruff_cache dist

install-maturin:
    uv tool install maturin

install-ruff:
    uv tool install ruff

install-python:
    uv python install

install-tools: install-maturin install-ruff install-python

setup: install-python
    uv sync --no-install-project --managed-python --link-mode symlink

check-gil: setup
    uv run --no-sync python -c "import sysconfig; print(sysconfig.get_config_var('Py_GIL_DISABLED'))"

install-wheel: install-maturin install-python setup
    uv run --no-sync maturin develop

check: install-ruff install-wheel
    uv run --no-sync ruff check

tests: install-wheel
    uv run --no-sync pytest tests

release: install-maturin install-python setup
    uv run --no-sync maturin build --release --out dist

sdist: install-maturin install-python setup
    uv run --no-sync maturin sdist --out dist

upload: install-maturin setup
    uv run --no-sync maturin upload --non-interactive --skip-existing dist/*

format: install-ruff setup
    uv run --no-sync ruff format
