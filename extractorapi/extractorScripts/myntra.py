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
    bucket = soup.find("div", class_ = "_1YokD2 _3Mn1Gg")
    item = bucket.find("div", class_ = "_4ddWXP")
    if(item==None) :
        item = bucket.find("div", class_="_2kHMtA")
        if(item==None):
            return map
        
        map['title'] = item.find("div", class_ = "_4rR01T").text
        map['price'] = item.find("div", class_ = "_30jeq3 _1_WHN1").text
        map['ratings'] = item.find("div", class_="_3LWZlK").text
        map['del_cost'] = item.find("div", class_="_3tcB5a p8ucoS").find("div", class_="_2Tpdn3").text
        map['img'] = item.find("img", class_="_396cs4")['src']
        return map
    
    map['title'] = item.find("a", class_ = "s1Q9rs")['title']
    map['price'] = item.find("div", class_ = "_30jeq3").text
    map['ratings'] = item.find("div", class_="_3LWZlK").text
    map['del_cost'] = item.find("div", class_="_3tcB5a _2hu4Aw").text
    map['img'] = item.find("img", class_="_396cs4")['src']
    return map


# Test Phase

url = "https://www.meesho.com/search?q=airdops"
soup = getSoup(url)
print(soup.head.title)

