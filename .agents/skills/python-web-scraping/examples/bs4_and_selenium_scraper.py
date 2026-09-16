from bs4 import BeautifulSoup
import requests

# === 1. Fast Static Scraper with BeautifulSoup4 ===
HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
    ),
    "Accept-Language": "en-US,en;q=0.9",
}


def scrape_articles(url: str) -> list[dict]:
    session = requests.Session()
    session.headers.update(HEADERS)

    response = session.get(url, timeout=15)
    response.raise_for_status()

    soup = BeautifulSoup(response.text, "html.parser")
    articles = []

    # Example CSS selector extraction
    for item in soup.select("article, .post-item, .card"):
        title_tag = item.select_one("h2, h3, .title")
        link_tag = item.select_one("a[href]")

        if title_tag and link_tag:
            articles.append({
                "title": title_tag.get_text(strip=True),
                "link": link_tag.get("href"),
            })

    return articles


if __name__ == "__main__":
    sample_html = """
    <html>
        <body>
            <article>
                <h2>Introduction to Python Web Scraping</h2>
                <a href="https://example.com/p1">Read more</a>
            </article>
            <article>
                <h2>Mastering BeautifulSoup Selectors</h2>
                <a href="https://example.com/p2">Read more</a>
            </article>
        </body>
    </html>
    """
    soup = BeautifulSoup(sample_html, "html.parser")
    cards = soup.select("article")
    for card in cards:
        print(card.select_one("h2").text, "->", card.select_one("a")["href"])
