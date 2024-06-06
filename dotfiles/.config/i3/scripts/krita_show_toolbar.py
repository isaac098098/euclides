# requieres python-pyqt5
from krita import *

Krita.instance().activeWindow().qwindow().menuBar().setVisible(True)
