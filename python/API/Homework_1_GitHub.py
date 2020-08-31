import requests
from pprint import pprint

url = 'https://api.github.com/user/repos'
username = input("User Login:")
password = input("User Password:")

repos = requests.get(url, auth=(username, password))
pprint(repos.json())
