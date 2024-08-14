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
