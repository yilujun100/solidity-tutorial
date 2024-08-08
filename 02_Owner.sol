// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

// Owner合约主要功能：
// 记录谁是合约的所有者。通过这个合约，你可以获取、更改或者移除所有者的信息
contract Owner {
    // 结构体
    struct Identity {
        address addr;
        string name;
    }

    // 枚举
    enum State {
        HasOwner,
        NoOwner
    }

    // 事件
    event OwnerSet(address indexed oldOwnerAddr, address indexed newOwnerAddr); // 当 owner 被设置成新 owner 时触发
    event OwnerRemoved(address indexed oldOwnerAddr); // 当 owner 被删除时触发

    // 函数修饰器
    modifier isOwner() {
        require(msg.sender == owner.addr, "Caller is not owner");
        _;
    }
    // 状态变量
    Identity private owner;
    State private state;
    
    // 下面的都是函数

    // 构造函数
    // 这是合约的构造函数，它在合约部署时自动执行。此函数将当前调用者设为 owner，并将合约的状态设置为 HasOwner
    constructor(string memory name) {
        owner.addr = msg.sender;
        owner.name = name;
        state = State.HasOwner;
        emit OwnerSet(address(0), owner.addr);
    }

    // 普通函数
    // 用于修改 owner
    function changeOwner(address addr, string calldata name) public isOwner {
        owner.addr = msg.sender;
        owner.name = name;
        emit OwnerSet(owner.addr, addr);
    }

    // 普通函数
    // 用于删除 owner
    function removeOwner() public isOwner {
        emit OwnerRemoved(owner.addr);
        delete owner;
        state = State.NoOwner;
    }

    // 普通函数
    // 返回 owner 的地址和名称
    function getOwner() external view returns (address, string memory) {
        return (owner.addr, owner.name);
    }
    
    // 普通函数
    // 返回合约的状态
    function getState() external view returns (State) {
        return state;
    }
}

// 合约的七大组成结构：
// 状态变量
// 函数
// 函数修饰器
// 事件
// Error
// 枚举
// 结构体

// 结构体
// 结构体是一种数据类型，它允许将多个字段组合成一个集合。这种结构体可以用于定义更复杂的数据类型，使得数据组织和处理更为高效和有序。

// 枚举
// 枚举是一种数据类型，用于定义一组固定的命名常量，将名称与整数值关联起来。使用枚举可以提高代码的可读性和可维护性，使得代码中的意图更加明确。

// 事件
// 事件在 Solidity 中是一种特殊的功能，用于记录合约执行过程中的关键活动。它们相当于 Solidity 的日志系统。这些事件一旦被触发，
// 就可以通过与合约连接的客户端进行访问和监听，从而使外部系统能够轻松跟踪合约的活动。

// 函数修饰器
// 函数修饰器可以被用来修饰函数的行为。

// 状态变量
// 状态变量是用于存储合约的持久状态的变量。这些变量被永久记录在区块链上，并且可以在合约执行过程中被读取或修改。
// 状态变量是合约存储和管理数据的关键组件，确保数据的持久性和可访问性。

// 函数
// 函数是定义在智能合约中的一组逻辑块，它们规定了合约能够执行的具体操作。这些函数可以接受参数，并根据这些参数计算并返回结果。
// 此外，函数可以被其他合约调用，使得合约之间可以互相交互和协作。

// 该合约主要操作包括：
//  - 在合约部署时，调用构造函数 constructor(string memory name) 来设置 owner
//  - 使用 changeOwner(address addr, string calldata name) 来修改 owner
//  - 通过 removeOwner() 来删除 owner
//  - 所有关键操作都通过函数修饰器 isOwner 进行保护，确保只有 owner 才能执行这些操作
//  - 合约还包含辅助函数，如 getOwner 和 getState，这些函数用于查询 owner 的信息和合约的状态
//  - 此外，合约定义了两个事件：OwnerSet 和 OwnerRemoved，它们分别在 owner 被设置或删除时触发。这些事件可以被外部系统监听，从而做出响应