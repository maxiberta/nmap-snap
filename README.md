<a href="https://snapcraft.io/nmap">
  <img alt="nmap" src="https://snapcraft.io/nmap/badge.svg" />
</a>

<p align="center">
  <b>This is the snap for <a href="https://nmap.org/"><code>nmap</code></a></b>.
  <br/>
  Nmap ("Network Mapper") is a free and open source utility for network discovery and security auditing.
  <br/>
  It works on Ubuntu, Fedora, Debian, and other major Linux distributions.
</p>

## Command-line Installation

    sudo snap install nmap

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

That'll install the latest _stable_ release of `nmap`.

Or, if you're feeling adventurous, try the in-progress _next release_ from the `edge` channel:

    sudo snap install nmap --edge

## Permissions

Once installed, this snap needs manually connecting to some plugs:

    sudo snap connect nmap:network-control


## The Snapcrafters

[maxiberta](https://github.com/maxiberta/)

## Upstream

[Nmap](https://nmap.org/)
