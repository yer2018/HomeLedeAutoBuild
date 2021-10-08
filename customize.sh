#!/bin/bash
# Modify default IP
sed -i 's/192.168.1.1/10.10.10.254/g' package/base-files/files/bin/config_generate
# Modify default Theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile 
\cp -rf ../bg1.jpg feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
sudo chmod 640 feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
sed -i 's/width: 420px;/width: 330px;/g' feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
sed -i 's/margin-left: 5%;/margin-left: 0%;/g' feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
# Modify default HostName
sed -i 's/OpenWrt/HomeLEDE/g' package/base-files/files/bin/config_generate
# Modify default PassWord
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$a87b3JDA$O5S5vtQFGIL9deGI2KeBg1:0:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings
# Add ssh-rsa
sed -i '33a echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDs1m4Ts+ZDF0qEu0kNypyQ//lJFIeAGNMBtCO9KzNKHKxPWnPrc7w1Eu43HqBZGH2VDmX/gOF+7xu8H49g+xMHHsSO/OjnQlYZoYDMRwAiceScQiEa6NBxJZ9upgdrPaSOBJ1LWPJDY9JbIqXYLJCCps3ZVxkw4p1PgLLTkTNvsx/KRbLQzuLsHtGHqcRh5VEqAqwiXnRyqVhoT8EGarbwO/jfSIWYWAskyISBbly4Otq9pwl+UCLCDq8h+0stUlvhRWsbI0+O24+w9c6ldGT/gBn7rQiujjCVEPSZTe7+8JkPiMQSzurnSNpCvF5dgHNw9uXdTOIvVNBzOGc+e09nTWJqkYUQDMebujQH4ZxZkGQx4lrMtofmJyFQV+kkhzMASX8OS9jTD/gJSmBUWOODc2rvbE6E2iSBTRmHWIkwmSz31PDktocf1OtPthsIbnxuCaK3FuTDnSe0lJROhoawF9B+s9+vp8+n2ORrqFsyrtay9v7FNCiS7jMXdjX7wr8= ye@MacBook-Pro" > /etc/dropbear/authorized_keys' package/lean/default-settings/files/zzz-default-settings
# Modify build date
# sed -i '56a echo "v`date +%Y.%m.%d`" > /etc/buildmark' package/lean/default-settings/files/zzz-default-settings
#echo '修改WIFI为开启'
#sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#echo '修改默认WIFI名称'
#sed -i 's/ssid=OpenWrt/ssid=Panzy/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
