require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://formy-project.herokuapp.com/dragdrop"

image = driver.find_element(id: 'image')
box = driver.find_element(id: 'box')

driver.action.drag_and_drop(image,box).perform
