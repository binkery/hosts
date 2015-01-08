hosts
=====

## Usage
You can replace hosts file to your local hosts file on your system.
操作系统在向 DNS 服务器或者 DNS 缓存请求域名的解析前，会先解析本地的 hosts 文件，如果 hosts 文件存在对于域名的 IP 地址映射，则优先采用 hosts 文件的 IP 地址，所以 hosts 文件的优先级要高于 DNS 服务器或者 DNS 缓存。

利用这个规则，我们可以做两件事。
1. 屏蔽广告。把跟广告相关的域名解析到一个无效的 IP 地址（一般可以指向 127.0.0.1）
2. 翻墙。像 google 永远 N 多的 IP 地址，并且任何 google 的子域名指向任一 IP 都是可以到达的，所有总有漏网的。这种方式翻墙是访问效率最高的，就是 IP 地址的查找需要费点功夫。

hosts 文件内容的编写规则：
 - 每一行定义一个域名和 IP 地址的映射
 - 每一行的编写规则是 域名 + 至少一个空格 + IP 地址
 - # 表示注释
 - 完全匹配，也就是不支持通配符，一行只能定义一个域名和 IP 地址的映射

hosts 文件的位置：

 - windows

   C:\Windows\System32\Drivers\etc

 - Linux

   /etc/hosts


## ip

There are 3 ip addresses could be used , every one work well . There are have some difference also , if have any APACHE server or some other server on your system , so maybe 127.0.0.1 is no a good choice for you .

 - 127.0.0.1
 - 127.1
 - 0.0.0.0

## 文件结构说明
### hosts
这个文件是最终产生的 hosts 文件，你可以直接替换操作系统的 hosts 文件。建议先备份好你本地的 hosts 文件。

### config-ads-list
All the ads relatived domain will be listed in the file , all the domains will point to 127.0.0.1 .
广告联盟的域名列表。每一行都是一个域名，这些域名都会被解析到 127.0.0.1 。

### config-google-ip
This is a file that listed all maybe enable ip address for google services , the hosts.sh will read this file and get the first line , and point all google service domains to this ip address.
google 系的域名，列出了已知的 google 的域名，这个文件拷贝自《月光博客》。

### config-google-list
All the google service relatived domain will be listed in this file , they will point to a ip address which provided on config-google-ip file .
这个文件放 google 的 IP 地址，因为 Google 有很多 IP 地址，哪一个可以用不好说。这里会列出曾经可用的或者也许可用的 IP 地址，如果 hosts 文件里的 Google IP 地址不可用，可以从这个文件里找一个 IP 试一下，剩下的就看RP 了。

### hosts.sh
一个在 linux 上运行的脚本，大致的逻辑是这样子的：
1. 逐行读取 config-ads-list 文件，每一行输出 域名+空格+127.0.0.1 到 hosts 文件。
2. 读取 config-google-ip 文件的第一行，作为 google 的 IP 地址
3. 逐行读取 config-google-list 文件，每一行输出 域名+空格+google IP 到 hosts 文件。



