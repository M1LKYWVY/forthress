( x -- | 
check parity of value | 
in case of even prints "value is even", in other case prints "value is not even". )
: parity 
2 % 
if 
    ." value is not even " cr 
else 
    ." value is even " cr 
then ; IMMEDIATE

( : parity 2 % if 0 else 1 cr then ; IMMEDIATE )


( x -- | 
check prime of value | 
to come over bug in forthress with iteration was created simple idea: added conditions. )
: prime 
dup 2 < 
if 
    ." can not check value " cr exit 
else 
then 
dup 2 = 
    if ." value is prime " cr exit 
else 
then 
dup dup 2 
do 
    if 
        dup r@ % 
    else 
    0 
    then 
loop 
if 
    ." value is prime " cr 
else 
    ." value is complex " cr 
then ; IMMEDIATE

( : prime dup 2 < if 0 exit else then dup 2 = if 1 exit else then dup dup 2 do if dup r@ % else 0 then loop if 1 else 0 then ; IMMEDIATE )


( )