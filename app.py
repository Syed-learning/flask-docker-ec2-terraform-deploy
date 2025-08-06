import os
from flask import Flask, render_template, request, redirect

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Flask on Docker and AWS EC2!"

@app.route('/feedback',methods=['GET','POST'])
def feedback():
    if request.method == 'POST':
        name = request.form['name']
        message = request.form['message']

        base_dir = os.path.dirname(os.path.abspath(__file__))
        feedback_file = os.path.join(base_dir, "feedback.txt")



        with open('feedback.txt', 'a') as f:
            f.write(f"Name: {name}\nMessage: {message}\n---\n")
        
        

        return redirect('/feedback')
    


    return render_template('feedback.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
