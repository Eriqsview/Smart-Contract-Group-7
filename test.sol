pragma solidity ^0.8.10;

//SPDX-License-Identifier: MIT

// Warning: Do not use for actual funds.

/* ### Rules of the game:
    1. One player against dealer
    2. Player has to choose his bet between 1000 wei and 1000000 wei
    3. Blackjack pays 3 to 2
    4. No doubling down
    5. No split
    6. No surrender 
    7. Time per decision is set to 1 minute */

contract Blackjack { 

    //State variables

    bool private roundend;
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
    string private playermsg;
    address private player = msg.sender;
    uint public TurnEndTime; // as UNIX timestamp for end of round
    address private dealer;
    uint256 private minBet =  1000 wei;
    uint256 private maxBet = 1000000 wei;
    uint public balance = msg.value;
    uint public BetWinnings;

    // Functions
   
    // function SendEther() external payable {} Unfortunately this function as a function to put Ether in the Smart contract didn't work 

    // Bet Approval
    function ApproveBet() public payable {
    
    // Check if round has not ended
        require(player == msg.sender);
        require(roundend == false);

    // Check if bet amount is acceptable
        require(msg.value <= maxBet);
        require(msg.value >= minBet);
        player = msg.sender;
        balance = msg.value;
    }

    // Time for each round 1 min need to include mutliple rounds

    constructor (address _player, uint _durationMinutes) {
        player = _player;
        TurnEndTime = block.timestamp + _durationMinutes * 1 minutes;
    }

    /* Randomization 
        1.  Generate a random number from 1 to 13(representing the value of the 13 cards)
            block.time to get a different random no. every sec. 
            block.diff simple value that changes over time */

    function RNG() internal returns(uint) {
        random = (uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, mixer)
        )) % 13+1); // Reference https://eattheblocks.com/how-to-generate-a-random-number-in-smart-contract/

    //  Add variable to get different result at the same time

        mixer = 69 * random;

    //  2. Adjust for card values

        if (random > 10)
        random = 10; // Defining value of KQJ 

        if (random == 1)
        random = 11; // Default value for Ace

        return random;
    } 

    //  Main Game
    //  Basic game always runs
    function game() external returns (string memory _playermsg) {

    playercard1 = RNG(); 
    dealercard1 = RNG();
    playercard2 = RNG(); 

        if (playercard1 + playercard2 > 21)
        playercard2 = 1; // Adjustment for ace

        playercards = playercard1 + playercard2;

    //  Players decision
    //  Automatic
        if (playercard1 + playercard2 == 21) { // Black Jack 
        _playermsg = "Black Jack";
        roundend = false; 
        dealercard2 = RNG();

        if (dealercard1 + dealercard2 == 21) { 
        _playermsg = "Tie";
        BetWinnings = balance * 1;
        roundend = true;  // Player gets bet back
        }

        if (dealercard1 + dealercard2 < 21) { 
        _playermsg = "Player Wins"; 
        BetWinnings = balance * 5/2;
        roundend = true;  // Player wins
        }}

        if (playercard1 + playercard2 < 21) {
        _playermsg = "Hit or stand";
        }}

    //  HIT
    function hit() external returns (string memory _playermsg) {
        if (playercards < 21)
        playercardadd = RNG();

        playercards += playercardadd;

        if (playercardadd == 11 && playercardadd + playercards > 21) 
        playercardadd = 1;

        if (playercards > 21)
        _playermsg = "Dealer Wins";
   
        roundend = true; 
        return _playermsg; 
  
    }
    //  Stand
    function stand() external returns (string memory _playermsg) {
  
        dealercard2 = RNG();
        dealercards = dealercard1 + dealercard2;

        while (dealercards < 17){
        dealeradd = RNG();
        dealercards += dealeradd;
        }
        if (dealercards > playercards && dealercards > 21){
        _playermsg = "Player Wins";
        BetWinnings = balance * 2; 
        roundend = true;
        }
        else if (dealercards > playercards && dealercards < 22){
        _playermsg = "Dealer Wins";
        BetWinnings = balance *0; 
        roundend = true;
        }
        else if (dealercards < playercards && playercards > 21){
        _playermsg = "Dealer Wins";
        BetWinnings = balance * 0; 
        roundend = true;
        }
        else if (dealercards < playercards && playercards < 22){
        _playermsg = "Player Wins"; 
        BetWinnings = balance * 2;
        roundend = true;
        }
        else if (dealercards == playercards) { 
        _playermsg = "Tie";
        BetWinnings = balance * 1;
        roundend = true;
        }
        else if (playercards == 21 && dealercards < 21){
        _playermsg = "Blackjack";
        BetWinnings = balance * 5/2;
        roundend = true;
        }
        return _playermsg;
        }

    // Summary of card Values 
    function Values() public view returns (uint PlayerCard1, uint PlayerCard2, uint PlayerCardTotal, uint Dealercard1, uint Dealercard2, uint Dealercards) {
        return (playercard1, playercard2, playercards, dealercard1, dealercard2, dealercards);
        }
//  function withdraw() public payable{
  //      payable(msg.sender).transfer(balance); Unfortunately this function as a payout function didn't work in our Smart contract
}
