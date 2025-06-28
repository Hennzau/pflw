import pflw.std


class Dataflow:
    def __init__(self):
        pass

    def description(self) -> pflw.Description:
        return pflw.Description(
            nodes=[
                ("timer", pflw.std.Timer, {"frequency": 1.0}),
                ("printer", pflw.std.Printer, {}),
            ],
            flows=[("timer/out", "printer/in")],
        )
