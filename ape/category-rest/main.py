from flask import Flask, request
import mysql.connector as myc

app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def root_handler():
    con = myc.connect(
        user='user',
        host='db',
        database='ape_database',
        password='password'
    )
    cursor = con.cursor()
    if request.method == 'POST':
        cursor.execute('select max(cat_id) from category;')
        id = cursor.fetchall()[0][0] + 1
        name = request.form.get('name')
        q = 'insert into category (`cat_id`, `name`) values (%s, %s);'
        cursor.execute(q, (id, name))
        con.commit()
        cursor.close()
        con.close()
        return 'Successfully submitted new data!<br>'
    else:
        res = cursor.execute('select * from category;')
        s = ''
        for i in cursor:
            s += str(i) + '<br>'
        print(res)
        cursor.close()
        con.close()
        return f'''
<form method="POST">
    id: <input type="text" name="requester_id"><br>
    type: <input type="text" name="requester_type"><br>
    session id: <input type="text" name="requester_session_id"><br>
    name: <input type="text" name="name"><br>
    <input type="submit" value="Submit"><br>
</form>

<h3> Current values: </h3>
{s}
'''


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port='80')
