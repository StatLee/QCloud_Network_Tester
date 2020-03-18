# QCloud_Network_Tester

针对Windows Server 批量检查IP、域名的traceroute、icmp情况

功能简述： Windows traceroute、ping的GUI工具

开发语言：

PowerShell v2.0

适用平台：

Windows Server 2008 R2 、 Windows Server 2012/2012R2 、 Windows Server 2016/2019 Wndows 7 SP3、Windows 8、Windows 10

版本：v1.0

功能信息：

1、支持批量输入IP或域名自动解析

2、支持自定义跃点数量、ping次数

3、可视化的测试过程

4、自动输出结果并记录在文本中

现存BUG：

当跃点数量过大(>10)、Ping次数过多(>5)或测试列表较多、网络通讯情况不佳时会卡顿若干秒

下载成品链接：

https://platform01-1252076932.cos.ap-chengdu.myqcloud.com/statli_tools/QCloud_Network_Tester.exe

若运行时闪退可能是因为PowerShell策略限制，可手动运行该命令进行解锁：

powershell "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force |Out-null"
