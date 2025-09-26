# 02_data_movement examples
# Data Movement in x86-64 Assembly

This folder demonstrates different usages of the `MOV` instruction in 64-bit NASM.

## Examples

1. **Register to Register** (`reg_to_reg.asm`)  
   Moves values between CPU registers.  
   ✅ `mov rax, rbx`  
   ❌ `mov al, bx` (size mismatch)

2. **Immediate to Register** (`imm_to_reg.asm`)  
   Loads constants into registers.  
   ✅ `mov rax, 5`  
   ❌ `mov rax, 0x123456789ABCDEF01234` (immediate too large)

3. **Memory to Register** (`mem_to_reg.asm`)  
   Loads values from memory into registers.  
   ✅ `mov rax, [num]`  
   ❌ `mov rax, num` (moves address, not contents)

4. **Register to Memory** (`reg_to_mem.asm`)  
   Stores register values into memory.  
   ✅ `mov [val], rax`  
   ❌ `mov [val], [rax]` (both memory operands)

5. **Wrong Usages** (`wrong_usages.asm`)  
   Shows common errors like size mismatches and invalid operands.

---

## Assembly & Execution

```bash
nasm -f elf64 file.asm -o file.o
ld file.o -o file
./hello64


```bash
nasm -f elf64 file.asm -o file.o
ld -o file file.o
./file


nasm -f elf32 hello_world_32.asm -o hello_world_32.o
ld -m elf_i386 -o hello32 hello_world_32.o
./hello32
