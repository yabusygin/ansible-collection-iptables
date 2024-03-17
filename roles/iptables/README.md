Ansible Role - yabusygin.netfilter.iptables
===========================================

The role configures persistent iptables rules.

Requirements
------------

None.

Role Variables
--------------

The optional variables `iptables_rules_ipv4` and `iptables_rules_ipv6` specify
the paths to files containing the iptables configuration for IPv4 and IPv6,
respectively. The configuration is defined as a Jinja template of iptables rules
dump produced by the `iptables-save` (`ip6tables-save`) utility. For the default
configuration, see the role's `templates/rules.v4.jinja` and
`templates/rules.v6.jinja` files.

Dependencies
------------

None.

Example Playbook
----------------

```yaml
---
- name: Example playbook
  hosts: server
  tasks:
    - name: Configure firewall
      ansible.builtin.import_role:
        name: yabusygin.netfilter.iptables
      vars:
        iptables_rules_ipv4: rules.v4.jinja
        server_port: 443
```

The `rules.v4.jinja` file content:

```
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

--append=INPUT --in-interface=lo --jump=ACCEPT
--append=INPUT --match=conntrack --ctstate=RELATED,ESTABLISHED --jump=ACCEPT
--append=INPUT --match=conntrack --ctstate=INVALID --jump=DROP
--append=INPUT --protocol=tcp --match=tcp --destination-port=22 --jump=ACCEPT
--append=INPUT --protocol=tcp --match=tcp --destination-port={{ server_port }} --jump=ACCEPT
COMMIT
```
