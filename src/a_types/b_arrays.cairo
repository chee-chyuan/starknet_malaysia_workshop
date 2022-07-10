%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc

# What about arrays?! Yes arrays are felts too. Except a different kind of felt
# How would you construct an array? https://www.cairo-lang.org/docs/how_cairo_works/consts.html?highlight=array

@view
func array{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}(
) -> (arr_len:felt, arr: felt*):

    ### create an array of [1,2,3,4,5]
    let (arr) = alloc()
    ### complete code here

    return (1, arr)
end