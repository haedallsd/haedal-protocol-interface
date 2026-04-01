/// Interface for admin.
module haedal::manage {
    use std::vector;
    use sui::transfer;
    use sui::coin::{TreasuryCap};
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    use sui_system::sui_system::{SuiSystemState};

    use haedal::hasui::{HASUI};
    use haedal::staking::{Self, Staking};
    use haedal::config::{Self};


    const EInitialized: u64 = 1;
    const EAccountExist: u64 = 2;
    const EAccountNotExist: u64 = 3;

    struct AdminCap has store, key {
        id: UID,
        init: bool,
    }

    struct ACL has store, key {
        id: UID,
        minor_signs: vector<address>,
        breakers: vector<address>,
        robots: vector<address>,
    }

    /// `OperatorCap` is used by the offchain programs.
    struct OperatorCap has store, key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        abort 0
    }

    #[test_only]
    public fun init_staking_for_test(ctx: &mut TxContext) {
        init(ctx);
    }

    public fun init_acl(_: &AdminCap, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun add_minor_signs_to_acl(_: &AdminCap,acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun del_minor_signs(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun add_breaker_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun del_breaker_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun add_robot_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun del_robot_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun is_minor_sign(acl: &ACL, account: address): bool {
        abort 0
    }

    public entry fun is_breaker(acl: &ACL, account: address): bool {
        abort 0
    }

    public entry fun is_robot(acl: &ACL, account: address): bool {
        abort 0
    }

    /// for admins
    public entry fun initialize(cap: &mut AdminCap, treasuryCap: TreasuryCap<HASUI>, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun set_deposit_fee(_: &AdminCap, staking: &mut Staking, deposit_fee: u64) {
        abort 0
    }

    public entry fun set_reward_fee(_: &AdminCap, staking: &mut Staking, reward_fee: u64) {
        abort 0
    }

    public entry fun set_validator_reward_fee(_: &AdminCap, staking: &mut Staking, validator_reward_fee: u64) {
        abort 0
    }

    public entry fun set_service_fee(_: &AdminCap, staking: &mut Staking, service_fee: u64) {
        abort 0
    }

    public entry fun set_withdraw_time_limit(_: &AdminCap, staking: &mut Staking, withdraw_time_limit: u64) {
        abort 0
    }

    public entry fun set_validator_count(_: &AdminCap, staking: &mut Staking, validator_count: u64) {
        abort 0
    }

    public entry fun sort_validators(_: &AdminCap, staking: &mut Staking, validators: vector<address>) {
        abort 0
    }

    /// Migrate the data version, this is called by the new package after upgrade.
    public entry fun migrate(_: &AdminCap, staking: &mut Staking) {
        abort 0
    }

    // The function is no longer supported.
    // public entry fun collect_rewards_fee(_: &AdminCap, staking: &mut Staking, account: address, ctx: &mut TxContext) {
    //     abort 0
    // }

    public entry fun collect_rewards_fee_v2(_: &AdminCap, wrapper: &mut SuiSystemState, staking: &mut Staking, account: address, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun collect_service_fee(_: &AdminCap, staking: &mut Staking, account: address, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun toggle_stake(_: &AdminCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun toggle_unstake(_: &AdminCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun toggle_claim(_: &AdminCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun do_stake(
        _: &AdminCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun update_total_rewards_onchain(_: &AdminCap, staking: &mut Staking, wrapper: &mut SuiSystemState, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun unstake_inactive_validators(_: &AdminCap, staking: &mut Staking, wrapper: &mut SuiSystemState, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun do_unstake_onchain(
        _: &AdminCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun unstake_pools(
        _: &AdminCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validators: vector<address>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public entry fun update_validator_rewards(_: &AdminCap, staking: &mut Staking, wrapper: &mut SuiSystemState, validator: address, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun unstake_from_validator(
        _: &AdminCap,
        staking: &mut Staking,
        wrapper: &mut SuiSystemState,
        validator: address,
        amount: u64,
        ctx: &mut TxContext,
    ) {
        abort 0
    }
}
