# Python DataFlow (PyDF) - A Python library for data processing and transformation

# Usage

Create a new python package with 3.13t:
```bash
mkdir my_app && cd my_app
uv init --bare
uv python install 3.13t
uv python pin 3.13t
```

Add pflw dependency:
```bash
uv add pflw
```

Create a new dataflow file at `src/my_app1.py`:
```Python
import pflw

class Dataflow:
    def __init__(self):
        pass

    def description(self) -> pflw.Description:
        return pflw.Description(
            nodes=[
                ("timer", pflw.std.Timer, {"frequency": 1.0}),
                ("printer", pflw.std.Printer )
            ],
            flows=[
                ("timer/out", "printer/in")
            ],
        )
```

Run the dataflow
```bash
uv run pflw src/my_app1.py
```
