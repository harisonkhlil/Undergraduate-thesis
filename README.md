# 使用说明

本 LaTeX 模板是依据郑州大学的模板根据学校要求的格式要求重新修改的，或许仍有一些细节无法对上，请在具体实践后反馈给老师，如果有能力进行模板的修改，请帮助一起修改这个项目

## 使用方法

可以使用多种方式编写以及编译 LaTeX 文档。

1. Overleaf 在线编辑，注意⚠️不要在官方模板上编写，请自行 copy 到自己的项目内，在自己的项目内进行修改
2. Visual Studio Code，使用扩展商店的 Latex Workshop，配置编译链和代码补全
3. 使用 (neo)vim 的插件 vimtex + Texlab（lsp）配置自动化和代码补全

### VSCode

VSCode 是一个微软出品的编辑器，具有非常强大的编辑功能，通过扩展商店的扩展可以更有效的进行代码开发或者其他工作。
对于 LaTeX 这门编译型语言来说，需要的扩展是 LaTeX Workshop，配置繁多，具体可以看这篇文章：[使用VSCode编写LaTeX](https://zhuanlan.zhihu.com/p/38178015)

### (neo)vim

对于喜欢使用命令行的学生来说，vim 的名字应该如雷贯耳，自 2019 年以来微软设计并发布了 lsp（language server protocol)
(neo)vim 的插件就层出不穷，源源不断。在这种创造的洪流之中诞生了许多优秀类似 IDE 的(neo)vim 发行版，
编写者使用的发行版是 Neovim 的`LazyVim` 一个成熟、稳定、快速、美观的发行版。

对于 LazyVim 编写 LaTeX 来说，仅仅需要吧 `LatexExtras` 的 `lang.tex` 模块打开即可。如果想要开启增量编译，
按下 `\ll` 即可自动识别文档类型决定编译工具链开启编译，编译完成即可自动使用默认 pdf 阅读工具查看编译结果

详细的快捷键教程：[LazyVim Start](https://www.lazyvim.org/)

详细的 `vimtex` 使用说明：[vimtex manual](https://www.ejmastnak.com/tutorials/vim-latex/vimtex/)

## 致谢

谢谢你的支持，祝你学术愉快
