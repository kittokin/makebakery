from SimpleHTTPServer import SimpleHTTPRequestHandler, test
import os

class MyHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        SimpleHTTPRequestHandler.__init__(self, *args, **kwargs)
        self.extensions_map[''] = 'text/html'

    def send_head(self):
        prefix = os.environ.get('BASEURL', '')
        if prefix:
            if self.path.startswith(prefix):
                self.path = self.path[len(prefix):]
        fpath = self.translate_path(self.path)
        if os.path.isdir(fpath):
            default = os.environ.get('DEFAULT_DOCUMENT', 'contents')
            for index in default, default + ".html":
                if os.path.exists(os.path.join(fpath, index)):
                    self.path = '/'.join([self.path, index])
                    break
        return SimpleHTTPRequestHandler.send_head(self)

if __name__=='__main__':
    import os
    os.chdir(os.environ.get('DST', 'build'))
    test(HandlerClass=MyHandler)
