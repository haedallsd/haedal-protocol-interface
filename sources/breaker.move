/// Interface for breaker.
module haedal::breaker {
    use sui::tx_context::{Self, TxContext};
    use haedal::manage::{Self, ACL};
    use haedal::staking::{Self, Staking};
  
    const ENotBreaker: u64 = 1;

    public entry fun toggle_unstake_v2(acl: &ACL, staking: &mut Staking, status: bool, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun toggle_claim_v2(acl: &ACL, staking: &mut Staking, status: bool, ctx: &mut TxContext) {
        abort 0
    }

}
