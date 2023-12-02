# Personal conky configuration

My conky configuration with an **nvidia gpu**. The configuration utilizes conky variables for GPU monitoring, and some nvidia-smi commands. 

This was tested on **Debian 12**.

For nvidia gpu compatibility remember to install the `conky-all` package instead of the `conky` package.

```
sudo apt install conky-all
```

You can use the `update.sh` script to replace the `/etc/conky/conky.conf` file.

```
update.sh <path to new conky config>
```

Don't edit the `default-conky.conf` file so you can restore the default configuration just in case.

## Screenshots

<div><img width=400 src="./conky-screenshot.png" alt="screenshot"></div>
