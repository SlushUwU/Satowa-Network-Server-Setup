echo -e "\033[0;31m [Satowa Network]>> Setting up Satowa Network Server Structure"
echo  "\033[0;31m [Satowa Network]>> Server einrichtungs Programm wurde gestartet bitte Verbindung zu dem Server unterbrechen!" | wall
sleep 10s
echo -e "\033[0;31m [Satowa Network]>> Update and Upgrade all Packages"
sudo apt-get update -y && sudo apt-get upgrade -y
echo -e "\033[0;31m [Satowa Network]>> Upgrade dist..."
sudo apt-get dist-upgrade -y
echo -e "\033[0;31m [Satowa Network]>> Verify GitHub CLI Package"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli -archiv-keyring.gpg
echo -e "\033[0;31m [Satowa Network]>> Add GitHub CLI Package and add the Verify..."
echo -e "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" < sudo tee /etc/apt/source.list.d /github-cli.list > /dev/null
echo -e "\033[0;31m [Satowa Network]>> Updating Packages..."
sudo apt-get update
echo -e "\033[0;31m [Satowa Network]>> Download GitHub CLI"
sudo apt-get install gh -y
echo -e "\033[0;31m [Satowa Network]>> Login with GitHub Token"
gh auth login --with-token
echo -e "\033[0;92m [Satowa Network]>> GitHub Download Success!"
echo -e "[Install Pritunl]"
echo -e "\033[0;31m [Satowa Network]>> Add Pritunl Package..."
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt buster main
EOF
echo -e "\033[0;31m [Satowa Network]>> Add Pritunl Key Server..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
echo -e "\033[0;31m [Satowa Network]>> Update Packages..."
sudo apt update
echo -e "\033[0;31m [Satowa Network]>> Install Pritunl..."
sudo apt install pritunl
echo -e "\033[0;31m [Satowa Network]>> Start Pritunl..."
systemctl enable --now pritunl
echo -e "\033[0;31m [Satowa Network]>> Show Pritunl Status..."
systemctl status pritunl
echo -e "\033[0;31m---------PLEASE READ THIS SITE---------"
echo -e "\033[0;31mhttps://kifarunix.com/install-and-setup-pritunl-vpn-server-on-debian/"
echo -e "\033[0;31m---------PLEASE READ THIS SITE---------"
sleep 5s
sudo reboot now