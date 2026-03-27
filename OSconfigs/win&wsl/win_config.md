# What to do with a new computer (win)

今天买了新电脑，配置它的时候不禁想整理一下这个问题. 

(以下文字全是个人意见.)

BTW 不止买电脑. 我感觉也可以作为一个配置备忘录以防忘记自己配了些啥

下面一直到底, 实测, 一整套操作 1.5 小时就可以全部配置完 (除了如果要装 latex 的话要等一会)



### step 1: language pack downloading

第一步绝对是下载一下自己需要的 language pack. 首先打字爽了再说. 中英日都配一个比较好. 切换方便

注意在右下角右键 setting -> general -> use English punctuations when in Chinese input mode



### chrome

我觉得最主要的还是先下载个浏览器. 下载其他东西通常都需要经过浏览器访问官网. 但是 edge 看着真的很花里胡哨且累眼, 一秒都不想用. 所以我会选择下一个 chrome, 然后 sync 一下我的账号. (账号的 setting 一同步就开始习惯起来了)



### logi GHub

下了 chrome 之后第一件事情是去 logi 官网下一个 GHub 调一下鼠标的灵敏度. 

这真太重要了. 鼠标灵敏度不习惯跟吃使一样难受





### wallpaper engine, 换 cursor 等等外观

很 personal. 我的第三件事情是下 steam 然后下 wallpaper engine. 不用自己常用的壁纸真的很难使用这个电脑.

btw 启动覆盖 Lock screen + 允许 sleep 时运行还可以解锁覆盖屏保小连招. 不过刚开机的时候有时候偶尔不会启动 (可能是 synchronization 问题)，最好自己也设一个文件夹 slide.



以及既然这样了那就顺便把外观都搞定一下. 我会习惯换一个 cursor.

我用的是:

https://www.rw-designer.com/cursor-set/hollow-knight

注意这些可以免费的贴图文件的网站很多都一堆广告. 千万别点广告里面以假乱真的 download 点了就是流氓软件. 



### VSCode, typora, sublime

赶紧下个 VSCode 然后连接一下 wsl. 以及同步一下同系统之前保存好的 setting.json 文件

以及 typora for 查看之前的 notes, sublime for text editor in windows



(顺便, 可以选择更改一下注册表里的可新建类型, 右键新建更快一点.

比如 md: 新建一个 `something.reg` 文件, 放入这个然后双击运行一下就好了

```reg
Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\.md]  ; 清除原有 .md 注册信息

[HKEY_CLASSES_ROOT\.md]
@="Markdown.File"
"Content Type"="text/markdown"

[HKEY_CLASSES_ROOT\.md\ShellNew]
"NullFile"=""

[HKEY_CLASSES_ROOT\Markdown.File]
@="Markdown File"

[HKEY_CLASSES_ROOT\Markdown.File\ShellNew]
"NullFile"=""

```

)







### github desktop

个人习惯把很多 settings 的 config 文件都在 github desktop, 所以接下来会下一个 github desktop



### 更改一下 file explorer 的文件布局

我的习惯是: medium icon, group by type, show filename extension 和hidden items

然后点击上面三个点 -> options -> view -> 把当前的布局应用到全部文件夹



### 下个新版 powershell

老版的太不智能了. powershell 7 还挺不错的

https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5

可以自己配置 config.

```
code  C:\Users\username\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

我的 config:

```shell
Import-Module PSReadLine

# 启用预测补全
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

# Tab → 切换下一个预测
Set-PSReadLineKeyHandler -Key Tab -Function NextSuggestion

# Set-PSReadLineOption -PredictionViewStyle InlineView

# # 上下箭头切换预测项
# Set-PSReadLineKeyHandler -Key DownArrow -Function NextSuggestion
# Set-PSReadLineKeyHandler -Key UpArrow -Function PreviousSuggestion


# # 记录上次 Tab 的时间
# $global:lastTabTime = [datetime]::MinValue

# # 自定义 Tab 行为: 单击 Tab 接受一个词, 快速双击 Tab 接受整句
# Set-PSReadLineKeyHandler -Key Tab `
#     -BriefDescription "Smart Tab Accept" `
#     -ScriptBlock {
#         $now = Get-Date
#         $delta = ($now - $global:lastTabTime).TotalMilliseconds
#         $global:lastTabTime = $now

