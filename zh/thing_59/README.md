# 错失多态性的机会

多态（Polymorphism）是 OO 的基本思想之一。这个词来自希腊语，意思是多种（*poly*）形式（*morph*）。在编程中，多态指的是某一类对象或方法的多种形式。但是，多态性并不仅仅是指替代实现。谨慎使用多态性，可以创建微小的本地化执行上下文，让我们的工作不需要冗长的*if-then-else*块。在上下文中，我们可以直接做正确的事，而在上下文之外，我们就不得不重新构建上下文，这样才能做正确的事。通过仔细使用替代实现，我们可以捕获上下文，这些上下文可以帮助我们生成更少、更易读的代码。这一点可以通过一些代码得到最好的证明，比如下面这个（不切实际的）简单购物车：

```
public class ShoppingCart {
    private ArrayList<Item> cart = new ArrayList<Item>()；
    public void add(Item item) { cart.add(item); }
    public Item takeNext() { return cart.remove(0); }
    public boolean isEmpty() { return cart.isEmpty(); }
}
```

假设我们的网店提供可下载的商品和需要发货的商品。让我们构建另一个支持这些操作的对象：

```
public class Shipping {
    public boolean ship(Item item, SurfaceAddress address) { ... }
    public boolean ship(Item item, EMailAddress address) { ... }
}
```

客户完成结账后，我们需要发货：

```
while (!cart.isEmpty()) {
    shipping.ship(cart.takeNext(), ????)；
}
```

*???*参数并不是什么新奇的猫王运算符，它是在问我应该用电子邮件还是snail邮件？回答这个问题所需的上下文已经不存在了。我们可以在布尔或枚举中捕获发货方法，然后使用*if-then-else*来填补缺失的参数。另一种解决方案是创建两个都扩展了 Item 的类。我们把它们分别称为 DownloadableItem 和 SurfaceItem。现在让我们编写一些代码。我将把 Item 提升为支持单个方法 ship 的接口。要运送购物车中的物品，我们将调用 `item.ship(shipper)`。类 `DownloadableItem` 和 `SurfaceItem` 都将实现 ship。

```
public class DownloadableItem implements Item {
    public boolean ship(Shipping shipper) {
        shipper.ship(this, customer.getEmailAddress())；
    }
}

public class SurfaceItem implements Item {
    public boolean ship(Shipping shipper) {
        shipper.ship(this, customer.getSurfaceAddress())；
    }
}
```

在这个示例中，我们将处理“发货”的责任委托给了每个项目。由于每个项目都知道自己的最佳装运方式，因此这种安排使我们无需*if-then-else*就能开始工作。这段代码还演示了两种经常配合使用的模式：命令和双重调度。这些模式的有效使用依赖于多态性的谨慎使用。如果做到了这一点，我们代码中的*if-then-else*块的数量就会减少。

虽然在某些情况下，使用 *if-then-else* 比多态性更为实用，但更常见的情况是，多态性更强的编码风格会使代码库更小、更易读、更不脆弱。错失良机的数量就是对代码中*if-then-else*语句的简单统计。

作者：[Kirk Pepperdine](http://programmer.97things.oreilly.com/wiki/index.php/Kirk_Pepperdine)