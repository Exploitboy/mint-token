# MyToken Smart Contract

## Overview

`Ashu` is a simple ERC-20 token smart contract written in Solidity. It supports essential features like token minting, burning, transferring, and allowances. This contract is designed to be a basic example of how ERC-20 functionality can be implemented.

- **Name:** Ashu
- **Symbol:** ASH
- **Decimals:** 18

## Features

- **Minting:** Only the contract owner can mint new tokens.
- **Burning:** Token holders can burn (destroy) their own tokens.
- **Transfer:** Token holders can transfer tokens to other addresses.
- **Allowance:** Allows for delegated transfers through `approve` and `transferFrom`.

## Smart Contract Code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AshuToken is ERC20 {
    address private admin;

    constructor() ERC20("Ashu", "ASH") {
        admin = msg.sender;
        // Mint an initial supply to the contract's address
        _mint(address(this), 100 * 10 ** decimals());
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Caller is not the admin");
        _;
    }

    // Only the admin can mint new tokens
    function createTokens(address recipient, uint256 quantity) public onlyAdmin {
        _mint(recipient, quantity);
    }

    // Any user can burn their own tokens
    function destroyTokens(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Any user can transfer tokens
    function transferTokens(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
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
