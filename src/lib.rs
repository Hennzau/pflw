use pyo3::prelude::*;

/// Formats the sum of two numbers as string.
#[pyclass]
pub struct Description {}

#[pyclass(subclass)]
pub struct Node {}

#[pyclass(extends=Node)]
pub struct Timer {}

#[pyclass(extends=Node)]
pub struct Printer {}

/// A Python module implemented in Rust.
#[pymodule(gil_used = false)]
fn pflw(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_class::<Description>()?;

    let std = PyModule::new(m.py(), "std")?;
    std.add_class::<Node>()?;
    std.add_class::<Timer>()?;
    std.add_class::<Printer>()?;

    m.add_submodule(&std)?;

    Ok(())
}
