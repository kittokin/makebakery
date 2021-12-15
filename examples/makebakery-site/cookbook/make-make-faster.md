% Make `make` go faster
% Michael F. Lamb
% Fri, 23 Apr 2021 15:17:30 -0700

```
make -r -j
```

`-r` (or `--no-builtin-rules`) turns off several built-in compilation rules that GNU Make includes by default that are useful for compiling software.
Turning them off makes it so it doesn't have to try as hard to figure out the steps to transform your source files into your rendered files.

`-j` (or `--jobs`) causes make to run its compilation steps in parallel whenever it is safe to do so.
