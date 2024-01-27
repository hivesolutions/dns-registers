# DNS Registers

The DNS registers for the Hive Solutions infra-structure, the set of files included in this repositories
are mean to be used by the [BIND DNS Server](https://www.isc.org/downloads/bind/).

## Configuration Modes

| Mode                   | Description                                                                                                                                                                          |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `normal` / `recursive` | Used to resolve DNS records for domains that are not being managed by the server, this mode is used to resolve the DNS records for the domains that are being managed by the server. |
| `authoritative`        | The default mode for the DNS server, this mode is used to serve the DNS records for the domains that are being managed by the server.                                                |
