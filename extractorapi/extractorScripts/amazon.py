import requests as re
from bs4 import BeautifulSoup

HEADERS = {
    'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0',
}
def getSoup(url):
    response = re.get(url, headers=HEADERS)
    soup = BeautifulSoup(response.text, "html.parser")
    return soup

def getProductDetails(soup):
    map = dict()
    map['title'] = soup.find("span", class_="a-size-medium a-color-base a-text-normal").text
    map['price'] = soup.find("span", class_="a-price-whole").text
    map['del_cost'] = soup.find("span", class_="a-color-base").text
    map['ratings'] = soup.find("span", class_="a-icon-alt").text
    map['img'] = soup.find("img", class_="s-image")['src']
    return map

def init(search_key):
    url = "https://www.amazon.in/s?k="+search_key
    soup = getSoup(url)
    DETAILS_MAP = getProductDetails(soup)
    print(DETAILS_MAP)
    return DETAILS_MAP

