This is my Debian live setup that I use for experimenting and fixing things. It's uses the [kiwi-ng](https://github.com/OSInside/kiwi) infrastructure for building Linux-based appliances.

If _you_ do use this (I don't know why you would:) make sure to download the dracut modules 'dmsquash-live' and 'livenet' into the `root/usr/lib/dracut/modules.d' directory to be merged into the build root until the dracut package on the Debian repos is updated. The modules can be found in [the Dracut repo](https://github.com/dracutdevs/dracut).
