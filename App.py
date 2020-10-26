from flask import Flask, render_template, request, url_for, redirect, flash
from flask_mysqldb import MySQL
from random import choice
app = Flask(__name__)

# MySQL connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
# app.config['MYSQL_PASSWORD'] = '####'
app.config['MYSQL_DB'] = 'headsortail'
mysql = MySQL(app)

# sttings
app.secret_key="mysecretkey"
@app.route('/')
def Index():
     return render_template('index.html')

@app.route('/search_user', methods=['POST'])
def search_user():
 if request.method == 'POST':
      fullname = request.form['fullname']
      password = request.form['password']

      cur = mysql.connection.cursor()
      cur.execute('SELECT password FROM userdata WHERE fullname = %s OR email = %s', (fullname, fullname))
      data = cur.fetchall()
      if  data and password != data[0][0]:
          flash("The password isn´t correct")
          return redirect(url_for('Index'))
      elif data and password == data[0][0]:
          flash("User " + fullname + " loged")
          return redirect(url_for('game', id=fullname))
      else:
          flash("This user isn´t registered")
          return redirect(url_for('Index'))

  

@app.route('/add')
def add_user(): 
 return render_template('add_user.html')

@app.route('/delete/<string:id>')
def delete_history(id): 
 fullname = id
 print(fullname)
 cur = mysql.connection.cursor()
 cur.execute('DELETE FROM historygames WHERE fullname = %s;',([id]))
 mysql.connection.commit()
 flash('Games history Removed Successfully')
 return redirect(url_for('game', id=fullname))

@app.route('/headsortails/<string:id>')
def game(id): 
     cur = mysql.connection.cursor()
     cur.execute('SELECT * FROM userdata WHERE fullname = %s;',([id]))
     data = cur.fetchall()
     cur.execute('SELECT * FROM historygames WHERE fullname = %s;',([id]))
     historygamesuser = cur.fetchall()
     return render_template('game.html', userinfo = data[0], historygameusers = historygamesuser)

@app.route('/logic/<string:id>', methods=['POST'])
def Logic_In_game(id): 
     fullname = id
     player1 = request.form['optionHuman']
     player2 = ""
     winner = choice(["Tails", "Heads"])
     if player1 == "Tails":
        player2 = "Heads"
     else:
        player2 = "Tails"
    
     cur = mysql.connection.cursor()
     cur.execute('INSERT INTO historygames (fullname, playplayer, playcomputer, winner) VALUES(%s, %s, %s, %s)', (fullname, player1, player2 ,winner))
     mysql.connection.commit()

     if player1 == winner:
         flash("Is " + winner + " so the player " + fullname + " is the winner")
     else:
         flash("Is " + winner + " so the the computer is the winner")
     return redirect(url_for('game', id=fullname))

@app.route('/create', methods=['POST'])
def create_contact():
 if request.method == 'POST':
      fullname = request.form['fullname']
      password = request.form['password']
      email = request.form['email']
      
      cur = mysql.connection.cursor()
      cur.execute('INSERT INTO userdata (fullname, email, password) VALUES(%s, %s, %s)', (fullname, email, password))
      mysql.connection.commit()
      flash('Contact registered successfully')
      return redirect(url_for('Index'))

if __name__ == '__main__': 
 app.run(port = 3001 , debug = True)
 