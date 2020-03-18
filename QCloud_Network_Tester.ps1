<#	
	===========================================================================
	 Created with: 	PowerShell
	 Created on:   	2018/2/27 19:11
	 Created by:   	statli
	 Organization: 	Tencent-QCloud
	 Projectname:   QCloudNetWorkTest
	 Version:     	1.0
	===========================================================================
#>

$button开始测试_Click={
	[System.Windows.Forms.MessageBox]::Show('请注意本工具运行时每个测试需要10s ~ 40s
一次完整的测试需要15分钟，测试期间卡顿属于正常现象
请勿强行关闭，耐心等待，本工具不会收集任何非网络调试的信息，谢谢
点击确定后开始执行测试
', '友情提示')
	$label请点击开始测试.Text = "[!]正在测试，请勿操作
"
	$filedatetmp = Get-Date
	$filehostname = hostname
	$filedate = $filedatetmp.ToString('MM-dd-hh-mm-ss')
	$Logfilename = $filedate + "-NTS-$filehostname.txt"
	for ($i = 0; $i -lt $textbox1.Lines.Length; $i++)
	{
		"测试网址(测试时间为"+ $filedate +")：" + $textbox1.Lines.Get($i) + "
"| Out-File -Append ".\$Logfilename"
		"===<
" | Out-File -Append ".\$Logfilename"
		"Ping 结果(未空时即为连接失败)：
" | Out-File -Append ".\$Logfilename"
		Test-Connection -count $pds.Text $textbox1.Lines.Get($i) | select Address, IPV4Address, ResponseTime, ResponseTimeToLive, ReplySize | Format-List| Out-File -Append ".\$Logfilename"
		"Tracert 结果：
" | Out-File -Append ".\$Logfilename"
		Tracert -d -h $yds.Text $textbox1.Lines.Get($i) | Out-File -Append ".\$Logfilename" 
		">===
" | Out-File -Append ".\$Logfilename"
		$label请点击开始测试.Text = $label请点击开始测试.Text + $textbox1.Lines.Get($i)+ " Done" + "
"
	}
	$label请点击开始测试.Text = $label请点击开始测试.Text + "[!]完成测试
"
	$label请点击开始测试.Text = $label请点击开始测试.Text + "[!]结果已输出,并自动打开对应文件夹
"
	$rs.Text = $rs.Text + "$Logfilename"
	start .\
}
$OnLoadFormEvent={
}