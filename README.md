# Puppet module for Keepalived

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the keepalived module](#setup)
4. [Reference - Types reference and additional functionalities](#reference)
5. [Hiera integration](#hiera)
6. [Contact](#contact)

<a name="overview"/>

## Overview

Module to manage Keepalived configuration and runtime. All configuration can be driven via Hiera.

<a name="module-description"/>

## Module Description

The keepalived module allows to automate the configuration and deployment of the keepalived daemon.

<a name="setup"/>

## Setup

The include the main class as follows:

```
include keepalived
```

<a name="reference"/>

## Reference

### Classes

#### keepalived
`keepalived`

```
include keepalived
```

##### `opts` (optional)
Keepalived main options.

##### `globaldefs_opts` (optional)
Keepalied globals configurations.

##### `static_ipaddress` (optional)
List of static IP addresses.

##### `static_rules` (optional)
List of static rules.

##### `static_routes` (optional)
List of static routes.

##### `vrrp_scripts` (optional)
VRRP scripts.

##### `vrrp_sync_groups` (optional)
VRRP sync groups.

##### `garp_groups` (optional)
GARP groups.

##### `vrrp_instances` (optional)
VRRP instances.

##### `vrrp_server_groups` (optional)
VRRP server groups.

##### `vrrp_servers` (optional)
VRRP servers.

##### `config_dir` (optional)
Path to the configuration directory. Defaults to `/etc/keepalived`.

##### `config_dir_purge` (optional)
Whether we should purge unmanaged resources under the keepalived's configuration directory. Defaults to `true`.

##### `config_file` (optional)
Path to the keepalived configuration file. Defaults to `$config_dir/keepalived.conf`.

##### `config_file_manage` (optional)
Whether we should manage keepalived's configuration file or not. Defaults to `true`.

##### `packages` (optional)
Installation packages for keepalived.

Defaults to:
```
keepalived::packages:
  "keepalived": {}
```

##### `service_name` (optional)
Keepalived service name. Defaults to `keepalived`.

##### `service_manage` (optional)
Whether we should manage the service runtime or not. Defaults to `true`.

##### `service_ensure` (optional)
Whether the resource is running or not. Valid values are `running`, `stopped`. Defaults to `running`.

##### `service_enable` (optional)
Whether the service is onboot enabled or not. Defaults to `true`.

### Defined Types

#### keepalived::config_block
`keepalived::config_block` manages a snippet configuration block

```
keepalived::config_block {"block_id": .. }
```

##### `order` (required)
Configuration order.

##### `block_id` (required)
Configuration block ID (global_defs, virtual_server etc.).

##### `block_name` (optional)
Configuration block name.

##### `opts` (optional)
Configuration options.

##### `ensure` (optional)
Whether the resource is present or not. Valid values are `present`, `absent`. Defaults to `present`.

#### keepalived::garp_group
`keepalived::garp_group` manages gratuitous ARPs (GARP) groups.

```
keepalived::garp_group {"group_name": .. }
```

##### `garp_interval` (optional)
Sets the interval between Gratuitous ARP (in seconds, resolution microseconds).

##### `gna_interval` (optional)
Sets the interval between unsolicitated NA (in seconds, resolution microseconds).

##### `interface` (optional)
The physical interface to which the intervals apply.

##### `interfaces` (optional)
A list of interfaces across which the delays are aggregated.

##### `ensure` (optional)
Whether the resource is present or not. Valid values are `present`, `absent`. Defaults to `present`.

#### keepalived::vrrp_script
`keepalived::vrrp_script` manages VRRP scripts.

```
keepalived::vrrp_script {"script_name": .. }
```

##### `script` (required)
Script to run periodically.

##### `interval` (optional)
Run the script this every seconds.

##### `timeout` (optional)
Script considered failed after 'timeout' seconds.

##### `weight` (optional)
Adjust priority by this weight.

##### `fall` (optional)
Required number of failures fo KO switch.

##### `rise` (optional)
Required number of successes fo OK switch.

##### `user` (optional)
Specify user/group to run script under.

##### `init_fail` (optional)
Assume script initially is in failed state. Valid values are `true`, `false`.

##### `ensure` (optional)
Whether the resource is present or not. Valid values are `present`, `absent`. Defaults to `present`.

#### keepalived::vrrp_sync_group
`keepalived::vrrp_sync_group` manages VRRP sync groups.

```
keepalived::vrrp_sync_group {"group_name": .. }
```

##### `group` (required)
Group of VRRP instances to sync together.

##### `notify_master` (optional)
Script to run during MASTER transit.

##### `notify_backup` (optional)
Script to run during BACKUP transit.

##### `notify_fault` (optional)
Script to run during FAULT transit.

##### `notify_all` (optional)
Script to run during ANY state transit.

##### `smtp_alert` (optional)
Send email notification during state transit.

##### `ensure` (optional)
Whether the resource is present or not. Valid values are `present`, `absent`. Defaults to `present`.

#### keepalived::vrrp_instance
`keepalived::vrrp_instance` manages VRRP instances.

```
keepalived::vrrp_instance {"instance_name": .. }
```

##### `use_vmac` (optional)
Use VRRP virtual mac.

##### `version` (optional)
VRRP version to use. Valid values are `1`, `2`.

##### `vmac_xmit_base` (optional)
Send/receive VRRP messages from base interface instead of VMAC interface.

##### `state` (optional)
Start-up default state. Valid values are `MASTER`, `BACKUP`.

##### `interface` (optional)
Binding interface.

##### `accept` (optional)
Allow a non address-owner to process packets destined to VIPs and eVIPs. Valid values are `true`, `false`.

##### `no_accept` (optional)
Set non-accept mode. Valid values are `true`, `false`.

##### `track_interface` (optional)
List of interfaces state to monitor.

##### `track_script` (optional)
List of scripts state to monitor.

##### `dont_track_primary` (optional)
Ignore VRRP interface faults. Valid values are `true`, `false`.

##### `mcast_src_ip` (optional)
Source IP to use into the VRRP packets.

##### `unicast_src_ip` (optional)
Source IP to use into the VRRP packets.

##### `unicast_peer` (optional)
List of IP addresses to advert.

##### `garp_master_delay` (optional)
Delay in seconds for second set of gratuitous ARP messages after MASTER state transition.

##### `garp_master_repeat` (optional)
How many gratuitous ARP messages after MASTER state transition should be sent.

##### `garp_lower_priority_delay` (optional)
Delay for second set of gratuitous ARPs after lower priority advert received when MASTER.

##### `garp_lower_priority_repeat` (optional)
Number of gratuitous ARP messages to send at a time after lower priority advert received when MASTER.

##### `garp_master_refresh` (optional)
Periodic delay in seconds sending ratuitous ARP while in MASTER state.

##### `garp_master_refresh_repeat` (optional)
How many gratuitous ARP messages should be sent at each periodic repeat.

##### `virtual_router_id` (required)
VRRP virtual router ID.

##### `priority` (optional)
VRRP priority.

##### `advert_int` (optional)
VRRP advert interval.

##### `lower_prio_no_advert` (optional)
Disable advert sending if a lower priority advert is received. Valid values are `true`, `false`.

##### `higher_prio_send_advert` (optional)
Disable advert sending if a higher priority advert is received. Valid values are `true`, `false`.

##### `authentication` (optional)
VRRP authentication.

##### `virtual_ipaddress` (optional)
List of IP addresses to use in the VRRP instance.

##### `virtual_ipaddress_excluded` (optional)
List of IP addresses excluded from VRRP packets.

##### `promote_secondaries` (optional)
Set the promote secondaries flag on the interface to stop other addresses in the same CIDR from being removed when any of them is removed. Valid values are `true`, `false`.

##### `virtual_routes` (optional)
VRRP virtual routes.

##### `virtual_rules` (optional)
VRRP virtual rules.

##### `nopreempt` (optional)
Override VRRP RFC preemption default. Valid values are `true`, `false`.

##### `preempt_delay` (optional)
Seconds after startup or seeing a lower priority master until preemption. Valid values are `0-1000`.

##### `strict_mode` (optional)
Enable VRRP sctrict mode. Valid values are `true`, `false`.

##### `debug` (optional)
Set debug level. Valid values are `0-4`.

##### `notify_master` (optional)
Script to run during MASTER transit.

##### `notify_backup` (optional)
Script to run during BACKUP transit.

##### `notify_fault` (optional)
Script to run during FAULT transit.

##### `notify_all` (optional)
Script to run during ANY state transit.

##### `smtp_alert` (optional)
Send email notification during state transit.

##### `ensure` (optional)
Whether the resource is present or not. Valid values are `present`, `absent`. Defaults to `present`.

#### keepalived::virtual_server
`keepalived::virtual_server` manages virtual servers.

```
keepalived::virtual_server {"server_name": .. }
```

##### `type` (optional)
Virtual server type. Valid values are `ip`, `fwmark`, `group`. Defaults to `ip`.

##### `ip_family` (optional)
Address family. Valid values are `inet`, `inet6`. Defaults to `inet`.

##### `delay_loop` (optional)
Delay timer for service polling

##### `lvs_sched` (optional)
LV scheduled used. Valid values are `rr`, `wrr`, `lc`, `wlc`, `lblc`, `sh`, `dh`, `fo`, `ovf`, `lblcr`, `sed`, `nq`.

##### `hashed` (optional)
Apply hashing. Valid values are `true`, `false`.

##### `flag-1` (optional)
Apply scheduler flag 1. Valid values are `true`, `false`.

##### `flag-2` (optional)
Apply scheduler flag 2. Valid values are `true`, `false`.

##### `flag-3` (optional)
Apply scheduler flag 3. Valid values are `true`, `false`.

##### `sh-port` (optional)
Apply sh-port scheduler flag. Valid values are `true`, `false`.

##### `sh-fallback` (optional)
Apply sh-fallback scheduler flag. Valid values are `true`, `false`.

##### `ops` (optional)
Apply one packet scheduling (only for UDP). Valid values are `true`, `false`.

##### `lvs_method` (optional)
LVS method to use. Valid values are `NAT`, `DR`, `TUN`.

##### `persistence_engine` (optional)
LVS persistence engine name.

##### `persistence_timeout` (optional)
LVS persistence timeout.

##### `persistence_granularity` (optional)
LVS granularity mask.

##### `protocol` (optional)
L4 protocol. Valid values are `TCP`, `UDP`, `SCTP`.

##### `ha_suspend` (optional)
Suspend heath checks if virtual server's IP address is not set. Valid values are `true`, `false`.

##### `virtualhost` (optional)
VirtualHost string to use for HTTP_GET or SSL_GET checks.

##### `alpha` (optional)
Assume silently all real servers down and health checks failed on start. Valid values are `true`, `false`.

##### `omega` (optional)
Consider quorum and real servers down on daemon shutdown. Valid values are `true`, `false`.

##### `quorum` (optional)
Minimum total weight of all live servers in the pool necessary to operate the virtual server with no quality regression.

##### `hysteresis` (optional)
Tolerate this much weight units compared to the nominal quorum when considering quorum gain or loss.

##### `quorum_up` (optional)
Script to launch when quorum is gained.

##### `quorum_down` (optional)
Script to launch when quorum is lost.

##### `sorry_server` (optional)
Real server to add to the virtual server topology when all real servers are down.

##### `sorry_server_inhibit` (optional)
Apply the inhbit_on_failure behaviour to the sorry_server directive. Valid values are `true`, `false`.

##### `sorry_server_lvs_method` (optional)
LVS method to use for sorry server. Valid values are `NAT`, `DR`, `TUN`.

##### `real_servers` (optional)
List of real servers that belong to this virtual server.

##### `ensure` (optional)
Whether the resource is present or not. Valid values are `present`, `absent`. Defaults to `present`.

#### keepalived::real_server
`keepalived::real_server` manages real servers.

```
keepalived::real_server {"server_name": .. }
```

##### `weight` (optional)
Weight to use.

##### `lvs_method` (optional)
LVS method to use. Valid values are `NAT`, `DR`, `TUN`.

##### `inhibit_on_failure` (optional)
Set weight to 0 upon health checks failures. Valid values are `true`, `false`.

##### `notify_up` (optional)
Script to launch when health check consider service as up.

##### `notify_down` (optional)
Script to launch when health check consider service as down.

##### `http_get` (optional)
HTTP heath check.

##### `ssl_get` (optional)
SSL heath check.

##### `tcp_check` (optional)
TCP heath check.

##### `smtp_check` (optional)
SMTP heath check.

##### `dns_check` (optional)
DNS heath check.

##### `misc_check` (optional)
MISC heath check.

<a name="hiera"/>

## Hiera integration

You should define your configuration in Hiera as follows.

```
---
```

<a name="contact"/>

## Contact

Matteo Cerutti - matteo.cerutti@hotmail.co.uk
