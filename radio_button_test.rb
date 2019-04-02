require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://formy-project.herokuapp.com/radiobutton"

radio_button_1 = driver.find_element(id: 'radio-button-1')
radio_button_1.click

radio_button_2 = driver.find_element(css: 'input[value="option2"]')
radio_button_2.click

radio_button_3 = driver.find_element(xpath: '/html/body/div/div[3]/input')
radio_button_3.click
