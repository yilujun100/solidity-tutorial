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


// 静态字节数组
// 静态字节数组（fixed-size byte arrays）是 Solidity 中独有的一种数据类型。与其字面意义相符，它们具有固定长度的字节数组。基于静态字节数组，
// 你可以构建更为紧凑、节省存储空间的数据类型。
// Solidity 共有32种静态字节数组：bytes1、bytes2、bytes3，依此类推，直至 bytes32。更好地理解这一概念是将这 32 种静态字节数组视为 32 种
// 不同的值类型，而非通常意义上的数组。这 32 种静态字节数组类似于大小各异的乐高积木，通过将它们嵌入到“结构体”中并进行排列组合，我们可以构建出新的
// 数据类型。

// 静态字节数组是值类型
// 静态字节数组属于值类型（value type），而不是引用类型。这意味着它的变量存储的是值，而不是数据的地址。由于这种设计，当我们需要访问静态字节数组
// 的数据时，无需先获取地址再获取数据。对于尺寸较小的数据来说，将其存储在静态字节数组中会更加高效，更节省存储空间。

// 运算符
// 比较运算符
// 通过比较运算符，我们能够比较两个变量的数量大小关系，以及它们是否相等。比较运算符的结果是布尔值。
// 位运算符
// 位运算符用于对二进制位进行操作，其结果是静态字节数组

// 下标访问
// 你可以像 JavaScript 一样使用 [] 运算符来通过下标访问静态字节数组的某个元素。然而，需要注意避免越界访问。


// 字面值
// 字面值（literal）是指在程序中无需变量保存，直接表示为具体数字或字符串值的方式。Solidity 支持多种字面值类型，包括：
// - 地址字面值
// - 有理数和整数字面值
// - 字符串字面值
// - Unicode 字面值

// 地址字面值是一个长度为 42 字节的十六进制字符串，可以直接赋值给地址类型
// 有理数和整数字面值有多种表示方式，包括十进制整数、十进制小数、十六进制整数以及科学记数法。Solidity 不支持 8 进制字面值
// 在 Solidity 中，可以在整数字面值中使用下划线_来增强可读性。例如，1_000_000 表示 100 万
// 字符串字面值是由双引号 " 或单引号 ' 括起来的字符串。可以使用转义字符 \ 来表示一些特殊字符
// Unicode 字面值是由反斜杠 \ 和四位十六进制数拼成的。例如，\u0041 表示大写字母 A


// 枚举类型
// 枚举类型是一种整理相关变量的方法
// Solidity 的枚举类型类似于 C 语言，都是一种特殊的整型
// 使用枚举类型可以提高代码的类型安全性和可读性
// 可以通过点操作符来获取枚举类型的特定枚举值


// 自定义值类型
// 自定义值类型（User Defined Value Types）是用户定义的一种”值类型“。与之类似的另一种自定义类型是结构体，不过结构体是引用类型。
// ”自定义值类型“类似于别名，但并不等同于别名。别名与原类型完全相同，只是名称不同。然而，”自定义值类型“则不具备原始类型的操作符（如 +、-、*、/ 等），
// 其主要价值在于提高类型安全性和代码可读性。
// 自定义值类型的定义通过 type C is V 可以定义新的”自定义值类型“，其中 C 是新定义的类型，V 必须是 Solidity 的原生类型。

// 定义 User-Defined Value Type
// type Weight is uint128;
// type Price is uint128;
// 原生类型指的是 Solidity 本身定义的，比如：int, uint, bytes32 等等。不能是由原生类型衍生出来的类型。

// 自定义值类型有什么好处
// 提高类型安全性
// 提高代码可读性

// 类型转换
// 自定义值类型和原生类型之间没有隐式类型转换，我们可以通过显式调用下面两个转换函数来实现：
// C.wrap: 将原生类型转换成自定义值类型
// C.unwrap: 将自定义值类型转换成原生类型

// 自定义值类型不继承操作符
// 请注意，”自定义值类型“不会继承原生类型的操作符，包括 + - * / 等。


/* 数组 */
// 数组的声明
// 数组是一种数据结构，用于存储同类型元素的有序集合。根据数组长度是否可以改变，可以将数组分为以下两种类型：
// - 静态数组（Static Array）
// - 动态数组（Dynamic Array）

