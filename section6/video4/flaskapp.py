import json
import logging
import sys
import traceback
from elasticapm.contrib.flask import ElasticAPM
from elasticapm.handlers.logging import LoggingHandler

from flask import Flask , jsonify, abort, make_response
from flask_restful import reqparse
from flask_restful import Api, Resource
import sqlite3


# initialize using environment variables from elasticapm.contrib.flask import ElasticAPM
app = Flask(__name__)
api = Api(app)

# configure to use ELASTIC_APM in your application's settings from elasticapm.contrib.flask import ElasticAPM
app.config['ELASTIC_APM'] = {
		# 'APP_NAME': 'PacktFauieFlask2',
		'SERVICE_NAME': 'PacktFauieFlask2',
		# 'SECRET_TOKEN': '',
		'SERVER_URL': 'http://localhost:8200',
		'DEBUG': True,
		}
apm = ElasticAPM(app)

conn = sqlite3.connect('users.db')
c = conn.cursor()

# Create table
try:
	c.execute('''CREATE TABLE users
	     (id integer primary key,name text,  description text)''')
except:
    print 'Table exists.'
conn.commit()
users = {}
for user in c.execute("SELECT id, name, description FROM users"):
   new_user = {}
   new_user['id'] =  user[0]
   new_user['name'] =  user[1]
   new_user['description'] =  user[2]
   users[int(user[0])] = new_user
conn.close()

@app.route('/')
def hello():
    return "Hello World!"

class UserListAPI(Resource):
    def __init__(self):
	self.reqparse = reqparse.RequestParser()
	self.reqparse.add_argument('name', type = str, required = True, help = 'No name provided', location = 'json')
	self.reqparse.add_argument('description', type = str, default = "", location = 'json')
	super(UserListAPI, self).__init__()

    def get(self):
	return jsonify(users)

    def post(self):
	pass

class UserAPI(Resource):
    def __init__(self):
	self.reqparse = reqparse.RequestParser()
	self.reqparse.add_argument('name', type = str, location = 'json')
	self.reqparse.add_argument('description', type = str, location = 'json')
	super(UserAPI, self).__init__()


    def get(self, id):
	    pass

    def put(self, id):
	user = users.get(id, {'id': id})
	users[id] = user

	args = self.reqparse.parse_args()
	for k, v in args.iteritems():
		if v != None:
			user[k] = v
	sql = """ INSERT or REPLACE into users (id, name, description) values (?,?,?) """ 

	conn = sqlite3.connect('users.db')
	c = conn.cursor()

	try:
		c.execute(sql, (user['id'],user['name'], user['description'],))
	except:
            print 'Exception inserting into table.'
	    print "Exception in user code:"
	    print '-'*60
	    traceback.print_exc(file=sys.stdout)
	    app.logger.error( 'Error while updating DB:', exc_info=True) 
	    print '-'*60
	conn.commit()
	conn.close()
	app.logger.info("Added or updated a user %s: %s", id, json.dumps(user)) 
	return jsonify( { 'user': user } )

def delete(self, id):
	pass




if __name__ == '__main__':
	# initialize using environment variables from elasticapm.contrib.flask import ElasticAPM
    app = Flask(__name__)
    api = Api(app)
    api.add_resource(UserListAPI, '/api/users', endpoint = 'users')
    api.add_resource(UserAPI, '/api/user/<int:id>', endpoint = 'user')

	# configure to use ELASTIC_APM in your application's settings from elasticapm.contrib.flask import ElasticAPM
    app.config['ELASTIC_APM'] = {
			# 'APP_NAME': 'PacktFauieFlask2',
			'SERVICE_NAME': 'PacktFauieFlask2',
			# 'SECRET_TOKEN': '',
			'SERVER_URL': 'http://localhost:8200',
			'DEBUG': True,
			}
    apm = ElasticAPM(app)

    handler = LoggingHandler(client=apm.client)
    handler.setLevel(logging.DEBUG)
    app.logger.addHandler(handler)
    app.run(debug=True)


