% (wip) Automatically update the preview browser tab whenever the site changes
% Michael F. Lamb
% Fri, 23 Apr 2021 15:17:30 -0700

```
```

TODO.

I think the simplest way to accomplish this will be to connect up:

- inotify watching the preview site output directory with
- a tiny server serving a long-poll endpoint, and
- a scrap of javascript inserted to every page that long-polls the endpoint.

When inotify sees a file has been modified, the server emits the path of the modified data to waiting long-poll requests.
The JavaScript waiting on the long-poll response calls window.location.reload() when window.location matches the received path.
