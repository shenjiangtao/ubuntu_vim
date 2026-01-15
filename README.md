# ubuntu_vim

一个在 **Ubuntu/macOS/Vim9** 上配置的高效 Vim 开发环境，支持智能补全、语义分析、诊断与格式化。

## ✨ 功能特性
- 自动补全（智能 + 语义）
- 跳转（定义、声明、引用）
- 实时诊断（红线、黄线）
- 自动 include
- `clang-tidy` 静态检查
- 保存时自动格式化（`clang-format`）
- 文件树 + Taglist
- 完全兼容 macOS / Ubuntu / Vim9

---

## ⚙️ 安装步骤

### 1. 复制配置文件
将 `.vimrc` 拷贝到用户目录：
```bash
cp .vimrc ~/.vimrc
```
### 2. 安装 vim-plug
使用 curl 下载并安装：
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 3. 安装插件
进入 Vim，执行：
```bash
:PlugInstall
```

### 4 安装 clangd
macOS
```bash
brew install llvm
```
Ubuntu
```bash
sudo apt install clangd
```

### 5.一键安装脚本
```bash
./install_vim_env.sh
```
