// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

// 数据位置
// Solidity 中有三种数据存储位置，分别指定变量的存储方式：
//  - storage: 数据永久存储在区块链上，通常用于状态变量
//  - memory: 数据存储在内存中，是临时的，当函数调用结束后数据就会消失
//  - calldata: 数据存储在一个专门用于存放函数参数的区域，这也是临时的
// 在这些存储位置中，标记为 storage 的数据位置通常关联到“状态变量”，它们的数据是永久记录在区块链上的。这种机制确保了区块链
// 数据的不可变性和合约状态的持续性

contract Types {
    // 在 Solidity 中，基于参数传递的方式，数据类型可以分为两大类：值类型 和 引用类型。
    //  - 值类型：这类类型的数据在传递时会被复制，每次传递都是一个独立的副本。
    //  - 引用类型：相对于值类型，引用类型的数据在传递时不复制其本身，而是传递对原始数据的引用。

    // 值类型
    // 值类型的变量直接存储实际的数据内容。当这类变量进行赋值或传递参数时，操作总是以值传递的形式进行，即数据内容被直接拷贝到新位置。
    // 因此，赋值之后的变量与原始变量完全独立，彼此之间没有任何影响。这种机制确保了数据的独立性和安全性，在操作过程中避免了意外的数据修改。
    
    // 值类型列表
    //  - 布尔类型
    //  - 整型
    //  - 静态浮点型
    //  - 地址类型
    //  - 静态字节数组
    //  - 枚举类型
    //  - 自定义值类型
    //  - 字面值

    // 引用类型
    // 引用类型的变量存储的是数据的地址，而不是数据本身。因此，当这种类型的变量进行赋值或参数传递时，传递的是数据的地址（按引用传递）。
    // 这种方式允许直接操作存储地址指向的数据，而不是创建数据的副本，从而在处理大量数据或复杂数据结构时提高效率。

    // 引用类型列表
    // Solidity 中的引用类型主要分为三类，每种类型都有其特定的用途和结构：
    //  - 数组：这是由相同类型的变量组成的集合，允许存储多个数据项
    //  - 结构体：由不同类型的变量组成的集合，使得可以在单一结构中组合多种数据类型
    //  - 映射类型：由键值对组成的集合，允许通过键来快速访问或修改对应的值

    // 值与引用的行为差异：在函数内部修改引用类型变量的值会影响到原始变量，而修改值类型变量则不会影响原始数据

    // Solidity 数据位置
    // 在 Solidity 中，声明引用类型时必须指定数据位置（data location）, 这是为了明确变量的存储方式和生命周期。例如，声明一个动态数组时，
    // 可能会使用 uint[] storage。重要的是要注意，虽然通常必须指定数据位置，但声明状态变量时则不需要这样做，因为状态变量默认存储在 storage。
    // 在函数内部声明引用类型时必须指定数据位置，常见的数据位置有三种：
    //  - storage: 数据永久存储在区块链上，其生命周期与合约本身一致
    //  - memory: 数据暂时存储在内存中，是易失的，其生命周期仅限于函数调用期间
    //  - calldata: 类似于 memory，但用于存放函数参数，与 memory 不同的是，calldata 中的数据不可修改且相比 memory 更节省 gas。
    // storage 可以类比为硬盘，而 memory 可类比为 RAM。calldata 可能稍显陌生，它的独特之处在于其不可变性和高效的 gas 使用。因其特性，
    // 当引用类型的函数参数不需要修改时，推荐使用 calldata 而非 memory。
    // calldata 仅用于函数参数，数据不可更改，是易失的，并且比 memory 更节约 gas。
}



// 布尔类型
// 布尔类型是只有 true 或 false 两种可能取值的类型。在 Solidity 中，布尔类型变量可以使用 bool 关键字进行定义。

