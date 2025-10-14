# Script to toggle Krita menus

from krita import *
from PyQt5.QtWidgets import QToolBar

win = Krita.instance().activeWindow().qwindow()
items = [win.menuBar(), win.statusBar(), win.findChild(QToolBar, "BrushesAndStuff")]

toggle = 0

for i in items:
    toggle = i.isVisible() or toggle

if toggle:
    for i in items:
        i.setVisible(False)
else:
    for i in items:
        i.setVisible(True)
