%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

@contract_interface 
namespace IContract:
    func get_simple_storage() -> (res:felt):
    end

    func set_simple_storage(val:felt):
    end

    func set_simple_storage_error(val:felt):
    end

end

const INIT_VALUE = 12345678


@view
func __setup__():
    %{ 
        context.contract_address = deploy_contract("./src/c_contracts/b_events_and_errors.cairo", [ids.INIT_VALUE]).contract_address 
    %}
    return ()
end

@view
func test_set_with_event{syscall_ptr:felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}():
    tempvar contract_address
    %{ 
        ids.contract_address = context.contract_address 
    %}

    %{ expect_events({"name": "set", "data": [5]}) %}
    IContract.set_simple_storage(contract_address=contract_address, val=5)

    return ()
end

@view
func test_set_with_error{syscall_ptr:felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}():
    tempvar contract_address
    %{ 
        ids.contract_address = context.contract_address 
    %}

    %{ expect_revert(error_message="Input Val cannot be 100") %}
    IContract.set_simple_storage_error(contract_address=contract_address, val=100)

    return ()
end