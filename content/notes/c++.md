+++

title = "C++"
template = "notes.html"
description = ""
draft = false

+++

## Data Types


```
type    usage                   examples

int     int numbers             0, 400 
double  floating-point numbers  3.14, -200.0 
char    characters              'a', '@' 
string  sequence of characters  "hello world!" 
bool    truth values            true, false 
```

- `int` requires 4 bytes of memory, ranges from -2^31 to 2^31
- `double` requires 8 bytes of memory, sufficient for storing up to 15 decimal digits

**Type conversion**, "convert value to type" -> `(type) value`.

```c++
double a = 3.5;
int b = (int) a; // convert a double to an int
```

- `char` stores a single character surrounded by single quotes ' '
- `std::string` stores a sequence of characters surrounded by double quotes " "
- `bool` requires 1 byte of memory space


## Bitwise Operators

```c++
int x = 3;  // in bits: 0011
int y = 9;  // in bits: 1001

int z = x << 2; // z equals 12, in bits: 1100
z = y >> 1; // z equals 4, in bits: 0100
z = x | y;  // z equals 11, in bits: 1011
```

When a variable is declared, a free memory address is set aside for the purpose of storing the value inside that variable. C++ provides two powerful features that allow programmers to directly manipulate memory:

- References
- Pointers

## Reference

A **reference variable is an alias** to an existing variable. It is declared by using an ampersand **& after the type**.

```c++
int exam_grade = 85;
int& score = exam_grade; // a reference
```

When the value of `score` is changed, the value of `exam_grade` will also change in the same way.

- References must be initialized.
- References cannot be reassigned.

The **primary application for references in C++ is in function parameters**. Because the **reference parameter acts as an alias for the argument**, a function that uses a reference parameter is **able to modify the argument** passed in.


## Input/Output

`iostream`, which stands for “input/output stream”, is part of the C++ standard library that deals with basic input and output. 

```c++
// include the iostream header at the beginning of your program
#include <iostream>
```

`std::cout`, which stands for **“character output”**, is used together with the **insertion operator** `<<` to print values on the terminal:

```c++
std::cout << "Hello World!";
```

`std::endl`, which stands for **“end line”**, can also be used to achieve a new line. `\n` and `std::endl` are mostly interchangeable.

```c++
std::cout << "Hello World!" << std::endl;
std::cout << "C++ is fun" << std::endl;
```

`std::cin`, which stands for **“character input”**, can be used together with the **extraction operator** `>>` to read input from the user.

```c++
int x;
std::cin >> x;  //  get user input and store it in variable x
```

## Program Structure

```c++
#include <iostream>
using namespace std;

int main() {
  cout << "Hello, world!";
  return 0;
}
```

The above line is a **preprocessor directive**, a special type of statement that starts with the **# symbol** and is examined before actual compilation.

The `include` keyword is used here to import libraries.

- Standard library names must be enclosed in `< >`
- User-defined library names must be enclosed in `" "`

```c++
using namespace std;
```

The above line introduces the **namespace std** into the current program. This line allows the usage of standard library objects without prepending the `std::` identifier.


```c++
int main() {
```

This is the beginning of the main function. Every C++ program must have a main function in order to run.
