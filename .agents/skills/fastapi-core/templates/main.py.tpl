from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup setup
    yield
    # Shutdown cleanup


def create_app() -> FastAPI:
    app = FastAPI(
        title="My API",
        version="0.1.0",
        lifespan=lifespan,
    )

    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    # Register routers here:
    # app.include_router(auth_router, prefix="/api/v1/auth", tags=["Auth"])

    return app


app = create_app()
