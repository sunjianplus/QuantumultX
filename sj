# QuantumultX 懒人配置DIY版 【作者】w37fhy 【电报频道】https://t.me/w37fhy【更新日期】2021/2/10
# 【YouTube视频教程】 QuantumultX 系列教程：https://fhyurl.tk/quantumultx
# 更新日志：
# 1、增加自动测速策略组url-latency-benchmark
# 2、优化策略组，增加香港、日本、新加坡、美国地区分组，并使用自动测速策略
# 3、优化策略组，取消之前的全球直连和全球拦截策略组，使用系统默认的DIRECT、REJECT策略
# 4、恢复网易云解锁功能
# 5、优化分流规则及其他配置内容。
# 6、本次更新借鉴了Orz-3大佬的配置进行修改，感谢大佬！


[general]
dns_exclusion_list=*.cmpassport.com, *.jegotrip.com.cn, *.icitymobile.mobi, id6.me, *.pingan.com.cn
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
resource_parser_url= https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/resource-parser.js
profile_img_url= https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/img/dragonball/1.PNG
server_check_url=http://www.gstatic.com/generate_204
#第一个filter为4g模式开启规则分流，第二个filter为其他wifi下开启规则分流，第三个wifi1修改成你路由器翻墙的wifi名开启直连模式，第四个wifi2为你公司或者其他有路由器翻墙的WiFi名走直连）
#默认关闭根据wifi切换模式，如需开启，删除下方的“#”即可！
#running_mode_trigger=filter, filter, wifi1:all_direct, wifi2: all_proxy

[dns]
no-ipv6
server=119.29.29.29
server=114.114.114.114

[policy]
static=🚀 节点选择, ♻️ 自动选择, 🇭🇰 香港,🇯🇵 日本,🇸🇬 新加坡,🇺🇸 美国, PROXY, DIRECT, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Available.png
# 默认设置10分钟测速一次，当前使用节点延迟和最新测速延迟最低的节点相差100ms以上则切换为最新的最低延迟节点，否则继续延用节点
url-latency-benchmark=♻️ 自动选择, server-tag-regex=.*, check-interval=600, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
url-latency-benchmark=🇭🇰 香港, server-tag-regex=(?=.*(港|HK|(?i)Hong))^((?!(台湾|日本|新加坡|美国|韩国|狮城|南朝鲜|US|SG|JP|KR|TW|台灣|美國|韓國|獅城)).)*$, check-interval=600, tolerance=50, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hong_Kong.png
url-latency-benchmark=🇯🇵 日本, server-tag-regex=(?=.*(日本|JP|(?i)Japan))^((?!(香港|台湾|新加坡|美国|韩国|狮城|南朝鲜|US|SG|KR|HK|TW|台灣|美國|韓國|獅城)).)*$, check-interval=600, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Japan.png
url-latency-benchmark=🇸🇬 新加坡, server-tag-regex=(?=.*(新加坡|狮城|SG|(?i)Singapore))^((?!(香港|台湾|日本|美国|韩国|南朝鲜|US|JP|KR|HK|TW|台灣|美國|韓國)).)*$, check-interval=600, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Singapore.png
url-latency-benchmark=🇺🇸 美国, server-tag-regex=(?=.*(美国|美國|US|洛杉矶|西雅图|(?i)States|American))^((?!(香港|台湾|日本|新加坡|韩国|狮城|南朝鲜|SG|JP|KR|HK|TW|台灣|韓國|獅城)).)*$, check-interval=600, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/United_States.png
static=🙈 网易云音乐, 解锁节点一, 🚀 节点选择, DIRECT, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Netease_Music.png
static=🐟 漏网之鱼, 🚀 节点选择, ♻️ 自动选择, 🇭🇰 香港,🇯🇵 日本,🇸🇬 新加坡,🇺🇸 美国, PROXY, DIRECT, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]
# 网易云分流
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/NetEaseMusic/NetEaseMusic.list, tag=🙈 网易云音乐, force-policy=🙈 网易云音乐, enabled=true
# Unbreak 后续规则修正
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Unbreak.list, tag=🎯规则修正-直连, update-interval=86400, opt-parser=false, enabled=true
# Advertising 广告
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Guard/Advertising.list, tag=🛑轻量广告拦截-拒绝, update-interval=86400, opt-parser=false, enabled=true
# NobyDa大佬去广告 -默认关闭，自行手动启用！
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/AdRule.list, tag=🛑重度广告拦截-拒绝, force-policy=reject, update-interval=86400, opt-parser=false, enabled=false
# Privacy 隐私
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Guard/Privacy.list, tag=🛑隐私保护-拒绝, update-interval=86400, opt-parser=false, enabled=true
# Hijacking 运营商劫持或恶意网站
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Guard/Hijacking.list, tag=🛑运营商劫持-拒绝, update-interval=86400, opt-parser=false, enabled=true
# Streaming 国际流媒体服务
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/StreamingMedia/Streaming.list, , tag=🚀 节点选择, force-policy=🚀 节点选择, update-interval=86400, opt-parser=false , enabled=true
# Global 全球加速
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Global.list, tag=🚀 节点选择, force-policy=🚀 节点选择, update-interval=86400, opt-parser=false , enabled=true
# China 国内网站
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/China.list, tag=🎯国内网站-直连, force-policy=direct, update-interval=86400, opt-parser=false, enabled=true
# ChinaIP 中国直连
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Filter/Extra/ChinaIP.list, tag=🎯中国IP-直连, update-interval=86400, opt-parser=false , enabled=true