// 静态数组的声明
// 假设 T 是一种类型，那么静态数组的声明格式如下：
// T[arrSize] DataLocation arrName;
// 其中，arrSize 表示数组的长度，DataLocation 表示数据位置，而 arrName 则是你为这个数组取的任意名字。
// 数组是一种引用类型。请注意：在声明和定义数组时，必须使用三个数据位置关键字之一：storage、memory、calldata。
// 在 Solidity 中，需要注意静态数组的大小必须在编译时确定。这意味着不能使用变量来指定数组的大小。
// uint size = 2;
// uint[size][size] memory array; // 非法，size 是变量，不能用来指定数组大小

// 动态数组的声明
// 假设 T 是一种类型，那么动态数组的声明格式如下：
// T[] DataLocation arrName;
// 其中 DataLocation 是数据位置，而 arrName 是你为这个数组起的任意名字。

// 数组的初始化
// 静态数组的初始化
// 零值初始化
// 若你只声明了静态数组但未手动进行初始化，那么数组中的所有元素都会被零值初始化。这意味着所有元素都会被赋予默认值。
// 零值初始化整型数组
// uint[3] memory nftArr; // 所有元素都是0
// 数组字面值初始化
// 你可以使用数组字面值对静态数组进行初始化。数组字面值的格式是[...]，例如 [1, 2, 3] 或 ['str1', 'str2', 'str3']。
// 需要注意的是，数组字面值的基础类型是由其第一个元素的类型确定的。例如，[uint(1000), 1001, 1002] 的基础类型是 uint,
// 因为第一个元素是 uint(1000)。其他所有元素都会隐式被转换成第一个元素的类型。
// 如果我们不强制将第一个元素转换成与我们所定义的数组的基础类型相同，那么编译器会报错。
// 另外需要注意的一点是，定义的数组长度必须与数组字面值的长度相匹配，否则会导致编译错误。

// 动态数组初始化
// 动态数组的初始化需要使用关键字 new。它的所有元素值会被「零值初始化」，即赋予默认值。
// uint n = 3;
// uint[] memory nftArr = new uint[](n);
// 使用 new 关键字可以在任何数据位置创建动态数组。如果你的动态数组是在 storage 中声明的，你也可以使用数组字面值来初始化：
// uint[] storageArr = [uint(1), 2]; // 动态数组只有在storage位置才能用数组字面值初始化

// 静态数组和动态数组是不同的类型
// 需要注意的是，静态数组和动态数组是不同的类型，因此它们之间不能相互赋值。例如：
// 不能把静态数组赋值给动态数组：
// uint[2] memory staticArr = [uint(1), 2];
// uint[] memory dynamicArr = staticArr;
// 也不能把动态数组赋值给静态数组：
// uint[] memory dynamicArr = new uint[](2);
// uint[2] memory staticArr = dynamicArr;

// 下标访问
// 与许多其他编程语言一样，你也可以使用下标访问 Solidity 中的数组。下标访问所使用的操作符是 []，并且下标索引从 0 开始。


/* 数组切片 */
// 数组切片（Array Slice）是建立在数组基础上的一种视图（view）。其语法形式为 arr[start:end]。这个视图包含的是从索引 start
// 到索引 end-1 的元素。与数组不同的是，切片是没有具体类型的，也不会占据存储空间。它是一种方便我们处理数据的抽象方式。
// 多种数组切片表示方式
// 底层数组 arr 包含了五个元素 [0, 1, 2, 3, 4]。arr[1:4] 表示该视图包含了从索引 1 到索引 3 的元素。
// start 和 end 可以被省略。如果省略了 start，则视图将包含从索引 0 到索引 end-1 的元素
// 如果省略了 end，则视图将包含从索引 start 到数组末尾的元素
// 如果 start 和 end 都省略了，那么会包含 arr 所有元素
// 数组切片只能作用于 calldata
// 目前只能对 calldata 使用数组切片。memory 和 storage 都不可以使用。在 Solidity 中，仅能对 calldata 进行数组切片操作。
// 若尝试在 memory 或 storage 中使用，编译将会报错。由于 calldata 数据不可更改，因此无法对数组切片的值进行修改。


/* 成员变量 */
// 数组，无论是静态还是动态，都具有一个成员变量：length。这个成员变量记录了数组的长度。我们可以通过点操作符(.)来访问这个值。
// 动态数组成员函数
// 只有当动态数组位于存储（storage）位置时，它才具备成员函数。与此相对，静态数组以及位于 calldata 或 memory 中的动态数组
// 不具备任何成员函数。这些成员函数可以改变数组的长度，具体包括：
// - push(): 在数组末尾增加一个元素，并赋予零值，使得数组长度增加一
// - push(x): 将元素 x 添加到数组末尾，同样使数组长度增加一
// - pop(): 从数组末尾移除一个元素，导致数组长度减少一
// 注意 只有当动态数组的数据位置为存储（storage）时，才可以使用成员函数 push(), push(x), 和 pop()。这三个函数都会影响数组的长度。


