/usr/bin/brsaneconfig4 -a name=$SCANNER_NAME model=$SCANNER_MODEL ip=$SCANNER_IP_ADDRESS
/usr/bin/brscan-skey
while true; do
  sleep 300
done
exit 0
