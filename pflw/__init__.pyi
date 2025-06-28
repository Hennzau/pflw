from typing import Tuple

from pflw.std import Node

class Description:
    def __init__(
        self, nodes: list[Tuple[str, type[Node], dict]], flows: list[Tuple[str, str]]
    ):
        pass
