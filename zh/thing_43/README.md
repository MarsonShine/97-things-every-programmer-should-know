# 了解如何使用命令行工具

如今，许多软件开发工具都以集成开发环境（IDE）的形式打包。微软的 Visual Studio 和开源的 Eclipse 是两个流行的例子，当然还有很多其他例子。集成开发环境有很多优点。它们不仅易于使用，还能让程序员不必考虑构建过程中的许多小细节。

不过，易用性也有其缺点。通常情况下，当一个工具易于使用时，是因为该工具在幕后为你做决定并自动完成很多事情。因此，如果集成开发环境是你唯一使用的编程环境，你可能永远无法完全理解你的工具究竟在做什么。你点击一个按钮，一些神奇的事情就会发生，一个可执行文件就会出现在项目文件夹中。

通过使用命令行构建工具，你可以更多地了解这些工具在构建项目时在做什么。编写自己的 make 文件可以帮助你了解构建可执行文件的所有步骤（编译、组装、链接等）。尝试使用这些工具的多种命令行选项也是一种宝贵的教育经历。要开始使用命令行构建工具，可以使用 GCC 等开源命令行工具，也可以使用专有集成开发环境提供的工具。毕竟，设计精良的集成开发环境只是一套命令行工具的图形前端。

除了提高对编译过程的理解外，有些任务使用命令行工具比使用集成开发环境更容易或更高效。例如，*grep* 和 *sed* 工具提供的搜索和替换功能往往比集成开发环境中的功能更强大。命令行工具本质上支持脚本编写，可以实现任务的自动化，例如生成计划的每日构建、创建项目的多个版本以及运行测试套件。在集成开发环境中，这种自动化可能更难实现（如果不是不可能的话），因为构建选项通常是通过图形用户界面对话框指定的，只需点击鼠标即可调用构建过程。如果您从未离开过集成开发环境，您可能根本不会意识到这类自动化任务是可行的。

但是，等等。集成开发环境的存在不就是为了让开发更简单，提高程序员的工作效率吗？是的，没错。这里提出的建议并不是让你停止使用集成开发环境。我们的建议是，你应该“看看引擎盖下”，了解集成开发环境在为你做什么。最好的办法就是学会使用命令行工具。这样，当你再次使用集成开发环境时，你就能更好地理解它在为你做什么，以及如何控制构建过程。另一方面，一旦你掌握了命令行工具的使用方法，并体验到它们带来的强大功能和灵活性，你可能会发现自己更喜欢命令行而不是集成开发环境。

作者：[Carroll Robinson](http://programmer.97things.oreilly.com/wiki/index.php/Carroll_Robinson)