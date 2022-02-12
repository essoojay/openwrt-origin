## 原版openwrt编译方法（x86）在ubuntu 20.04 ，Debian 10：
## 0.安装依赖
```bash
sudo apt-get update
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync build-essential ccache ecj fastjar file g++ gawk gettext git java-propose-classpath libelf-dev libncurses5-dev libncursesw5-dev libssl-dev python python2.7-dev python3 unzip wget python3-distutils python3-setuptools python3-dev rsync subversion swig time xsltproc zlib1g-dev 
```
## 1.首次
```bash
git clone https://github.com/openwrt/openwrt -b openwrt-21.02 openwrt
cd openwrt
sed -i '$a src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
cp /usr/bin/upx staging_dir/host/bin
cp /usr/bin/upx-ucl staging_dir/host/bin
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig （此处可以直接下载config文件使用）
make -j8 download V=s
make -j1 V=s
```
## 2.第二次及后续编译
```bash
cd openwrt
git pull
./scripts/feeds update -a && ./scripts/feeds install -a
make menuconfig
make -j8 download
make -j$(($(nproc) + 1)) V=s
```
## 3.重新配置：
```bash
rm -rf ./tmp && rm -rf .config
make menuconfig
make -j8 download
make -j$(($(nproc) + 1)) V=s
```
## 4.固件使用
```bash
# For advanced usage, please see /etc/config/v2raya
uci set v2raya.config.enabled='1'
uci commit v2raya
/etc/init.d/v2raya start
http://openwrt.lan:2017
```
## 5.主题
**如果你的openwrt是lede源码，请选择1806的主题插件**

**否则，请选择1907及以上的版本**

**文件名不带版本则默认为1806**

