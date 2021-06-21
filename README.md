# System
A collection of useful scripts and tools that I like to use.

## pathmod
Simplifies manipulating the Linux PATH variable.

You change **change** the path:
 - append
 - prepend
 - remove

Restore **defaults** or **show** the current path.

Note: pathmod only returns the result of the action. To make the change take effect you should `eval` the result.

Example:
```
$ pathmod show
$ /sbin:/bin
$ eval $(pathmod change --prepend=/opt/some-program/bin)
$ pathmod show
$ /opt/some-program/bin:/sbin:/bin
```

Requires [click](http://click.pocoo.org/5/).
```
$ pip install --user click
```

## jumpdir
Makes navigation simpler.

```
cd Projects/ACoolProject       # Go to a directory
jd -s                          # Save the directory, prompts for binding...

Add binding for C:\Users\UserX\Projects\ACoolProject
>> a
Current bindings:
 (a) = C:\Users\UserX\Projects\ACoolProject

```

Then jump to that directory at any time:
```
jd a
```

Get help:
```
jd -h
```