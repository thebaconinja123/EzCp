echo "Disabling Root via SSH..."
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config 2> /dev/null
echo "Disabling Guest Login..."
echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
restart lightdm > /dev/null 2> /dev/null
echo "Finding Supposed 'hacking tools'..."
hackingtools="$(find . -name hack*)"
echo "Finding Totally Real 'malware'..."
malware="$(find . -name mal*)"
echo "Finding 'spyware'..."
spy="$(find . -name spy*)"
echo "Deleting Hacking Tools..."
rm $hackingtools
echo "Deleting Malware..."
rm $malware
echo "Deleting Spyware (y'know, besides Canotical's)..."
rm $spy
echo "Setting Password Reminders..."
echo "PASS_MIN_DAYS 7\nPASS_MAX_DAYS 90\nPASS_WARN_AGE 14\n" >> /etc/login.defs
echo "Setting Password Requirements..."
linewithpam="$(grep -n 'pam_unix.so' /etc/pam.d/common-password > awk '{ print $1}')"
sed "$linewithpam \bs/$/ minlen=10 remeber=5"
echo "Setting up daily updates..."
echo "sudo apt update && sudo apt upgrade" >> /etc/cron.daily/up&ud.sh
echo "Updating and upgrading..."
apt update && apt upgrade
echo "That's all I could do auto automatically without breaking anything.\nTo be clear I:\nDisabled Root Access from SSH.\nDisabled Guest Login.\nRemoved 'bad' software.\nSet password expiration, reminders, etc.\n Set password restrictions.\nSetup daily updates.\nand Updated repos and upgraded packeges."
