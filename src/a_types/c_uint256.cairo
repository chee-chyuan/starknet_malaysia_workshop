%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

# 3. The normal integer convention we see alot in Solidity is Uint256. 
# However in Cairo, felt is only up to 252 bits, leaving 4 bits missing. 
# This means that we programmers are forced to change the ERC standards
# To prevent that, the Starkware team has come up with the Uint256 library
# refer to this link for more info https://github.com/starkware-libs/cairo-lang/blob/master/src/starkware/cairo/common/uint256.cairo


# our uint256 import
from starkware.cairo.common.uint256 import Uint256