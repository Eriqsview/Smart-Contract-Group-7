pragma solidity ^0.8.9;

//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

contract Blackjack { // Blackjack parameters

//State variables
    bool private roundend;
    uint public playerbet;
    uint public playercard1;
    uint public playercard2;
    uint public dealercard1;
    uint public dealercard2;
    uint public playercards;
    uint public dealercards;
    uint private playercardadd;
    uint private dealeradd;
    uint private random;
    uint private mixer;
    address public winnerBlackjack;
    string private playermsg;
    address private Player = msg.sender;
    uint public TurnEndTime; // as UNIX timestamp for end of round

    address public dealer;
    address public player = msg.sender;
    uint256 public minBet =  1000 wei;
    uint256 public maxBet = 1000000 wei;
    bool public inprogress;

    uint public dealerFund;
    uint public playerFund;
    uint public bet = msg.value;
    
    // simple mapping in storage
    //mapping(address => uint256) public betofplayer;

    // Handles the validation and registration of players and the bet
    function ApproveBet() public payable {
    // Check if game is gameRunning

        require (player == msg.sender);
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

    //function balance() public view returns(uint) {
      //  return address(this).balance;
    //} 
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
  _playermsg = "Hit or stand";
 }}

 //HIT
 function hit() external returns (uint) {
   if (playercards < 21)
   playercardadd = RNG();

   playercards += playercardadd;

     if (playercardadd == 11 && playercardadd + playercards > 21) 
     playercardadd = 1;

   
  
   playermsg = "Hit or stand"; 
   roundend = true; 
   return playercards; 
  
}
//Stand
function stand() external returns (string memory _playermsg) {
  
dealercard2 = RNG();
dealercards = dealercard1 + dealercard2;

while (dealercards < 17){
dealeradd = RNG();
dealercards += dealeradd;
}
if (dealercards > playercards && dealercards > 21){
_playermsg = "Player Wins"; 
roundend = true;
}
else if (dealercards > playercards && dealercards < 22){
_playermsg = "Dealer Wins"; 
roundend = true;
}
else if (dealercards < playercards && playercards < 22){
_playermsg = "Player Wins"; 
roundend = true;
}
return _playermsg; 

}
// Summary of card Values 
function Values() public view returns (uint PlayerCard1, uint PlayerCard2, uint PlayerCardTotal, uint Dealercard1, uint Dealercard2, uint Dealercards) {
 return (playercard1, playercard2, playercards, dealercard1, dealercard2, dealercards);
}
}
