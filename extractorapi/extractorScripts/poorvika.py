import pandas as pd
import requests as re
from bs4 import BeautifulSoup

HEADERS = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0','Accept-Language': 'en-US, en;q=0.5'}

def getSoup(url):
    response = re.get(url, headers=HEADERS)
    soup = BeautifulSoup(response.text, "html.parser")
    return soup

def getProductDetails(soup):
    map = dict()
    map['title'] = soup.find("div", class_="product-cardlist_card__description__eduH5").a.b.text
    map['link'] = "https://poorvika.com"+soup.find("div", class_="product-cardlist_card__description__eduH5").a['href']
    map['price'] = soup.find("div", class_="product-cardlist_price__1aKwZ").span.text
    map['img'] = soup.find("div", class_="product-cardlist_card__IeCc4 product-cardlist_card--border__C3__Q no-select").img['src']
    map['del_cost'] = "Not mentioned"
    return map 

def init(search_key):
    url = "https://poorvika.com/s?q="+search_key
    soup = getSoup(url)
    DETAILS_MAP = getProductDetails(soup)
    return DETAILS_MAP

