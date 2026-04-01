/// Interface for minorsign.
module haedal::minorsign {
    use sui::tx_context::{Self, TxContext};
    use haedal::manage::{Self, ACL};
    use haedal::staking::{Self, Staking};
    use haedal::config::{Self};

    const ENotMinorSign: u64 = 1;

    public entry fun set_withdraw_time_limit_v2(acl: &ACL, staking: &mut Staking, withdraw_time_limit: u64, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun set_validator_count_v2(acl: &ACL, staking: &mut Staking, validator_count: u64, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun toggle_stake_v2(acl: &ACL, staking: &mut Staking, status: bool, ctx: &mut TxContext) {
        abort 0
    }

}
