( x -- | 
check parity of value | 
in case of even prints "value is even", in other case prints "value is not even". )
: parity 
2 % 
if 
    ." value is not even " cr 
else 
    ." value is even " cr 
then 
;

( : parity 2 % if 0 else 1 then ; IMMEDIATE )


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
then 
;

( : prime dup 2 < if 0 exit else then dup 2 = if 1 exit else then dup dup 2 do if dup r@ % else 0 then loop if 1 else 0 then ; IMMEDIATE )

( value -- addr |
allocating memory in according with value amd stores value in menory )
: push_mem 
dup 0 = 
if
    1 allot dup rot swap ! exit
else 
then
dup dup 8 / swap 8 % 
if 
    1 + 
else 
then 
allot dup rot swap ! 
;


( x -- |
Second task made with chages )
: prime_alloc
dup 2 < 
if 
    0 push_mem exit 
else 
then 
dup 2 = 
if 
    1 push_mem exit 
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
    1 push_mem 
else 
    0 push_mem 
then 
;


( x y -- x y x y |
copies given values )
: dup_twice
over swap dup rot swap 
;

( from_addr to_addr -- |
copies one byte from from_addr to to_addr )
: copy_char 
c@ swap c! 
;






