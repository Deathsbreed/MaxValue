#PURPOSE: This program finds the maximum number of a set of data items.
#

#VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used to terminate the data
#

.section .data
data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start

_start:
    movl $0, %edi                       # move 0 into the index register
    movl data_items(,%edi,4), %eax      # load the first byte of data
    movl %eax, %ebx                     # since this is the first item it
                                        # is the biggest (duh)

    start_loop:                         # start the loop
        cmpl $0, %eax                   # check to see if end value 0
        je loop_exit
        incl %edi                       # increase index
        movl data_items(,%edi,4),%eax   # load the next byte of data
        cmpl %ebx, %eax                 # compare values
        jle start_loop                  # jump to the loop beginning if the
                                        # new value isn't bigger
        movl %eax, %ebx                 # move the value as the largest
        jmp start_loop                  # jump to loop beginning

    loop_exit:
        # since %ebx is already the set as the largest value in the data
        # simply return it in the exit system call since it's already %ebx
        movl $1, %eax                   # 1 tell the kernel to exit
        int $0x80
