---
name: python-web-scraping
description: Extract data and automate web workflows using BeautifulSoup4 for static HTML parsing and Selenium WebDriver for dynamic JavaScript-heavy browser automation.
---

# Python Web Scraping & Automation

Use this skill when building web scrapers, data extractors, automated form submissions, and browser workflows in Python.

## Tool Selection

- **Static HTML / REST / Server-rendered pages**: Use `requests` (or `httpx`) with `BeautifulSoup4` (`bs4`). Fast, lightweight, low-resource consumption.
- **Dynamic JavaScript / Single Page Apps / Bot-protected pages**: Use `selenium` (with headless Chrome / Chromium). Renders client-side DOM, executes JavaScript, and simulates user interactions.

## Core Rules & Best Practices

1. **Always Set Realistic Headers & Timeouts**:
   - Never send requests without a standard browser `User-Agent`.
   - Always set an explicit `timeout=...` in `requests.get()` to avoid hanging indefinitely.
   - Call `response.raise_for_status()` to catch HTTP 4xx/5xx errors early.

2. **Explicit Waits in Selenium**:
   - NEVER use hardcoded `time.sleep()` for waiting on elements in Selenium.
   - Always use `WebDriverWait(driver, 10).until(EC.presence_of_element_located(...))` or `EC.element_to_be_clickable(...)`.

3. **Guaranteed Driver Lifecycle**:
   - Wrap Selenium operations in `try ... finally: driver.quit()` or use context managers so background browser processes do not linger in memory.
