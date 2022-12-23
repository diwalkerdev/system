A collection of useful scripts and tools that I like to use.

# Getting Started

These steps must be completed manually:

```
# generate a key
ssh-keygen -t ed25519

# go to gitlab.com and add the key

# clone the project
git clone git@github.com:diwalkerdev/system.git
```

Install the default programs and applications:
```
# run the setup script:
sudo chmod +x manjaro-setup.bash
./manjaro-setup.bash
```

Finally, remember to add davidw.bashrc to .zshrc/.bashrc to install the following tools:

# jumpdir
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

# pathmod
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

