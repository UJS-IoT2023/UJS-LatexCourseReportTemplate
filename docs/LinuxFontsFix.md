编译过程中，由于相关字体为 Windows 中商用字体，Linux 可能遇到无法编译的问题，需要手动安装字体，或者进行替换。

首先安装 Times New Roman 等英文字体

```bash
sudo apt update
sudo apt install ttf-mscorefonts-installer
```

然后安装中文字体，挂载并找到 Windows 盘中的 C:\Windows\Fonts\ 的四个文件，分别为

```
➜  Fonts l
total 49M
drwxrwxr-x  2 cacc cacc 4.0K Sep 16 13:23 .
drwxr-xr-x 15 cacc cacc 4.0K Sep 16 13:22 ..
-rwxr-xr-x  1 cacc cacc  11M Feb 27  2026 simfang.ttf
-rwxr-xr-x  1 cacc cacc 9.3M Feb 27  2026 simhei.ttf
-rwxr-xr-x  1 cacc cacc  12M Feb 27  2026 simkai.ttf
-rwxr-xr-x  1 cacc cacc  18M Feb 27  2026 simsun.ttc
```

然后安装到系统

```bash
# 1. 创建用户字体目录（如果不存在）
mkdir -p ~/.local/share/fonts/chinese

# 2. 将字体文件复制过去，路径可能不同
cp ~/Documents/Fonts/{simfang.ttf,simhei.ttf,simkai.ttf,simsun.ttc} ~/.local/share/fonts/chinese/

# 3. 刷新字体缓存
fc-cache -fv
```

最后验证

```bash
fc-list :lang=zh family | sort -u | grep -i -E "sim|fang|kai|hei|song|宋|黑|楷|仿"
```

会显示

```
FangSong,仿宋
KaiTi,楷体
NSimSun,新宋体
SimHei,黑体
SimSun,宋体
```