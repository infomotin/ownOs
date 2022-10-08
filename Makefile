GPPPARAMS = -m32
ASPARAMS = --32
LDPARAMS = -melf_i386
OBJS = loader.o kernel.o



%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<
%.o: %.s
	as $(ASPARAMS) -o $@ $<
mykernel.bin: linker.ld $(OBJS)
	ld $(LDPARAMS) -T $< -o $@ $(OBJS)
install: mykernel.bin
	sudo cp $< /boot/mykernel.bin
