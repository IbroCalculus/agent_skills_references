import streamlit as st


def main():
    st.set_page_config(page_title="Streamlit App", page_icon="⚡", layout="wide")
    st.title("⚡ Application")

    if "counter" not in st.session_state:
        st.session_state.counter = 0

    if st.button("Increment"):
        st.session_state.counter += 1

    st.write(f"Count: {st.session_state.counter}")


if __name__ == "__main__":
    main()
