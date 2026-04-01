/// Interface for operator.
module haedal::operate {
    use sui::tx_context::{TxContext};
    use sui_system::sui_system::{SuiSystemState};

    use haedal::manage::{OperatorCap};
    use haedal::staking::{Self, Staking};

    public entry fun toggle_stake(_: &OperatorCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun toggle_unstake(_: &OperatorCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun toggle_claim(_: &OperatorCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun do_stake(
        _: &OperatorCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun update_total_rewards_onchain(_: &OperatorCap, staking: &mut Staking, wrapper: &mut SuiSystemState, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun unstake_inactive_validators(_: &OperatorCap, staking: &mut Staking, wrapper: &mut SuiSystemState, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun do_unstake_onchain(
        _: &OperatorCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun unstake_pools(
        _: &OperatorCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun update_validator_rewards(_: &OperatorCap, staking: &mut Staking, wrapper: &mut SuiSystemState, validator: address, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun unstake_from_validator(
        _: &OperatorCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validator: address,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun sort_validators(_: &OperatorCap, staking: &mut Staking, validators: vector<address>) {
        abort 0
    }
}
