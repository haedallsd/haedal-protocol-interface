/// Interface for robot.
module haedal::robot {
    use sui::tx_context::{Self, TxContext};
    use sui_system::sui_system::{SuiSystemState};

    use haedal::manage::{Self, ACL};
    use haedal::staking::{Self, Staking};

    const ENotRobot: u64 = 1;
  
    public entry fun unstake_inactive_validators_v2(acl: &ACL, staking: &mut Staking, wrapper: &mut SuiSystemState, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun update_validator_rewards_v2(acl: &ACL, staking: &mut Staking, wrapper: &mut SuiSystemState, validator: address, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun sort_validators_v2(acl: &ACL, staking: &mut Staking, validators: vector<address>, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun do_stake(
        acl: &ACL,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun do_unstake_onchain_v2(
        acl: &ACL,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }


}
