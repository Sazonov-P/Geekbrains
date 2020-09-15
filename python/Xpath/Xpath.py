from pprint import pprint
from lxml import html
import requests

header = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36'}

# Lenta.ru
lenta_ru_link = 'https://lenta.ru'
lenta_response = requests.get(lenta_ru_link,headers=header)
dom_lenta = html.fromstring(lenta_response.text)
lenta_news = dom_lenta.xpath("//div[@class='item']")

# Yandex.news
yandex_ru_link = 'https://yandex.ru/news'
yandex_response = requests.get(yandex_ru_link,headers=header)
dom_yandex = html.fromstring(yandex_response.text)
yandex_news = dom_yandex.xpath("//div[@class='mg-grid__col mg-grid__col_xs_4']")

# Mail.news
mail_ru_link = 'https://news.mail.ru'
mail_response = requests.get(mail_ru_link,headers=header)
dom_mail = html.fromstring(mail_response.text)
mail_news = dom_mail.xpath("//div[contains(@class, 'cols__column')]")

all_news = []

for lenta in lenta_news:
    data_lenta = {}
    source_news = 'lenta.ru'
    name_news = lenta.xpath(".//a/text()")
    link_news = lenta.xpath(".//a/@href")
    date_news = lenta.xpath(".//a/time/@datetime")

    data_lenta['source_news'] = source_news
    data_lenta['name_news'] = name_news
    link = 'https://lenta.ru' + str(link_news)
    data_lenta['link_news'] = link.replace('[', '').replace(']', '').replace('\'', '')
    data_lenta['date_news'] = date_news

    all_news.append(data_lenta)

for yandex in yandex_news:
    data_yandex = {}
    source_news = yandex.xpath(".//span[@ class ='mg-card-source__source']/a/text()")
    name_news = yandex.xpath(".//a/h2/text()")
    link_news = yandex.xpath(".//article/a/@href")
    date_news = yandex.xpath(".//article//span[@class='mg-card-source__time']/text()")

    data_yandex['source_news'] = source_news
    data_yandex['name_news'] = name_news
    data_yandex['link_news'] = link_news
    data_yandex['date_news'] = date_news

    all_news.append(data_yandex)

for mail in mail_news:
    data_mail = {}
    source_news = mail.xpath(".//span[@class='newsitem__param']/text()")
    name_news = mail.xpath(".//span[@class='newsitem__title-inner']/text()")
    link_news = mail.xpath(".//a[@class='newsitem__title link-holder']/@href")
    date_news = mail.xpath(".//span/@datetime")

    data_mail['source_news'] = source_news
    data_mail['name_news'] = name_news
    data_mail['link_news'] = link_news
    data_mail['date_news'] = date_news

    all_news.append(data_mail)

pprint(all_news)
