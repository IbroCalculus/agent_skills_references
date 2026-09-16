import logging
from logging.handlers import RotatingFileHandler
from pathlib import Path


def setup_application_logging(log_dir: str = "logs", log_level: int = logging.INFO) -> logging.Logger:
    Path(log_dir).mkdir(parents=True, exist_ok=True)
    logger = logging.getLogger("app")
    logger.setLevel(log_level)

    if logger.hasHandlers():
        return logger

    formatter = logging.Formatter(
        fmt="%(asctime)s [%(levelname)s] %(name)s (%(filename)s:%(lineno)d) - %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )

    # Console Handler
    console_handler = logging.StreamHandler()
    console_handler.setFormatter(formatter)
    logger.addHandler(console_handler)

    # Rotating File Handler (10MB per file, max 5 backups)
    file_handler = RotatingFileHandler(
        filename=f"{log_dir}/application.log",
        maxBytes=10 * 1024 * 1024,
        backupCount=5,
        encoding="utf-8",
    )
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)

    return logger


if __name__ == "__main__":
    log = setup_application_logging()
    log.info("Logging subsystem initialized successfully.")
    try:
        1 / 0
    except ZeroDivisionError:
        log.exception("Caught calculation failure:")
