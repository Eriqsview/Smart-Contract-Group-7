//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

pragma solidity ^0.8.9;

contract Blackjack {

    // State variables
    address public dealer;
    address private player = msg.sender;
    uint256 public minBet =  1000 wei;
    uint256 public maxBet = 10000000000 wei;
    bool public inprogress;

    uint public dealerFund;
    uint public playerFund;
    uint public TurnEndTime;
    
    // simple mapping in storage
    mapping(address => uint256) public betofplayer;

    function placebet() external payable {
        require (player == msg.sender);
        require (inprogress == false);
    }

    // add player if bet amount is valid
    if (player == msg.sender) {
    // Check if bet is in acceptable range
    require(
            msg.value <= maxBet,
            "Bet is too high. Can't be more than 10 ether."
    );
    require(
            msg.value >= minBet,
            "Your bet is too low. Must be at least 0.001 ether."
    );
    player = msg.sender;
    bet = msg.value;

    }

    function balance() external view returns(uint) {
        return address(this).balance;
    }

    constructor (address _player, uint _durationMinutes) {
    player = _player;
    TurnEndTime = block.timestamp + _durationMinutes * 1 minutes;
  }
}
