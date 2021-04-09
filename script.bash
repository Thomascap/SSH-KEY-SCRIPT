#!/bin/bash
ALREADY_HAVE=false

echo "Are you already using SSH Keys? (y/n)"
read ALREADY_HAVE_CHOISE
if [ "$ALREADY_HAVE_CHOISE" == "y" ]; then
    ALREADY_HAVE=true
elif [ "$ALREADY_HAVE_CHOICE" == "yes" ]; then
    ALREADY_HAVE=true
elif [ "$ALREADY_HAVE_CHOICE" == "Y" ]; then
    ALREADY_HAVE=true
elif [ "$ALREADY_HAVE_CHOICE" == "Yes" ]; then
    ALREADY_HAVE=true
elif [ "$ALREADY_HAVE_CHOICE" == "n" ]; then 
    ALREADY_HAVE=false
elif [ "$ALREADY_HAVE_CHOICE" == "no" ]; then 
    ALREADY_HAVE=false
elif [ "$ALREADY_HAVE_CHOICE" == "N" ]; then 
    ALREADY_HAVE=false
elif [ "$ALREADY_HAVE_CHOICE" == "No" ]; then 
    ALREADY_HAVE=false
else
    echo "Answer not found"
fi


if [ "$ALREADY_HAVE" == true ]; then
echo "Type / paste your SSH key"
read ssh_key_true
echo "$ssh_key_false" >> /root/.ssh/authorized_keys
systemctl restart sshd
elif [ "$ALREADY_HAVE" == false ]; then
mkdir /root/.ssh
echo "Type / paste your SSH key"
read ssh_key_false
echo '## Below you will find SSH Keys' >> /root/.ssh/authorized_keys
echo "$ssh_key_false" >> /root/.ssh/authorized_keys 
sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
systemctl restart sshd
fi
echo "Your SSH Keys have been successfully set!"
