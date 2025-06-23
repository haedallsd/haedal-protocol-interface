# haedal-protocol
A lsd protocol on Sui

## how to integrate haedal

The Haedal Protocol is deployed to **mainnet**, and its package id and Staking object id are below:

```
original packageId: '0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d',
latest upgraded packageId: '0x3f45767c1aa95b25422f675800f02d8a813ec793a00b60667d071a77ba7178a2'
Staking Id: '0x47b224762220393057ebf4f70501b6e657c3e56684737568439a04f80849b2ca',
```
Haedal website[https://www.haedal.xyz/stake] .



You need these two ids to integrate Haedal to your project.

The Haedal Protocol is deployed to **testnet**, and its package id and Staking object id are below:
```
original stakingId: '0x6e384d2da5b040b27f973155e25bbe4beb0ad5ca8ee0a36e20dff356094c9fc0'
latest upgraded packageId: '0x9dac9c5770e5f930d2223ff68782958701acfaee9337e8d8363978ce7670dffb'
packageId: '0xac2afb455cbcdc2ff1a2e9bbb8aa4ccb4506a544b08c740886892a5cdf92f472'
```
Haedal testnet website[https://testnet3.haedal.xyz/stake] .



## stake
### 1 calculate how many haSUI you can get

The below function can get the `haSUI::SUI` exchagne rate, you need to divide it by 1000000 to get the actual exchange rate.

```
0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d::staking::get_exchange_rate(staking: &Staking): u64 {}
```

For DAPP developers, you can call `staking::get_exchange_rate` through Sui SDK `sui_devInspectTransactionBlock` method. After you get the `haSUI::SUI` exchagne rate, suppose you have 100 SUI, and you want to exchange them into haSUI, you can calculate the haSUI you can get like below(pseudocode):

``` 
const suiAmount = 100000000000; // 100 SUI
let exchangeRate = staking::get_exchange_rate(stakingObject) / 1000000;
let hasuiAmount = suiAmount / exchangeRate;
```

We also suggest you calculate the result, and have a comparison between the Haedal website[https://www.haedal.xyz/stake] .


### 2 call `interface::request_stake` or `staking::request_stake_coin` to exchange SUI into haSUI


If you want to get haSUI, you can call below two functions.
1. calling the first one, the haSUI will be sent to the caller account.

```
0x1d56b8ec33c3fae897eb7bb1acb79914e8152faed614868928e684c25c8b198d::interface::request_stake(wrapper: &mut SuiSystemState, staking: &mut Staking, input: Coin<SUI>, validator: address, ctx: &mut TxContext){}
```

2. calling the second one, the haSUI is just returned, allowing the caller to deal it.

```
0x1d56b8ec33c3fae897eb7bb1acb79914e8152faed614868928e684c25c8b198d::staking::request_stake_coin(wrapper: &mut SuiSystemState, staking: &mut Staking, input: Coin<SUI>, validator: address, ctx: &mut TxContext): Coin<HASUI> {}
```

Arguments:

    wrapper, the SuiSystemState, the object id is `0x5`.

    staking, the Staking object id is 0x47b224762220393057ebf4f70501b6e657c3e56684737568439a04f80849b2ca .

    input, the Coin<SUI> object, it will be all swaped to haSUI, so you need to split it before calling these two functions.

    validator, the validator's the address of active validators in the network, if you don't want to choose one, just set it to 0x0, let haedal to handle it.


If you want to integrate the stake operation with your operations in one txb, we suggest you call `staking::get_exchange_rate(staking: &Staking)` and calculate the haSUI amount you can get firstly, and then submit the integrated txb.



## unstake
### 1 call `interface::request_unstake_delay` to get a `UnstakeTicket`, and call `interface::claim` to get SUI

```
public entry fun request_unstake_delay(staking: &mut Staking, clock: &Clock, input: Coin<HASUI>, ctx: &mut TxContext) {}

public entry fun claim(staking: &mut Staking, ticket: UnstakeTicket, ctx: &mut TxContext) { }
```

This method is recommended, after calling it in epoch n, you will get a `UnstakeTicket`, and just wait to epoch+1 or epoch+2 begining, you can call claim it. The wait time depends on the time you call `request_unstake_delay`, if it's at the end of this epoch(right now the last 4 hours), you will wait to n+2 to claim, otherwise n+1.


### 2 call `interface::request_unstake_instant_v2` to get SUI immediately

```
public entry fun request_unstake_instant_v2(wrapper: &mut SuiSystemState, staking: &mut Staking, input: Coin<HASUI>, ctx: &mut TxContext) {}
```

This method is not recommended, after calling it, user can get the staked SUI & rewords back immediately, but it may fail. The reason is that, there might be not enough SUI in the protocol, for most of the SUI is staked in the validator nodes. And this method will charge a service fee(right now 9%) on staked SUI & rewards.


## claim
### call `interface::claim_v2` or `staking::claim_v2` to get SUI back after your withdrawal ticket is unlocked

```
public entry fun claim_v2(wrapper: &mut SuiSystemState, staking: &mut Staking, ticket: UnstakeTicket, ctx: &mut TxContext) {}
public fun claim_v2(wrapper: &mut SuiSystemState, staking: &mut Staking, ticket: UnstakeTicket, ctx: &mut TxContext) {}
```



