```

Register  Usage                       Save
---------------------------------------------
rax       Return value                Caller
rbx       Callee Saved                Callee*  
rcx       4th argument                Caller
rdx       3rd argument                Caller
rsi       2nd argument                Caller
rdi       1st argument                Caller
rbp       Callee Saved                Callee*
rsp       Stack Pointer               Callee*
r8        5th argument                Caller
r9        6th argument                Caller
r10       temporary                   Caller
r11       temporary                   Caller
r12       Callee Saved                Callee*
r13       Callee Saved                Callee*
r14       Callee Saved                Callee*
r15       Callee Saved                Callee*
xmm0      First argument and return   Caller
xmm1      Second argument and return  Caller
xmm2-7    Arguments                   Caller
xmm8-15   Temporary                   Caller

``

Callee register - the onus of maintaining the state of such a register is on the called function ('the callee') - whenever the function needs to use it locally, it needs to 
push the state onto the stack and pop it in the proper order once done. Such registers are also called "non-volatile" registers.

Caller register - the onus of maintaining the state of such a register is on the calling function ('the caller') - such registers can be used freely within the called function.
Such registers are also called "volatile" registers.
