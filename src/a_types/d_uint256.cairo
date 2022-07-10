%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

# The normal integer convention we see alot in Solidity is Uint256. 
# However in Cairo, felt is only up to 252 bits, leaving 4 bits missing. 
# This means that we programmers are forced to change the ERC standards
# To prevent that, the Starkware team has come up with the Uint256 library
# Uint256 is a special kind of structs
# refer to this link for more info https://github.com/starkware-libs/cairo-lang/blob/master/src/starkware/cairo/common/uint256.cairo


# our uint256 import
from starkware.cairo.common.uint256 import Uint256, uint256_add, uint256_le

# perform addition
func operator_uint256{syscall_ptr:felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}(
) -> (add_res:Uint256):

    ### add 5 and 3402823669209384634633746074317682114551 in uint256
    let (add_res,_) = uint256_add(Uint256(5,0), Uint256(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7,9))

    return (add_res=add_res)
end

func compare_uint256{syscall_ptr:felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}(
) -> (res:felt, a:Uint256, b:Uint256):

    ### compare 100 (a) <=101 (b)
    let a = Uint256(100,0)
    let b = Uint256(101,0)
    let (res) = uint256_le(a, b)
    return (res=res, a=a, b=b)
end