// 运算符
// 布尔类型可以使用的运算符合作用如下所示，运算操作后得到的结果依然是布尔类型
//  - !（逻辑非）
//  - &&（逻辑与）
//  - ||（逻辑或）
//  - ==（等于）
//  - !=（不等于）

// 短路规则
// 需要注意的是，逻辑运算符 || 和 && 在 Solidity 中都遵循短路规则（short-circuiting）。其规则如下：
//  - 对于 f(x) || g(y)，如果 f(x) 为 true，则 g(y) 不会被执行
//  - 对于 f(x) && g(y)，如果 f(x) 为 false，则 g(y) 不会被执行
contract BoolShortCircuit {
    uint256 public zeroCount = 0;

    function isEven(uint256 num) private pure returns(bool) {
        return num % 2 == 0;
    }

    // isZero函数有副作用，会改变状态变量zeroCount的值
    function isZero(uint256 num) private returns(bool) {
        if (num == 0) {
            zeroCount += 1; // 函数副作用，会改变zeroCount的值
        }
        return num == 0;
    }
}
// isEven(1) && isZero(0) isEven(1) 为 false，所以，有副作用的函数 isZero(0) 不会执行。因此，不会影响到 zeroCount 的值
// isEven(2) && isZero(0) isEven(2) 为 true，所以会继续执行有副作用函数 isZero(0)，于是 zeroCount 会增加 1
// isEven(2) || isZero(0) isEven(2) 为 true，所以，有副作用的函数 isZero(0) 不会执行。因此，不会影响到 zeroCount 的值
// isEven(1) || isZero(0) isEven(1) 为 false，所以会继续执行有副作用函数 isZero(0)，于是 zeroCount 会增加 1
// 逻辑或和逻辑与都遵循短路规则，即在满足左边条件时不会再执行右边的操作


// 整型
// 整型（integer）是不包含小数部分的数值型数据，包括正整数、负整数和 0 等。账户余额、Gas、持有的 Token 数量等通常都用整型表示。
// 在 Solidity 中，整型有两种类型：
// - intM: 有符号整型
// - uintM: 无符号整型
// 其中，M 的取值范围为 8 到 256，步长为 8。例如，有 int8、int16、int32 等等，一直到 int256.相应地，也有 uint8、uint16、
// uint32，一直到 uint256。其中，int8 和 uint8 占用 8 位（8 bits）, int16 和 uint16 占用 16 位，以此类推。

// 算术运算符
// - +（加）
// - -（减）
// - *（乘）
// - /（除）
// - %（取模）
// - **（幂）
// - <<（左移）
// - >>（右移）

// 比较运算符
// - <=
// - <
// - ==
// - !=
// - >=
// - >

// 位运算符
// - &（按位与）
// - |（按位或）
// - ^（按位异或）
// - ~（按位取反）

// 整型溢出
// Solidity 中的整型运算可能会出现溢出的情况，导致合约运行时产生不符合预期的行为。在旧版本的 Solidity 中，你可能会使用 OpenZeppelin
// 的 SafeMath 库来防止整型溢出。然而，在 Solidity 0.8.0 及以上版本中，一旦出现整型溢出，整个交易都会被终止。因此，在这些版本中，
// Solidity 在处理整型溢出方面是安全的。
// 例如，uint8 能够存储的最大正整数为 255。如果再加 1，就会发生整型溢出。执行以下函数时，Remix Terminal 会输出：
// call to Integer.overflow errored: VM error: revert，这意味着整个交易已被回滚。
/* contract Integer {
    function overflow() public view {
        uint8 a = 255;
        a = a + 1; // 整型溢出，整个transaction revert
    }
} */
// 虽然 Solidity 在整型溢出方面是安全的，但这并不意味着你的合约没有问题，还需要注意其他的潜在风险。


