% Preview my changes
% Michael F. Lamb
% Fri, 23 Apr 2021 15:17:30 -0700

Use the `serve-python` module.

```
MODULES := webserver ...
```
and then run
```
make serve
```

This starts a little local webserver to preview your site before deploying it the public internet.

There's many other ways to do this. Each of these commands will start a webserver that serves its current directory at http://localhost:8000, if you have the software installed.

- Python 2: `python -m SimpleHTTPServer` (stop using Python 2.)
- Python 3: `python3 -m http.server 8000`
- Ruby: `ruby -run -e httpd . -p 8000`
- PHP: `php -S localhost:8000`
- busybox: `busybox httpd -f -p 8000`

<!--
- docker: `docker run -it - - rm busybox httpd -f -p 8000` # FIXME volume-mount ./, configure ports, etc.
-->

TODO: make more modules out of these mechanisms named e.g. `serve-busybox`, etc.
