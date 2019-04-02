require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://formy-project.herokuapp.com/switch-window"

new_tab_button = driver.find_element(id: "new-tab-button")
new_tab_button.click

driver.switch_to.window(driver.window_handles[1])
driver.switch_to.window(driver.window_handles[0])

alert_button = driver.find_element(id: "alert-button")
alert_button.click
driver.switch_to.alert.accept
