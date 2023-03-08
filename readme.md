# Install checkmk agent 2.1 with ansible

# Download colletion 

```ansible-galaxy collection install tribe29.checkmk```

# Create yml file

```
---
- hosts: all

  collections:
    - tribe29.checkmk.agent

  vars:
    checkmk_agent_version: "2.1.0p23"
    checkmk_agent_edition: "cre"
    checkmk_agent_user: "automation"
    checkmk_agent_pass: "password"
    checkmk_agent_protocol: http
    checkmk_agent_server: 10.10.10.10
    checkmk_agent_port: 8080
    checkmk_agent_site: "cmk"
    checkmk_agent_force_install: 'true'
  roles:
    - agent
```
