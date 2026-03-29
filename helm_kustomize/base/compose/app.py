import time
import socket
import redis
from flask import Flask, make_response
import os

DB_HOST = os.getenv('REDIS_HOST', 'redis')
MY_ENV = os.getenv('ENV', 'unknown')

app = Flask(__name__)
cache = redis.Redis(host=DB_HOST, port=6379)

def get_hit_count():
	return cache.incr('hits')

@app.route('/')
def hello():
	count = get_hit_count()
	return 'Hello World! I have been seen {} times. My name is: {}. My env: {}\n'.format(count, socket.gethostname(), MY_ENV)
