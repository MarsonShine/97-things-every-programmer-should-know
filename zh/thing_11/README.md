# 用领域语言编写代码

有两个代码库。一个是

```java
if (portfolioIdsByTraderId.get(trader.getId())
  .containsKey(portfolio.getId()) {...}
```

你挠了挠头，想知道这段代码是做什么用的。它似乎是从一个交易者对象中获取一个 ID，用它从一个字典中获取一个可能是字典对象，然后看看内部字典中是否存在 portfolio 对象的另一个 ID。你又挠了挠头。你查找了 portfolioIdsByTraderId 的声明，并发现了以下内容：

```java
Map<int, Map<int, int>> portfolioIdsByTraderId；
```

渐渐地，你意识到这可能与交易者是否有权访问特定 portfolio 有关。当然，你还会发现相同的代码片段，或者更有可能是类似但略有不同的代码片段，只要涉及到交易者是否能访问特定 portfolio。

在另一个代码库中，你会看到这样的代码：

```
if (trader.canView(portfolio)) {...}
```

无需挠头。你不需要知道交易者是如何知道的。也许交易者的内心深处藏着一张“字典中的字典”。但那是交易人的事，与你无关。

现在，你更愿意在哪个代码库中工作？

以前，我们只有最基本的数据结构：比特、字节和字符（其实只是字节，但我们会把它们当作字母和标点符号）。小数有点麻烦，因为我们的基 10 数在二进制中不好用，所以我们有几种大小的浮点类型。然后是数组和字符串（实际上只是不同的数组）。然后，我们有了堆栈、队列、哈希、链表和跳转列表，以及许多其他令人兴奋的数据结构，但这些结构在现实世界中并不存在。“计算机科学”就是要花费大量精力将现实世界映射到我们的限制性数据结构中。真正的大师甚至还记得他们是如何做到这一点的。

后来，我们有了用户自定义类型！好吧，这不是什么新闻，但它确实在一定程度上改变了游戏规则。如果您的领域包含交易员和投资组合等概念，您可以使用名为  Trader 和 Portfolio 的类型对其进行建模。但比这更重要的是，您还可以使用领域术语对它们之间的*关系*进行建模。

如果你不用领域特定的术语来编码，你就是在创建一种默示的（即秘密的）理解，即这个整数表示一种识别交易者的方式，而那个整数表示一种识别投资组合的方式。（最好不要把它们混淆！）如果你用一个算法片段（如键值对映射中的存在关系）来表示一个业务概念（“某些交易者不允许查看某些投资组合——这是违法的”），你并没有给审计和合规人员带来任何好处。

下一个程序员可能还不知道其中的秘密，为什么不把它明示出来呢？将一个键作为另一个键的查找键来执行存在性检查并不十分明显。别人怎么会知道防止利益冲突的业务规则是在这里实现的呢？

在代码中明确提出领域概念，意味着其他程序员可以更容易地了解代码的*意图*，而不是试图将算法改装成他们所理解的领域。这也意味着，当领域模型发生演变时（随着你对领域理解的加深，领域模型也会发生演变），你可以很好地对代码进行演变。再加上良好的封装，规则很有可能只存在于一个地方，你可以在不影响任何依赖代码的情况下对其进行更改。

几个月后来修改代码的程序员会感谢你的。几个月后出现的程序员可能就是你。

作者：[丹-诺斯](http://programmer.97things.oreilly.com/wiki/index.php/Dan_North)