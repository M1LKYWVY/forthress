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


( x -- x+1 |
increments given value )
: inc 
1 +
;


( x y -- x+1 y+1 |
increments to given values )
: inc_twice 
inc swap inc swap
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


( quantity from_addr to_addr -- |
copies given amount of bytes from from_addr to to_addr )
: copy_string 
0 
do 
dup_twice 
copy_char 
inc_twice 
loop
drop drop 
;


( first_str_addr second_str_addr -- result_addr |
concat given strings returns new addres ) 
: concat
swap dup count >r swap dup count >r dup count rot dup 
count rot + rot swap inc heap-alloc dup >r over dup count 
copy_string count r@ + swap dup count copy_string r> r> r> inc + 
swap dup rot + 0x 0 swap c!
; 


( value -- [colltz_vector] | 
makes colltaz vector on stack )
: collatz
repeat
dup dup 2 % 
if
    3 * inc 
else 
    2 /
then
dup
1 = 
until 
;