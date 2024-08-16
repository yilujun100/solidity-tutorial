// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ControlStructures {
    /* if-else */
    // 智能合约被称为“智能”主要是因为它们可以根据不同的条件执行不同的操作。为了实现这种条件依赖的执行，我们需要使用条件判断语句。
    // 在 Solidity 中，这些条件语句与 C 语言中的用法相同，你可以使用以下三种主要的条件语句：
    // - if: 用于当满足某一条件时执行一段代码
    // - else if: 在前一个 if 条件不满足时，提供另一个条件的判断
    // - else: 在前面的 if 或 else if 中的条件都不满足时执行的代码块
    /* if (age < 18) { // 如果年龄小于 18 岁，则分类为“小孩”
        ageStage = "teen";
    } else if (age < 65) { // 如果年龄大于等于 18 岁，且小于 65 岁，则分类为“成年人”
        ageStage = "adult";
    } else { // 否则为老年人
        ageStage = "elderly";
    } */

    /* for 循环 */
    // Solidity 的 for 循环的语法与 C 语言，JavaScript 基本相同，其语法如下：
    /* for (init-statement; test-statement; iteration-statement) {
        // 循环体
    } */
    // 在 Solidity 中，for 循环是处理迭代任务的强大工具，它包含三个主要的控制语句：
    // - init-statement: 用于在循环开始之前初始化循环变量，这一语句仅在循环开始时执行一次
    // - test-statement: 用于判断是否满足继续执行循环的条件。这个判断在每一轮循环开始前都会执行一次，如果条件不满足，则退出循环
    // - iteration-statement: 用于在每轮循环的代码执行完毕后更新循环变量。这确保了在下一次迭代开始之前，循环变量的状态已经更新
    // for 循环示例
    // 下面 5 个示例的逻辑都是一样的：计算从 1 加到 n 的总和。这些示例展示了你可以使用的 for 循环的不同形式来实现一样的功能
    /* function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i;
        for(i = 1; i <= n; i++) {
            sum += i;
        }
        return sum;
    } */
    // 在 init-statement 定义并初始化变量
    /* function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        for(uint16 i = 1; i <= n; i++) {
            sum += i;
        }
        return sum;
    } */
    // init-statement 可以移动到 for 循环之前
    /* function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1;
        for(; i <= n; i++) {
            sum += i;
        }
        return sum;
    } */
    // iteration-statement 可以移动到 for 循环内部
    /* function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1;
        for(; i <= n; ) {
            sum += i;
            i++;
        }
        return sum;
    } */
    // 所有逻辑都可以在 for 循环的循环体里实现
    /* function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1;
        for(;;) {
            if (i > n) {
                break;
            }
            sum += i;
            i++;
        }
        return sum;
    } */

    /* while 循环 */
    // while 循环语法
    // Solidity 的 while 循环语法与 C 语言，JavaScript 基本相同，其语法如下：
    /* while (test-statement) {
        // 循环体
    } */
    // 在 Solidity 中，while 循环是一个在满足特定条件时重复执行代码块的控制结构。它在每次循环迭代开始前，首先评估一个测试语句（test-statement）:
    // - 如果 test-statement 评估为 true，则执行循环体内的代码
    // - 如果 test-statement 评估为 false，循环将终止，控制流将转移到循环体后的代码
    // 使用 while 循环时，通常需要在循环体内部对控制变量进行修改，以确保在某个条件下，测试语句最终将返回 false，从而避免无限循环的发生。
    // 这种循环特别适用于那些在循环开始前不知道需要执行多少次迭代的情况。
    // for 循环与 while 循环的比较
    /* function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 0;
        while(i <= n) {
            sum += i;
            i++;
        }
        return sum;
    } */
    // 在编程中选择使用 for 循环还是 while 循环，并没有严格的规定。选择哪一种循环结构主要取决于哪种方式可以让代码更加整洁和易于理解。
    // 不同的编程场景可能需要不同类型的循环。
    // 以下是一些通常的做法，但请注意这些不是强制性的规定：
    // - 使用 for 循环：如果你有明确的初始条件和终止条件，for 循环通常是更好的选择。这是因为 for 循环可以在一个地方集中处理这些元素，使得代码更加清晰和直观。
    // - 使用 while 循环：如果没有明确的初始和终止条件，或者当测试语句的条件判断较为复杂时，while 循环可以是更合适的选择。while 循环便于处理那些需要持续检查条件是否成立才能执行的情况。

    /* do while 循环 */
    // do while 循环语法
    // Solidity 的 do while 循环语法规则也与 C 语言，JavaScript 基本相同，其语法如下：
    /* do {
        // 循环体
    } while (test-statement) */
    // do while 循环区别于 while 循环的地方是，它的循环体至少会执行一遍。然后才会执行 test-statement 判断是否为 true。如果是则把循环体再执行一遍。
    // 如果 test-statement 为 false，那么退出循环并执行余下的代码。
    // do while 循环，从 1 加到 N
    /* function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1;

        do {
            sum += i;
            i++;
        } while (i <= n);

        return sum;
    } */
    // for, while, do while 应该选哪个
    // for 循环和 while 循环并没有太大的区别，更多的是不同的场景下其中一个比另外一个看起来更加简洁而已。
    // do-while 循环与 for 和 while 循环存在一个明显的区别：do-while 循环保证了循环体至少被执行一次，即使循环条件一开始就不满足。
    // 相反，for 和 while 循环在条件不满足时可能一次都不执行。因此，当你需要确保循环体至少执行一次时，使用 do-while 循环是更自然、
    // 更清晰的选择。使用它并非必须，但它可以让控制逻辑看起来更直观，代码更简洁。
    // 总的来说，for、while 和 do-while 三种循环在功能上相似，都能完成重复执行代码的任务。for 和 while 循环在使用上比较相似，可以
    // 根据个人偏好或代码的清晰度来选择。而 do-while 循环通常用在至少需要执行一次循环体的场景中。选择合适的循环类型可以根据具体的应用
    // 场景和代码可读性的需求来决定。

    /* break */
    // 我们已学习了三种循环：for、while 和 do-while。有时，我们可能会发现没有必要完整地执行所有循环迭代。例如，在检查一个字符串中是否包含
    // 空格的场景中，一旦发现第一个空格，我们就可以立即得出结论，无需继续遍历整个字符串。在这种情况下，break 关键字就显得非常有用。
    // 在 Solidity 中，break 关键字允许我们在满足特定条件时提前退出循环。这不仅可以提升程序的执行效率，还可以减少不必要的计算开销。无论是
    // 在 for、while 还是 do-while 循环中，break 都可以有效地使用。
    // 下面的函数用来检查一个字符串里面是否含有空格。里面是一个从 0 到 input.length 的循环。一旦发现有空格就马上设置 result=true 并
    // 跳出循环。这样就不需要遍历整个字符串的每一个字符。
    /* function hasSpace(string memory input) public view returns (bool) {
        bool result;
        for (uint i = 0; i < bytes(input).length; i++) {
            if (bytes(input)[i] == " ") {
                result = true;
                break;
            }
        }
        return result;
    } */
    // break 只会跳出一层循环
    // 当你在编写包含多重循环的程序时，理解 break 关键字的行为尤为重要。在多层循环结构中，break 关键字只会退出它所在的当前循环层，而不会
    // 影响到外层的循环。这意味着一旦 break 在内层循环中被执行，程序将退出该内层循环，并继续执行外层循环的下一次迭代。

    /* continue */
    // 在 Solidity 中，continue 关键字的作用是终止当前循环迭代的剩余部分，直接跳转到下一次迭代的开始。这个关键字主要用于在循环过程中
    // 跳过不符合特定条件的数据，使我们能够专注于处理感兴趣的数据。
    // 以下是一个使用 continue 关键字的 Solidity 函数示例，该函数用于打印从 1 到 10 的奇数：
    /* function printOddNumbers() public {
        for (uint i = 1; i <= 10; i++) {
            if (i % 2 == 0) { // 如果是偶数，跳过本次循环
                continue;
            }
            console.log(i);
        }
    } */
    // 1.控制循环行为：break 和 continue 都是关键字，用于在循环中控制执行流
    // 2.功能区分：
    // - break: 用于立即退出当前的整个循环，有助于减少不必要的计算和时间开销，特别当已达成循环目的时
    // - continue: 用于跳过当前循环的剩余部分，快速进入下一次迭代。这允许循环忽略后续的代码执行，直接进行下一轮的条件判断
    // 3.优化数据处理：continue 关键字特别适用于筛选循环中的数据，允许程序专注于处理有意义或感兴趣的信息，而忽略不相关的数据

    // 在智能合约的执行过程中，经常会遇到各种异常 情况，如输入参数非法、算术运算中的除零错误、整型溢出等。为了处理这些异常，Solidity 采用
    // 状态回滚（state reverting）的机制，即在发生异常时撤销所有执行中的改变，恢复到执行前的状态，仿佛未执行任何操作一样。
    // Solidity 为异常处理提供了三种函数：
    // - require
    // - assert
    // - revert

    // require 函数在智能合约中主要用于验证函数执行前的条件，确保合约状态的正确性。如果 require 的条件不满足，则函数将停止执行，并
    // 抛出异常，触发状态回滚。这种机制常用于以下场景：
    // 1.检查输入参数：验证传入函数的参数是否满足预期，确保它们在合理的范围或状态
    // 2.检查操作结果：确保某些操作的结果如预期一样有效
    // 3.预检条件：在执行函数的主要逻辑之前，确认所有必要的条件都已经满足
    // 通常，require 语句被放置在函数的开始处，以便在进一步处理任何逻辑之前，首先确保所有基础条件都被满足。这不仅有助于防止错误或恶意
    // 的操作，还能有效地节约因执行不必要操作而浪费的 Gas。
    // require 语法
    // require(condition, "My error string");
    // 在智能合约中，require 函数是用于处理异常情况的关键工具。它接受一个布尔表达式作为条件，如果该条件评估为 false，则会立即抛出异常并终止执行，
    // 同时撤销所有改变，使所有状态变量恢复到事务开始前的状态。
    // 例如，考虑下面的用例，其中一个智能合约需要将传入的以太币（Ether）平均分配到两个不同的地址 addr1 和 addr2。在进行转账之前，
    // 我们使用 require 来确保传入的以太币数量是偶数，以便能够平均分配：
    /* function splitEther(address payable addr1, address payable addr2) public payable {
        require(msg.value % 2 == 0, "Even value required."); // 检查传入的ether是不是偶数
        addr1.transfer(msg.value / 2);
        addr2.transfer(msg.value / 2);
    } */

    // assert语法
    // assert(condition);
    // 其中 condition 是布尔表达式，如果其结果是 false 那么就会抛出异常。然后所有状态变量都会恢复原状。
    // 例如下面的示例中，把传入的 Ether 分为两半，一半转入地址 addr1 ，另一边转到地址 addr2 。在实际分账之前，
    // 使用 require 先检查传入的 Ether 是不是偶数。在分账完成后，使用 assert 检查分账前后，合约的 balance 不受影响。
    /* function splitEther(address payable addr1, address payable addr2) public payable {
        require(msg.value % 2 == 0, "Even value required."); // 检查传入的ether是不是偶数
        uint balanceBeforeTransfer = address(this).balance;
        addr1.transfer(msg.value / 2);
        addr2.transfer(msg.value / 2);
        assert(address(this).balance == balanceBeforeTransfer); // 检查分账前后，本合约的balance不受影响
    } */
    // assert 与 require 的区别
    // 在 Solidity 中，assert 和 require 都用于检查异常情况并在条件不满足时抛出异常。虽然它们在行为上相似，主要区别在于它们的使用场景和语义意义。
    // - require: 通常用于验证外部输入、处理条件和确认合约的交互符合预期。它主要用于可恢复的错误或者在正常的业务逻辑中检查条件，比如验证用户输入、
    //   合约状态条件或执行前的检查。如果 require 检查失败，会撤销所有修改并退还剩余的 gas
    // - assert: 用于检查代码逻辑中不应发生的情况，主要是内部错误，如不变量的检查或某些后置条件，这些通常指示合约存在 Bug。assert 应仅在确定有逻辑
    //   错误时使用，因为如果 assert 失败，它表示一个严重的错误，通常是编码或逻辑错误，需要马上修复。与 require 不同，assert 失败将消耗所有提供的 gas，并回滚所有修改。
    // 使用 require 和 assert 的这种区分是一种编程惯例，有助于提高代码的清晰度和维护性。正确地使用这两者，不仅可以确保合约逻辑的正确性，还能帮助开发者更快地定位问题所在。
    // 尽管可以交替使用这两个关键字而不影响合约的功能，这样做通常会使得合约的可读性和可维护性降低。正确的使用习惯是根据错误的类型和来源来选择使用 require 还是 assert。

    /* revert */
    // 在 Solidity 中，revert 与 require 功能上有些相似，它们都用于异常处理并撤销所有状态变化。然而，revert 的使用更为直接：它不像 require 那样进行条件检查，
    // 而是立即抛出异常。这使得 revert 非常适用于那些需要立即中止执行并恢复合约到执行前状态的场景。
    // revert 的灵活性表现在它可以与 if-else 语句结合使用，提供比 require 更精细的控制逻辑。例如，在一些复杂的逻辑判断中，使用 revert 加上 if-else 结构可以根据多个条件
    // 决定是否应该终止执行。这种方法虽然在表达能力上非常强，但可能牺牲一些代码的直观性和易读性，这是在使用时需要考虑的一个权衡点。
    // revert 语法
    // revert 使用方式
    // 方式一
    // revert CustomError(arg1, arg2);
    // 方式二
    // revert("My Error string");
    // 其中 CustomError 是自定义的 Error
    // 例如下面的示例中，把传入的 Ether 分为两半，一半转入地址 addr1 ，另一边转到地址 addr2 。在实际分账之前，使用 revert 先检查传入的 Ether 是不是偶数。
    /* function splitEther(address payable addr1, address payable addr2) public payable {
        if (msg.value % 2 == 0) {
            revert("Even value revertd.");
        }
        addr1.transfer(msg.value / 2);
        addr2.transfer(msg.value / 2);
    } */
    // revert 与 require 的区别
    // revert 可以在某些复杂的情况下替代 require 来停止执行并抛出异常。这里，我们将展示两种表达方式在功能上是等价的，但各自适用于不同的编程风格和场景。
    // require 与 revert 的等价表达式
    // 判断是否是偶数
    // require(msg.value % 2 == 0, "Even value revertd.");
    // 等价于：
    /* if (msg.value % 2 == 0) {
        revert("Even value revertd.");
    } */
    // 在一些复杂的逻辑嵌套中，使用 revert 会更加方便，清晰：
    /* if (condition1) {
        // 可能有更多的 if-else 嵌套
        if (condition2) {
            // do sth
        }
        revert("condition2 not fulfilled");
    } */
}