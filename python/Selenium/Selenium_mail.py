import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from pprint import pprint

chrome_options = Options()
chrome_options.add_argument('start-maximized')

driver = webdriver.Chrome('./chromedriver.exe', options=chrome_options)
driver.get('https://mail.ru/')

login = driver.find_element_by_id('mailbox:login-input')
login.send_keys('study.ai_172@mail.ru')
login.send_keys(Keys.ENTER)

time.sleep(1)

passw = driver.find_element_by_id('mailbox:password-input')
passw.send_keys('NextPassword172')
passw.send_keys(Keys.ENTER)

all_mails = []

while True:
    links = driver.find_elements_by_class_name('js-letter-list-item')
    for link in links:
        all_mails.append(link.get_attribute("href"))

    if len(all_mails) >= 10:
        break

mails_data = []

for link in all_mails:
    data = {}
    driver.get(link)
    time.sleep(1)

    mail_from = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, 'letter-contact'))).text
    mail_date = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, 'letter__date'))).text
    mail_topic = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, 'thread__subject'))).text
    mail_text = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, 'letter-body__body'))).text

    data['from'] = mail_from
    data['date'] = mail_date
    data['subject'] = mail_topic
    data['body'] = mail_text

    mails_data.append(data)

pprint(mails_data)
driver.close()
