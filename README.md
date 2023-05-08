# SSH-Ready Ubuntu

At SSH-Ready, our mission is to provide you SSH ready images for Docker containers.
You can make your own SSH image by forking any of our images, and get in touch with us to contribute!

# How to install ?
Only one command is required to launch your SSH-Ready image of Ubuntu.
`docker run -d -p 2022:22 ssh-ready/ubuntu:latest`

# How to connect to SSH.
You can use an SSH client like PuTTY, or you can use command line.
`ssh root@<ip> -p 2022`

The default password is `ubuntu`.

Note
----

The image doesn't expose other ports like `80`, `443`...
You'll need to add it to your `docker run` command, like this :
`docker run -d -p 2022:22 -p 8080:80 ssh-ready/ubuntu:latest`
*(example for Apache running on port 80)*

If you find an issue, please report it on the
[issue tracker](https://github.com/ssh-ready/ubuntu/issues/new/choose).
