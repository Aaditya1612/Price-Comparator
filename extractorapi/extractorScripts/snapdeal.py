import requests as re
from bs4 import BeautifulSoup
import secrets

HEADERS = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0','Accept-Language': 'en-US, en;q=0.5'}

def getSoup(url):
    response = re.get(url, headers=HEADERS)
    soup = BeautifulSoup(response.text, "html.parser")
    return soup

def getProductDetails(soup):
    map = dict()
    map['title'] = soup.find("p", class_ = "product-title").text
    map['link'] = soup.find("div", class_="product-desc-rating").a['href']
    map['price'] = soup.find("span", class_="lfloat product-price").text
    map['ratings'] = str((float(str(soup.find("div", class_="filled-stars")['style']).removeprefix("width:").removesuffix("%"))/100)*5)
    map['del_cost'] = "Free Delievery"
    map['img'] = soup.find("img", class_="product-image")['src']
    return map

def init(search_key):
    url = "https://www.snapdeal.com/search?keyword="+search_key+"&sort=rlvncy"
    soup = getSoup(url)
    DETAILS_MAP = getProductDetails(soup)
    return DETAILS_MAP

