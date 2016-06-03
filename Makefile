AS=as
LINKER=ld
OBJ=src/maxvalue.o

%.o: %.asm
	$(AS) -o $@ $<

maxvalue: $(OBJ)
	mkdir -p bin
	$(LINKER) -o bin/$@ $^

.PHONY: clean

clean:
	rm $(OBJ)
