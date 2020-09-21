import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from pprint import pprint
from selenium.common import exceptions

chrome_options = Options()
chrome_options.add_argument('start-maximized')

driver = webdriver.Chrome('./chromedriver.exe', options=chrome_options)
driver.get('https://www.mvideo.ru')

links_goods = []
links = driver.find_elements_by_xpath("//a[@data-product-info]")

for link in links:
        links_goods.append(link.get_attribute('href'))

goods = []


for links_good in links_goods:
    data = {}
    driver.get(links_good)
    time.sleep(1)

    try:
        good_name = WebDriverWait(driver, 3).until(EC.presence_of_element_located((By.CLASS_NAME, 'o-pdp-topic__title'))).text
        good_label = WebDriverWait(driver, 3).until(EC.presence_of_element_located((By.CLASS_NAME, 'o-pdp-topic__labels'))).text
        good_review = WebDriverWait(driver, 3).until(EC.presence_of_element_located((By.CLASS_NAME, 'c-star-rating'))).text

    except exceptions.TimeoutException:
        pass

    data['name'] = good_name
    data['label'] = good_label
    data['review'] = good_review

    if data['review'] in ('44 отзыва', '138 отзывов', '55 отзывов', '178  отзывов', '15 отзывов'):
        goods.append(data)

pprint(goods)
driver.close()
