// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. Import the Chainlink Interface
// This acts like a "remote control" telling your contract how to talk to the Oracle
import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract PriceOracle {

    // 2. Create a variable to hold the Oracle's address
    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Sepolia Testnet
     * Aggregator: ETH/USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     */
    constructor() {
        // 3. Connect your contract to the specific Chainlink Oracle on Sepolia
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    // 4. The function to get the price
    function getLatestPrice() public view returns (int) {
        (
            /* uint80 roundID */,
            int price,            // We only care about this variable
            /* uint startedAt */,
            /* uint timeStamp */,
            /* uint80 answeredInRound */
        ) = priceFeed.latestRoundData();
        
        // Chainlink returns the price with 8 decimals. 
        // Example: If ETH is $3000, it returns 300000000000
        return price;
    }
}
