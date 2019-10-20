from flask import Flask, request
import mysql.connector as myc

class ApeConn:
    def __init__(self):
        self.con = myc.connect(
            user='user',
            host='db',
            database='ape_database',
            password='password'
        )
        self.cursor = self.con.cursor()
    def __enter__(self):
        return self.cursor

    def __exit__(self, type, value, tb):
        if tb is None:
            self.con.commit()
        else:
            self.rollback()

    def __del__(self):
        self.cursor.close()
        self.con.close()


app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def root_handler():
    with ApeConn() as cursor:
        if request.method == 'POST':
            q = request.form.get('query')
            cursor.execute(q)
            s = ''
            for i in cursor:
                s += str(i) + '<br><br>'
            return f'''
Next Query:
<br><br>
<form method="POST">
    query: <input type="text" name="query"><br>
    <input type="submit" value="Submit"><br>
</form>
<br><br>
Query results:<br><br>
{s}
'''
        else:
            return f'''
<form method="POST">
    query: <input type="text" name="query"><br>
    <input type="submit" value="Submit"><br>
</form>
'''


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port='80')
