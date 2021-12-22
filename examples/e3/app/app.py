import datetime
import uvicorn
from fastapi import FastAPI
from pydantic import BaseSettings
import redis

app = FastAPI()


class RedisConfig(BaseSettings):

    db_host: str
    db_password: str


config = RedisConfig()


client = redis.Redis(host=config.db_host, password=config.db_password)


@app.get("/name")
async def user_exists(name):

    exists = client.get(name)
    return {"exists": exists is not None}


@app.post("/name")
async def add_user(name: str):
    client.set(name, str(datetime.datetime.utcnow()))
    return {"message": f"added new user: {name}, at {client.get(name)}"}


@app.get("/db-creds")
async def get_db_creds():
    return config.dict()


@app.get("/alive")
async def is_alive():
    return "I'm alive!"


if __name__ == '__main__':
    uvicorn.run(
        app,
        host="0.0.0.0",
        port=8000,  # be careful as this is not been update if fastapi_base_port is changed
        reload=False,
        log_level="debug"
    )