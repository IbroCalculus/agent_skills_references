# Pandas & NumPy Vectorization Cheatsheet

## Essential Vectorized Methods
- `np.where(condition, value_if_true, value_if_false)`
- `np.select([cond1, cond2], [choice1, choice2], default=choice3)`
- `pd.to_datetime(col, errors='coerce')`
- `pd.to_numeric(col, errors='coerce')`

## Filtering with Query vs Boolean Indexing
```python
# Boolean indexing
df[(df['age'] >= 21) & (df['status'] == 'active')]

# Readable query syntax
df.query("age >= 21 and status == 'active'")
```

## Reading & Writing Excel
```bash
pip install openpyxl
```
```python
df = pd.read_excel("data.xlsx", sheet_name="Sheet1", engine="openpyxl")
df.to_excel("output.xlsx", index=False, engine="openpyxl")
```
