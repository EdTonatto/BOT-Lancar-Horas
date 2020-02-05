import csv
import time
from getpass import getpass
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

print("--=== Informe o seu login no Redmine ===--")
user = input("Username: ")
password = getpass()

browser = webdriver.Chrome("./chromedriver")
browser.get('https://redmine.expressosaomiguel.com.br/redmine/projects?jump=welcome')
browser.maximize_window()

fieldUser = browser.find_element_by_xpath("//*[@id='username']").send_keys(user)
fieldPassword = browser.find_element_by_xpath("//*[@id='password']").send_keys(password)
btnLogin = browser.find_element_by_xpath("//*[@id='login-submit']").click()
btnTempoGasto = browser.find_element_by_xpath("//*[@id='main-menu']/ul/li[4]/a").click()
btnTempoTrabalho = browser.find_element_by_xpath("//*[@id='content']/div[1]/a").click()

#Abre arquivo CSV e lança as atividade cadastradas nele
with open('BOT-Horas-para-lancar.csv', 'r', encoding="utf8") as csvFile:
	readCSV = csv.reader(csvFile, delimiter = ';')
	next(readCSV, None)
	for data in readCSV:
		#Declaração dos campos utilizados no lançamento das horas
		fieldProjeto = browser.find_element_by_xpath("//*[@id='time_entry_project_id']")
		fieldIssue = browser.find_element_by_xpath("//*[@id='time_entry_issue_id']")
		fieldDate = browser.find_element_by_xpath("//*[@id='time_entry_spent_on']")
		fieldTimeSpent = browser.find_element_by_xpath("//*[@id='time_entry_hours']")
		fieldDescription = browser.find_element_by_xpath("//*[@id='time_entry_comments']")
		fieldActivity = browser.find_element_by_xpath("//*[@id='time_entry_activity_id']")
		btnCreateAndGo = browser.find_element_by_xpath("//*[@id='new_time_entry']/input[5]")

		#Printando informação para conferencia após execução
		print(data)

		#Seleção do Projeto
		selectProject = Select(fieldProjeto)
		for option in selectProject.options:
			if data[0] in option.text:
				selectProject.select_by_visible_text(option.text)
				break
			else:
				selectProject.select_by_visible_text('Product Backlog')

		#Informa tarefa relacionada
		fieldIssue.send_keys(data[1])

		#Informa data da atividade
		fieldDate.send_keys(data[2])

		#Informa tempo gasto na atividade
		fieldTimeSpent.send_keys(data[3])

		#Informa descrição da tarefa
		fieldDescription.send_keys(data[4])

		#Seleção do tipo de atividade
		selectActivity = Select(fieldActivity)
		for option in selectActivity.options:
			if data[5] in option.text:
				selectActivity.select_by_visible_text(option.text)
				break
			else:
				selectActivity.select_by_visible_text('Atividade')

		#Gerar lançamento e iniciar próximo
		btnCreateAndGo.click()
		time.sleep(3)

browser.quit()
