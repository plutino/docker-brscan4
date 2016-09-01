#! /bin/sh
set +o noclobber
#
#   $1 = scanner device
#   $2 = friendly name
#

resolution=600  # 100|150|200|300|400|600|1200|2400|4800|9600

device=$1

filename=/scans/$(date +%F | sed s/-//g)$(date +%T | sed s/://g)".tif"

sleep  0.1

#echo "scan from $2($device) to $output_file"
scanimage --format tiff --mode "24bit Color[Fast]" --device-name "$device" --resolution $resolution> $filename 2>/dev/null

