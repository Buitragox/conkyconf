# Personal conky configuration

My conky configuration with an **nvidia gpu**. The configuration utilizes conky variables for GPU monitoring, and some nvidia-smi commands. 

This was tested on **Debian 12** with **X11** on **conky 1.18.3**.

## Requirements

The main font is [Fira Code](https://github.com/tonsky/FiraCode) but you can change it to whatever you want.

For nvidia gpu compatibility remember to install the `conky-all` package instead of the `conky` package.

```
sudo apt install conky-all
```

You will also need to install [playerctl](https://github.com/altdesktop/playerctl) for displaying music metadata.

```
sudo apt install playerctl
```

## Tips

#### Fonts

TODO: copy fonts to ./fonts folder

`/usr/local/share/fonts`

`sudo fc-cache -fv`

`LC_ALL=en_US.utf8 conky`

#### Network

You will probably need to replace the name of the network interface for the `upspeed` and `downspeed` variables on the network section for it to work properly. Use `ip a show` to find the name of your network interface.

DELETE THIS SECTION... REPLACE FOR move contents of this repo to ~/.config/conky/
#### Update conky.conf

You can use the `update.sh` script to replace the `/etc/conky/conky.conf` file.

```
update.sh <path to new conky config>
```

Don't edit the `default-conky.conf` file so you can restore the default configuration just in case.

## Screenshots

<div align="center"><img width=400 src="./conky-screenshot.png" alt="screenshot"></div>
