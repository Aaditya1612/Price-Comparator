# import requests as re
# from bs4 import BeautifulSoup

# HEADERS = {
#     'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0',
# }
# def getSoup(url):
#     response = re.get(url, headers=HEADERS)
#     soup = BeautifulSoup(response.text, "html.parser")
#     return soup

# def getProductDetails(soup):
#     map = dict()
#     map['title'] = soup.find("span", class_="a-size-medium a-color-base a-text-normal").text
#     map['price'] = soup.find("span", class_="a-price-whole").text
#     map['del_cost'] = soup.find("span", class_="a-color-base").text
#     map['ratings'] = soup.find("span", class_="a-icon-alt").text
#     map['img'] = soup.find("img", class_="s-image")['src']
#     return map

# def init(search_key):
#     url = "https://www.amazon.in/s?k="+search_key
#     soup = getSoup(url)
#     DETAILS_MAP = getProductDetails(soup)
#     print(DETAILS_MAP)
#     return DETAILS_MAP

# init("airpods")

import csv
from bs4 import BeautifulSoup
from selenium import webdriver 
import msedge.selenium_tools


def get_url(search_term):
    template = "https://www.amazon.in/s?k={}1"
    search_term = search_term.replace(" ", "+")

    #add search query to the url
    url = template.format(search_term)


    url += '&page={}'

    return url

def extract_record(item):
    """"Extract and return data from a single finding"""

    #scrapping description and url

    atag = item.h2.a
    description = atag.text.strip()
    url = "https://www.amazon.com/" + atag.get("href")
    
    try:
        #retriving price
        price_parent = item.find("span", "a-price")
        price = price_parent.find("span", "a-offscreen").text

    except AttributeError:

        return
        
    #retriving rating

    try:
        rating = item.i.text

    except AttributeError:

        rating = ""
    

    result = (description, price, rating, url)
    return result



def main(search_term):

    #staring the web driver
    edgeBrowser = webdriver.Edge(executable_path= r"C:\Users\AADITYA RAJ\Downloads\edgedriver_win64\msedgedriver.exe") # webdriver path
    
    url = get_url(search_term)

    records = []

    for page in range(1,21): #(1,21) defines the range of pages which are to be scrapped

        edgeBrowser.get(url.format(page))

        soup = BeautifulSoup(edgeBrowser.page_source, 'html.parser')

        results = soup.find_all("div", {"data-component-type": "s-search-result"})

        for item in results:
            record = extract_record(item)
            if record:
                records.append(record)
    
    edgeBrowser.close()

    # Save the results to a .csv file

    with open('results.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(["Description", "Price", "Rating", "Url"])
        writer.writerows(records)

search_query = input("Specify the item: " )
main(search_query)