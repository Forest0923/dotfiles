#!/bin/python3
import socket
import struct
import tomli
import os

"""
An example of config.toml:

```toml
[wol.server]
mac_address	= "00:11:22:33:44:55"
domain		= "example.com"
port		= 7
```
"""

class WakeOnLan:
    def __init__(self, filepath):
        config      = self.import_config(filepath);
        self.mac    = config["wol"]["server"]["mac_address"]
        self.domain = config["wol"]["server"]["domain"]
        self.port   = config["wol"]["server"]["port"]

    def import_config(self, filepath):
        with open(filepath, mode='rb') as fp:
            config  = tomli.load(fp)
        return config

    def cr_magic_packet(self):
        self.mac    = self.mac.replace(self.mac[2], '')
        data        = ''.join(['FFFFFFFFFFFF', self.mac * 20])
        packet      = b''

        for j in range(0, len(data), 2):
            packet  = b''.join([
                packet, struct.pack('B', int(data[j: j+2], 16))
            ])
        return packet

    def send_packet(self, packet):
        sock    = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        sock.sendto(packet, (self.domain, self.port))

    def run(self):
        packet  = self.cr_magic_packet()
        self.send_packet(packet)


if __name__ == '__main__':
    filepath    = os.environ['HOME'] + '/dotfiles/local/config.toml'
    wol = WakeOnLan(filepath)
    wol.run()
