from flask import Flask,request
import pymongo
from datetime import datetime

client = pymongo.MongoClient("mongodb+srv://by9559:2FjNWHfZNnoHcoIY@serverdb.tgnra.mongodb.net/?retryWrites=true&w=majority")
db = client.get_database("test")
c = db.get_collection("DDNS")



app = Flask(__name__)


@app.route("/")
def main():
    ip = request.headers.get('X-Forwarded-For', request.remote_addr).replace(" ","").split(",")[0]
    if not [i for i in c.find({"domain":ip})]:
        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        c.insert_one({"domain":ip, 'date': current_time})
    return ip

if __name__ =="__main__":
    app.run(port=8081,host="::")
