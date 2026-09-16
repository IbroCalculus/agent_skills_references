from bs4 import BeautifulSoup
import requests


class WebScraper:
    def __init__(self, base_url: str):
        self.base_url = base_url
        self.session = requests.Session()
        self.session.headers.update({
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
        })

    def fetch_page(self, path: str = "") -> BeautifulSoup:
        url = f"{self.base_url.rstrip('/')}/{path.lstrip('/')}"
        response = self.session.get(url, timeout=10)
        response.raise_for_status()
        return BeautifulSoup(response.text, "html.parser")
