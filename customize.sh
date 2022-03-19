#!/bin/bash
#DIY
wget https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js -O feeds/xiaoqingfeng/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/JD_DailyBonus.js
# Modify default IP
cat >package/base-files/files/etc/networkip <<-EOF
uci set network.lan.ipaddr='10.10.10.100'                                    # IPv4 地址(openwrt后台地址)
uci set network.lan.netmask='255.255.255.0'                                 # IPv4 子网掩码
uci set network.lan.gateway='10.10.10.2'                                   # IPv4 网关
uci set network.lan.broadcast='10.10.10.255'                               # IPv4 广播
uci set network.lan.dns='127.0.0.1'                         # DNS(多个DNS要用空格分开)
uci set network.lan.delegate='0'                                            # 去掉LAN口使用内置的 IPv6 管理
uci commit network                                                          # 不要删除跟注释,除非上面全部删除或注释掉了
uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释
uci set system.@system[0].hostname='Phicomm-N1'                             # 修改主机名称为Phicomm-N1
EOF

sed -i 's/192.168.1.1/10.10.10.100/g' package/base-files/files/bin/config_generate
# Modify default Theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile 
\cp -rf ../bg1.jpg feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
sed -i 's/width: 420px;/width: 330px;/g' feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
sed -i 's/margin-left: 5%;/margin-left: 0%;/g' feeds/xiaoqingfeng/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css

# Modify default Time zone
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# firewall custom
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user
# Modify default HostName
sed -i 's/OpenWrt/Phicomm-N1/g' package/base-files/files/bin/config_generate
# Modify default PassWord
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$a87b3JDA$O5S5vtQFGIL9deGI2KeBg1:0:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings
# Add ssh-rsa
sed -i '40a echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDs1m4Ts+ZDF0qEu0kNypyQ//lJFIeAGNMBtCO9KzNKHKxPWnPrc7w1Eu43HqBZGH2VDmX/gOF+7xu8H49g+xMHHsSO/OjnQlYZoYDMRwAiceScQiEa6NBxJZ9upgdrPaSOBJ1LWPJDY9JbIqXYLJCCps3ZVxkw4p1PgLLTkTNvsx/KRbLQzuLsHtGHqcRh5VEqAqwiXnRyqVhoT8EGarbwO/jfSIWYWAskyISBbly4Otq9pwl+UCLCDq8h+0stUlvhRWsbI0+O24+w9c6ldGT/gBn7rQiujjCVEPSZTe7+8JkPiMQSzurnSNpCvF5dgHNw9uXdTOIvVNBzOGc+e09nTWJqkYUQDMebujQH4ZxZkGQx4lrMtofmJyFQV+kkhzMASX8OS9jTD/gJSmBUWOODc2rvbE6E2iSBTRmHWIkwmSz31PDktocf1OtPthsIbnxuCaK3FuTDnSe0lJROhoawF9B+s9+vp8+n2ORrqFsyrtay9v7FNCiS7jMXdjX7wr8= ye@MacBook-Pro" > /etc/dropbear/authorized_keys' package/lean/default-settings/files/zzz-default-settings
# Modify default Shell
#sed -i '43a sed -i "s/\\\/bin\\\/ash/\\\/usr\\\/bin\\\/zsh/g" /etc/passwd' package/lean/default-settings/files/zzz-default-settings
# Modify build date
# sed -i '56a echo "v`date +%Y.%m.%d`" > /etc/buildmark' package/lean/default-settings/files/zzz-default-settings
#echo '修改WIFI为开启'
#sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#echo '修改默认WIFI名称'
#sed -i 's/ssid=OpenWrt/ssid=Phicomm_n1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Disable

sed -i "/exit 0/d" package/lean/default-settings/files/zzz-default-settings
echo "sed -i s/openwrt.org/www.baidu.com/g /etc/config/luci" >> package/lean/default-settings/files/zzz-default-settings
#echo "sed -i '2a /etc/init.d/odhcpd disable' /etc/rc.local" >> package/lean/default-settings/files/zzz-default-settings
echo "sed -i '4a /etc/init.d/led disable' /etc/rc.local" >> package/lean/default-settings/files/zzz-default-settings
echo "sed -i '5a /etc/init.d/hd-idle disable' /etc/rc.local" >> package/lean/default-settings/files/zzz-default-settings
echo "sed -i '6a /etc/init.d/haproxy disable' /etc/rc.local" >> package/lean/default-settings/files/zzz-default-settings
#echo "sed -i '7a mount --make-shared /mnt/mmcblk2p4/' /etc/rc.local" >> package/lean/default-settings/files/zzz-default-settings
echo "sed -i 's/\/bin\/login/\/bin\/login -f root/' /etc/config/ttyd" >> package/lean/default-settings/files/zzz-default-settings            # 设置ttyd免帐号登录，如若开启，进入OPENWRT后可能要重启一次才生效
echo "exit 0" >> package/lean/default-settings/files/zzz-default-settings

