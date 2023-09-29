function update_dns () {
    SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}'`
    HOME_WIFI=`echo $SSID | grep -i helloworld`
    GOOGLE_WIFI=`echo $SSID | grep -i google`
    DNS=""
    if [[ -n $HOME_WIFI ]]; then
        #echo "Updating to Adguard DNS."
        DNS="10.0.0.41 2601:602:9b01:59f0::919f 2601:602:9b01:59f0:9cc1:1b7c:4a29:9a1e"
    elif [[ -n $GOOGLE_WIFI ]]; then
        #echo "Removing manual DNS entries."
        DNS="empty"
    else
        #echo "Updating to Google and Cloudflare DNS."
        DNS="1.1.1.1 8.8.8.8"
    fi;
    #set -x
    networksetup -setdnsservers Wi-Fi `echo $DNS`
    #set +x
}
