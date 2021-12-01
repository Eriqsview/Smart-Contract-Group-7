pragma solidity ^0.8.9;

//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

contract Blackjack { // Blackjack parameters

//State variables
    bool public roundend;
    uint public playerbet;
    uint public playercard1;
    uint public playercard2;
    uint public dealercard1;
    uint public dealercard2;
    uint public playercards;
    uint public random;
    address public winnerBlackjack;
    string private playermsg;
   address private Player = msg.sender;
   uint public TurnEndTime; // as UNIX timestamp for end of round
  
// Time for each round 1 min need to include mutliple rounds

  constructor (address _Player, uint _durationMinutes) {
    Player = _Player;
    TurnEndTime = block.timestamp + _durationMinutes * 1 minutes;
    //uint [13] cardValues = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];
  }

 function initialize (address _Player) external{
     }

// accept and store valid bets

  function bet() public payable {
    require (block.timestamp < TurnEndTime, 'No bets allowed');
 }

//Randomisation 
  //1. Generate a random number vom 0 to 13
function RNG() internal returns(uint) {
        random = (uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)
        )) % 13+1);

  //2. adjust for card values

     if (random > 10)
     random = 10; // Defining value of KQJ of 10 

     if (random == 1)
     random = 11; //default value for ace

     return random;
    } 
//Main Game
  //Basic game allways runs
    function game() internal returns (uint) {

    playercard1 = RNG(); 
    dealercard1 = RNG();
    playercard2 = RNG(); 

    playercards = playercard1 + playercard2;

    if (playercard1 + playercard2 > 21)
    playercard2 = 1;

  //players decision
   
   if (playercard1 + playercard2 == 21)  //black jack 
   playermsg = "Black Jack";
   roundend = false; 
   dealercard2 = RNG(); 
    if (dealercard1 + dealercard2 == 21) 
    playermsg = "Tie";
    roundend = true;  // player bet back
    if (dealercard1 + dealercard2 < 21)
    playermsg = "Player Wins"; 
    roundend = true;  // player wins

   if (playercard1 + playercard2 < 21) 
   roundend = false; 
   //playermsg ("Cards") = (playercard1 + playercard2); 

   while (playercards < 13) {
   playercards + RNG(); 
   roundend = true; 
    }

   //playermsg ("Cards") = (playercards); 

}


//address public player;

// Storing players bet
//struct Player {
//    uint amountofbet;
//}

// simple mapping in storage
//mapping(address => uint256) public betofplayer;

}
