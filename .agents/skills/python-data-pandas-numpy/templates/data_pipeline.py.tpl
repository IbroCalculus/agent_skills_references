import pandas as pd


def process_dataset(filepath: str) -> pd.DataFrame:
    df = pd.read_csv(filepath)
    cleaned = (
        df.dropna()
        .drop_duplicates()
        .reset_index(drop=True)
    )
    return cleaned
