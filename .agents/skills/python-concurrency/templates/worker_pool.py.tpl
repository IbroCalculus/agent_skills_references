from collections.abc import Callable
from concurrent.futures import ThreadPoolExecutor, as_completed


def run_parallel_tasks(tasks: list[dict], worker_func: Callable, max_workers: int = 5) -> list[dict]:
    results = []
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        future_to_task = {executor.submit(worker_func, task): task for task in tasks}
        for future in as_completed(future_to_task):
            try:
                data = future.result()
                results.append(data)
            except Exception as exc:
                print(f"Task generated an exception: {exc}")
    return results
