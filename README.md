Ansible Collection - yabusygin.netfilter
========================================

The `yabusygin.netfilter` Ansible collection is used for configuring Netfilter
based firewalling, NAT and packet mangling for Linux.

Included Content
----------------

Roles:

- `yabusygin.netfilter.iptables`: configure persistent iptables rules

Requirements
------------

Only the `ansible-core` package is required. Tested with the `ansible-core`
version 2.16.

Installation
------------

The collection may be installed with the following command:

```sh
ansible-galaxy collection install --requirements-file=requirements.yml
```

The `requirements.yml` file content:

```yaml
---
collections:
  - name: yabusygin.netfilter
```

License
-------

MIT

Author Information
------------------

Alexey Busygin \<yaabusygin@gmail.com\>
