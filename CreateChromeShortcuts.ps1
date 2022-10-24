

# Title:    【自动生成多个具有独立环境的 Chrome 浏览器
# Author:   【0x哪吒       https://twitter.com/0xNezha
# Describe: 【新建一个记事本文件，复制以下代码，保存为 chrome.ps1 ，右键单击选择“使用 PowerShell 运行”

#先建立两个文件夹并复制其路径，【替换】以下两个路径
$UserDataPath = "E:\Chrome_UserData" # 存放 Chrome 用户数据
$FilePath = "E:\Chrome_ShortCuts"    # 存放快捷方式图标，从这个文件夹里打开浏览器分身

#右键打开【你桌面上的 Chrome浏览器快捷方式】 ，复制“目标”一栏的内容，【替换】下方路径
#（注意：只复制 C:\Users\....\chrome.exe ，chrome.exe 后面的形如“ --profile-directory”等字符不要复制） 
$TargetPath = "C:\Users\用户名\AppData\Local\Google\Chrome\Application\chrome.exe" 

#复制 Chrome浏览器快捷方式 的“起始位置”一栏的内容，【替换】下方路径
$WorkingDirectory = "C:\Users\用户名\AppData\Local\Google\Chrome\Application" 

 #设置生成分身的数量（从1到100）
$array=1..100

foreach ($n in $array)
{
    $x = $n.ToString()
    $ShortcutFile = $FilePath + "\Chrome_FenShen_" + $x + ".lnk" #
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath =$TargetPath
    $Shortcut.Arguments = "--user-data-dir=" + $UserDataPath +"\"+$x
    $Shortcut.WorkingDirectory = $WorkingDirectory
    $Shortcut.Description = "Chrome分身" #备注，可以随便写
    $Shortcut.Save()
}
