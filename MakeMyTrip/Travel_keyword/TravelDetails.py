from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.common.action_chains import ActionChains
import time
import logging
from common_locators import Locators


class TravelDetails:
    def __init__(self, wait_time=5):
        self.driver = 'none'
        self.wait_time = wait_time
        # self.driver = webdriver.Chrome()

    def login(self, browser="chrome"):

        if browser == "chrome":
            self.driver = webdriver.Chrome()
        else:
            pass
        self.driver.get(Locators.urlXpath)
        self.driver.maximize_window()
        self.driver.implicitly_wait(5)
        time.sleep(5)
        # self.driver.refresh()
        webelement = self.driver.find_element(By.XPATH, '//a[@data-cy="mmtLogo"]')
        ActionChains(self.driver).move_to_element(webelement).click(webelement).perform()
        # self.driver.find_element(By.XPATH, Locators.loginAccountXpath).click()
        # self.driver.find_element(By.ID, Locators.userNameId).send_keys('barada.prasanna1987@gmail.com')
        # self.driver.find_element(By.XPATH, Locators.continueButtonXpath).click()
        # time.sleep(2)
        # self.driver.find_element(By.ID, Locators.passwordId).send_keys('Prasanna@123')
        # time.sleep(5)
        # #assert len(password) >= 6, "Password should minimum 6 character"
        # self.driver.find_element(By.XPATH, Locators.loginButtonXpath).submit()
        time.sleep(5)

    def flight_booking_details(self, travel):
        booking = self.driver.find_elements(By.XPATH, Locators.flightBookingXpath)
        for select in booking:
            print(select.text, " and ", select.is_selected())
            if select.text == travel:
                if select.is_selected():
                    pass
                else:
                    select.click()
                    print(select.text)
                    break
        self.wait_for_visible_element(locator='xpath', path=Locators.fromXpath)
        self.driver.find_element(By.ID, Locators.fromCityXpath).send_keys('Bhu')

    def wait_for_visible_element(self, locator, path):
        if locator == 'xpath':
            WebDriverWait(self.driver).until(EC.visibility_of_element_located((By.XPATH, path)))
        elif locator == 'id':
            WebDriverWait(self.driver).until(EC.visibility_of_element_located((By.NAME, path)))
        elif locator == 'name':
            WebDriverWait(self.driver).until(EC.visibility_of_element_located((By.NAME, path)))
        else:
            raise Exception("Invalid locator")
