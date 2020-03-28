### Switching the command and control key to use Mac keyboard on Ubuntu 16.04

Add the following to `~/.Xmodmap`

```
clear control
clear mod4

keycode 105 =
keycode 206 =

keycode 133 = Control_L NoSymbol Control_L
keycode 134 = Control_R NoSymbol Control_R
keycode 37 = Super_L NoSymbol Super_L

add control = Control_L
add control = Control_R
add mod4 = Super_L
```

Run: `xmodmap ~/.Xmodmap`, then add that command to your startup applications.
