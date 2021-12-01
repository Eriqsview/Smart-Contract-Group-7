//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

pragma solidity ^0.8.9;

contract Blackjack {

    // State variables
    address public dealer;
    address public player = msg.sender;
    uint256 public minBet =  1000 wei;
    uint256 public maxBet = 1000000 wei;
    bool public inprogress;

    uint public dealerFund;
    uint public playerFund;
    uint public bet = msg.value;
    uint public TurnEndTime;
    
    // simple mapping in storage
    mapping(address => uint256) public betofplayer;

    function placebet() external payable {
        require (player == msg.sender);
        require (inprogress == false);
    }

    // Handles the validation and registration of players and the bet
    function ApproveBet() public payable {
    // Check if game is gameRunning
        require(
            inprogress == false,
            "Game is in progress. You cannot bet right now."
        );

    // Check if bet is in acceptable range
        require(
                msg.value <= maxBet,
                "Please bet less than 1000000 wei."
        );
        require(
                msg.value >= minBet,
                "Please bet more than 1000 wei."
        );
        player = msg.sender;
        bet = msg.value;
    
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    constructor (address _player, uint _durationMinutes) {
    player = _player;
    TurnEndTime = block.timestamp + _durationMinutes * 1 minutes;
    }

    function GameEnd() external {
    require(player = msg.sender);
    require(balance > 0);
    inprogress = false;
    payable(msg.sender).transfer(balance);  
    }
}
