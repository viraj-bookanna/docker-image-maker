#!/bin/bash
echo "creating user.."
NEW_USER="viraj"
while true; do
    if id "$NEW_USER" &>/dev/null; then
        echo "User $NEW_USER already exists. Please choose another username."
    else
        sudo adduser $NEW_USER --disabled-password
        echo "User $NEW_USER has been added."
        break
    fi
done
PUB_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD1Tlmhtm9CKAD43fH3AFziQQtMD3TID4Jf9nSUxEtXw7U97D6yWh2zphiruwvqP/Rg9F14fMTGFyT2FpkWOHMR7Gyz/A71KwGa9FPJQSirMiS8XiJWrOlBTTeFGQVU5Z8wagiEWVoHQDL/rV11XOeE9q24boH19YtOLbaxYblR0FK7W1W3gUIwPpk8iUfle1iY610xzzty9SoTPw3d5O/sZtACQmdK0wTaePXe11FJvD7xiYqn9Zj2qvAxr6bj/M4QkhaxF75blO3kLkrVcWUu3cbEru2VHVC2SpBkR19iJ5mShPRQq/MFa26UIYAH7qzIQltYKj3SLw765qcLGV6vALAFI4azsVwQowNizRlcd0AsDJ1w/yphWOPN/PgpIuG20Pz4I/GaZJVPfIAmEKyxTnXDCp8sOteqHCpe2wxwNiZ4Qb35DIW7u/j7+kX6GQhtLARcpk6MjOKAFwY9emhDn662wZJTRZohnzvxihXwv8s9ss+h54KvnKjOdt9ulZc= unknown@DESKTOP-ABHNPP8"
sudo echo "$NEW_USER ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$NEW_USER"
sudo usermod -aG sudo $NEW_USER
# allowing pub key login
sudo sed -r -i 's/^#?PubkeyAuthentication (yes|no)$/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -r -i 's/^#?TCPKeepAlive (yes|no)$/TCPKeepAlive yes/g' /etc/ssh/sshd_config
sudo sed -r -i 's/^#?ClientAliveInterval .+$/ClientAliveInterval 30/g' /etc/ssh/sshd_config
sudo sed -r -i 's/^#?ClientAliveCountMax .+$/ClientAliveCountMax 9999/g' /etc/ssh/sshd_config
NEW_PORT="2222"
sudo sed -r -i "s/^#?Port .+$/Port $NEW_PORT/g" /etc/ssh/sshd_config

echo "adding ssh key for user.."
mkdir -p /home/$NEW_USER/.ssh
chmod 0700 /home/$NEW_USER/.ssh
echo $PUB_KEY >> /home/$NEW_USER/.ssh/authorized_keys
chmod 600 /home/$NEW_USER/.ssh/authorized_keys
sudo chown -hR $NEW_USER /home/$NEW_USER/.ssh
echo "restarting ssh service.."
sudo systemctl restart ssh
echo "done!"
exit
