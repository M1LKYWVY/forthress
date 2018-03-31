( .S 2 3 parity .S )
( .S 3 3 parity .S )
( .S 1 1 parity .S )
( -1 prime )
( 0 prime )
( 1 prime )
( 2 prime )
( 3 prime )
( 4 prime )
( 5 prime )
( 6 prime )
( 7 prime) 
: push_mem dup dup 8 / swap 8 % if 1 + else then allot dup rot swap ! .S ;
16 push_mem