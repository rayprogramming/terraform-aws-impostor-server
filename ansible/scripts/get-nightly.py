from bs4 import BeautifulSoup
import requests
import re


url = 'https://nightly.link/Impostor/Impostor/workflows/ci/master'
html = requests.get(url).text
soup = BeautifulSoup(html, 'html.parser')


# Get all href from <a> tags
def get_nightly_url(i):
    for link in i.find_all('a'):
        if re.search('_linux-x64.zip$', link.get_text()):
            nightly_url = link.get('href')
            print(nightly_url)


get_nightly_url(soup)
