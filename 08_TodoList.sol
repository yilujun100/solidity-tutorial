// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract TodoList {
    struct Todo {
        string name;
        bool isCompleted;
    }
    Todo[] public list;
    // 创建任务
    function create(string memory name) external {
        list.push(
            Todo({
                name: name,
                isCompleted: false
            })
        );
    }
    // 修改任务名称
    function modiName1(uint256 index, string memory name) external {
        // 方法1: 直接修改，修改一个属性的时候比较省 gas
        list[index].name = name;
    }
    function modiName2(uint256 index, string memory name) external {
        // 方法2: 先获取储存到 storage，再修改，在修改多个属性的时候比较省 gas
        Todo storage temp = list[index];
        temp.name = name;
    }
    // 修改完成状态1:手动指定完成或者未完成
    function modiStatus1(uint256 index, bool status) external {
        list[index].isCompleted = status;
    }
    // 修改完成状态2:自动切换 toggle
    function modiStatus2(uint256 index) external {
        list[index].isCompleted = !list[index].isCompleted;
    }
    // 获取任务1: memory: 2次拷贝
    function get1(uint256 index) external view returns (string memory name, bool status) {
        Todo memory temp = list[index];
        return (temp.name, temp.isCompleted);
    }
    // 获取任务2: storage: 1次拷贝
    function get2(uint256 index) external view returns (string memory name, bool status) {
        Todo storage temp = list[index];
        return (temp.name, temp.isCompleted);
    }
}