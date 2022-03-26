# Mine Arweave

Arwaeve is a crypto project that aims to archive the world's information in an
immutable way and you can mine Arweave token using the spare hard drivers that
you have at home.  
This project provides a Docker configuration, so you can easily run Arweave miner
in any machine running docker.


## How to run

```
docker run --mount type=bind,source={{STORAGE_PATH}},destination=/data \
    -p 1984:1984 rafaelzimmermann/arweave \
    -w={{YOUR_WALLET}}
```

Replace:
- {{STORAGE_PATH}} : Path to the directory where the arweave data will be stored
- {{YOUR_WALLET}} : Your wallet address


## Create an Arweave wallet

[Arweave Web Extension Wallet](https://docs.arweave.org/info/wallets/arweave-web-extension-wallet)


## Make sure your node is accessible on the Internet

An important part of the mining process is discovering blocks mined by other
miners. Your node needs to be accessible from anywhere on the Internet so that
your peers can connect with you and share their blocks.  
To check if your node is publicly accessible, browse to `http://[Your Internet IP]:1984`.
You can, or by running `curl ifconfig.me/ip`.
If you can not access the node, you need to set up TCP port forwarding for incoming
HTTP requests to your Internet IP address on port **1984** to the selected port on your
mining machine. For more details on how to set up port forwarding, consult your ISP
or cloud provider.  
**If the node is not accessible on the Internet, the miner functions but is
significantly less efficient.**


## Why do I need Docker for that?

Docker allows you to run software without any “dependencies”. And with docker
you can not only skip the installation of the application but also simplify its
configuration.

# Support

<a href="https://www.buymeacoffee.com/r25b8yt77fh" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
