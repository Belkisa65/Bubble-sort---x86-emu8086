mov si, 1100h  ; postavlja SI register kao pokazivac za niz
mov cl, [si]   ; postavlja CL registar kao brojac za n-1 rep.
dec cl

repeat:
mov si, 1100h  ; init
mov ch, [si]   ; postavlja ch kao brojac za n-1 uporedjivanje
dec ch
inc si         ; pointer++

rep2:
mov al, [si]   ; premesta element iz niza u al
inc si           
cmp al, [si]   ; uporedjuje al sa sledecim elementom u nizu
jc ahead       ; if al<data, onda ahead
xchg al, [si]  ; zameni al i si
xchg al, [si-1]; zameni al i si-1

ahead:
dec ch         ; ch++
jnz rep2
dec cl
jnz repeat     ; ponovi n-1 comp. sve dok je cl nula
hlt            ; exit