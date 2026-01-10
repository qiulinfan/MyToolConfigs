## 安装 MikTex / MacTex

win:

```powershell
winget install --id MiKTeX.MiKTeX --accept-source-agreements --accept-package-agreements
```

加入环境变量:

```
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User"); lualatex --version

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User"); mpm --update-db
```

而后进入MikTex Console GUI 进行更新

验证:

```
lualatex --version
where.exe lualatex
```

然后重启, 即可在本地编译 latex. 

过程中会弹出gezhon





mac:
```
brew install --cask mactex
sudo tlmgr path add

```

