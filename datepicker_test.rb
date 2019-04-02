require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://formy-project.herokuapp.com/datepicker"

datefield = driver.find_element(id: 'datepicker')
datefield.send_keys('03/04/2022')
datefield.send_keys :return
