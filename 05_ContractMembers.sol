// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ContractMembers {
    // 在 Solidity 中，合约类似于其他编程语言中的类（class），它拥有自己的成员属性和成员函数。例如，一个去中心化交易所可以被实现为一个合约，
    // 借贷平台的功能也可以通过合约来实现。你可以使用 contract 关键字来定义一个新的合约：
    /* contract myContractName {
        // members
    } */
    // 合约组成结构
    // 在 Solidity 中，合约由多个组成部分构成，每个部分承担不同的角色和功能，类似于将多种积木以不同的方式组合起来构建复杂的结构。以下是各个
    // 组成成员的具体作用：
    // 构造函数：用于初始化合约的状态，只在合约创建时执行一次。
    // 函数：包含一组逻辑代码块，负责执行合约的主要功能，可以被外部或内部其他函数调用。
    // 修饰器：用于修改或限制函数的行为，增强函数的复用性和安全性。
    // fallback 函数：当调用合约的函数不存在时执行的特殊函数，用于处理意外的函数调用或额外的数据。
    // receive 函数：专门用来接收以太币（Ether）转账的特殊函数，当合约被发送以太币且未调用任何函数时触发。
    // 结构体：自定义的数据类型，用于组织和存储多个不同类型的数据项。
    // 枚举类型：定义有限个数值的集合，用于提高代码的可读性和增强类型安全。
    // 事件：用于记录合约中发生的特定操作，类似于日志功能，便于外部监听和响应合约的活动。
    // 自定义值类型：允许用户定义新的值类型，可以基于现有的 Solidity 类型，增强代码的清晰度和效率。
    // Error：定义可能在函数执行中抛出的错误，这些错误可以被捕获和处理，增强合约的安全性和稳定性。
    // using 语句：使当前合约能够使用指定库中定义的函数或类型，无需显式调用，简化代码并增强功能。
    // 通过合理利用这些组件，开发者可以构建功能强大且灵活的智能合约，满足各种去中心化应用的需求。


    /* Solidity constant */
    // 在 Solidity 中，constant 关键字用于定义常量，即那些在编译时就确定且之后无法更改的变量。使用 constant 关键字可以确保一旦值被设定，
    // 就无法被意外或恶意修改，从而提高智能合约的安全性。
    // 例如，假设你正在编写一个借贷合约，其中规定了必须维持三倍的抵押率，且这一比率预期在合约的整个生命周期内都不会变化。在这种情况下，你可以
    // 将抵押率定义为一个 constant 变量，如下所示：
    // uint constant ratio = 3;
    // constant 的值必须能在编译期间确定
    // 在 Solidity 中，使用 constant 关键字定义的变量必须在编译时就能确定其值。如果一个 constant 变量的值不能在编译期被确定，编译器将会
    // 抛出错误。因此，你不能使用运行时才能确定的普通变量来为 constant 变量赋值。这确保了 constant 变量的值是固定不变的，从而提高合约的
    // 可预测性和安全性。
    // 简而言之，constant 的值必须在代码编写时就明确指定，并且在合约的整个生命周期内都不会改变。这种特性使得 constant 变量成为定义不变参数
    // 和合约设置的理想选择。
    /* uint a  = 3;
    uint constant ratio = a; // 不合法，不能用普通变量给 constant 赋值
    uint constant b; // 不合法，必须在声明时就赋值 */
    // constant 不能更改
    // constant 必须在声明的时候赋值（初始化），不能在其他地方为其赋值。
    // constant 不能更改
    /* uint constant ratio = 3;

    constructor() {
        ratio = 0; // 不合法
    }

    function f() public {
        ratio = 0; // 不合法
    } */


    /* Solidity immutable */
    // 在 Solidity 中，immutable 和 constant 关键字都用于定义变量的值只能设置一次，不过 immutable 相比 constant 提供了更灵活的初始化选项。
    // 在前面讨论的“constant”部分，constant 变量必须在声明时就完成初始化，并且之后不能再进行修改。而 immutable 变量则提供了更宽松的约束，允许
    // 变量在声明时初始化，或者在合约的构造函数中进行初始化。
    // 具体来说，使用 immutable 关键字的变量有以下初始化选项：
    // 1.在变量声明时进行初始化。
    // 2.在合约的构造函数中进行初始化。
    // 这意味着，如果你选择在声明时不初始化一个 immutable 变量，你还可以在合约的构造函数中为其赋值一次。这种灵活性使得 immutable 变量非常适合用于
    // 那些值在部署时才能确定，但之后不再改变的场景。
    // 因此，immutable 和 constant 的主要区别在于初始化的时机和灵活性。constant 适用于那些在编写智能合约代码时就已知且永不改变的值，而 immutable 
    // 更适合那些需要在部署合约时根据具体情况确定一次的值。这使得 immutable 在实际应用中提供了更多的便利和效率。
    // immutable 变量声明
    // 我们可以在声明的时候对 immutable 变量初始化，或者在构建函数初始化。
    // 声明时初始化
    // uint immutable n = 5;
    // 在构建函数初始化
    /* uint immutable n;
    constructor() {
        n = 5;
    } */
    // 注意不能初始化两次：
    /* uint immutable n = 0;
    constructor() {
        n = 5; // 不合法，已经在声明时初始化过了
    } */
    // 注意不能在函数中初始化
    // 不能在函数初始化 immutable 变量
    /* uint immutable n;
    function f() public {
        n = 5; // 不合法，不能在函数初始化 immutable 变量
    } */
    // immutable 变量不能更改
    /* uint immutable n = 0;
    function f() public {
        n = 5; // 不合法，immutable 变量不能更改
    } */


    /* Solidity 函数 */
    // 在 Solidity 中，函数是智能合约的核心组件之一，包含一组执行特定操作或行为的逻辑代码块。它们定义了合约可以执行的各种功能，是构建合约的基础。
    // 例如，一个借贷合约可能会包含多个函数来处理不同的金融操作，如提供资金（supply），借出资金（borrow），和还款（repay）等。每个函数都封装了
    // 实现这些操作所需的逻辑，允许合约用户在区块链上执行复杂的交互。
    // 函数声明
    // 我们先来看一个简单函数声明的例子：两数之和
    // 实现了一个 add 函数，对两个数相加求和
    /* function add(uint lhs, uint rhs) public pure returns(uint) {
        return lhs + rhs;
    } */
    
    // 在 Solidity 中，函数的声明需要遵循一定的语法规则，以确保函数的正确定义和预期行为。以下是一个函数声明的详细解析：
    // function: 函数声明以关键字 function 开始
    // add: 这是函数的名称，用于标识这个特定的函数
    // (uint lhs, uint rhs): 这是函数的输入参数列表，包含两个参数: lhs 和 rhs，它们都是无符号整型（uint）
    // public: 这是函数的可见性修饰符。public 表示该函数可以被合约内部的其他函数以及外部调用
    // pure: 这是函数的状态可变性修饰符。pure 表示该函数不会读取或修改合约的状态
    // returns(uint): 这定义了函数的返回类型，本例中为一个无符号整型（uint）
    // { return lhs + rhs; }: 这是函数的主体部分，包含实际要执行的逻辑。在此例中，函数逻辑是返回两个参数 lhs 和 rhs 的和
    // 此函数的主要作用是接收两个无符号整型参数 lhs 和 rhs，并返回它们的和。由于这个函数被标记为 public 和 pure，它可以被外部调用，同时保证不会
    // 更改或依赖于合约的状态，确保了其执行的纯净性和安全性。
    
    // 函数声明语法
    // 函数声明应该包含的内容：
    // - function: 所有函数声明必须以关键字 function 开始，标识这是一个函数。
    // - myFuncName: 函数的名称，用于在合约中唯一标识这个函数。
    // - (parameter-list): 函数的输入参数列表，列出所有参数及其类型。这部分是可选的，取决于函数是否需要输入参数。
    // - visibility: 函数的可见性修饰符，决定了函数的访问范围。可选的值包括 internal（仅限合约内部和继承的合约）、external（仅限外部调用）、private（仅限当前合约）、public（无限制访问）。
    // - state mutability: 函数的状态可变性，表明函数是否会修改或读取合约的状态。选项包括 pure（不读取也不修改状态）、view（只读状态不修改）、payable（可以接收以太币）。这是可选的。
    // - modifiers: 函数修饰器，用于增加额外的行为或验证逻辑。这是可选的。
    // - returns(return-list): 指定函数返回值的类型，适用于函数需要返回数据时。可以声明多个返回值。这部分也是可选的。
    // - { // statements }: 函数的主体，包含实际执行的代码块。
    
    // 函数声明示例
    // 仅指定 visibility
    // function f1() public {}
    // 指定 visibility 和 state-mutability
    // function f2() public pure {}
    // 指定 visibility 和 state-mutability
    // function f3() public view {}
    // 指定 visibility 和 state-mutability，函数有一个入参
    // function f4(uint a) public pure {}
    // 指定 visibility 和 state-mutability，函数有一个入参和一个返回值
    // function f5(uint a) public pure returns(uint) {}
    // 指定 visibility 和 state-mutability，函数有多个入参和多个返回值
    // function f6(uint a, uint b, uint c) public pure returns(uint, uint, uint) {}
    // 指定 visibility 和 modifier
    // function f7(uint a) external onlyOwner {} // onlyOwner 修饰器需要事先定义
    
    // 参数列表
    // 你可以为函数提供零或多个参数。多个参数可以使用逗号进行分割。如下所示：
    // 提供 0 个参数
    // function foo() public {};
    // 提供 1 个参数
    // function foo(uint a) public {}; 
    // 提供多个参数
    // function foo(uint a, uint b, uint c) public {};

    // 返回值列表
    // 你可以为函数提供零或多个返回值。多个返回值可以使用逗号进行分割。如下所示：
    // 提供 0 个返回值
    // function foo() public {};
    // 提供 1 个返回值
    // function foo() public returns(uint) {};
    // 提供多个返回值
    // function foo() public returns(uint, uint, uint) {};

    // 函数可见性
    // 在 Solidity 中，函数的可见性（visibility） 是一个关键的属性，它定义了其他合约和账户能否访问当前合约的函数。
    // Solidity 函数有四种可见性可以选择： public , private , internal , external。

    // 函数状态可变性
    // 在 Solidity 中，函数状态可变性指的是函数是否有能力修改合约的状态。默认情况下，函数被认为是可以修改合约状态的，即它们可以写入或更改合约中存储的数据。在某些情况下，
    // 如果你希望明确地限制函数不改变合约状态，提高合约的安全性和可读性，你可以使用状态可变性修饰符来实现这一点。Solidity 有三种函数状态可变性可以选择：view , pure , payable。

    // 函数修饰器
    // 修饰器在 Solidity 中扮演着重要的角色，它们用于修改或增强函数的行为。通过在函数执行前进行预处理和验证操作，修饰器可以确保函数在合适的条件下执行。
    // 例如，修饰器可用于验证函数的输入参数是否符合预定规范，或确认调用者是否拥有执行特定操作的权限。
    // 使用修饰器的主要优势包括提高代码的复用性和增强代码的可读性。将常用的逻辑封装在修饰器中可以避免在多个函数中重复相同的代码，使得合约结构更加清晰，同时也便于维护和更新。


    /* Solidity 构建函数 */
    // 在 Solidity 中，构造函数是一种特殊的函数，它主要用于在合约部署时初始化合约状态。初始化指的是为变量分配存储空间并设定初始值。构造函数提供了一种方法，使得变量的初始值
    // 可以通过参数化的方式设定，这带来了极大的灵活性和便利。
    // 这样的设计允许开发者编写一次合约代码，但可以多次部署，每次部署时都可以指定不同的初始值。这种功能特别有用，因为它允许同一个合约逻辑被复用于不同的情景，而无需为每种情况重写代码。
    // 例如，你可以部署同一个借贷合约多次，每次都设定不同的利率或其他参数，以适应不同的市场条件或业务需求。

    // 最简单的初始化方式
    // 在定义状态变量的时候直接为其设定默认值。这就是最简单的初始化状态变量的方法。如下面所示，将状态变量 a 初始化为 1：
    /* contract ExampleContract {
        uint a = 1; // 将 a 初始化为 1
    } */

    // 使用构造函数初始化
    // 在 Solidity 中使用硬编码的初始值来初始化状态变量可能有效，但这种方法在需要部署具有不同初始值的多个合约版本时，会显示出其局限性。如上所述，如果需要改变变量 a 的初始值从 1 变为 2，
    // 直接修改合约代码中的 uint a = 1; 为 uint a = 2; 不仅容易出错，而且在合约中如果存在多个相互依赖的状态变量时，这种方法的复杂性会迅速增加。
    // 为了解决这个问题，构造函数提供了一种优雅的解决方案，它允许在部署合约时动态地初始化状态变量。构造函数可以将初始化的复杂性封装起来，使得部署新合约变得更加简单和可控。
    // 下面是如何使用构造函数来初始化状态变量的示例：
    // 构建函数初始化合约状态
    /* contract ExampleContract {
        uint a; // 状态变量声明，但是还没初始化

        constructor(uint aVal) {
            a = aVal; // 将 a 的值初始化为 aVal
        }
    } */
    // 定义了上面的合约后，我们就可以使用 new 关键字来新建一个 a 的初始值为 2 的合约：
    // ExampleContract c = new ExampleContract(2);


    /* Solidity 修饰器 */
    // 在 Solidity 中，修饰器（modifier）是一种特殊的声明，它用于修改智能合约函数的行为。通过在函数执行前添加预处理和验证逻辑，修饰器可以确保函数在特定条件下运行，例如验证函数的输入参数是否符合预设标准，
    // 或确认调用者是否具备特定权限。使用修饰器不仅能增强代码的复用性，还能提升其可读性。
    // 举个例子，考虑以下情况：在一个合约中，几个函数（如 mint、changeOwner、pause）需要确保只有合约的所有者（owner）才能调用它们。通常，我们需要在每个这样的函数前用 require(msg.sender == owner, "Caller is not the owner"); 
    // 来检查调用者的身份。这种逻辑在多个函数中重复出现，不仅冗余，而且每次更改时都需要手动更新每个函数。
    // 用 require 来进行权限检查
    /* contract ExampleContract {
        address private owner;

        constructor() {
            owner = msg.sender;
        }

        function mint() external {
            require(msg.sender == owner, "Only the owner can call this function.");
            // Function code goes here
        }

        function changeOwner() external {
            require(msg.sender == owner, "Only the owner can call this function.");
            // Function code goes here
        }

        function pause() external {
            require(msg.sender == owner, "Only the owner can call this function.");
            // Function code goes here
        }
    } */
    // 在这种情况下，我们可以把权限检查的代码抽出来，变成一个修饰器。如果有函数需要权限检查时就可以添加这个修饰器去修饰函数行为。如下面所示：
    // 用修饰器来进行权限检查
    /* contract ExampleContract {
        address private owner;

        constructor() {
            owner = msg.sender;
        }

        // 将权限检查抽取出来成为一个修饰器
        modifier onlyOwner() {
            require(msg.sender == owner, "Only the owner can call this function.");
            _;
        }

        // 添加 onlyOwner 修饰器来对调用者进行限制
        function mint() external onlyOwner {
            // Function code goes here
        }

        function changeOwner() external onlyOwner {
            // Function code goes here
        }

        function pause() external onlyOwner {
            // Function code goes here
        }
    } */
    // 像上面所展示的一样，有了修饰器，你就不需要写重复的代码了。提高了代码复用，降低了出现 bug 的可能性。
    
    // 修饰器的语法
    /* modifier modierName {
        // modifier body 1
        _;
        // modifier body 2
    } */
    // 在 Solidity 中，修饰器的定义和使用都是非常直观的，它们提供了一种强大的方式来封装代码，以便在函数执行前或后进行检查或执行某些操作。
    // 定义修饰器时，一个关键元素是使用 _ 占位符，这个占位符指示函数主体应该在何处执行。
    // 以下是修饰器的基本语法和执行顺序的例子：
    // 1.执行修饰器的前置代码（modifier body 1）。
    // 2._ 占位符处执行原函数的主体。
    // 3.执行修饰器的后置代码（modifier body 2，如果有的话）。
    // 定义修饰器之后，你可以将其应用于任何函数。修饰器紧跟在函数的参数列表后面。这里是一个示例，展示了如何定义和使用修饰器：
    // 添加单个修饰器
    /* function foo() public modifier1 {
        // function body
    } */
    // 添加多个修饰器，它们的执行顺序是从左到右的
    /* function foo() public modifier1, modifier2, modifier3 {
        // function body
    } */


    /* Solidity 可见性 */
    // 为了增强合约的安全性，Solidity 提供了一套机制来限制合约中变量和函数的访问范围。这被称为“可见性（visibility）”，指的是其他合约是否可以访问当前合约中的变量或函数。
    // 通过明确指定哪些合约可以访问特定的成员，开发者能够有效地控制合约的交互界面和隐私级别。通过合理应用这些修饰符，开发者可以精确控制合约成员的交互界限，从而提高合约的模块化和安全性。
    // 例如，敏感操作或关键数据可以设置为 private，而只需要外部接口的函数可以声明为 external，以优化交互效率和 gas 消耗。
    // Solidity 支持四种可见性修饰符：
    // - internal
    // - external
    // - private
    // - public
    // 在 Solidity 中，正确设置变量和函数的可见性修饰符是保证智能合约安全性和功能正确性的关键。以下是变量和函数可用的可见性修饰符及其具体含义：
    // 变量的可见性修饰符
    // - public: 变量可以被当前合约内部以及外部访问。对于 public 变量，Solidity 自动创建一个访问器函数，允许外部合约也可以读取这些变量。
    // - private: 变量只能被定义它的合约内部访问。即使是派生合约也无法访问 private 变量。
    // - internal: 变量可以被当前合约以及所有派生自该合约的“子合约”访问，但不能被外部合约直接访问。
    // 函数的可见性修饰符
    // - public: 函数可以在当前合约内部和外部被访问。这是函数默认的可见性级别，如果没有指定其他修饰符。
    // - external: 函数只能从合约外部被调用。这种修饰符通常用于那些不需要在合约内部调用的函数，可优化 gas 消耗。
    // - private: 函数仅限于在定义它的那个合约内部被调用，不可在任何外部合约或派生合约中访问。
    // - internal: 函数可以在定义它的合约内部以及所有派生自该合约的子合约中被调用，但不能从外部合约调用。

    // 合约分类
    // 在深入讨论可见性之前，我们需要了解如何根据合约之间的关系对它们进行分类。这是因为可见性直接影响不同类型的合约如何访问“当前合约”的数据和函数。基于可见性对不同合约访问权限的影响，
    // 合约通常可以被分为三个主要类别：
    // 1.主合约（当前合约内部）: 这是正在被我们讨论或编写的合约本身。在主合约内部，所有成员（变量和函数）通常都是可访问的，除非它们被标记为 private。
    // 2.子合约（继承自当前合约的合约）: 这些合约是从主合约派生出来的。子合约可以访问主合约中标记为 internal 或更宽松访问级别的成员，但不能访问 private 成员。
    // 3.第三方合约（外部合约）: 这类合约与当前合约没有继承关系。它们只能访问当前合约中标记为 public 或 external 的成员。
    // 简单来说，子合约是从主合约继承而来的，它们共享某些特性和行为。而第三方合约则与主合约及子合约没有任何继承关系，可以看作是完全独立的实体。如果将主合约和子合约比作一个家庭的成员，
    // 那么第三方合约就像是外面的陌生人。
    // 重要的是要理解，我们所讨论的访问限制都是从主合约（当前合约）的视角出发的。这意味着，当我们编写主合约时，使用的可见性修饰符决定了哪些外部实体（子合约或第三方合约）可以访问主合约中的哪些变量和函数。
    // 这样的设置帮助合约开发者确保数据安全，同时允许一定程度上的灵活性和扩展性。
    // 主合约
    // 主合约其实就是一个普通合约，内部定义了很多变量和函数。这些变量和函数可能有不同的可见性。主合约可以访问自己内部可见性为 private , internal , public 的任何变量和函数。
    // 子合约
    // 子合约继承了主合约。继承的语法是 Child is Parent 。子合约允许访问主合约中可见性为 internal ， public 的函数。
    // 第三方合约
    // 第三方合约是一个普通合约。可以通过主合约的地址来与主合约进行交互。第三方合约可以访问主合约中可见性为 external ， public 的函数。

    // 可见性对于合约访问的限制
    // public
    // 可见性为 public 的变量和函数可以被任何合约访问。也就是可以被 MainContract , ChildContract , ThirdPartyContract 访问。
    // external
    // 可见性为 external 的函数只能被第三方合约访问。也就是只能被 ThirdPartyContract 访问。注意变量是没有 external 修饰符的。
    // internal
    // 可见性为 internal 的变量和函数可以被主合约和子合约访问。也就是可以被 MainContract , ChildContract 访问。
    // private
    // 可见性为 private 的变量和函数只能被主合约访问。也就是只能被 MainContract 访问。


    /* Solidity 状态可变性 */
    // 合约函数在区块链上的主要作用通常涉及修改状态，如转账、更改状态变量或触发事件等。然而，并非所有函数都需要这种能力；某些函数可能仅仅提供辅助作用，例如进行计算或返回某些值，而不应该改变
    // 合约的状态。为了明确标示这些函数不应修改合约状态，你可以使用状态可变性修饰符（state mutability modifiers）。
    // 状态可变性修饰符有几种类型，包括 pure 和 view：
    // - pure 修饰符用于那些不会读取或修改合约状态的函数。例如，一个纯粹执行数学计算并返回结果的函数应被标记为 pure。
    // - view 修饰符适用于那些只读取但不修改状态的函数。这种类型的函数可能会返回合约中某个状态变量的值，但不会对其进行更改。
    // 正确使用这些修饰符不仅能提高合约的安全性和可读性，还有助于 Debug 过程，因为它们确保函数行为与开发者的意图一致。如果一个被标记为 pure 或 view 的函数尝试修改合约状态，Solidity 编译器将抛出错误，
    // 防止潜在的逻辑错误影响合约执行。这种机制强制开发者更加精确地规划函数的角色和行为，从而提高整个合约的稳健性和效率。
    // Solidity 提供了三个状态可变性修饰符：
    // - view: 这种类型的函数仅能查询合约的状态，而不能对状态进行任何形式的修改。简而言之，view 函数是只读的，它们可以安全地读取合约状态但不会造成任何状态改变。
    // - pure: pure 函数表示最严格的访问限制，它们不能查询也不能修改合约状态。这类函数只能执行一些基于其输入参数的计算并返回结果，而不依赖于合约中存储的数据。例如，一个计算两数相加的函数可以被标记为 pure。
    // - payable: payable 修饰符允许函数接收以太币（Ether）转账。在 Solidity 中，函数默认是不接受以太币转账的；如果你的函数需要接收转账，则必须明确指定为 payable。这是处理金融交易时必不可少的修饰符。

    // 怎样才算查询合约状态
    // 在 Solidity 中，查询合约状态涉及到多种操作，这些操作可以直接读取或者间接影响合约存储的数据。为了更好地理解和规范这些操作，以下是被明确定义为查询合约状态的五种行为：
    // 1.读取状态变量：直接访问合约中定义的任何状态变量。
    // 2.访问余额：使用 address(this).balance 或 <address>.balance 来获取合约或任何地址的当前以太币余额。
    // 3.访问区块链特性：通过 block，tx，msg 等全局变量的成员访问区块链的特定数据。例如，block.timestamp 获取区块的时间戳，msg.sender 获取消息发送者的地址。
    // 4.调用非 pure 函数：任何未明确标记为 pure 的函数调用。即便函数本身没有修改状态，但如果它没有被标记为 pure，调用它仍被视为状态查询。
    // 5.使用内联汇编：特别是那些包含某些操作码的内联汇编，这些操作码可能会读取或依赖于链上数据。

    // 怎样才算修改合约状态
    // 在 Solidity 中，明确哪些行为会修改合约状态是至关重要的，这有助于开发者理解合约的行为，并确保安全地进行合约操作。以下是被认定为修改了合约状态的八种主要行为：
    // 1.修改状态变量：直接改变存储在合约中的任何状态变量的值。
    // 2.触发事件：在合约中发出事件，这通常用于记录合约活动，尽管本身不改变任何存储的状态变量，但被视为状态改变，因为它改变了链上的日志。
    // 3.创建其他合约：通过合约代码创建新合约实例。
    // 4.使用 selfdestruct：销毁当前合约，并将剩余的以太币发送到指定地址。
    // 5.通过函数发送以太币：包括使用 transfer 或 send 方法发送以太币。
    // 6.调用非 view 或 pure 的函数：调用任何可能改变状态的函数，如果函数未明确标记为 view 或 pure，则默认可能修改状态。
    // 7.使用低级调用：如 call、delegatecall、staticcall 等。这些低级函数允许与其他合约交互，并可能导致状态变化。
    // 8.使用含有特定操作码的内联汇编：特定的汇编代码可能直接修改状态，例如直接写入存储或执行控制合约资金的操作。

    // view 函数
    // 如果你的函数承诺不会修改合约状态，那么你应该为它加上 view 修饰符。如下所示：
   /*  uint count;
    function GetCount() public view returns(uint) {
        return count;
    } */
    // 在 Solidity 中，view 函数是一种特殊的函数类型，其主要作用是读取合约的状态而不进行任何修改。如果在 view 函数体内尝试修改合约状态，Solidity 编译器将直接报错，因为这违反了 view 声明的约束。
    // 使用 view 函数有助于增强代码的安全性，确保函数的行为不会与预期产生副作用，只进行数据的读取操作。这种函数特别适合用于那些需要返回合约数据但不需要更改它的场景，比如获取当前的状态变量值或计算返回
    // 某些派生值而不影响合约状态的函数。

    // pure 函数
    // 纯函数（pure function）是函数式编程中的一个重要概念。在编程中，如果一个函数满足以下条件，则它可以被认为是纯函数：
    // 1.相同输入产生相同输出：对于相同的输入值，纯函数必须始终产生相同的输出。
    // 2.输出仅依赖输入：函数的输出只依赖于其输入参数，而与其他隐藏信息或状态无关，也不受 I/O 设备产生的外部输出影响。
    // 3.无副作用：函数不能有语义上可观察的副作用，比如触发事件、输出到设备、或更改输入参数以外的内容等。
    // 简单来说，纯函数不读不写状态变量，没有副作用。使用纯函数可以提高代码的安全性，避免出现与预期不符的副作用。
    // 如果你的函数承诺不需要查询，也不需要修改合约状态，那么你应该为它加上 pure 修饰符。如下所示：
    /* function add(uint lhs, uint rhs) public pure returns(uint) {
        return lhs + rhs;
    } */

    // payable 函数
    // 函数默认是不能接受 Ether 转账的。如果你的函数需要接受转账，那么你应该为它加上 payable 修饰符。如下所示：
    /* function deposit() external payable {
        // deposit to current contract
    } */


    /* Solidity receive 函数 */
    // receive 函数是 Solidity 中的一种特殊函数，主要用于接收以太币（Ether）的转账。此外，还有一个 fallback 函数也可以用来接收以太币转账
    // 需要注意的是，以太币转账与 ERC20 代币转账之间存在本质区别：
    // - 以太币转账：转账的是以太坊的原生代币（native token），即 Ether。
    // - ERC20 代币转账：转账的是非原生代币（non-native token），这些代币在合约内部实现类似于一个数据库，记录了每个持有者的代币数量。ERC20 代币转账通过调用普通的合约函数来实现。

    // Solidity receive 函数定义语法
    // receive 函数的定义格式是固定的，其可见性（visibility）必须为 external，状态可变性（state mutability）必须为 payable。同时要注意 receive 函数不需要 function 前缀
    /* receive() external payable {
        // 函数体
    } */

    // 合约没有定义 receive 和 fallback 函数时，不能对其转账
    // 如果一个合约既没有定义 receive 函数，也没有定义 fallback 函数，那么该合约将无法接收以太币转账。在这种情况下，所有试图向该合约进行的转账操作都会被 revert（回退）。
    // Callee 既没有定义 receive 函数，也没有定义 fallback 函数
    // contract Callee {}

    /* contract Caller {
        address payable callee;

        // 注意： 记得在部署的时候给 Caller 合约转账一些 Wei，比如 100
        constructor() payable {
            callee = payable(address(new Callee()));
        }

        // 失败，因为Callee既没有定义receive函数，也没有定义fallback函数
        function tryTransfer() external {
            callee.transfer(1);
        }

        function trySend() external {
            bool success = callee.send(1);
            require(success, "Failed to send Ether");
        }

        function tryCall() external {
            (bool success, bytes memory data) = callee.call{value: 1}("");
            require(success, "Failed to send Ether");
        }
    } */

    // 需要注意的是，我们提到的以太币转账指的是纯转账（msg.data 为空）。这种转账不会调用任何函数，只是将以太币转到目标地址。在 Solidity 中，有三种方法可以进行以太币转账：
    // - send(amount): 发送 amount 数量的以太币，固定使用 2300 gas，错误时不会 revert，只返回布尔值表示成功或失败。
    // - transfer(amount): 发送 amount 数量的以太币，固定使用 2300 gas，错误时会 revert。
    // - call{value: amount}(""): 发送 amount 数量的以太币，gas 可以自由设定，返回布尔值表示成功或失败。
    // 这三种方法都是将 amount 数量的以太币发送到目标地址。如果合约既没有定义 receive 函数，也没有定义 fallback 函数，那么进行纯转账的操作会失败并回退。但是，这种限制
    // 不影响带有 msg.data 的普通函数调用。例如，可以使用 call 来调用普通函数。

    // 注意 Gas 不足的问题
    // 在定义 receive 函数时，需要特别注意 Gas 不足的问题。前面我们提到，send 和 transfer 方法的 Gas 是固定为 2300 的。因此，这些方法剩余的 Gas 往往不足以执行复杂操作。
    // 如果 receive 函数体需要执行较复杂的操作，那么可能会抛出“Out of Gas”异常。
    // 以下操作通常会消耗超过 2300 Gas：
    // - 修改状态变量
    // - 创建合约
    // - 调用其他相对复杂的函数
    // - 发送以太币到其他账户
    // 例如，下面的 receive 函数由于消耗的 Gas 超过了 2300，因此它总是会被 revert：
    // 用send,transfer函数转账到该合约都会被 revert，原因是消耗的 Gas 超过了 2300
    /* contract Example {
        uint a;
        receive() external payable {
            a += 1;
        }
    } */


    /* Solidity fallback 函数 */
    // fallback 函数是 Solidity 中的一种特殊函数，用于在调用的函数不存在或未定义时充当兜底。顾名思义，fallback 在中文中有回退、兜底的意思。类似于没有带现金时可以使用银行卡付款。
    // 需要注意的是，这里所说的“匹配不到”、“不存在”、“没有定义”都指的是同一个意思。
    // fallback 函数可以在以下两种情况下兜底：
    // - receive 函数不存在（因为没有定义）
    // - 普通函数不存在（因为没有定义）
    // 简而言之：
    // - 当需要用到 receive 函数时，如果它没有被定义，就使用 fallback 函数兜底。
    // - 当调用的函数在合约中不存在或没有被定义时，也使用 fallback 函数兜底。

    // 兜底 receive 函数不存在的情况
    // receive 函数只能在合约接受纯转账（msg.data 为空）时被触发，例如通过以下方法进行转账：
    // - send(amount)：Gas 固定为 2300，错误时会 revert。
    // - transfer(amount)：Gas 固定为 2300，返回布尔值。
    // - call{value: amount}("")：Gas 可以随意设定，返回布尔值。
    // 当使用上述三种方法之一进行转账时，交易的 msg.data 为空。因此，理论上应该触发 receive 函数。如果合约没有定义 receive 函数，那么 fallback 函数将自动作为兜底函数被调用。
    // 如果 fallback 函数也没有定义，那么交易将失败并 revert。

    // 兜底普通函数不存在情况
    // 如果你调用了一个合约里面没有定义的函数，比如说 funcNotExist() 那么 fallback 函数就会自动被调用。
}

// 示例：receive 和 fallback 函数被调用场景
/* contract Callee {
    event FunctionCalled(string);

    function foo() external payable {
        emit FunctionCalled("this is foo");
    }

    receive() external payable {
        emit FunctionCalled("this is receive");
    }

    fallback() external payable {
        emit FunctionCalled("this is fallback");
    }
}

contract Caller {
    address payable callee;

    constructor() payable {
        callee = payable(address(new Callee()));
    }

    function transferReceive() external {
        callee.transfer(1);
    }

    function sendReceive() external {
        bool success = callee.send(1);
        require(success, "Failed to send Ether");
    }

    function callReceive() external {
        (bool success, bytes memory data) = callee.call{value: 1}("");
        require(success, "Failed to send Ether");
    }

    function callFoo() external {
        (bool success, bytes memory data) = callee.call{value: 1}(
            abi.encodeWithSignature("foo()")
        );
        require(success, "Failed to send Ether");
    }

    function callFallback() external {
        (bool success, bytes memory data) = callee.call{value: 1}(
            abi.encodeWithSignature("funcNotExist()")
        );
        require(success, "Failed to send Ether");
    }
} */