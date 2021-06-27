import re
import time
import threading

from PyQt5.QtCore import QObject, pyqtSignal


class Finder(QObject):


    def __init__(self):
        super().__init__()

    updateResultsModel = pyqtSignal(list, arguments=['model'])

    def find(self, needle: str):
        f_thread = threading.Thread(target=self._find, args=[needle])
        f_thread.daemon = True
        f_thread.start()

    def _find(self, needle: str):

        timer = 0.0

        item = {}
        results = 0

        with open('C:\\OxyTech\\Finder\\C_index.txt', 'r', encoding='utf-8') as e_file:
            for string in e_file:
                real = re.split('`', string)
                item[real[0]] = real[1][0:-1]

        timer = time.time()
        for each in item:
            if re.findall(needle, each):
                results += 1
                print(each)

        print(results)
        print(time.time() - timer)
