from bs4 import BeautifulSoup as bs
import requests
import re
import pandas as pd

main_link = 'https://www.superjob.ru'
headers = {'User_Agent':'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36'
                         '(KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'}

response = requests.get(main_link + '/vakansii/analitik.html?geo%5Bt%5D%5B0%5D=4', headers=headers)
soup = bs(response.text,'html.parser')

job_list = soup.find_all('div',{'class':'jNMYr GPKTZ _1tH7S'})

jobs = []
for job in job_list:
    job_data = {}
    job_name = job.find("a").getText()
    job_salary = job.find("span", class_="_1OuF_ _1qw9T f-test-text-company-item-salary").getText()
    job_link = main_link + job.find('a', class_=re.compile("^icMQ_ _6AfZ9 f-test-link")).get('href')
    job_website = main_link

    job_data['name'] = job_name
    job_data['salary'] = job_salary
    job_data['link'] = job_link
    job_data['website'] = job_website

    jobs.append(job_data)

results = pd.DataFrame(jobs)
results.to_csv("output.csv", index=False, header=True, encoding="utf-8-sig")

## For multiple pages:
# page_number = 0
# jobs = []
#
# while page_number <=5:
#     page_number += 1
#     response = requests.get(main_link + '/vakansii/analitik.html?geo%5Bt%5D%5B0%5D=4' + '&page={}'.format(page_number), headers=headers)
#     soup = bs(response.text,'html.parser')
#     job_list = soup.find_all('div',{'class':'jNMYr GPKTZ _1tH7S'})
#
#     for job in job_list:
#         job_data = {}
#         job_name = job.find("a").getText()
#         job_salary = job.find("span", class_="_1OuF_ _1qw9T f-test-text-company-item-salary").getText()
#         job_link = main_link + job.find('a', class_=re.compile("^icMQ_ _6AfZ9 f-test-link")).get('href')
#         job_website = main_link
#
#         job_data['name'] = job_name
#         job_data['salary'] = job_salary
#         job_data['link'] = job_link
#         job_data['website'] = job_website
#
#         jobs.append(job_data)
