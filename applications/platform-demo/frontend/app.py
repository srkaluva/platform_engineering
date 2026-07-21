from flask import Flask
import requests

app = Flask(__name__)

@app.route("/")
def home():

    response = requests.get(
        "http://payment-service/payment"
    )

    return f"""
    <h1>Platform Demo</h1>
    <p>{response.text}</p>
    """

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8080
    )
    