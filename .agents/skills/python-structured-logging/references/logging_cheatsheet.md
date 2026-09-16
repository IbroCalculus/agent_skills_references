# Python Logging Reference

## Standard Levels
- `DEBUG` (10): Granular diagnostics, variable values.
- `INFO` (20): Normal operational events (startup, incoming request, completed task).
- `WARNING` (30): Non-fatal anomaly (deprecated API, slow query, retrying).
- `ERROR` (40): Operation failed, request aborted, resource unreachable.
- `CRITICAL` (50): Severe system failure, data corruption, immediate intervention required.

## Logging Format Attributes
- `%(asctime)s`: Human-readable date/time.
- `%(name)s`: Logger name (typically `__name__`).
- `%(levelname)s`: Text logging level (INFO, ERROR, etc.).
- `%(filename)s`: Source file basename.
- `%(lineno)d`: Source line number where call was issued.
- `%(funcName)s`: Function name containing the call.
- `%(message)s`: The logged message.
