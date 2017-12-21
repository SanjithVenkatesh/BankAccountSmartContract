pragma solidity ^0.4.0;

contract bankAccount {
    struct user {
        address person;
        uint numOfTransactions;
    }

    address public owner;
    user[] public users;
    uint numOfUsers = 0;
    uint public balance;
    uint public maxTransfers = 20;
    uint public lastTime;


    function bankAccount() {
        owner = msg.sender;
        lastTime = block.timestamp;
        balance = 0;
        users.length = 100;
    }

    function checkBalance() public returns (uint) {
        return balance;
    }

    function addUser(address newUser) {
        if (numOfUsers == users.length + 1) {
            user[users.length * 2] newUsers;
            for (int i = 0; i < users.length; i++) {
                newUsers[i] = users[i];
            }
            newUsers[users.length] = newUser;
        } else {
            numOfUsers += 1;
            users[numOfUsers] = newUser;
        }
    }

    function depositMoney(uint toDeposit) {
        if (inArray() == true) {
            updateTime(msg.sender);
            if (user[msg.sender].numOfTransactions == 20) {
                break;
            } else {
                user[msg.sender].numOfTransactions += 1;
                balance += toDeposit;
            }
            return;
        }
        if (msg.sender == owner) {
            balance += deposit;
        }
    }

    function withdraw(uint toWithdarw) {
        if (inArray() == true) {
            updateTime(msg.sender);
            if (user[msg.sender].numOfTransactions == 20) {
                return;
            } else {
                user[msg.sender].numOfTransactions += 1;
                balance -= toWithdraw;
            }
        }
        if (msg.sender == owner) {
            balance -= toWithdraw;
        }
    }

    function transfer(bankAccount otherBank, uint amount) {
        if (inArray() == true) {
            updateTime(msg.sender);
            if (user[msg.sender].numOfTransactions == 20) {
                return;
            } else {
                user[msg.sender].numOfTransactions += 1;
                balance -= amount;
                otherBank.balance += amount;
            }
        }
    }

    function updateTime(address updater) {
        if (block.timestamp - lastTime > 86400) {
            users[updater].numOfTransactions = 0;
        } 
        lastTime = now;
    }

    function inArray() { 
        bool inArray = false;
        for (int i = 0; i < users.length; i++) {
            if (users[i] = msg.sender) {
                inArray = true;
            }
        }
        return inArray;
    }





} 