#!/bin/python3
import os
import sys
import tomli

"""
[ipmi]
  [ipmi.hostname]
  username	= "root"
  password	= "calvin"
  ip_addr	= "192.168.0.123"
"""

def ipmitool_on(cfg):
    os.system("ipmitool -I lanplus -U " + cfg["username"] + " -P " + cfg["password"] + " -H " + cfg["ip_addr"] + " chassis power on")

def ipmitool_off(cfg):
    os.system("ipmitool -I lanplus -U " + cfg["username"] + " -P " + cfg["password"] + " -H " + cfg["ip_addr"] + " chassis power off")

if __name__ == '__main__':
    filepath    = os.environ['HOME'] + '/dotfiles/local/config/config.toml'
    with open(filepath, mode='rb') as fp:
        config  = tomli.load(fp)

    if sys.argv[2] == "on":
        ipmitool_on(config["ipmi"][sys.argv[1]])
    elif sys.argv[2] == "off":
        ipmitool_off(config["ipmi"][sys.argv[1]])
