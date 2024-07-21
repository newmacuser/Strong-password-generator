from flask import Flask, render_template, request, redirect, url_for
import subprocess

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/generate', methods=['POST'])
def generate():
    app_name = request.form['app']
    username = request.form['username']
    result = subprocess.run(['./obfs.gen.sh'], input=f"{app_name}\n{username}\n", text=True, capture_output=True)
    output = result.stdout
    return render_template('result.html', output=output)

@app.route('/recover', methods=['POST'])
def recover():
    recovery_key = request.form['recovery_key']
    app_name = request.form['app']
    username = request.form['username']
    result = subprocess.run(['./obfs.rec.sh'], input=f"{recovery_key}\n{app_name}\n{username}\n", text=True, capture_output=True)
    output = result.stdout
    return render_template('result.html', output=output)

if __name__ == '__main__':
    app.run(debug=True)
