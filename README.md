# ansible-dns-site-wireguard

A simple interactive script that sets up a Wireguard VPN server with Adguard, Unbound and DNSCrypt-Proxy on your VPS of choice.

## Usage

```
git clone https://github.com/k-wlosek/ansible-dns-site-wireguard.git
cd ansible-dns-site-wireguard
bash bootstrap.sh
```

## Features
* Wireguard VPN server, for peer-to-peer encrypted traffic
* Hardened web server (Bunkerweb)
* Encrypted DNS resolution with optional ad-blocking functionality (Adguard Home, DNSCrypt and Unbound)
* Two-factor authentication for the AdGuard panel (Authelia)
* Automatic certificates using Let's Encrypt

## Requirements
* A KVM-based VPS (or an AWS EC2 instance) with a dedicated IPv4 address
* One of the supported Linux distros:
  * Ubuntu Server 22.04
  * Ubuntu Server 20.04
  * Debian 11

### 2FA setup for Authelia
Since there's no mail server, you need to get 2FA register link from the Authelia container logs. Fortunately, original playbook already provided a command to do that:
```bash
show_2fa
```
