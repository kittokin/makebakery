% About _Make_

_Make_ is a build tool that figures out which commands need to be run to transform some given set of source files into a desired set of output files.
Modern work-alikes include [Grunt][], [Rake][], or [Ant][].
Despite its age and the number of times it has been re-invented, _Make_ has some surprising features that I think makes it superior to the newcomers:

- When invoked multiple times, it is smart enough to only recompile target files whose source files have changed.
- When used on multi-core systems or with I/O heavy jobs, it is smart enough to figure out how to parallelize its work.
- It can apply multiple compilation steps to each source file to render the desired output, and it cleans up the intermediate files automatically.

_Make_ has a rather steep learning curve, but since it is so ubiquitous, it's likely to be already installed on your computer, and your web host's servers, and easy to obtain if not.

_Make_ is a POSIX standard, but Makebakery relies on a specific implementation with non-standard features: [GNU Make][]. Why?

Mostly because that's what is installed on all my computers, all of which run Debian GNU/Linux.
It's Free Software so it's not difficult to get running on other platforms.
Creating a similar system based on BSD Make, POSIX _Make_ or [Plan 9's Mk][Mk] might be possible, but it's not a high priority for me.

> ... the POSIX standard version of Make is extraordinarily feature-poor; it lacks many basic functions that people need in practice. As a result, most people create makefiles (the input files to make) that require specific implementations instead of just following the POSIX standard. Typically that specific implementation is GNU make; since GNU make runs on nearly every Unix-like system, and is FLOSS, this is an easy requirement to meet.
>
> --David Wheeler, [Improving Make (2014)][]

More about _Make_ and GNU Make: [Wikipedia: Make (software)][W:Make]

[W:Make]: https://en.wikipedia.org/wiki/Make_%28software%29
[Improving Make (2014)]: https://www.dwheeler.com/essays/make.html
[Mk]: http://doc.cat-v.org/plan_9/4th_edition/papers/mk
[GNU Make]: https://www.gnu.org/software/make/
[Grunt]: gruntjs.com
[Rake]: http://rake.rubyforge.org
[Ant]: http://ant.apache.org
