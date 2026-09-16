---
name: python-structured-logging
description: Configure robust, production-grade logging in Python using the standard logging library, named loggers, rotating file handlers, custom formatters, and exception tracing.
---

# Python Structured Logging

Use this skill when configuring application loggers, setting up rotating file logs, formatting diagnostic telemetry, and handling exception traces in Python applications.

## Core Rules & Best Practices

1. **Always Use Named Loggers**:
   - In any module, obtain a logger via `logger = logging.getLogger(__name__)`.
   - NEVER call root logger functions like `logging.info()` or `logging.error()` directly inside libraries or route handlers.

2. **Stream + Rotating File Handlers**:
   - For production services, configure:
     - `logging.StreamHandler()` for console stdout/stderr (e.g. Docker / Kubernetes log scrapers).
     - `logging.handlers.RotatingFileHandler(filename, maxBytes=10*1024*1024, backupCount=5)` to prevent infinite disk growth.

3. **Exception Tracing with `logger.exception()`**:
   - Inside `except Exception:` blocks, always use `logger.exception(...)` rather than `logger.error(...)`. `logger.exception` automatically appends the full traceback.

4. **Standardized Formatting**:
   - Include timestamp (ISO 8601), log level, logger/module name, function name, and line number:
     `%(asctime)s [%(levelname)s] %(name)s (%(funcName)s:%(lineno)d) - %(message)s`
