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
    map['title'] = soup.find("div", class_="column col3 search_blocks").h2.text
    map['link'] = "https:"+soup.find("div", class_="column col3 search_blocks").a['href']
    map['price'] = soup.find("div", class_="column col3 search_blocks").span.text
    map['img'] = soup.find("div", class_="column col3 search_blocks").img['src']
    map['del_cost'] = "Not mentioned"
    return map 

def init(search_key):
    url = "https://www.shopclues.com/search?q="+search_key
    soup = getSoup(url)
    DETAILS_MAP = getProductDetails(soup)
    return DETAILS_MAP

