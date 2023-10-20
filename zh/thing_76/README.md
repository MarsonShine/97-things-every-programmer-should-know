# 单一职责原则

良好设计的最基本原则之一是

> 将因相同原因而发生变化的事物集中在一起，将因不同原因而发生变化的事物分开。

这一原则通常被称为*单一责任原则*或 SRP。简而言之，就是一个子系统、模块、类，甚至一个函数，都不应该有一个以上的变更原因。典型的例子是一个类，它有处理业务规则、报表和数据库的方法：

```
public class Employee {
  public Money calculatePay() ...
  public String reportHours() ...
  public void save() ...
}
```

有些程序员可能会认为，将这三个函数放在同一个类中是非常合适的。毕竟，类应该是对共同变量进行操作的函数集合。但问题是，这三个函数变化的原因完全不同。只要计算薪酬的业务规则发生变化，“calculatePay”函数就会改变。每当有人需要不同格式的报告时，“reportHours”函数就会改变。每当 DBA 更改数据库模式时，”save" 函数就会更改。这三个改变的原因结合在一起，使得 `Employee` 非常不稳定。它会因为上述任何一个原因而改变。更重要的是，任何依赖于`Employee`的类都会受到这些变化的影响。

良好的系统设计意味着我们要将系统分离成可以独立部署的组件。独立部署意味着如果我们更改了一个组件，就不必重新部署任何其他组件。但是，如果 `Employee` 被其他组件中的许多其他类大量使用，那么对 Employee 的每一次更改都可能导致其他组件的重新部署；从而抵消了组件设计（或 SOA，如果您喜欢更时髦的名称的话）的主要优点。

```
public class Employee {
  public Money calculatePay() ...
}

public class EmployeeReporter {
  public String reportHours(Employee e) ...
}

public class EmployeeRepository {
  public void save(Employee e) ...
}
```

上面显示的简单分区解决了这些问题。每个类都可以放在自己的组件中。或者说，所有报表类都可以放在报表组件中。所有与数据库相关的类都可以放到存储库组件中。而所有的业务规则都可以放在业务规则组件中。

精明的读者会发现，上述解决方案中仍然存在依赖关系。“Employee”仍然依赖于其他类。因此，如果修改了 `Employee`，其他类很可能需要重新编译和部署。因此，不能修改 `Employee` 后再独立部署。但是，其他类可以修改并独立部署。对其中任何一个类的修改都不会迫使其他任何一个类重新编译或重新部署。通过谨慎使用*依赖反转原则(DIP)* ，甚至`Employee`也可以独立部署，但这是[另一本书](http://www.amazon.com/dp/0135974445/)的主题。

谨慎应用 SRP，将因不同原因而发生变化的事物分开，是创建具有可独立部署组件结构的设计的关键之一。

作者：[鲍勃叔叔](http://programmer.97things.oreilly.com/wiki/index.php/Uncle_Bob)