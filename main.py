import sys

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

from finder import Finder


def cleanUp():
    finder.app_exited = True

app = QGuiApplication(sys.argv)
app.aboutToQuit.connect(cleanUp)

engine = QQmlApplicationEngine()
engine.load('UI/main.qml')

finder = Finder()
engine.rootObjects()[0].setProperty('finder', finder)
engine.quit.connect(app.quit)


sys.exit(app.exec())
