from flask import Flask
from opentelemetry import trace
import time

app = Flask(__name__)

tracer = trace.get_tracer(__name__)

@app.route("/payment")
def payment():

    with tracer.start_as_current_span("validate-order"):
        time.sleep(0.1)

    with tracer.start_as_current_span("call-payment-gateway"):
        time.sleep(0.3)

    with tracer.start_as_current_span("persist-transaction"):
        time.sleep(0.1)

    return "Payment successful"

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8080
    )
    