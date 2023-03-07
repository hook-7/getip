from flask import Flask,request


app = Flask(__name__)

@app.route("/")
def main():
    return request.headers.get('X-Real-IP', request.remote_addr)

if __name__ =="__main__":
    app.run(port=8080,host="::")
