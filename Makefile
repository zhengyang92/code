
inline_asm.out:
	rustc -o inline_asm.out inline_asm.rust

clean:
	rm -f *.out
