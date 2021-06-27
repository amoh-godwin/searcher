import re
import time

from PyQt5.QtCore import QObject


class Finder(QObject):


    def __init__(self):
        pass

    needle = '55'
    timer = 0.0

    item = {}
    results = 0

    def _some_stuff(self):
        with open('C:\\OxyTech\\Finder\\D_index.txt', 'r', encoding='utf-8') as e_file:
            for string in e_file:
                real = re.split('`', string)
                self.item[real[0]] = real[1][0:-1]

        timer = time.time()
        for each in self.item:
            if re.findall(self.needle, each):
                self.results += 1
                print(each)
                
        print(self.results)
        print(time.time() - timer)
