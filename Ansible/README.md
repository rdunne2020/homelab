## TODO
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

## Command
`ansible-playbook homelab.yml -i inventory.ini --ask-become-pass --extra-vars "exclude_hosts=['hermes', 'poseidon']"`
- The exclude_roles variable is a made up variable allowing us to not run specific roles if we don't want to.
- Just need to add a `when: "'hostname' not in exclude_hosts"` to the role call