// 地址类型
// 地址类型（address）是 Solidity 独有的一种类型，用于存放账户地址。在给其他账户转账或与其他合约交互时，需要使用地址类型。类似于向他人
// 银行账户转账时需要知道对方的账户号码，Solidity 的地址类型也扮演着类似的角色。
// Solidity 的地址类型用关键字 address 表示。它占据 20 字节（160 位），默认值为 0x0，表示空地址。地址类型可以细分为两种：
// - address: 普通地址类型（不可接收转账）
// - address payable: 可收款地址类型（可接收转账）
// 这两种地址类型的主要区别在于，address payable 能接受转账，而 address 不能。

// 定义地址类型变量
// address addr = 0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990;
// address payable addr_pay = payable(0x8306300ffd616049FD7e4b0354a64Da835c1A81C);
// 注意在定义 addr_pay 时，使用了一个 payable() 函数，这是用来将地址字面值显式转换为 address payable 类型的。

// 为什么要区分 address 和 address payable
// Solidity 之所以要进行这样的区分，是为了提高合约的安全性，避免 Ether 转入某些合约后无法转出，导致资金永远被锁住。
// 首先，我们需要了解 Solidity 中账户有两种类型：外部账户（externally owned address，简称 EOA）和合约账户（contract address，简称 CA）。
// EOA 是我们在 MetaMask 上创建的那些账户，而 CA 是在部署合约后生成的合约地址。
// 当我们将 Ether 转入 EOA 后，只要我们控制了 EOA 的私钥，就可以将 Ether 再转出来。然而，CA 账户情况则不同。CA 账户是由合约控制的，合约只能
// 执行其定义过的操作。因此，我们必须在合约中实现一个函数，定义如何将账户中的 Ether 转出，否则这些 Ether 会被永远锁在 CA 账户中。
// 因此，每次向 CA 账户转账时，我们都必须问自己：这个合约是否已经定义了转出 Ether 的逻辑。使用 address payable 明确告诉编译器你已确认转账到
// 该地址是安全的。这不仅提高了合约的安全性，也更方便开发者进行调试。

// 类型转换
// address 和 address payable 之间可以互相进行类型转换。主要遵循两条规则：
// 1.address payable 可以隐式地被转换成 address
// 2.address 需要显式地使用 payable(addr) 函数转换成 address payable

// 成员变量
// 地址类型有三个成员变量，分别为：
// - balance: 该地址的账户余额，单位是 Wei
// - code: 该地址的合约代码，EOA 账户为空，CA 账户为非空
// - codehash: 该地址的合约代码的 hash 值
/* function get_balance() public view returns(uint256) {
    return address(this).balance; // 获取地址账户余额
} */
/* function get_code() public view returns(bytes memory) {
    return address(this).code; // 获取合约代码
} */
/* function get_codehash() public view returns(bytes32) {
    return address(this).codehash; // 获取合约代码的hash值
} */

// 成员函数
// 地址类型有五个成员函数：
// - transfer(uint256 amount): 向指定地址转账，失败时抛出异常（仅 address payable 可以使用）
// - send(uint256 amount): 与 transfer 函数类似，但失败时不会抛出异常，而是返回布尔值（仅 address payable 可以使用）
// - call(...): 调用其他合约中的函数
// - delegatecall(...): 与 call 类似，但使用当前合约的上下文来调用其他合约中的函数，修改的是当前合约的数据存储

// transfer 和 send 应该使用哪一个
// 在转账时，应该选择使用 transfer 还是 send 呢？一般而言，建议一律选择 transfer。因为 transfer 是对 send 的改进，其目的是
// 在转账失败时立即终止交易。相比之下，使用 send 时需要检查返回值以确认转账是否成功，再进行后续处理。如果忽略了这个检查，可能会导致
// 合约收到攻击的风险。
// 然而，根据最新的分析（截至2023年1月），这两个函数都被认为存在安全性问题，因此不建议继续使用。更为安全的方法是使用 call 函数进行转账

// 函数 delegatecall() 与 call() 类似，但使用当前合约的上下文来调用其他合约中的函数
// 函数 staticcall() 也类似于 call()，但不允许改变状态变量的操作