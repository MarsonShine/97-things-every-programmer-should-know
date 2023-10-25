# WET 稀释性能瓶颈

DRY 原则（Don't Repeat Yourself）的重要性在于，它规定了系统中的每项知识都应具有单一的表示形式。换句话说，知识应包含在单一的实现中。与 DRY 相反的是 WET 原则（Write Every Time）。当一个系统中的知识被多个不同的实现重复时，我们的代码就变得像 WET 一样。在性能方面，DRY 和 WET 之间的差异变得非常明显，当你考虑到它们对性能产生的多种影响时。

首先，让我们考虑一下系统中的一项功能，例如*X*，它是 CPU 的瓶颈。假设 *X* 功能消耗了 30% 的 CPU。现在假设 *X* 有 10 种不同的实现方式。平均而言，每种实现都会消耗 3% 的 CPU。如果我们想速战速决，这种程度的 CPU 利用率并不值得担心，因此我们很可能会忽略这一功能是我们的瓶颈。然而，假设我们已经意识到*X*功能是瓶颈所在。现在，我们面临的问题是找到并修复每一个实施方案。如果使用 WET，我们就有十种不同的实现方式需要查找和修复。如果使用 DRY，我们就能清楚地看到 30% 的 CPU 使用率，而且我们只需要修复十分之一的代码。我有没有说过，我们不需要花时间去查找每个实现？

在一个使用案例中，我们经常会违反 DRY：我们对集合的使用。实现查询的常用技术是遍历集合，然后对每个元素依次应用查询：

```java
public UsageExample {
    private ArrayList<Customer> allCustomers = new ArrayList<Customer>()；
    // ...
    public ArrayList<Customer> findCustomersThatSpendAtLeast(Money amount) {
        ArrayList<Customer> customersOfInterest = new ArrayList<Customer>()；
        for (Customer Customer: allCustomers) {
            如果 (customer.spendsAtLeast(amount))
               customersOfInterest.add(customer)；
        }
        return customersOfInterest；
    }
}
```

通过将原始集合暴露给客户端，我们违反了封装。这不仅限制了我们重构的能力，还迫使我们代码的用户违反 DRY，因为他们每个人都要重新实现可能相同的查询。通过从应用程序接口中移除暴露的原始集合，可以轻松避免这种情况。在本例中，我们可以引入一个新的、特定于领域的集合类型，名为 "CustomerList"。这个新类在语义上更符合我们的领域。它将成为我们所有查询的自然归宿。

有了这个新的集合类型，我们还可以轻松查看这些查询是否是性能瓶颈。通过将查询整合到类中，我们就不需要向我们的客户公开表示方法的选择，如 `ArrayList`。这样，我们就可以自由地更改这些实现，而不必担心违反客户约定：

```java
public CustomerList {
    private ArrayList<Customer> customers = new ArrayList<Customer>()；
    private SortedList<Customer> customersSortedBySpendingLevel = new SortedList<Customer>()；
    // ...
    public CustomerList findCustomersThatSpendAtLeast(Money amount) {
        return new CustomerList(customersSortedBySpendingLevel.elementsLargerThan(amount))；
    }
}

public class UsageExample {
    public static void main(String[] args) {
        CustomerList customers = new CustomerList()；
        // ...
        CustomerList customersOfInterest = customers.findCustomersThatSpendAtLeast(someMinimalAmount)；
        // ...
    }
}
```

在这个示例中，坚持 DRY 使我们能够使用以客户消费水平为关键字的 SortedList 来引入另一种索引方案。比这个特定示例的具体细节更重要的是，遵循 DRY 帮助我们发现并修复了性能瓶颈，而如果代码是 WET 的，则很难发现这个瓶颈。

作者：[Kirk Pepperdine](http://programmer.97things.oreilly.com/wiki/index.php/Kirk_Pepperdine)