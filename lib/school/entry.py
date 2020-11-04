# coding=utf-8
import time, os, unittest, sys
from selenium import webdriver
from tkinter import messagebox

from selenium.webdriver.support.color import Color

#def rgba(param, param1, param2, param3):
#    pass


class CMWorkFlow(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.driver = webdriver.Chrome()

    #登录
    def Login(self,username,password):
        self.url = "http://211.144.105.165/admissions/login.action"
        self.driver.get(self.url)
        self.driver.implicitly_wait(5)
        self.driver.find_element_by_name("username").clear()
        self.driver.find_element_by_name("username").send_keys(username)
        self.driver.find_element_by_name("password").clear()
        self.driver.find_element_by_name("password").send_keys(password)
        self.driver.find_element_by_xpath('//*[@id="login_text"]/ul/li/div[5]/input[1]').click()

    def test_submit(self):
        print ('*'*30,' hello it is patrick! ', '*'*30)
        try:
            self.Login('jielinguo@ostay.cc', '10121001')
            self.driver.implicitly_wait(3)
            #点击确定
            self.driver.switch_to.alert.accept()
            #点击学生图片
            self.driver.implicitly_wait(3)
            self.driver.find_element_by_xpath('//*[@id="showContentAll"]/li[1]/a/table/tbody/tr[1]/td[1]/img').click()
            self.driver.implicitly_wait(3)
            #点击递交资料并审核
            self.driver.find_element_by_xpath('//*[@id="auditInfo"]/div/span').click()
            self.driver.implicitly_wait(3)
            #不停刷新页面
            for i in range(10):
                # 选择预约时间
                time1 = self.driver.find_element_by_xpath('//*[@id="ulappointmentInfo"]/table/tbody/tr[5]/td[2]/div/div[3]/table/tbody/tr[2]/td[2]')
                time1Color = time1.value_of_css_property('color')
                # print(time1Color)
                time2 = self.driver.find_element_by_xpath('//*[@id="ulappointmentInfo"]/table/tbody/tr[5]/td[2]/div/div[3]/table/tbody/tr[3]/td[2]')
                time2Color = time1.value_of_css_proper