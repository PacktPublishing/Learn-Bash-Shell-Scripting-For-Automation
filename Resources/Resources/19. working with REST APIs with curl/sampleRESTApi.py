from flask import Flask, request,jsonify
app = Flask(__name__)

@app.route('/getCreds', methods=['GET'])
def details():
    username='VRTech'
    passKey='VRTechForScripting'
    data = {
            "passKey" : passKey,
            "userName":username,
        }
    return jsonify(data)

@app.route('/upper', methods=['GET'])
def upper():
    input=request.json['input'].upper()
    data = {
            "input" : input
        }
    return jsonify(data)

if __name__=='__main__':
    app.run(debug=True)