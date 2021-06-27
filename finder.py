import re
import time
import threading

from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot


class Finder(QObject):


    def __init__(self):
        super().__init__()
        self.app_exited = False

    updateResultsModel = pyqtSignal(list, arguments=['model'])

    @pyqtSlot(str)
    def find(self, needle: str):
        f_thread = threading.Thread(target=self._find, args=[needle])
        f_thread.daemon = True
        f_thread.start()

    def _find(self, needle: str):

        timer = 0.0

        item = {}
        results = 0


        timer = time.time()

        with open('C:\\OxyTech\\Finder\\C_index.txt', 'r', encoding='utf-8') as e_file:
            for string in e_file:
                if self.app_exited:
                    break
                else: 
                    real = re.split('`', string)
                    item[real[0]] = real[1][0:-1]

        print('timer: ', time.time() - timer) # 6.4

        print('should be')
        timer = time.time()
        for each in item:
            #print(each)
            if self.app_exited:
                break
            elif re.findall(needle, each):
                results += 1
                print(each)

        print(results)
        print(time.time() - timer) # 1.17
