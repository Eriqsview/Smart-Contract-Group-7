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
    uint public dealercards;
    uint public playercardadd;
    uint public dealeradd;
    uint public random;
    uint public mixer;
    address public winnerBlackjack;
    string public playermsg;
    address private Player = msg.sender;
    uint public TurnEndTime; // as UNIX timestamp for end of round
  
// Time for each round 1 min need to include mutliple rounds

constructor (address _Player, uint _durationMinutes) {
    Player = _Player;
    TurnEndTime = block.timestamp + _durationMinutes * 1 minutes;
  }

// function initialize (address _Player) external{
//     }

// accept and store valid bets

//  function bet() public payable {
//    require (block.timestamp < TurnEndTime, 'No bets allowed');
// }

//Randomisation 
  //1. Generate a random number vom 0 to 13
  // block.time to get a dierrent random no. every sec. 
  // block.diff simple value that changes over time
function RNG() internal returns(uint) {
        random = (uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, mixer)
        )) % 13+1);
  // add variable to get different result at the same time
     mixer = 69 * random;
  //2. adjust for card values

     if (random > 10)
     random = 10; // Defining value of KQJ 

     if (random == 1)
     random = 11; //default value for ace

     return random;
    } 
//Main Game
  //Basic game allways runs
function game() external returns (string memory _playermsg) {

    playercard1 = RNG(); 
    dealercard1 = RNG();
    playercard2 = RNG(); 

    if (playercard1 + playercard2 > 21)
    playercard2 = 1;

    playercards = playercard1 + playercard2;

  //players decision
   //automatic
   if (playercard1 + playercard2 == 21) { //black jack 
   _playermsg = "Black Jack";
   roundend = false; 
   dealercard2 = RNG(); 
    if (dealercard1 + dealercard2 == 21) { 
    _playermsg = "Tie";
    roundend = true;  // player bet back
    }
    if (dealercard1 + dealercard2 < 21) { 
    _playermsg = "Player Wins"; 
    roundend = true;  // player wins
    }}

  if (playercard1 + playercard2 < 21) {
  _playermsg = "Hit or fold";
 }}

 //HIT
 function hit() external returns (uint) {
   if (playercards < 21)
   playercardadd = RNG();

   playercards += playercardadd;

     if (playercardadd == 11 && playercardadd + playercards > 21) 
     playercardadd = 1;

   
  
   playermsg = "Hit or fold"; 
   roundend = true; 
   return playercards; 
  
}
//FOLD
function fold() external returns (string memory _playermsg) {
  
dealercard2 = RNG();
dealercards = dealercard1 + dealercard2;

if (dealercard1 + dealercard2 < playercards){
dealeradd = RNG();
dealercards += dealeradd;
}
if (dealercards > playercards && dealercards > 21){
_playermsg = "Player Wins"; 
roundend = true;
}
else if (dealercards > playercards && dealercards < 21){
_playermsg = "Dealer Wins"; 
roundend = true;
}
else if (dealercards < playercards && playercards < 21){
_playermsg = "Player Wins"; 
roundend = true;
}
return _playermsg; 

}
// All Values 
function Values() public view returns (uint PlayerCard1, uint PlayerCard2, uint PlayerCardTotal, uint Dealercard1, uint Dealercard2, uint Dealercards) {
 return (playercard1, playercard2, playercards, dealercard1, dealercard2, dealercards);
}

//address public player;

// Storing players bet
//struct Player {
//    uint amountofbet;
//}

// simple mapping in storage
//mapping(address => uint256) public betofplayer;

}
