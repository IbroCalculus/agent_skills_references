import time
import pandas as pd
import streamlit as pd_st
import streamlit as st


@st.cache_data(ttl=600)
def load_kpi_dataset() -> pd.DataFrame:
    # Simulating data retrieval
    time.sleep(0.1)
    return pd.DataFrame({
        "Month": ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
        "Revenue": [12000, 15400, 14200, 18900, 22100, 26500],
        "Expenses": [8000, 9200, 8900, 11000, 12500, 14000],
    })


def main():
    st.set_page_config(page_title="Executive Metrics", page_icon="📊", layout="wide")

    st.title("📊 Business Performance Dashboard")
    st.markdown("Real-time revenue tracking and performance analytics.")

    # Sidebar Filter Controls
    st.sidebar.header("Configuration")
    selected_view = st.sidebar.selectbox("Select View", ["Overview", "Detailed Table"])

    # Load Data
    data = load_kpi_dataset()

    # KPI Summary Cards
    col1, col2, col3 = st.columns(3)
    latest_rev = data["Revenue"].iloc[-1]
    prev_rev = data["Revenue"].iloc[-2]
    delta = ((latest_rev - prev_rev) / prev_rev) * 100

    col1.metric("Current Month Revenue", f"${latest_rev:,.0f}", f"{delta:+.1f}%")
    col2.metric("Total YTD Revenue", f"${data['Revenue'].sum():,.0f}")
    col3.metric("Net Margin", f"${(data['Revenue'] - data['Expenses']).sum():,.0f}")

    if selected_view == "Overview":
        tab1, tab2 = st.tabs(["Trends Chart", "Monthly Breakdown"])
        with tab1:
            st.line_chart(data.set_index("Month")[["Revenue", "Expenses"]])
        with tab2:
            st.bar_chart(data.set_index("Month")["Revenue"])
    else:
        st.dataframe(data, use_container_width=True)


if __name__ == "__main__":
    main()
