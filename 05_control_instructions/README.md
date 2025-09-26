# 🚀 Real-World Use Cases of Conditional Jumps in Assembly (8086/80386+)

Conditional jumps (`Jcc`) are the backbone of **decision-making and control flow** in assembly.  
Common instructions and **where they are useful in real programs**.

---

## 1. Based on Equality / Zero Flag (ZF)

- **JE / JZ → Jump if Equal / Zero**
  - String comparison (`strcmp`, `memcmp`)
  - Password matching
  - Loop termination when counter reaches zero  

- **JNE / JNZ → Jump if Not Equal / Not Zero**
  - Searching in arrays
  - Input validation (value ≠ expected)
  - Conditional execution in loops  

---

## 2. Unsigned Comparisons (CF, ZF)

- **JA / JNBE → Jump if Above**
  - Packet size validation (unsigned > limit)
  - File size checks  

- **JAE / JNB → Jump if Above or Equal**
  - Array index check (`index >= 0`)
  - Loop conditions with unsigned counters  

- **JB / JNAE → Jump if Below**
  - Array bounds checking (`index < length`)
  - Buffer overflow prevention  

- **JBE / JNA → Jump if Below or Equal**
  - Safe access in arrays (`index <= length`)
  - Input range validation  

---

## 3. Signed Comparisons (SF, OF)

- **JG / JNLE → Jump if Greater**
  - Sorting algorithms
  - Positive growth checks (e.g. profit increase)  

- **JGE / JNL → Jump if Greater or Equal**
  - Physics/game coordinates (object right of origin)
  - Age or salary threshold checks  

- **JL / JNGE → Jump if Less**
  - Negative values (temperature < 0)
  - Error codes < 0  

- **JLE / JNG → Jump if Less or Equal**
  - Loop termination with signed counters
  - Constraints (`balance <= 0`)  

---

## 4. Based on Sign Flag (SF)

- **JS → Jump if Sign (negative)**
  - Check for negative return values (errors)
  - Physics/game movement in negative direction  

- **JNS → Jump if Not Sign (positive/zero)**
  - Validate positive user input
  - Ensure only positive balances  

---

## 5. Based on Carry Flag (CF)

- **JC → Jump if Carry**
  - Multi-precision arithmetic (big integers, cryptography)
  - Unsigned overflow detection  

- **JNC → Jump if No Carry**
  - Continue safe arithmetic
  - Optimized addition in checksums  

---

## 6. Based on Overflow Flag (OF)

- **JO → Jump if Overflow**
  - Detect signed integer overflow
  - Prevent financial miscalculations  

- **JNO → Jump if No Overflow**
  - Continue only if safe arithmetic
  - Security checks for overflow-based exploits  

---

## 7. Based on Parity Flag (PF)

- **JP / JPE → Jump if Parity Even**
  - Parity bit validation in communication systems
  - Error detection in RAM / UART  

- **JNP / JPO → Jump if Parity Odd**
  - Cryptography algorithms (bit parity)
  - Serial port error checking  

---

## Summary

- **JE/JNE** → equality checks (passwords, loops)  
- **JA/JB** → unsigned comparisons (arrays, sizes, bounds checking)  
- **JG/JL** → signed comparisons (sorting, signed values like temperatures)  
- **JS/JNS** → negative vs positive values (errors, physics)  
- **JC/JNC** → carry flag (big integer math, crypto)  
- **JO/JNO** → overflow detection (security, finance)  
- **JP/JNP** → parity checks (data transmission, error detection)  
