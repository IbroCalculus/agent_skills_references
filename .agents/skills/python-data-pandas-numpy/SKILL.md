---
name: python-data-pandas-numpy
description: Process, clean, aggregate, and analyze tabular datasets using Pandas DataFrames and NumPy vectorization, covering CSV, Excel, and JSON workflows.
---

# Python Data Processing with Pandas & NumPy

Use this skill when processing tabular data, building ETL scripts, calculating statistical summaries, and handling CSV/Excel datasets in Python.

## Core Principles & Vectorization

1. **Vectorization Over Python Loops**:
   - NEVER iterate over DataFrame rows using `for index, row in df.iterrows():` for calculations.
   - Use vectorized arithmetic, NumPy functions (`np.where`, `np.select`), or `.apply()` as a last resort.

2. **Explicit Missing Data Handling**:
   - Always audit missing values: `df.isna().sum()`.
   - Explicitly handle nulls via `.dropna(subset=[...])` or `.fillna({'col': default_value})` with correct types.

3. **Chained Operations & Method Chaining**:
   - Use `.assign()`, `.query()`, and `.pipe()` for readable data transformation pipelines without intermediate mutable variable reassignment.

4. **Multi-Format I/O**:
   - Support `pd.read_csv`, `pd.read_excel(engine='openpyxl')`, and export with `index=False`.
