from flask import Flask, request
import aria2p

# initialization, these are the default values
aria2 = aria2p.API(
    aria2p.Client(
        host="http://127.0.0.1",
        port=6800,
        secret="Python_No.1"
    )
)

# list downloads
downloads = aria2.get_downloads()
print(downloads)
app = Flask(__name__)

@app.route('/event-invoke', methods = ['POST'])
def invoke():
    # Get all the HTTP headers from the official documentation of Tencent
    request_id = request.headers.get("X-Scf-Request-Id", "")
    print("SCF Invoke RequestId: " + request_id)

    event = request.get_data()
    event_str = event.decode("utf-8")
    print(request)
    return "Hello from SCF event function, your input: " + event_str + ", request_id: " + request_id + "\n"

@app.route('/web-invoke/python-flask-http', methods = ['POST','GET'])
def web_invoke():
    # Get all the HTTP headers from the official documentation of Tencent
    request_id = request.headers.get("X-Scf-Request-Id", "")
    print("SCF Invoke RequestId: " + request_id)
    
    event = request.get_data()
    event_str = event.decode("utf-8")

    return "Hello from SCF Web function, your input: " + event_str + ", request_id: " + request_id + "\n"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000)
