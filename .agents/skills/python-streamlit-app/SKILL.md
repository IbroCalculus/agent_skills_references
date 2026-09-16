---
name: python-streamlit-app
description: Architect interactive web applications, dashboards, and internal tools in pure Python using Streamlit, session state management, cached data pipelines, and responsive layouts.
---

# Python Streamlit Application Development

Use this skill when developing interactive web dashboards, analytical UIs, internal data tools, or prototype interfaces using Streamlit.

## Core Rules & Architecture

1. **Page Configuration First**:
   - `st.set_page_config(page_title=..., page_icon=..., layout="wide")` must be the FIRST Streamlit command executed in the script entry point.

2. **Session State Initialization**:
   - Never access `st.session_state["key"]` without first verifying presence:
     ```python
     if "messages" not in st.session_state:
         st.session_state.messages = []
     ```

3. **Prevent Unwanted Reruns with Forms**:
   - For multi-input flows (filters, user submission forms), wrap controls in `with st.form("form_key"):` and trigger state updates only on `st.form_submit_button(...)`.

4. **Modern Caching Directives**:
   - Use `@st.cache_data` for serializable computational results, API fetches, and DataFrame transformations.
   - Use `@st.cache_resource` for non-serializable objects (database connections, ML model instances, thread pools).
   - NEVER use the deprecated `@st.cache`.

5. **Responsive Layouts**:
   - Use `st.columns([...])` for side-by-side KPI cards and metrics (`st.metric`).
   - Use `st.tabs([...])` to segment views without cluttering the screen.