[rewrite_remote]
https://raw.githubusercontent.com/chavyleung/scripts/master/box/rewrite/boxjs.rewrite.quanx.tf.conf, tag=Boxjs, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/w37fhy/QuantumultX/master/QuantumultX_JS.conf, tag=比价等脚本, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/w37fhy/QuantumultX/master/QuantumultX_Cookie.conf, tag=获取Cookie, update-interval=86400, opt-parser=false, enabled=true

[server_local]
#解锁网易云音乐节点
http=106.52.127.72:19951, fast-open=false, udp-relay=false, tag= 解锁节点一
[filter_local]
host-suffix, local, direct
ip-cidr, 192.168.0.0/16, direct
ip-cidr, 10.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 100.64.0.0/10, direct
ip-cidr, 224.0.0.0/4, direct
ip6-cidr, fe80::/10, direct
host-suffix, music.126.net, DIRECT
# GEOIP,CN,DIRECT
FINAL,🐟 漏网之鱼

[rewrite_local]

[task_local]

[mitm]
hostname = api.m.jd.com, *.bilibili.com, music.163.com, act.10010.com, m.client.10010.com, iface?.iqiyi.com, nebula.kuaishou.com, trade-acs.m.taobao.com, mp.weixin.qq.com, *.amemv.com, ms.jr.jd.com, wapside.189.cn, wx.10086.cn, draw.jdfcloud.com, jdjoy.jd.com
passphrase = 05F9D3D2
p12 = MIIKsQIBAzCCCnsGCSqGSIb3DQEHAaCCCmwEggpoMIIKZDCCBL8GCSqGSIb3DQEHBqCCBLAwggSsAgEAMIIEpQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQIrTnbRI3fyBcCAggAgIIEeH+Rj0HYBRgKzNisKG3yLz/xFfZU1bHbl+KtBOrF159KnAdpLkowBfDCcJ2CStD22tZdUOm2yVVaWBVPdMpuPYANJy7NKqeuC4fon9CIgJKJQr+7pUb14y5RVmZssKLxTB4mmh2yD8AyEHrCugkYHARChPhSLtLkpNfjeByjBm/wgRLRxmEUFrdRDhZ+4tIFPfB2pZtlkmtEl2stNxKQzHA8JT8Y+eOGmkXWzdW0gZwxPRiG/W4n8vVAWidzQjWo7H8B+AyMVvExL0/typLYUmi36C/c1NIYjPgxxqYwG5knyIpZHoWGFQUn2D9zTaIPNs1UTKkQINhIqowxLUqhbqp/kxDw67viV+Njfwzr1tlDf0pmSFbfvto0tGhc5/BP3wnnl244ke6uKY2ZPeABf5vhNv+8vDiokyyE9Md6i5lTvypC7CCErjcrOTDeLvsVQI0neleHCqyzSGMn5Pii6rnyxyfJJaRUsXTrpgOsG4fD80xCzwJpF98jjjIVEsVOqWTPl8DzZJGVNlebwBiD9zyw47hP8SkSr+3G7bdNQIdg1Qkr4hOzE5UtFJ5ieep771iYhWzbmcNQZqRze5BeFoxch215wj9t5YO/jI91hFTtopo75KZRFb+3OZek78L1inc6SbZwawAfeOJ07NQjyWOtr3zuFoIGv+kRC/UdsIkBWuKp2FyQJukuiKanfpnxScdBSmz2BIB7/x9LDiPyhFX2m6cEMHW2KBmw3AsZvgGVDWu51HNA/IrmB1iNT9WHzN48myErZIiKQEnvoGKzFyW6ZjM1UenvZlJ8DkjaF1kZr5rTcaucBOI9Me2EYW1t3+iWnKHeSf7QJOqx85VrkNFAOucZkxzacGDyXEuGbl61fXknpTqJYFd83+aCegyq5CFMTtQwhNIHNqoQs9I9JViho/98T1Cnd+DBFD5/DGbNy2Gg/j+pRZakXI7wNZ+8oGKlyRmPhcbdfY36aV/R5v/NQKaM4rP9bIeInzhpAz+REk3yfUVEen6SFUWBCdq1NAfZbFPTr/z3ltsBFUosNSY5pHl6LdTeVqIyoSvm7LYdPUaS+xDGVCaMGfgPLJx9zdCIanpQ8hsbfZovb7gagVA0xxav3J+x0vTGzi5ok6FC9+zPYm/lbXaTBoF/noXu/5oConpgY05gACUJM8BXSrQ253A5ulaCGtfeRBsOGimf2sxjunKIL091Xh9vk5I+HQs7fmKtYU8f2A4lrF2wdKjSgkyxWE6mbglXRH0OY7lRo8pSMCmv1Y9rF3UeuLYUaa2vD9g+oMiQ/veH6yVSoxkwimJp+4+f1l51SsGWhEvKSx6AqUkIdsNIHoPAQRBmPBdUnaTa07SGimEAtQAWRy5JH6gUeDdnC5YYXCulCmXrsIQXzxQ+X0d9vAL/HeiijVO2avzp27CzyBQOqxvB6FN9gmwxtT86jlf48O6wv8VxXj8XGLYbPkTUeO4hxGgmtFXaJ4heF7pVADFU+69G+Za+V+KVrrdF0LYojmTBOz1g9iCCJ30z+b4wggWdBgkqhkiG9w0BBwGgggWOBIIFijCCBYYwggWCBgsqhkiG9w0BDAoBAqCCBO4wggTqMBwGCiqGSIb3DQEMAQMwDgQIIVxwwNLcIyMCAggABIIEyIOYiDowYVGs6qrDP1Wroz1Mbhuml8aQ/fRUwEIaNaitqRKizjz4+ZTqjGiAyVRR5Otj1ey64+qHngYGbW04Dg5eoNUJvab3VGIkILEUnTOoZPeZyHBePiumqr8EoL33qqMVcnUvsG2qHKbC0wG89EcW4UlRiqSyEnSA80t7Ay4fiKPCkCDSG3SVQpvuCntDlpzRof356OuDPyCaDm3HTMVEB2LV6m1wnT7llgz2tDbYYB+DdhDGcezIXmcqaqSg3zw0MKiebNesRAgzmUYiZEEyWyW+RKZfUfBKZi+vQ5mPdGheLUQ7zFOwqmpdpm2dUF5m5riKwIHc6+lzcueEYC5g2Hk+qxpUmXp9Z+NxwEQf4E28Uj5W5BjiZuLkDaHFZ/DZ5YVyFEukZ1sr5PSEPpBxsNnN5rhbsLwMD4EedVs4lhwTxDWnx9XeBOMyl1aEhReG/CX4xhtIrnJwG/hztlLOa2UBsDIuYubr5J9mDncnnzAXBFzbWpQnwZhEasX18JCxiqkYgcnxL4chStCHp1MEt0swTID2MA3jJ+37xtrgUx9vw+KnvF+3q0EAYMgWcF9G1UUpB07j9y37jLOSQ5C+I4rMQJPYkjwlmM4cw1ReOCVIdqTjC1cn71zEeejR6NedDssB5v7LiChfNkZtOalLsdzWvFWof3x06iAYxEn1e3IKz1VIe1cDU/vLgpHlKgt5MzppXgkTDz2l+VMo/ScLD9ssTY7KDnt0PSTyrBzU0MHKm5pr9EkpEHATXv0pyaLCBx4tftu5QLxGDXgVzgmmTOScPfSIwNLDcqAaNUwiID9Hqv4NxwypjTxqPjzJpdHtJChmSdVq4AoazhXpP1nFmanwCgVCTHFU7Hq0Dust+/bPuGmOuc9OS6OVVIesAD0bJGIJGjlopCNWVGpmdDeLcqt5vERx7Zwg3HWv+85DMhtmVapQPkN0m6AhBLP1eW+32BXgtpd68Gm6myh+GBKt4uyhx8YKbbrEXEdwOUVBKco0Pqp41a4p2RiOZpRlkO54Ydpkvn/3PBll9nRrQB+zcLvt/4bn5JrKPta7CfoYoLPCDrC/SlIt2hb0o3CWbfrVF3JPA7kBFCrWuh25BC/4mNVcUq0GWlqNHXOuKLfV1lusQ3hhE+2POV4ZhqB/ksJPc8PanCCdq9TsGglVvqma5/bwN1XDbV3zOme+m1jtQpmbbFKHx/TsdoS0FvAxPUsNZi7+u4BgWtrhAEnDWh04sdXgaYr2oMPJ3eHkYJ0WTmC/Fj8wnZKx4Kcai1/8wCvnrorDoRgHaDVVC7rrWI3YGM6xoKcl7srdHjVAKCtWa8L6TR2VRlCSuJbP1SYuUNCQO2EUc2aqbcyYtPs6x00+QB0gN3xFK93AX310ksEvsxUU8gN3na9/iZ+lOZzR1E/phQfihWIoL/qx+mAxyID94G/PemWd6Gtp5P4mis5DTv0vO0pZb4E9H99yl1cDoRGSmNPC0VPgAVVazSOlgKb5lOA9XP/I4N7P+grFlmkwrE5xuq97JJIE3RqjC3yj1UVajRXjJ+VD18YIzb+LTJ/CDn6VB4s1DGpKwwBBAng+zs/p1T1ID/SZT5Bd6NjpCw3jXeZtq5YBM4WtEibwggygtT9CQpXclzGBgDAjBgkqhkiG9w0BCRUxFgQUK17fEZhGp4ONwPJ9QQoj98Rti3QwWQYJKoZIhvcNAQkUMUweSgBRAHUAYQBuAHQAdQBtAHUAbAB0ACAAWAAgAEMAQQAgADAANQBGADkARAAzAEQAMgAgACgAMgAgAEEAdQBnACAAMgAwADIAMAApMC0wITAJBgUrDgMCGgUABBQs9jCpOYuCs5xNQsj+fSTMRjpnRQQIrdj7+lYpXuo=
