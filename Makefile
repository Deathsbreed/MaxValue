AS=as
LINKER=ld
OBJ=src/MaxValue.o

%.o: %.asm
	$(AS) -o $@ $<

maxvalue: $(OBJ)
	$(LINKER) -o $@ $^

.PHONY: clean

clean:
	rm $(OBJ)
