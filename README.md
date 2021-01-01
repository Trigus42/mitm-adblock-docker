# MITM Adblock

An adblocker that runs as a proxy server! (And works on HTTPS connections.)
Use this to block ads on your mobile device, or just monitor its traffic.

Build from alpine:latest for amd64, arm64/v8, and arm/v7.

## Installation

 1. Install docker
 2. Run "docker run -d -p 8118:8118/tcp --name mitm-adblock trigus42/mitm-adblock"
 3. Setup your browser/phone to use `localhost:8118` or `lan-ip-address:8118` as an HTTP(S) proxy server; then, visit http://mitm.it on that device to install the MITM SSL certificate so that your machine won't throw security warnings whenever the proxy server intercepts your secure connections.

If you'd like to change any of the mitmproxy settings (like port, and where/whether it logs your connections), edit the `go` script.
