from fastapi import FastAPI

app = FastAPI(title="Orders Service", version="0.1.0")


@app.get("/health")
def health():
    return {"status": "ok", "service": "orders"}


@app.get("/")
def root():
    return {"message": "orders service ok"}
