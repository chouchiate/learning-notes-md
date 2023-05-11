# [pyqt] QtCore.Qdir


```py
def initUI(self):

        self.setStyleSheet('background-color: silver')
        mod_path = os.path.dirname(Pythonic.__file__)
        """
        image_folder = QDir('images')

        if not image_folder.exists():
            logging.error('Image foulder not found')
            sys.exit(1)
        """

        self.layout_h = QHBoxLayout()

        self.e_mail = MasterTool(self, 'ConnMail', 1)
        self.e_mail.setPixmap(QPixmap(join(mod_path, 'images/ConnMail.png')).scaled(120, 60))

        self.rest = MasterTool(self, 'ConnREST', 1)
        self.rest.setPixmap(QPixmap(join(mod_path, 'images/ConnREST.png')).scaled(120, 60))

        self.layout_h.addWidget(self.e_mail)
        self.layout_h.addWidget(self.rest)
        self.layout_h.addStretch(1)

        self.setLayout(self.layout_h)

```