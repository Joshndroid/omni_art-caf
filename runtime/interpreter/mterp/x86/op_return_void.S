    .extern MterpThreadFenceForConstructor
    call    SYMBOL(MterpThreadFenceForConstructor)
    movl    rSELF, %eax
    testl   $$(THREAD_SUSPEND_OR_CHECKPOINT_REQUEST), THREAD_FLAGS_OFFSET(%eax)
    jz      1f
    movl    %eax, OUT_ARG0(%esp)
    call    SYMBOL(MterpSuspendCheck)
1:
    xorl    %eax, %eax
    xorl    %ecx, %ecx
    jmp     MterpReturn
