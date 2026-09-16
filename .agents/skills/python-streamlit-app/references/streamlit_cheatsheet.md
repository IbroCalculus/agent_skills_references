# Streamlit Core Cheatsheet

## Execution Model
- Streamlit scripts run from top to bottom on every user interaction (button click, slider move, text input).
- Use `st.session_state` to persist variables across reruns.
- Use `@st.cache_data` or `@st.cache_resource` to prevent heavy computations or DB reconnects on every rerun.

## Common Components
```python
# User Inputs
name = st.text_input("Username")
count = st.number_input("Count", min_value=1, max_value=100)
flag = st.checkbox("Enable Notifications")
option = st.selectbox("Category", ["Finance", "Engineering", "Marketing"])

# Progress & Status
with st.spinner("Processing..."):
    do_work()
st.success("Completed successfully!")
```
