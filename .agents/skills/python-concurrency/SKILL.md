---
name: python-concurrency
description: Implement robust concurrent and parallel execution in Python using ThreadPoolExecutor, ProcessPoolExecutor, asyncio, thread synchronization locks, and GIL management.
---

# Python Concurrency & Parallelism

Use this skill when building multi-threaded, multi-process, or asynchronous routines in Python to maximize throughput and eliminate race conditions.

## Decision Matrix: Threads vs Processes vs Async

| Task Characteristic | Recommended Concurrency Model | Primary Mechanism |
| :--- | :--- | :--- |
| **I/O Bound (HTTP, DB, Disk, Network)** | Threading or AsyncIO | `ThreadPoolExecutor` or `asyncio.gather` |
| **CPU Bound (Data crunching, Image/Crypto, ML)** | Multiprocessing | `ProcessPoolExecutor` (Bypasses the GIL) |
| **High Concurrency Micro-tasks (Web servers)** | Asynchronous event loop | `async / await` with `asyncio` |

## Core Rules & Safety

1. **Prefer `concurrent.futures` High-Level Executors**:
   - Use `with ThreadPoolExecutor(max_workers=...) as executor:` or `with ProcessPoolExecutor(...) as executor:`.
   - Use `executor.map()` for simple parallel iterables, and `executor.submit()` + `as_completed()` when individual task futures need granular error handling.

2. **Race Condition Prevention**:
   - Whenever mutable state is shared across threads (e.g. shared counters, in-memory caches), protect the critical section with a `threading.Lock()` using a context manager (`with lock:`).

3. **Multiprocessing Entry Point Guard**:
   - Every script executing `ProcessPoolExecutor` or `multiprocessing.Process` MUST be protected by `if __name__ == "__main__":` to prevent recursive fork loops on Windows/macOS.
