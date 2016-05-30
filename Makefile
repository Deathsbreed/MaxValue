AS=as
LINKER=ld
OBJ=src/MaxValue.o

%.o: %.asm
	$(AS) -o $@ $<

maxvalue: $(OBJ)
	mkdir bin/
	$(LINKER) -o bin/$@ $^

.PHONY: clean

clean:
	rm $(OBJ)
