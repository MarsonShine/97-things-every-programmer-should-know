# 在指责他人之前先检查自己的代码

开发人员——我们所有人！——常常难以相信自己的代码出了问题。因为这太不可能了，这一次，一定是编译器出了问题。

然而事实上，由于编译器、解释器、操作系统、应用程序服务器、数据库、内存管理器或任何其他系统软件中的错误而导致代码损坏的情况非常（非常）少见。是的，这些 bug 确实存在，但它们远没有我们想象的那么常见。

我曾经遇到过一个编译器错误优化掉循环变量的真正问题，但我想象过我的编译器或操作系统有更多次错误。在这一过程中，我浪费了大量的时间、支持时间和管理时间，但每次最终证明是我的错误时，我都会觉得自己有点愚蠢。

假设这些工具被广泛使用、成熟，并应用于各种技术堆栈，那么我们就没有什么理由怀疑其质量。当然，如果工具是早期发布的，或者在全球范围内只有少数人使用，或者是一款很少下载的 0.1 版开源软件，那么我们就有充分的理由怀疑这款软件。(同样，商业软件的 alpha 版本也可能值得怀疑）。

鉴于编译器 bug 的罕见程度，将时间和精力投入到查找代码中的错误比证明编译器是错的要好得多。所有常见的调试建议都适用，因此要隔离问题，将调用存根化，用测试将其包围；检查调用约定、共享库和版本号；向其他人解释；注意堆栈损坏和变量类型不匹配；在不同的机器和不同的构建配置（如调试和发布）上尝试代码。

质疑自己和他人的假设。不同供应商的工具可能有不同的假设，同一供应商的不同工具也可能有不同的假设。
当别人报告了一个你无法复制的问题时，去看看他们在做什么。他们可能在做一些你从未想到的事情，或者在以不同的顺序做一些事情。

我个人的原则是，如果我遇到一个无法确定的错误，而且我开始认为是编译器的问题，那么就应该查找堆栈损坏。如果添加跟踪代码会使问题四处移动，那就更是如此了。

多线程问题是另一个让人头发变白、对着机器尖叫的 bug 源头。当系统采用多线程时，所有有利于简单代码的建议都会成倍增加。调试和单元测试无法稳定地发现这些错误，因此设计的简洁性至关重要。

因此，在你急于责怪编译器之前，请记住夏洛克·福尔摩斯的建议：“一旦你排除了不可能的，无论剩下什么，不管看似多么不可能，必定是真相。”，并且将其优先于狄克·金特利的建议：“一旦你排除了不太可能的，无论剩下什么，不管看似多么不可能，必定是真相。”

作者：[艾伦-凯利](http://programmer.97things.oreilly.com/wiki/index.php/Allan_Kelly)