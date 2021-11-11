#!/bin/bash
# Modify default IP
sed -i 's/192.168.1.1/10.10.10.254/g' package/base-files/files/bin/config_generate
# Modify default Theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile 
\cp -rf ../bg1.jpg feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
sed -i 's/width: 420px;/width: 330px;/g' feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
sed -i 's/margin-left: 5%;/margin-left: 0%;/g' feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
# Modify default HostName
sed -i 's/OpenWrt/HomeLEDE/g' package/base-files/files/bin/config_generate
# Modify default PassWord
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$a87b3JDA$O5S5vtQFGIL9deGI2KeBg1:0:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings
# Add ssh-rsa
sed -i '33a echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDs1m4Ts+ZDF0qEu0kNypyQ//lJFIeAGNMBtCO9KzNKHKxPWnPrc7w1Eu43HqBZGH2VDmX/gOF+7xu8H49g+xMHHsSO/OjnQlYZoYDMRwAiceScQiEa6NBxJZ9upgdrPaSOBJ1LWPJDY9JbIqXYLJCCps3ZVxkw4p1PgLLTkTNvsx/KRbLQzuLsHtGHqcRh5VEqAqwiXnRyqVhoT8EGarbwO/jfSIWYWAskyISBbly4Otq9pwl+UCLCDq8h+0stUlvhRWsbI0+O24+w9c6ldGT/gBn7rQiujjCVEPSZTe7+8JkPiMQSzurnSNpCvF5dgHNw9uXdTOIvVNBzOGc+e09nTWJqkYUQDMebujQH4ZxZkGQx4lrMtofmJyFQV+kkhzMASX8OS9jTD/gJSmBUWOODc2rvbE6E2iSBTRmHWIkwmSz31PDktocf1OtPthsIbnxuCaK3FuTDnSe0lJROhoawF9B+s9+vp8+n2ORrqFsyrtay9v7FNCiS7jMXdjX7wr8= ye@MacBook-Pro" > /etc/dropbear/authorized_keys' package/lean/default-settings/files/zzz-default-settings
# Modify default Shell
#sed -i '43a sed -i "s/\\\/bin\\\/ash/\\\/usr\\\/bin\\\/zsh/g" /etc/passwd' package/lean/default-settings/files/zzz-default-settings
# Modify build date
# sed -i '56a echo "v`date +%Y.%m.%d`" > /etc/buildmark' package/lean/default-settings/files/zzz-default-settings
#echo '修改WIFI为开启'
#sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#echo '修改默认WIFI名称'
#sed -i 's/ssid=OpenWrt/ssid=Panzy/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify network diagnostics
#sed -i '34a sed -i "s/<%=ping_host%>/www.baidu.com/g" /usr/lib/lua/luci/view/admin_network/diagnostics.htm' package/lean/default-settings/files/zzz-default-settings
#sed -i '35a sed -i "s/<%=route_host%>/www.baidu.com/g" /usr/lib/lua/luci/view/admin_network/diagnostics.htm' package/lean/default-settings/files/zzz-default-settings
#sed -i '36a sed -i "s/<%=dns_host%>/www.baidu.com/g" /usr/lib/lua/luci/view/admin_network/diagnostics.htm' package/lean/default-settings/files/zzz-default-settings
sed -i '32a sed -i "s/openwrt.org/www.baidu.com/g" /etc/config/luci'  package/lean/default-settings/files/zzz-default-settings
# Disable
sed -i '34a cp /etc/rc.local /etc/rc.local.bak' package/lean/default-settings/files/zzz-default-settings
sed -i '35a sed -i "2a /etc/init.d/odhcpd disable" /etc/rc.local' package/lean/default-settings/files/zzz-default-settings
sed -i '36a sed -i "3a /etc/init.d/led disable" /etc/rc.local' package/lean/default-settings/files/zzz-default-settings
sed -i '37a sed -i "4a /etc/init.d/shortcut-fe disable" /etc/rc.local' package/lean/default-settings/files/zzz-default-settings
sed -i '38a sed -i "5a wget https://cdn.jsdelivr.net/gh/yer2018/HomeLedeAutoBuild@master/AdGuardHome.yaml -O /etc/AdGuardHome/AdGuardHome.yaml" /etc/rc.local' package/lean/default-settings/files/zzz-default-settings
sed -i '39a sed -i "6a cp -f /etc/rc.local.bak /etc/rc.local" /etc/rc.local' package/lean/default-settings/files/zzz-default-settings
