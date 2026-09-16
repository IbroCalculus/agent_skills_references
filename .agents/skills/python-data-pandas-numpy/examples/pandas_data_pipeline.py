import numpy as np
import pandas as pd


def clean_and_summarize_sales(raw_records: list[dict]) -> pd.DataFrame:
    df = pd.DataFrame(raw_records)

    # 1. Cleaning & Type Casting
    cleaned_df = (
        df.dropna(subset=["transaction_id", "amount"])
        .assign(
            amount=lambda d: pd.to_numeric(d["amount"], errors="coerce"),
            date=lambda d: pd.to_datetime(d["date"]),
            # Vectorized conditional tagging using numpy
            tier=lambda d: np.where(d["amount"] >= 100.0, "High Value", "Standard"),
        )
        .fillna({"category": "Uncategorized"})
    )

    # 2. GroupBy Aggregations
    summary = (
        cleaned_df.groupby(["category", "tier"])
        .agg(
            total_revenue=("amount", "sum"),
            avg_ticket=("amount", "mean"),
            transactions=("transaction_id", "count"),
        )
        .reset_index()
        .sort_values(by="total_revenue", ascending=False)
    )

    return summary


if __name__ == "__main__":
    data = [
        {"transaction_id": "T1", "amount": 150.0, "category": "Tech", "date": "2026-01-01"},
        {"transaction_id": "T2", "amount": "45.50", "category": "Office", "date": "2026-01-02"},
        {"transaction_id": "T3", "amount": 220.0, "category": "Tech", "date": "2026-01-03"},
        {"transaction_id": "T4", "amount": None, "category": "Tech", "date": "2026-01-04"},
        {"transaction_id": "T5", "amount": 15.0, "category": None, "date": "2026-01-05"},
    ]
    report = clean_and_summarize_sales(data)
    print(report.to_string(index=False))
