x=$((1))
clear
echo -e "\e[32m"
while [ $x -le 11 ]; do
   y=$( cut -d ',' -f $x intro )
   toilet -f future -F border $y
   if [ $x -lt 11 ]; then
      sleep 0.4
      tput cuu 5 && tput ed
   fi
   x=$(( x + 1 ))
done
sleep 0.4
clear
echo -e "\e[0m          Magru Tools\n"
toilet -f future -F gay WEBSCANNER
sleep 0.4
clear
echo -e "          Panda Tools\n"
toilet -f future -F metal WEBSCANNER
echo -e "\nBy Khusi-docker & PhiVault v1.0\n"

read -p "Enter Domain or IP :- " IP

ver=$( ping -c 1 $IP | grep -o "1 received" | wc -w )
if [ $ver -eq "2" ]; then
curl -s "https://www.ipqualityscore.com/api/json/url/KxNz4yY3GIfeLOPI9HcOsNFUSR2ws6JJ/$IP"  > data
echo -e "\n\e[31m + Server Name :\e[32m $( cat data | jq -r '.server') "
sleep 0.4
echo -e "\e[31m + Root Domain :\e[32m $( cat data | jq -r '.root_domain')"
sleep 0.4
echo -e "\e[31m + Domain Rank :\e[32m $( cat data | jq -r '.domain_rank')"
sleep 0.4
echo -e "\e[31m + Domain Down :\e[32m $( cat data | jq -r '.parking')"
sleep 0.4
echo -e "\e[31m + Page Size   :\e[32m $( cat data | jq -r '.page_size')"
sleep 0.4
echo -e "\e[31m + DNS VALID   :\e[32m $( cat data | jq -r '.dns_valid')"
sleep 0.4
echo -e "\e[31m + SPAM        :\e[32m $( cat data | jq -r '.spamming')"
sleep 0.4
echo -e "\e[31m + Malicious   :\e[32m $( cat data | jq -r '.malware')"
sleep 0.4
echo -e "\e[31m + Phishing    :\e[32m $( cat data | jq -r '.phishing')"
sleep 0.4
echo -e "\e[31m + Unsure      :\e[32m $( cat data | jq -r '.suspicious')"
sleep 0.4
echo -e "\e[31m + Risk Score  :\e[32m $( cat data | jq -r '.risk_score')"
sleep 0.4
echo -e "\e[31m + UNSAFE      :\e[32m $( cat data | jq -r '.unsafe')"
echo > data
sleep 0.4
   ip=$( ping -c 1 $IP | grep PING | cut -d ' ' -f3 | tr -d '(',')' )
   echo -e "\n\e[31m # Precise Location\e[32m$( curl -s ipinfo.io/$ip | grep "country" | cut -d ':' -f2 | tr -d '"' )\e[31m"
   echo -e " # Detected City\e[32m$( curl -s ipinfo.io/$ip | grep "city" | cut -d ':' -f2 | tr -d '"' )\e[31m"
   echo -e " # Current Region is\e[32m$( curl -s ipinfo.io/$ip | grep "region" | cut -d ':' -f2 | tr -d '"' )\e[31m"
   echo -e " # IP based Co-ords\e[32m$( curl -s ipinfo.io/$ip | grep "loc" | cut -d ':' -f2 | tr -d '"' )\e[31m"
   echo -e " # Organization Name -\e[32m $( curl -s https://ipwhois.app/json/$IP | cut -d ':' -f19 | cut -d ',' -f1 | tr -d '"' )\e[31m\n"
   nmap -PnOV $IP
   echo -e "\n\e[0m                     \e[41m         Starting Aggressive LLaMA Scan         \e[0m\e[32m"
   echo -e "\e[0m                     \e[44m                  Please Wait                   \e[0m\e[32m"
   echo -e "\e[0m                     \e[42m                      IN                        \e[0m\e[32m\n"
   
cont="Please Analyze $IP , give information like open ports , service used , os detection , vulnerabilities , full network scan , issues faced by customers or clients , recent frauds , reviews , conclusion and trust rating from various sites like scamadvisor ipquality check etc trust scores from at least 7 sources, Display the information in well stuctured format use whatever display technique you can just ensure user can properly differentiate and understand , Please ensure the output is not so much huge just dislay the relevent information only , if the input is not a domain or ip just replied please enter a valid domain or ip to work , nothing else"
( curl -s -X POST "https://openrouter.ai/api/v1/chat/completions" \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer $(cat api)" \
     -d "{
           \"model\": \"meta-llama/llama-3.1-8b-instruct:free\",
           \"messages\": [
             {\"role\": \"system\", \"content\": \"You are a website analyzer which checks website trust scores and more. Ensure you provide information without giving garbage data or errors\"},
             {\"role\": \"user\", \"content\": \"$cont\"}
           ] 
         }" | jq -r '.choices[0].message.content' | sed '/^$/d' | tr -d '*' ) > out.md

cat out.md | pv -qL 27 
echo > out.md
echo -e "\n\n\e[32mToolBy : \e[0mKhusi-docker \e[32m&\e[0m PhiVault \e[32m\nGitHub : \e[36mhttps://github.com/Khusi-docker/\n\e[32mGitHub : \e[36mhttps://github.com/PhiVault/\e[0m\n" | pv -qL 8
else
   echo -e "\n\e[31mHost Unreachable !\n\e[0m"
fi



