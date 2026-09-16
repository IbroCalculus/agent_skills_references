import logging
from logging.handlers import RotatingFileHandler


def get_configured_logger(name: str) -> logging.Logger:
    logger = logging.getLogger(name)
    if not logger.handlers:
        logger.setLevel(logging.INFO)
        formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")

        ch = logging.StreamHandler()
        ch.setFormatter(formatter)
        logger.addHandler(ch)

        fh = RotatingFileHandler("app.log", maxBytes=5 * 1024 * 1024, backupCount=3)
        fh.setFormatter(formatter)
        logger.addHandler(fh)

    return logger
