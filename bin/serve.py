from SimpleHTTPServer import SimpleHTTPRequestHandler, test

class MyHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        SimpleHTTPRequestHandler.__init__(self, *args, **kwargs)
        self.extensions_map[''] = 'text/html'

    def send_head(self):
        print self.path
        prefix = "/~mike/beta.datagrok.org"
        if self.path.startswith(prefix):
            self.path = self.path[len(prefix):]
        path = self.translate_path(self.path)
        if os.path.isdir(path):
            for index in "contents", "contents.html":
                index = os.path.join(path, index)
                if os.path.exists(index):
                    self.path = '/'.join([self.path, index])
                    break
        return SimpleHTTPRequestHandler.send_head(self)

if __name__=='__main__':
    import os
    os.chdir('dst')
    test(HandlerClass=MyHandler)