/* 多维数组 */
// 多维数组的声明
// 多维数组也是同类型元素的集合。只不过它在这个基础上再分组而已。例如，我们可以创建一个二维数组，如下所示：
// uint[3][3] memory arr;
// 多维数组也有静态和动态之分：
// - 静态多维数组（static multi-dimensional array）
// - 动态多维数组（dynamic multi-dimensional array）

// 静态多维数组的声明
// 假设 T 是一种类型，那么静态多维数组的声明格式如下：
// T[col][row] DataLocation arrName;
// 在 Solidity 中，定义多维数组时，DataLocation 表示数据的位置，而 arrName 是你为这个数组起的任意名称。此外，row 和 col 分别定义了
// 多维数组的行数和列数。例如，uint[3][5] 声明了一个具有 5 行 3 列的多维数组。如果你熟悉其他编程语言，你会发现 Solidity 在声明多维数组
// 时的格式与其他语言恰好相反。例如，在 C 语言和 JavaScript 中，声明一个 5 行 3 列的多维数组的格式应该是 uint[5][3]。这一点需要特别注意，
// 尤其是在遍历多维数组时，很容易将行列搞反。
// 在 Solidity 中，多维数组的声明需要从右往左解读。例如，uint[2][3][4] 包含了 4 个 uint[2][3] 静态数组。进一步分解，每个 uint[2][3]
// 代表包含了 3 uint[2] 的静态数组，以此类推。

// 动态多维数组的声明
// 假设 T 是一种类型，那么动态多维数组的声明格式如下：
// T[][] DataLocation arrName;
// 在声明动态多维数组时，DataLocation 指定数据的存储位置，而 arrName 是你为这个数组指定的任意名称。尽管动态多维数组没有预设的行和列，
// 其行为与静态多维数组相似。这意味着在声明时，其行和列的顺序与其他编程语言相反，因此我们需要从右往左阅读动态多维数组的声明。

// 多维数组的初始化
// 静态多维数组的初始化
// 静态多维数组的初始化和静态一维数组的初始化差不多
// 零值初始化
// 当你声明一个静态多维数组而不进行手动初始化时，所有元素将会自动进行零值初始化。这意味着，每个元素都将被赋予其类型的默认值。这种自动初始化
// 确保数组中的每个元素都处于一个预定义的初始状态，避免了未初始化数据可能导致的不确定行为。
// uint[2][3] memory arr; // 所有元素都是0
// 多维数组字面值初始化
// uint[3][2] memory arr = [[uint(1), 2, 3], [uint(4), 5, 6]]; // 必须使用uint(1)和uint(4)显式地将「数组字面值」第一个元素的类型转换成uint
// 正如一维数组一样，多维数组字面值的“基础类型”（base type）由其第一个元素的类型决定。因此，为确保类型一致性，我们需要对第一个元素进行类型转换，
// 例如使用 uint(1) 和 uint(4)。
// 如果未强制将第一个元素转换成与所定义数组的基础类型相同（在上面的示例中为 uint），则编译器会报错。
// 另外一个重要的注意点是定义的「多维数组」的维度必须与「多维数组字面值」的维度完全一致，否则编译过程中会报错。
// 动态多维数组初始化
// 初始化动态多维数组需要使用 new 关键字，且所有元素会进行「零值初始化」，即所有元素都会被赋予默认值。
// 请记住，静态数组的长度是固定的，因此它不支持 push 或 pop 函数。假设你定义了一个数组 uint[][3] storageArr，它包含 3 个 uint[] 动态数组。
// 这里的 3 是固定的，所以你不能对 storageArr 执行 storageArr.push(new uint[])。
// 尽管 storageArr 是一个静态数组，其长度不可变，但是因为 storageArr[0] 是一个 uint[] 动态数组，你可以对其使用 push 方法。这意味着你可以
// 在动态数组中添加元素。
// 如果动态多维数组定义在 storage 中，你也可以使用字面值进行初始化。这种方式简化了数组的设置过程，特别是当你需要一开始就给数组赋予具体的值时。
// 下标访问
// 多维数组的下标访问与一维数组相似，使用的操作符也是 []，并且下标索引从 0 开始。这意味着你可以通过连续使用方括号来访问多维数组的各个层级。