#         if ($delta -lt 400) {
#             # 400ms 内连续两次 Tab → 接受整句
#             [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
#         } else {
#             # 第一次 Tab → 接受下一个词
#             [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord()
#         }
#     }


```

下面注释掉的是 Inline 模式的. 目前用的是 listview 模式的



### windows 的包管理器 (我用 chocolatey)

不下载包管理器的话 windows 安装什么软件都要上网找然后手动添加环境变量

所以搞一个

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

搞完之后就可以 unix-like 地下载一些软件了

```powershell
choco install make
make --version
choco install git
git --version
choco install wget
```

(注意下载完之后 `git --version` 不一定直接反应. 可能需要关掉新开一个 terminal 才能识别.)



### wsl 下载和配置

最重要的就是先把 wsl 下了.

先在 turn windows features on or off -> 开启 WSL , Virtual Machine Platform 

(不要开 hyperv)

```shell
wsl --install
wsl --install -d Ubuntu-24.04
```

看看装好没:

```powershell
wsl -l -v
```

这个时候关闭 teminal 再打开就能看到 ubuntu 了. 如果看不到话打开 json settings 在 profile 里面加

```json
			{
                "guid": "{64e6e1e3-c812-5795-90e4-ce9fcec3d825}",
                "hidden": false,
                "name": "Ubuntu-24.04",
                "source": "Microsoft.WSL"
            }
