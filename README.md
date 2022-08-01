#### Very much possible, makes sense to store ETH as gas as it differs from the asset and provides protocol native funding potential among other use cases. However there's a few issues to account for. Currently miners are protected so that refunds are capped. Also likely for selfedestruct to be removed.. probably in order to make the popular upgradability stuff more reliable.

## See https://gastoken.io/ for a robust `selfdestruct`-based implementation

## GAS Refund Tip/Protocol Financing Model

 Call/All Calls to contract to 'deposit' refunable gas and give the rights to delete to a third party.

- the thrid party should be able to prove the ownership over the gas refund
- the third party should be able to sell/alienate the right to materialize the gas refund

Core idea: what if gas refunds can be currency.. like ETH but for web3.
Call Contract -> Contract instructions: -delete all of this - get gas refund - if enough gas deploy this contract (kindof logic) 
Would make sense for it to be a modifer.

- can such an asset be defi composable?
- can deletion rights over unaccesed data be a way of financing a protocol? (gas refund)

To Do:
- take a closer look at gas-centered projects like gasstation
