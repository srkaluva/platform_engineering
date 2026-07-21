from flask import Flask
import time

app = Flask(__name__)

@app.route("/payment")
def payment():

    time.sleep(0.2)

    return "Payment successful"

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8080
    )
    