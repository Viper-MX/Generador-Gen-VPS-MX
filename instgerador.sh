#!/bin/bash
BARRA="\033[1;36m-----------------------------------------------------\033[0m"
IVAR="/etc/http-instas"
SCPT_DIR="/etc/SCRIPT"
SCPresq="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1ZpcGVyLU1YL0dlbmVyYWRvci1HZW4tVlBTLU1YL21hc3Rlci9nZXJhZG9y"
SUB_DOM='base64 -d'
rm $(pwd)/$0

ofus () {
unset server
server=$(echo ${txt_ofuscatw}|cut -d':' -f1)
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="+";;
"+")txt[$i]=".";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="%";;
"%")txt[$i]="4";;
"-")txt[$i]="K";;
"K")txt[$i]="-";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}

veryfy_fun () {
[[ ! -d ${IVAR} ]] && touch ${IVAR}
[[ ! -d ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
unset ARQ
case $1 in
"gerar.sh")ARQ="/usr/bin/";;
"http-server.py")ARQ="/bin/";;
*)ARQ="${SCPT_DIR}/";;
esac
mv -f $HOME/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}
meu_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
echo "$IP" > /usr/bin/vendor_code
}
function_verify () {
  permited=$(curl -sSL "https://raw.githubusercontent.com/rudi9999/Generador_Gen_VPS-MX/master/Control-IP")
  [[ $(echo $permited|grep "${IP}") = "" ]] && {
  echo -e "\n\n\n\033[1;31m====================================================="
  echo -e "\033[1;31m       ¡LA IP $(wget -qO- ipv4.icanhazip.com) NO ESTA AUTORIZADA!"
  echo -e "\033[1;31m                CONTACTE A @Rufu99"
  echo -e "\033[1;31m=====================================================\n\n\n"
  [[ -d /etc/SCRIPT ]] && rm -rf /etc/SCRIPT
  exit 1
  } || {
  ### INTALAR VERCION DE SCRIPT
  v1=$(curl -sSL "https://raw.githubusercontent.com/rudi9999/Generador_Gen_VPS-MX/master/Vercion")
  echo "$v1" > /etc/versin_script
  }
}
meu_ip
#function_verify
echo -e "$BARRA"
echo -e "\033[1;33mDescargando archivos... "
echo -e "$BARRA"
cd $HOME
REQUEST=$(echo $SCPresq|$SUB_DOM)
wget -O "$HOME/lista-arq" ${REQUEST}/GERADOR > /dev/null 2>&1
sleep 1s
[[ -e $HOME/lista-arq ]] && {
for arqx in `cat $HOME/lista-arq`; do
echo -ne "\033[1;33mDescargando: \033[1;31m[$arqx] "
wget -O $HOME/$arqx ${REQUEST}/${arqx} > /dev/null 2>&1 && {
echo -e "\033[1;31m- \033[1;32mRecibido!"
[[ -e $HOME/$arqx ]] && veryfy_fun $arqx
} || echo -e "\033[1;31m- \033[1;31mFalla (no recibido!)"
done
[[ ! -e /usr/bin/trans ]] && wget -O /usr/bin/trans https://raw.githubusercontent.com/rudi9999/Generador_Gen_VPS-MX/master/Install/trans &> /dev/null
[[ -e /bin/http-server.py ]] && mv -f /bin/http-server.py /bin/http-server.sh && chmod +x /bin/http-server.sh
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] || apt-get install netcat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || apt-get install apache2 -y &>/dev/null
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
service apache2 restart > /dev/null 2>&1 &
IVAR2="/etc/key-gerador"
echo "$Key" > $IVAR
cp $HOME/lista-arq /etc/SCRIPT
cp /bin/http-server.sh /etc/SCRIPT
mv /etc/SCRIPT/http-server.sh /etc/SCRIPT/http-server.py
wget https://raw.githubusercontent.com/rudi9999/Generador_Gen_VPS-MX/master/gerador/gerar.sh &>/dev/null
mv gerar.sh /etc/SCRIPT
cd /etc/SCRIPT
rm -rf FERRAMENTA KEY KEY! INVALIDA!
rm $HOME/lista-arq
sed -i -e 's/\r$//' /usr/bin/gerar.sh
echo -e "$BARRA"
echo "/usr/bin/gerar.sh" > /usr/bin/gerar && chmod +x /usr/bin/gerar
echo -e "\033[1;33m Perfecto, utilize el comando \033[1;31mgerar.sh o gerar \033[1;33mpara administrar sus keys y
 actualizar la base del servidor"
echo -e "$BARRA"
} || {
echo -e "$BARRA"
echo -e "\033[1;33mKey Invalida!"
echo -e "$BARRA"
}
echo -ne "\033[0m"
apt-get install netcat -y &>/dev/null
apt-get install net-tools -y &>/dev/null
sed -i -e 's/\r$//' /usr/bin/gerar.sh
