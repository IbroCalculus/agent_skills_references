# Python Concurrency Cheatsheet

## The Global Interpreter Lock (GIL) Rule
- In CPython, multiple native OS threads cannot execute Python bytecode in parallel.
- **I/O operations** (network requests, database queries, file reading) release the GIL, meaning `threading` and `ThreadPoolExecutor` provide massive speedups for network/disk operations.
- **CPU intensive operations** (numerical algorithms, data transformation) do NOT release the GIL. Use `ProcessPoolExecutor` or libraries with C extensions (NumPy, Polars) for true multicore parallelism.

## Context Management
Always manage executors with context managers:
```python
from concurrent.futures import ThreadPoolExecutor

with ThreadPoolExecutor(max_workers=8) as executor:
    results = list(executor.map(worker_fn, data_list))
```
