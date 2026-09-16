# Web Scraping Cheatsheet

## BeautifulSoup4 Selectors
```python
# By class
soup.select(".author-name")

# By ID
soup.select_one("#main-content")

# Attribute selector
soup.select("a[data-category='tech']")

# Child combinator
soup.select("ul.nav-list > li > a")
```

## Headless Selenium Setup
```python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

options = Options()
options.add_argument("--headless=new")
options.add_argument("--disable-gpu")
options.add_argument("--no-sandbox")

driver = webdriver.Chrome(options=options)
try:
    driver.get("https://example.com")
    elem = WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.CSS_SELECTOR, "h1"))
    )
    print(elem.text)
finally:
    driver.quit()
```
