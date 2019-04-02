require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"

$first_name = 'John'
$last_name = 'Doe'
$job_title = 'QA'
$date = '05/25/2025'
$expected_banner_text = 'The form was successfully submitted!'

def submit_form(driver)
  driver.find_element(id: 'first-name').send_keys($first_name)
  driver.find_element(id: 'last-name').send_keys($last_name)
  driver.find_element(id: 'job-title').send_keys($job_title)
  driver.find_element(id: 'radio-button-2').click
  driver.find_element(id: 'checkbox-2').click
  driver.find_element(css: 'option[value="2"]').click
  driver.find_element(id: 'datepicker').send_keys($date)
  driver.find_element(id: 'datepicker').send_keys :return
  driver.find_element(css: '.btn.btn-lg.btn-primary').click
end

def get_banner_text(driver)
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { driver.find_element(class: 'alert').displayed? }
  banner = driver.find_element(class: 'alert')
  banner_text = banner.text
end

describe "automating a form" do
  it "submits a form" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://formy-project.herokuapp.com/form"
    submit_form(driver)
    actual_banner_text = get_banner_text(driver)
    expect(actual_banner_text).to eql($expected_banner_text)
    driver.quit
  end
end
