import config
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles


app = FastAPI(
    title="corn job API",
    version="0.0.1",
)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
    expose_headers=["process_time"],
)

"""
HTTP Method: GET
API 主路徑，取得狀態與資訊。
"""
@app.get(
    "/",
    responses={
        200: {
            "content": {
                "application/json": {
                    "example": {
                        "name": "ASR API",
                        "message": "server started on 8001 PORT development",
                        "version": "1.0.0",
                    }
                }
            }
        }
    },
    tags=["root"],
)
async def root():
    return {
        "name": "corn job API",
        "message": f"server started on {config.PORT} PORT {config.ENV}",
        "version": f"{config.VERSION}",
    }

app.mount("/", StaticFiles(directory="static"), name="static")
