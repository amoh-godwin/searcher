import re
import time
import threading

from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot


class Finder(QObject):


    def __init__(self):
        super().__init__()
        self.app_exited = False
        self.address = {}

        # filters
        self.ignore_caps = True

        # Load indeces
        self.load_indeces()


    updateResultsModel = pyqtSignal(list, arguments=['model'])

    @pyqtSlot(str)
    def find(self, needle: str):
        f_thread = threading.Thread(target=self._find, args=[needle])
        f_thread.daemon = True
        f_thread.start()

    def _find(self, needle: str):

        timer = 0.0
        results_count = 0
        results = {}

        timer = time.time()
        for each in self.address:

            # Filters
            if self.ignore_caps:
                f_needle = needle.lower()
                f_each = each.lower()
            else:
                f_needle = needle
                f_each = each

            if self.app_exited:
                break
            elif re.findall(f_needle, f_each):
                results_count += 1
                results[f_each] = self.address[each]


        print(results_count)
        print(results)
        print(time.time() - timer) # 1.17

    def load_indeces(self):
        l_thread = threading.Thread(target=self._load_indeces)
        l_thread.daemon = True
        l_thread.start()

    def _load_indeces(self):

        timer = time.time()

        with open('C:\\OxyTech\\Finder\\C_index.txt', 'r', encoding='utf-8') as e_file:
            for string in e_file:
                if self.app_exited:
                    break
                else: 
                    real = re.split('`', string)
                    self.address[real[0]] = real[1][0:-1]
        
        timer = time.time() - timer
        print(f"Load index took {timer} seconds")

