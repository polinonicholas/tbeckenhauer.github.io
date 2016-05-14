---
layout: post
title:  "Building GitHub Pages on Android"
date:   2021-04-23 00:00:00
---

1. Install Termux
2. Install Andronix
3. Install Ubuntu

	`pkg update -y && pkg install curl proot tar -y && curl https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu20/ubuntu20.sh | bash`

4. Start Ubuntu

	sudo isn't necessary

5. apt update
6. apt upgrade
7. apt install git ruby-dev make gcc gpp build-essential zlib1g zlib1g-dev
8. git clone https://github.com/tbeckenhauer/tbeckenhauer.github.io.git
9. cd tbeckenhauer.github.io
10. gem install bundler
11. bundler install
12. bundle exec jekyll serve
