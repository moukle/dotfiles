amount=$1

npadding=$((`bspc config -d focused left_padding` $amount))
padding=$(( $npadding > 0 ? $npadding : 0 ))

bspc config -d focused left_padding   $padding
bspc config -d focused right_padding  $padding
bspc config -d focused top_padding    $padding
bspc config -d focused bottom_padding $padding
