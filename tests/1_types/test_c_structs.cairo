%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from src.a_types.c_structs import my_first_struct, read_struct
from starkware.cairo.common.alloc import alloc

@view
func test_init_struct{syscall_ptr:felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}():
    let (arr) = alloc()
    assert arr[0] = 1
    assert arr[1] = 2
    assert arr[2] = 3
    assert arr[3] = 4

    let arr_len = 4

    let (my_struct) = my_first_struct(name=1, age=1, items_len=arr_len, items=arr)

    assert my_struct.name = 1
    assert my_struct.age = 1
    assert my_struct.items[2] = 3 
    assert my_struct.items_len = 4

    return ()
end

@view
func test_read_struct{syscall_ptr:felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}():
    read_struct()
    return ()
end