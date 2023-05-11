[pyqt] - listWidget

```python

# signal
self.serial_listWidget.clicked.connect(self._serial_select_event)

# event handler
def _serial_select_event(self):
    selected = self.serial_listWidget.currentItem().text()
    print('serial comm select', self.available_coms, selected)



```