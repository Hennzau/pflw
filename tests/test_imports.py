def test_import_pflw():
    import pflw

    print(pflw)


def test_import_classes():
    from pflw import Description

    print(Description)


def test_import_submodules():
    import pflw.std as pstd

    print(pstd)


def test_import_submodules_classes():
    from pflw.std import Timer, Printer

    print(Timer)
    print(Printer)
