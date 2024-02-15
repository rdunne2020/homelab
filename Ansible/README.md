## What the Playbook will verify
- Hermes
    - Cockpit
    - Util
    - Mounts?
- Poseidon
    - Jellyfin
    - Jellyseerr
    - Audiobookshelf
    - Mounts?
- Aphrodite
    - Portainer
    - Nextcloud
    - Paperless
    - Mounts?
- Neptune
    - Arr Stack
    - Homarr

## Vault
- The necessary passwords are stored in a vault file under group_variables/all

## Command
`ansible-playbook homelab.yml -i hosts.yml --extra-vars "exclude_hosts=['hermes', 'poseidon']"`
- The exclude_roles variable is a made up variable allowing us to not run specific roles if we don't want to.
- This variable must be included because I was too lazy to add for a check making sure it was there. Just leave it empty if you don't want anything excluded
- Just need to add a `when: "'hostname' not in exclude_hosts"` to the role call