```

然后切 bash 下载一些需要的软件.

```shell
sudo apt update
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt install g++-13 make rsync wget git ssh gdb tree unzip
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 100
sudo update-alternatives --config g++
```

配置一下 github 需要用到的 ssh

```shell
sudo apt install openssh-client
ssh-keygen -t ed25519 -C "rynnefan@umich.edu"
#Enter file in which to save the key (/home/rynne/.ssh/id_ed25519):
cat ~/.ssh/id_ed25519.pub
```

结果复制到 github 的 ssh

然后本地 global config 一下 git:
```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global core.editor "vim"
```



安装一下 VSCode server in Ubuntu:

```bash
code
```

然后就是 Linux 的配置环节. 

- 切个顺手的 shell (我用 fish

- 然后下载一个 nvim 作为便携的终端编辑器

见 Shells/fish 和 Editors/nvim 的配置. BTW 我使用一个 dotfiles dir + symlink 来管理 configs. 不用复制粘贴. 

基础的 wsl 相关的配置就这些了. 更多配置直接见 OSConfigs/linux



### 配置一下常用 scripting language 的环境 (python here)

scripting language 还是非常必要的

我习惯用 py

我这里在 windows 和 wsl 都下一个 miniconda 的包管理器

#### Windows:

这个不要用 choco 装.  

```powershell
Invoke-WebRequest -Uri "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe" -OutFile ".\Miniconda3-latest-Windows-x86_64.exe"
```

然后搜索栏里搜索 mini.. 找到刚下好的 graphic installer, 一路点 next, 在 advanced 选项里 Add Miniconda3 to my PATH environment variable, register miniconda3 as default python 3.13, 以及 clear the packager cache upon completion

如果不小心没选 add miniconda3 to my PATH environment variable 或者选了它没用(其实有可能的) 的话

这个东西位置 (默认) 安装在

```
C:\Users\<username>\miniconda3
```

那就只能手动把这三个东西加进去了:

```
C:\Users\<username>\miniconda3
C:\Users\<username>\miniconda3\Scripts
C:\Users\<username>\miniconda3\Library\bin
```

(记得改 username)

我的:

```
[Environment]::SetEnvironmentVariable(
  "Path",
  [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\Users\rynne\miniconda3;C:\Users\rynne\miniconda3\Scripts;C:\Users\rynne\miniconda3\Library\bin",
  [EnvironmentVariableTarget]::User
)
```

#### Linux:

```shell
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

```shell
bash ~/Miniconda3-latest-Linux-x86_64.sh
# Miniconda3 will now be installed into this location: /home/username/miniconda3
```

在 config 文件里:

```shell
set -gx PATH /home/(username)/miniconda3/bin $PATH
```

然后 source 一下. note 如果用的是我的 dotfiles 的话这个已经写在 fish_config 里了.



然后可以创建环境

```shell
conda create -n myenv python=3.13
```

查看:

```shell
conda env list
```

而 windows 的直接用 anaconda powershell 就行.

还可以下载额外 GUI:

```shell
conda install jupyterlab
conda install anaconda-navigator
```

 

### powertoy: keyremap 和 dock

由于小键盘没有 printscreen, 组合键又麻烦

我的话会一个 powertoy, 重新映射一下键, 把 f6 映射到 printscreen

(14 寸笔记本真需要这个. win+shift+s 太不顺手了)

https://learn.microsoft.com/en-us/windows/powertoys/install?tabs=gh%2Cextract-094

也可以 powershell 安装:
```powershell
winget install --id Microsoft.PowerToys --source winget
```

然后把 powertoys 加入开机自启动:

Win+R -> 输入 shell:startup 打开 Startup 文件夹 -> 把 powertoys 放进去

注意: 一般我们不想要弹窗只是想它后台启动. 所以右键这个快捷方式 -> properties -> 在 target 后面加上 --silent

#### key remap

安装好了之后:

- 开启 keyboard manager 

- 打开 Powertoy -> input and output -> keyboard manager (先 enable) -> remap a shortcut

我会把

- F6 -> Print Screen
- F5 -> Ctrl + Alt + M (for mathpix)

#### dock

- 点开 system tools -> command palette -> settings
- dock -> enable dock

这样即可实时监测 performance, 以及布置一些快速 commands.







### memory management: ramMap

内存管理. 主要有些厂商开机占有率太高了. 大概率是一些服务 start up 的原因; 再加上 16 GB 的 ram, 雪上加霜了属于.

首先少开点 app 上的 startup, 其次对系统的 startup processes 可以用 RamMap 清一下

我会:

1. 下载一个 RamMap 管理内存: https://learn.microsoft.com/en-us/sysinternals/downloads/rammap

2. (非常 optional) 下载一个 autohotkey 然后把这一段 `launch_gamebar.ahk` 的 快捷方式放在 shell:startup 里面 (winR 打开输入 shell:shartup)

   ```ahk
   #Persistent
   SetTimer, LaunchGameBar, 5000  ; 等待5秒后执行（确保系统加载完）
   Return
   
   LaunchGameBar:
   SetTimer, LaunchGameBar, Off
   Send, #{g} ; 发送 Win+G
   ExitApp
   
   ```

   目的是用 gamebar 来检测性能.

这样我的开机时内存占用率就从 60% 降低到了 25%. 



### notetaking

我的三个级别的 note taking.

- 日常备忘录: sublime, typora
- eecs notes (需要一点数学和代码环境但是主要是文字): obsidian
- math notes: latex

反正不可能用 office 的.



#### latex

请参见 https://github.com/qiulinfan/localLatexenv



#### obsidian

安装: https://obsidian.md/

我的 notes structure 是放在 desktop:

```
Desktop/
    notes/
        mathnotes-...
        csnotes-...
        ...
```

notes/ 作为 obsidian 的 root.

#### mathpix

快速公式转 latex/md 的工具. 



### 一些免费软件

应急像素图绘制: Pixel Studio, steam 下载

音频剪辑: ocenaudio, 免费开源

pdf 页面编辑: pdfgear

压缩和解压缩器: 7-zip




### extra: nvdia 驱动

记得重新装一下. 根据机型找官网的驱动 

不然多显示器可能出问题





## snapshot (自用, 换机时提醒我自己别忘记迁移文件的...本人不使用云服务)

我的桌面:

> row 1
>
> - recycle bin
> - wallpaper engine
> - clash verge
> - baiduyun
> - rammap
> - tencent meeting
> - zoom
>
> row 2
>
> - cursor
> - IDEA
> - Rider
> - Mathpix
> - Diary/
> - notes/
>
> row 3
>
> - unreal
> - blender
> - pixel studio
> - ocenaudio
> - mateengine
>
> - games/



我的 task bar:

> - windows
> - screen manager
> - file explorer
> - terminal
> - task manager
> - settings
> - logi
> - VSCode
> - github desktop
> - Visual Studio
> - Unity
> - chrome
> - typora
> - obsidian
> - wechat
> - sublime text
> - discord



我的 Documents/

> - PersonalInfo/
> - Photos/
> - Ebooks/
> - Music/
> - Courses/
> - Powershell scripts/
> - nodejs/

