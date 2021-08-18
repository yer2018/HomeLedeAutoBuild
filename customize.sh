#!/bin/bash
# Modify default IP
sed -i 's/192.168.1.1/10.10.10.254/g' package/base-files/files/bin/config_generate
sed -i s/luci-theme-bootstrap/luci-theme-argon/ feeds/luci/collections/luci/Makefile 
sed -i 's/OpenWrt/HomeLEDE/g' package/base-files/files/bin/config_generate
