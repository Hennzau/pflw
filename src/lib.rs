use pyo3::prelude::*;

/// Formats the sum of two numbers as string.
#[pyfunction]
fn main() {
    println!("Hello from Python ahah!");
}

/// A Python module implemented in Rust.
#[pymodule(gil_used = false)]
fn pflw(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(main, m)?)?;
    Ok(())
}
