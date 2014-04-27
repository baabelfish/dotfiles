<<<<<<< HEAD
dotfiles
========

First of all, I must state that not everything in this repo was originally produced by me.


Dependencies
============

```
Termsyn
chromium
clipit
cmus
compton
dnsutils
dmenu
urxvt-font-size-git
dunst
dwb
dzen2
elementary-icon-theme
faenza-icon-theme
feh
nitrogen
gifsicle
gimp
gimp
gvim
i3
i3lock
i3status
libav (with --enable-x11grab)
mutt
screen
the_silver_searcher
tmux
transset-df
tree
udiskie
unclutter
urxvt
volumeicon
weechat
xautolock
xcape
xdotool
xmms2
xorg
xorg
xorg-apps
xorg-apps
xorg-xrandr
yaourt
zathura
zenity
zsh
autojump
```

```
jslint
nodejs-jshint
```
=======
uTest
=====

A simple test "library" for lazy people who don't like writing tests.

# Usage
- Create a test `something_test.cpp`:
```cpp
// Include it
#include "utest.hpp"

// Initializes everything (only one per file)
uTest() {
    // Add tests into it
    test([]{
        Warn(1 == 2); // Prints a warning and continues
        Assert(1 == 2); // Prints a failure and stops execution
    });
}
```
- Compile and run:
```bash
g++ -std=c++11 -o runner something_test.cpp && ./runner
```
- Run multiple tests:
```bash
for i in $(find *_test.cpp); do g++ -std=c++11 -o runner $i && ./runner; done
```

# Todo
- Add timeout
- Add timed comparisons
- Add time complexity testing
- Support for container -> container testing
>>>>>>> 7ccf4598bf5cb3589b0c3004b22f4c3ed3517cd5
