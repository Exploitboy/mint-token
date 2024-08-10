# MyToken Smart Contract

## Overview

`Alibaba` is a simple ERC-20 token smart contract written in Solidity. It supports essential features like token minting, burning, transferring, and allowances. This contract is designed to be a basic example of how ERC-20 functionality can be implemented.

- **Name:** Alibaba
- **Symbol:** ALB
- **Decimals:** 18

## Features

- **Minting:** Only the contract owner can mint new tokens.
- **Burning:** Token holders can burn (destroy) their own tokens.
- **Transfer:** Token holders can transfer tokens to other addresses.
- **Allowance:** Allows for delegated transfers through `approve` and `transferFrom`.

## Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name = "alibaba";
    string public symbol = "alb";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the contract owner");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        mint(owner, initialSupply);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        require(account != address(0), "we can't mint to the zero address");
        totalSupply += amount;
        balanceOf[account] += amount;
        emit Mint(account, amount);
        emit Transfer(address(0), account, amount);
    }

    function burn(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "you have insufficient balance");
        totalSupply -= amount;
        balanceOf[msg.sender] -= amount;
        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "you have insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(balanceOf[sender] >= amount, "you have insufficient balance");
        require(allowance[sender][msg.sender] >= amount, "your allowance exceeded");
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        allowance[sender][msg.sender] -= amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }
}


## Installation

1. **Prerequisites:**
   - Ensure you have [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed.
   - Install a smart contract development framework such as [Truffle](https://www.trufflesuite.com/truffle) or [Hardhat](https://hardhat.org/).

2. **Clone the repository:**

   ```bash
   git clone https://github.com/Exploitboy/mint-token.git
   cd mint-token
   ```

3. **Install dependencies:**

   ```bash
   npm install
   ```

## Usage

1. **Compile the contract:**

   Using Truffle:
   ```bash
   truffle compile
   ```

   Using Hardhat:
   ```bash
   npx hardhat compile
   ```

2. **Deploy the contract:**

   Using Truffle:
   ```bash
   truffle migrate
   ```

   Using Hardhat:
   ```bash
   npx hardhat run scripts/deploy.js
   ```

3. **Interact with the contract:**

   Use Truffle Console:
   ```bash
   truffle console
   ```

   Use Hardhat Console:
   ```bash
   npx hardhat console
   ```

   Example commands to interact with the contract:
   ```javascript
   // Truffle or Hardhat console
   let instance = await MyToken.deployed();
   ```

## Events

- **Transfer:** Emitted when tokens are transferred from one address to another.
- **Approval:** Emitted when an address is approved to spend tokens on behalf of another address.
- **Mint:** Emitted when new tokens are minted.
- **Burn:** Emitted when tokens are burned.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you would like to contribute to this project.

---

Feel free to modify the paths and details according to your actual repository setup and any additional instructions or information relevant to your project.
```
