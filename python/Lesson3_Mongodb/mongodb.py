from pymongo import MongoClient
from pprint import pprint
import csv
import json

# First of all I need to convert my previous output result from csv to json
csvfile = open('output.csv', 'r')
jsonfile = open('output.json', 'w')

fieldnames = ("name", "min_salary",	"max_salary","link","website")
reader = csv.DictReader(csvfile, fieldnames)
next(reader) # to skip to record a fieldnames into json

for row in reader:
    json.dump(row, jsonfile)
    jsonfile.write('\n')

csvfile.close()
jsonfile.close()

# 1. Then connect to mongodb and record my json into a database
superjob = MongoClient('127.0.0.1',27017)
db = superjob['jobs_db']
jobs = db.jobs

jobs.delete_many({})

with open("output.json") as file:
    for row in file:
        json_row = json.loads(row)
        jobs.insert_one(json_row)

# 2. Search function with the salary parameter
x = input("Введите сумму больше которой необходимо выполнить поиск: ")

for job in jobs.find({"$or": [{'min_salary':{"$gt": x}}, {'max_salary': {"$gt": x}}]}):
     pprint(job)

# 3. Only new data
with open("output.json") as file:
    for row in file:
        json_row = json.loads(row)
        jobs.update_many(json_row, {'$set': json_row}, True)
