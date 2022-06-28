// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StoreContract {
    IERC20 public usdt;

    constructor(address _usdtAddress) {
        usdt = IERC20(_usdtAddress);
    }

    receive() external payable {}

    // Modifier to check token allowance
    modifier checkAllowance(uint256 amount) {
        require(usdt.allowance(msg.sender, address(this)) >= amount, "Error");
        _;
    }

    // In your case, Account A must to call this function and then deposit an amount of tokens
    function depositTokens(uint256 _amount) public {
        usdt.transferFrom(msg.sender, address(this), _amount);
    }

    function withdraw(uint256 amount) external {
        usdt.transfer(msg.sender, amount);
    }

    function approve(uint256 _value) public {
        usdt.approve(address(this), _value);
    }

    function allowance() public view {
        usdt.allowance(msg.sender, address(this));
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return usdt.balanceOf(_owner);
    }
}
// link: 0xa36085F69e2889c224210F603D836748e7dC0088