## 6.插件说明
```
以下是全部：           注：应用后面标记 “ * ” 为最近新添加；标记“ ! ”与其他插件依赖或冲突。
-----------------------------------------------------------------------------------------
LuCI ---> Applications ---> luci-app-adbyby-plus   #广告屏蔽大师Plus +
LuCI ---> Applications ---> luci-app-arpbind  #IP/MAC绑定
LuCI ---> Applications ---> luci-app-autoreboot  #支持计划重启
LuCI ---> Applications ---> luci-app-ddns   #动态域名 DNS（集成阿里DDNS客户端）
LuCI ---> Applications ---> luci-app-filetransfer  #文件传输（可web安装ipk包）
LuCI ---> Applications ---> luci-app-firewall   #添加防火墙
LuCI ---> Applications ---> luci-app-nlbwmon   #网络带宽监视器
LuCI ---> Applications ---> luci-app-ramfree  #释放内存
LuCI ---> Applications ---> luci-app-samba   #网络共享（Samba）
-------------------------------------------------------------------------------------------
LuCI ---> Applications ---> luci-app-ssr-plus   #SSR科学上网Plus+
    luci-app-ssr-plus ---> Include Shadowsocks Libev Client  #SS Libev客户端(轻量级)
    luci-app-ssr-plus ---> Include Shadowsocks Libev Server  #SS Libev服务端(轻量级)
    luci-app-ssr-plus ---> Include ShadowsocksR Libev Client  #SSR Libev客户端(轻量级)
    luci-app-ssr-plus ---> Include ShadowsocksR Libev Server  #SSR Libev服务端(轻量级)
    luci-app-ssr-plus ---> Include Include Shadowsocks Simple Obfs Plugin  #SS Simple-Obfs混淆代理(Nginx)
    luci-app-ssr-plus ---> Include Xray  #Xray代理(XTLS)
-------------------------------------------------------------------------------------------
LuCI ---> Applications ---> luci-app-turboacc   #Turbo ACC 网络加速(支持 Fast Path 或者 硬件 NAT)
LuCI ---> Applications ---> luci-app-unblockmusic  #解锁网易云灰色歌曲3合1新版本
LuCI ---> Applications ---> luci-app-upnp   #通用即插即用UPnP（端口自动转发）
LuCI ---> Applications ---> luci-app-vlmcsd  #KMS服务器设置
LuCI ---> Applications ---> luci-app-wol   #WOL网络唤醒
LuCI ---> Applications ---> luci-app-zerotier  #ZeroTier内网穿透
以下是全部：           注：应用后面标记 “ * ” 为最近新添加；标记“ ! ”与其他插件依赖或冲突。
-------------------------------------------------------------------------------------------------------------------
LuCI ---> Applications ---> luci-app-accesscontrol  #访问时间控制
LuCI ---> Applications ---> luci-app-adblock   #ADB广告过滤
LuCI ---> Applications ---> luci-app-adbyby-plus  #广告屏蔽大师Plus +
LuCI ---> Applications ---> luci-app-adguardhome  #AdGuard home广告过滤（Le库以外的插件）
LuCI ---> Applications ---> luci-app-advanced-reboot  #Linksys高级重启
LuCI ---> Applications ---> luci-app-advancedsetting  #系统高级设置（Le库以外的插件）
LuCI ---> Applications ---> luci-app-ahcp  #Ad-Hoc配置协议(AHCP) ipv6 and 双栈 自动配置协议 !
LuCI ---> Applications ---> luci-app-airplay2   #Apple AirPlay2 无损音频接收服务器
LuCI ---> Applications ---> luci-app-aliyundrive-webdav  #阿里云盘 WebDAV 服务
LuCI ---> Applications ---> luci-app-amule  #aMule下载工具 !
LuCI ---> Applications ---> luci-app-argon-config  #Argon主题配置插件（Le库以外的插件）
LuCI ---> Applications ---> luci-app-aria2 # Aria2下载工具
LuCI ---> Applications ---> luci-app-arpbind  #IP/MAC绑定
LuCI ---> Applications ---> luci-app-asterisk  #支持Asterisk电话服务器
LuCI ---> Applications ---> luci-app-attendedsysupgrade  #固件更新升级相关
LuCI ---> Applications ---> luci-app-autoreboot  #支持计划重启
LuCI ---> Applications ---> luci-app-baidupcs-web  #百度网盘管理
LuCI ---> Applications ---> luci-app-bcp38  #BCP38网络入口过滤（不确定）
LuCI ---> Applications ---> luci-app-bird1-ipv4  #对Bird1-ipv4的支持
LuCI ---> Applications ---> luci-app-bird1-ipv6  #对Bird1-ipv6的支持
LuCI ---> Applications ---> luci-app-bmx6  #BMX6路由协议
LuCI ---> Applications ---> luci-app-cifs-mount   #CIFS/SMB挂载设置
LuCI ---> Applications ---> luci-app-cifsd  #CIFS/SMB网络共享
LuCI ---> Applications ---> luci-app-cjdns  #加密IPV6网络相关
LuCI ---> Applications ---> luci-app-clamav  #ClamAV杀毒软件
LuCI ---> Applications ---> luci-app-clash  #Clash客户端（Le库以外的插件）
LuCI ---> Applications ---> luci-app-commands  #Shell命令模块
LuCI ---> Applications ---> luci-app-cshark  #CloudShark捕获工具
LuCI ---> Applications ---> luci-app-dawn  #分布式AP管理程序
LuCI ---> Applications ---> luci-app-ddns   #动态域名 DNS（集成阿里DDNS客户端）
LuCI ---> Applications ---> luci-app-diag-core   #core诊断工具
LuCI ---> Applications ---> luci-app-diskman   #磁盘管理工具
    luci-app-diskman ---> Include btrfs-progs   #新型的写时复制 (COW)
    luci-app-diskman ---> Include lsblk   #lsblk命令 用于列出所有可用块设备的信息
    luci-app-diskman ---> Include mdadm   #mdadm命令 用于创建、管理、监控RAID设备的工具
LuCI ---> Applications ---> luci-app-dnscrypt-proxy  #DNSCrypt解决DNS污染
LuCI ---> Applications ---> luci-app-dnsfilter  #DNSFilter基于DNS的广告过滤
LuCI ---> Applications ---> luci-app-dnsforwarder  #DNSForwarder防DNS污染
LuCI ---> Applications ---> luci-app-docker  #Docker容器(dockerman更名为docker)
LuCI ---> Applications ---> luci-app-dump1090  #民航无线频率（不确定）
LuCI ---> Applications ---> luci-app-dynapoint  #DynaPoint（未知）
LuCI ---> Applications ---> luci-app-e2guardian   #Web内容过滤器
LuCI ---> Applications ---> luci-app-easymesh   #简单MESH(可有线+无线回程)
LuCI ---> Applications ---> luci-app-eqos  #基于IP地址限速（Le库以外的插件）
LuCI ---> Applications ---> luci-app-familycloud   #家庭云盘
LuCI ---> Applications ---> luci-app-fileassistant   #文件管理助手（Le库以外的插件）
LuCI ---> Applications ---> luci-app-filetransfer  #文件传输（可web安装ipk包）
LuCI ---> Applications ---> luci-app-firewall   #添加防火墙
LuCI ---> Applications ---> luci-app-frpc   #内网穿透Frp客户端
LuCI ---> Applications ---> luci-app-frps   #内网穿透Frp服务端
LuCI ---> Applications ---> luci-app-fwknopd  #Firewall Knock Operator服务器
LuCI ---> Applications ---> luci-app-guest-wifi   #WiFi访客网络
LuCI ---> Applications ---> luci-app-go-aliyundrive-webdav   #阿里云盘webdav协议(文件管理/同步等)  *
LuCI ---> Applications ---> luci-app-gost  #隐蔽的https代理（Le库以外的插件）
LuCI ---> Applications ---> luci-app-haproxy-tcp   #HAProxy负载均衡-TCP
LuCI ---> Applications ---> luci-app-hd-idle  #硬盘休眠
LuCI ---> Applications ---> luci-app-hnet  #Homenet Status家庭网络控制协议
LuCI ---> Applications ---> luci-app-https-dns-proxy  #通过HTTPS代理为DNS提供Web UI
LuCI ---> Applications ---> luci-app-ipsec-vpnd  #VPN服务器 IPSec
LuCI ---> Applications ---> luci-app-jd-dailybonus  #京东签到服务
LuCI ---> Applications ---> luci-app-kodexplorer  #KOD可道云私人网盘（与vnStat冲突 ! ）
LuCI ---> Applications ---> luci-app-lxc   #LXC容器管理
LuCI ---> Applications ---> luci-app-minidlna   #完全兼容DLNA / UPnP-AV客户端的服务器软件
LuCI ---> Applications ---> luci-app-mjpg-streamer   #兼容Linux-UVC的摄像头程序
LuCI ---> Applications ---> luci-app-music-remote-center   #PCHiFi 数字转盘遥控
LuCI ---> Applications ---> luci-app-mwan3   #MWAN3负载均衡
LuCI ---> Applications ---> luci-app-mwan3helper   #MWAN3分流助手
LuCI ---> Applications ---> luci-app-n2n_v2   #N2N内网穿透 N2N v2 VPN服务
LuCI ---> Applications ---> luci-app-netdata  #Netdata实时监控（图形化）
LuCI ---> Applications ---> luci-app-nfs   #NFS网络共享
LuCI ---> Applications ---> luci-app-nft-qos  #QOS流控 Nftables版
LuCI ---> Applications ---> luci-app-nlbwmon   #网络带宽监视器
LuCI ---> Applications ---> luci-app-noddos  #NodDOS Clients 阻止DDoS攻击
LuCI ---> Applications ---> luci-app-nps   #内网穿透nps
LuCI ---> Applications ---> luci-app-ntpc   #NTP时间同步服务器
LuCI ---> Applications ---> luci-app-ocserv  #OpenConnect VPN服务
LuCI ---> Applications ---> luci-app-olsr  #OLSR配置和状态模块
LuCI ---> Applications ---> luci-app-olsr-services  #OLSR服务器
LuCI ---> Applications ---> luci-app-olsr-viz   #OLSR可视化
LuCI ---> Applications ---> luci-app-openclash  #运行在OpenWrt上的Clash代理客户端（Le库以外的插件）
LuCI ---> Applications ---> luci-app-openvpn  #OpenVPN客户端
LuCI ---> Applications ---> luci-app-openvpn-server  #易于使用的OpenVPN服务器 Web-UI
LuCI ---> Applications ---> luci-app-p910nd   #打印服务器模块
LuCI ---> Applications ---> luci-app-pagekitec   #Pagekitec内网穿透客户端
LuCI ---> Applications ---> luci-app-passwall  #科学上网（Li大佬插件）
    Configuration ---> Include Brook  #Brook代理(跨平台强加密且不可检测代理)
    Configuration ---> Include ChinaDNS-NG  #防污染DNS服务
    Configuration ---> Include Haproxy  #HAProxy  #HAProxy负载均衡
    Configuration ---> Include Hysteria  #Hysteria双边加速工具
    Configuration ---> Include Kcptun  #Kcptun双边加速工具
    Configuration ---> Include NaiveProxy  #NaiveProxy代理(Chrome网络堆栈伪装流量)
    Configuration ---> Include PDNSD  #DNS服务器
    Configuration ---> Include Shadowsocks Libev Client  #SS Libev客户端(轻量级)
    Configuration ---> Include Shadowsocks Libev Server  #SS Libev服务端(轻量级)
    Configuration ---> Include Shadowsocks Rust Client  #SS Rust客户端(负载均衡/探测延迟)
    Configuration ---> Include ShadowsocksR Libev Client  #SSR Libev客户端(轻量级)
    Configuration ---> Include ShadowsocksR Libev Server  #SSR Libev服务端(轻量级)
    Configuration ---> Include Simple-Obfs (Shadowsocks plugin)  #simple-Obfs简单混淆工具(Nginx)
    Configuration ---> Include Trojan_GO  #Trojan_GO代理(直接模仿协议HTTPS)
    Configuration ---> Include Trojan_Plus  #Trojan_Plus代理(直接模仿协议HTTPS)
    Configuration ---> Include V2ray  #V2Ray代理
    Configuration ---> Include v2ray-plugin (Shadowsocks plugin)  #SS V2ray插件(WebSocket+TLS )
    Configuration ---> Include Xray  #Xray代理(XTLS)
    Configuration ---> Include Xray-Plugin (Shadowsocks Plugin)  #SS Xray插件(WebSocket+TLS )   *
LuCI ---> Applications ---> luci-app-polipo  #Polipo代理(是一个小型且快速的网页缓存代理)
LuCI ---> Applications ---> luci-app-pppoe-relay  #PPPoE NAT穿透 点对点协议（PPP）
LuCI ---> Applications ---> luci-app-pptp-server  #VPN服务器 PPTP
LuCI ---> Applications ---> luci-app-privoxy  #Privoxy网络代理(带过滤无缓存)
LuCI ---> Applications ---> luci-app-ps3netsrv  #PS3 NET服务器(用于加载蓝光/游戏ISO/PKG)
LuCI ---> Applications ---> luci-app-pushbot  #全能推送(钉钉推送,企业微信推送,Bark,PushPlus推送)
LuCI ---> Applications ---> luci-app-qbittorrent  #BT下载工具(qBittorrent)
    Build Version Selection (Static Build)  ---> Static Build  #选择静态编译版本
    Build Version Selection (Static Build)  ---> Dynamic Build  #选择动态编译版本
LuCI ---> Applications ---> luci-app-qos   #流量服务质量(QoS)流控
LuCI ---> Applications ---> luci-app-radicale   #CalDAV/CardDAV同步工具
LuCI ---> Applications ---> luci-app-ramfree  #释放内存
LuCI ---> Applications ---> luci-app-rclone  #命令行云端同步工具
    Include rclone-webui  #Rclone界面
    Include rclone-ng (another webui)  #Rclone另一个界面
LuCI ---> Applications ---> luci-app-rp-pppoe-server  #Roaring Penguin PPPoE Server 服务器
LuCI ---> Applications ---> luci-app-samba   #网络共享（Samba）
LuCI ---> Applications ---> luci-app-samba4   #网络共享（Samba4）
LuCI ---> Applications ---> luci-app-serverchan   #微信/Telegram推送的插件
LuCI ---> Applications ---> luci-app-shadowsocks-libes  #SS-libev服务端
LuCI ---> Applications ---> luci-app-shairplay  #支持AirPlay功能
LuCI ---> Applications ---> luci-app-siitwizard  #SIIT配置向导  SIIT-Wizzard
LuCI ---> Applications ---> luci-app-simple-adblock  #简单的广告拦截
LuCI ---> Applications ---> luci-app-softethervpn  #SoftEther VPN服务器  NAT穿透
LuCI ---> Applications ---> luci-app-splash  #Client-Splash是无线MESH网络的一个热点认证系统
LuCI ---> Applications ---> luci-app-sqm  #流量智能队列管理（QOS）
LuCI ---> Applications ---> luci-app-squid   #Squid代理服务器
LuCI ---> Applications ---> luci-app-ssr-plus   #SSR科学上网Plus+（Le大佬插件）
    Include libustream-ssl  ---> Include libustream-wolfssl  #选择wolfSSL库(传输层安全协议)
    Include libustream-ssl  ---> Include libustream-openssl  #选择OpenSSL库(传输层安全协议)
    luci-app-ssr-plus ---> Include Kcptun  #Kcptun双边加速工具
    luci-app-ssr-plus ---> Include NaiveProxy  #NaiveProxy代理(Chrome网络堆栈伪装流量)
    luci-app-ssr-plus ---> Include Redsocks2  #Redsocks2代理(透明TCP定向Socks/HTTPS代理服务器)
    luci-app-ssr-plus ---> Include Shadowsocks Libev Client  #SS Libev客户端(轻量级)
    luci-app-ssr-plus ---> Include Shadowsocks Libev Server  #SS Libev服务端(轻量级)
    luci-app-ssr-plus ---> Include Shadowsocks Rust Client  #SS Rust客户端(负载均衡/探测延迟)
    luci-app-ssr-plus ---> Include Shadowsocks Rust Server  #SS Rust服务端(负载均衡/探测延迟)
    luci-app-ssr-plus ---> Include ShadowsocksR Libev Client  #SSR Libev客户端(轻量级)
    luci-app-ssr-plus ---> Include ShadowsocksR Libev Server  #SSR Libev服务端(轻量级)
    luci-app-ssr-plus ---> Include Simple-Obfs Plugin  #SS Simple-Obfs混淆代理(Nginx)
    luci-app-ssr-plus ---> Include Trojan  #Trojan代理(直接模仿协议HTTPS)
    luci-app-ssr-plus ---> Include Shadowsocks V2ray Plugin  #SS V2ray代理(WebSocket+TLS )
    luci-app-ssr-plus ---> Include Xray  #Xray代理(XTLS)
LuCI ---> Applications ---> luci-app-ssrserver-python  #ShadowsocksR Python服务器
LuCI ---> Applications ---> luci-app-statistics  #流量监控工具
LuCI ---> Applications ---> luci-app-syncdial  #多拨虚拟网卡（原macvlan）
LuCI ---> Applications ---> luci-app-tinyproxy  #Tinyproxy是 HTTP(S)代理服务器
LuCI ---> Applications ---> luci-app-transmission   #BT下载工具
LuCI ---> Applications ---> luci-app-travelmate  #旅行路由器
LuCI ---> Applications ---> luci-app-ttyd   #网页终端命令行
LuCI ---> Applications ---> luci-app-turboacc   #Turbo ACC 网络加速(支持 Fast Path 或者 硬件 NAT)
    luci-app-turboacc ---> Include Shortcut-FE  #Shortcut-FE 流量分载
    luci-app-turboacc ---> Include BBR CCA  #BBR拥塞控制算法提升TCP网络性能
    luci-app-turboacc ---> Include DNSForwarder  #DNS防污染 Forwarder
    luci-app-turboacc ---> Include DNSProxy  #DNS防污染 Proxy
LuCI ---> Applications ---> luci-app-udpxy  #udpxy做组播服务器
LuCI ---> Applications ---> luci-app-uhttpd  #uHTTPd Web服务器
LuCI ---> Applications ---> luci-app-unblockmusic  #解锁网易云灰色歌曲3合1新版本
    UnblockNeteaseMusic Golang Version  #Golang版本
    UnblockNeteaseMusic NodeJS Version  #NodeJS版本
LuCI ---> Applications ---> luci-app-unbound  #Unbound DNS解析器
LuCI ---> Applications ---> luci-app-upnp   #通用即插即用UPnP（端口自动转发）
LuCI ---> Applications ---> luci-app-usb-printer  #USB 打印服务器
LuCI ---> Applications ---> luci-app-uugamebooster  #UU网游加速器
LuCI ---> Applications ---> luci-app-v2ray-server   #V2Ray 服务器
LuCI ---> Applications ---> luci-app-verysync  #微力同步
LuCI ---> Applications ---> luci-app-vlmcsd  #KMS服务器设置
LuCI ---> Applications ---> luci-app-vnstat   #vnStat网络监控（图表）（与kodexplorer冲突 ! ）
LuCI ---> Applications ---> luci-app-vpnbypass  #VPN BypassWebUI  绕过VPN设置
LuCI ---> Applications ---> luci-app-vsftpd  #FTP服务器
LuCI ---> Applications ---> luci-app-vssr  #VSSR科学上网（je大佬插件）
    luci-app-vssr ---> Include Xray  #Xray代理(XTLS)
    luci-app-vssr ---> Include Trojan  #Trojan代理(直接模仿协议HTTPS)
    luci-app-vssr ---> Include Kcptun  #Kcptun双边加速工具
    luci-app-vssr ---> Include Shadowsocks Xray Plugin  #SS Xray代理
    luci-app-vssr ---> Include ShadowsocksR Libev Server  #SSR Libev服务端(轻量级)
LuCI ---> Applications ---> luci-app-watchcat  #断网检测功能与定时重启
LuCI ---> Applications ---> luci-app-webadmin  #Web管理页面设置
LuCI ---> Applications ---> luci-app-wifischedule  #WiFi 计划
LuCI ---> Applications ---> luci-app-wireguard  #VPN服务器 WireGuard状态
LuCI ---> Applications ---> luci-app-wireless-regdb  #WiFi无线
LuCI ---> Applications ---> luci-app-wol   #WOL网络唤醒
LuCI ---> Applications ---> luci-app-wrtbwmon  #实时流量监测
LuCI ---> Applications ---> luci-app-xlnetacc  #迅雷快鸟
LuCI ---> Applications ---> luci-app-zerotier  #ZeroTier内网穿透
![image](https://user-images.githubusercontent.com/62841189/151914821-9e340cb7-b458-4958-ac28-741b3dec24c1.png)

