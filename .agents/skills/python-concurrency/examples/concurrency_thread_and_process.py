from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor, as_completed
import math
import threading
import time


# === I/O Bound Example with Thread Safety ===
class SafeCounter:
    def __init__(self):
        self.count = 0
        self.lock = threading.Lock()

    def increment(self):
        with self.lock:
            current = self.count
            time.sleep(0.001)  # Simulate I/O latency
            self.count = current + 1


def fetch_url(url: str) -> dict:
    time.sleep(0.05)  # Simulate network latency
    return {"url": url, "status": 200}


# === CPU Bound Example (Bypasses GIL) ===
def compute_heavy_factorials(n: int) -> int:
    return sum(math.factorial(i % 20) for i in range(n))


if __name__ == "__main__":
    # 1. ThreadPoolExecutor for I/O
    urls = [f"https://api.example.com/item/{i}" for i in range(10)]
    with ThreadPoolExecutor(max_workers=5) as executor:
        futures = {executor.submit(fetch_url, url): url for url in urls}
        for future in as_completed(futures):
            res = future.result()
            print("Fetched:", res)

    # 2. ProcessPoolExecutor for CPU
    numbers = [200000, 300000, 400000]
    with ProcessPoolExecutor(max_workers=3) as process_pool:
        results = list(process_pool.map(compute_heavy_factorials, numbers))
        print("CPU Computed Results:", len(results))
