#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='housoul '/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i '$a\iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE' ./package/network/config/firewall/files/firewall.user
sed -i 's/root:$1$sAxtw/ld$Uv.jqmG3SLCorQ0tV0nW4/:18722:0:99999:7:::/root:$1$B9Tb5xi4$8JNetNueZsXZe0Ikt61sp.:18721:0:99999:7:::/g' ./package/base-files/files/etc/shadow
sed -i 's/option Port '22'/option Port '4213'/g' ./package/network/services/dropbear/files/dropbear.config
sed -i "s/hostname='OpenWrt'/hostname='hou-openwrt'/g" ./package/base-files/files/bin/config_generate
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# Modify default IP
sed -i 's/192.168.1.1/192.168.3.111/g' package/base-files/files/bin/config_generate
rm -rf ./package/lean/luci-theme-argon
rm -rf ./feeds/packages/net/https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
