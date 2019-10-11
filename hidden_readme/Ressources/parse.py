#!/Users/etranchi/.brew/Cellar/python/3.7.3/bin/python3
# coding: utf-8

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import requests



url = "http://10.12.1.122/.hidden/"
c_driver = ChromeDriverManager().install()

driver = webdriver.Chrome(c_driver)

driver.get(url)



def print_or_not(ret):
	if b"toujours" not in ret and b"voisin" not in ret and b"aide" not in ret and b"craquer" not in ret:
		print(ret)
	

def getRefs(_url):
	path_to_go = []
	try:
		driver.get(_url)
		allElements = driver.find_elements(By.TAG_NAME, 'a')
		for elm in allElements:
			path = elm.get_attribute('href')
			if "README" in path:
				response = requests.get(path)
				ret_txt = response.content
				print_or_not(ret_txt)
			elif not ".." in path and not path in _url:
				path_to_go.append(path)
		if len(path_to_go):
			for path in path_to_go:
				getRefs(path)
	except:
		print(_url)
		print("Erro")


getRefs(url)