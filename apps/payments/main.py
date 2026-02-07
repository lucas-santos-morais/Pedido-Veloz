from fastapi import FastAPI

app = FastAPI(title="Payments Service", version="0.1.0")


@app.get("/health")
def health():
    return {"status": "ok", "service": "payments"}


@app.get("/")
def root():
    return {"message": "payments service ok"}