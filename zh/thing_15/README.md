# 理性编程

试图通过手工推理软件的正确性会得到一个比代码更长、而且比代码更容易包含错误的形式证明。自动化工具更可取，但并非总是可行。以下描述了一种中间路径：半正式地推理正确性。

其基本方法是将所有正在考虑的代码分成短小的部分——从单行（如函数调用）到少于十行的代码块——并对其正确性进行论证。论据只需足够有力，足以说服你的魔鬼代言人同行程序员即可。

应该选择这样一个部分：在每个端点，程序的*状态*（即程序计数器和所有”活“对象的值）都满足一个易于描述的属性，并且该部分的功能（状态转换）易于描述为一个任务——这些都会使推理变得更简单。这种端点属性概括了函数的*前条件*和*后条件*，以及循环和类的*不变*（相对于它们的实例）等概念。力求各部分尽可能相互独立，可以简化推理，在修改这些部分时也是不可或缺的。

许多众所周知（尽管可能不太被遵守）并被认为是“好”的编码实践都能使推理变得更容易。因此，只要打算对代码进行推理，您就已经开始考虑采用更好的风格和结构。不出所料，静态代码分析器可以检查这些做法中的大多数：

- 避免使用 goto 语句，因为它们会使远程部分高度相互依赖。
- 避免使用可修改的全局变量，因为它们会使得使用这些变量的所有部分相互依赖。
- 每个变量的作用域应尽可能小。例如，可以在首次使用前声明本地对象。
- 在相关情况下，使对象*不可变*。
- 通过使用横向和纵向间距来提高代码的可读性。例如，对齐相关结构，使用空行分隔两个部分。
- 为对象、类型、函数等选择描述性（但相对简短）的名称，使代码具有自文档性。
- 如果需要嵌套部分，就将其作为一个函数。
- 让你的函数简短并专注于一项任务。过去的*24 行限制*仍然适用。虽然屏幕尺寸和分辨率已经发生了变化，但自 20 世纪 60 年代以来，人类的认知能力并没有发生任何变化。
- 函数的参数应该很少（4 个参数是一个很好的上限）。这并不限制与函数通信的数据： 将相关参数归类到一个对象中，可以从*对象不变式*中获益，并节省推理时间，例如它们的一致性和连贯性。
- 更一般地说，从代码块到库，每个代码单元都应该有一个*窄的接口*。减少交流可以减少推理。这意味着，返回内部状态的*getters*是一种负担——不要向对象索取信息来进行处理。相反，可以要求对象利用已有的信息来完成工作。换句话说，*封装*是*窄接口*的全部，也是唯一。
- 为了保持类的*不变性*，应避免使用*setters*，因为*setters*往往会破坏支配对象状态的不变性。

除了对代码的正确性进行推理外，对代码的争论还能加深对代码的理解。为了大家的利益，请交流你的见解。

作者：[Yechiel Kimchi](http://programmer.97things.oreilly.com/wiki/index.php/Yechiel_Kimchi)