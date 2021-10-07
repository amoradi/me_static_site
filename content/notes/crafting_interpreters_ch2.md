+++

title = "Crafting Interpreters, Ch. 2"
template = "notes.html"
description = "A Map of the Territory"

+++

## Why Learn This Stuff?

- “little languages” are everywhere. json, HTML, XML etc.
  - Almost every large software project needs a handful of these. When you can, it’s good to reuse an existing one instead of rolling your own
  - there’s still a good chance you’ll find yourself needing to whip up a parser or other tool when there isn’t an existing library that fits your needs
  - inevitably end up needing to debug and maintain it and poke around in its guts.
- Languages are great exercise
  - Long distance runners sometimes train with weights strapped to their ankles or at high altitudes where the atmosphere is thin. When they later unburden themselves, the new relative ease of light limbs and oxygen-rich air enables them to run farther and faster.
  - **Implementing a language is a real test of programming skill.**
    - The code is complex and performance critical.
    - You must master recursion, dynamic arrays, trees, graphs, and hash tables.
    - You probably use hash tables at least in your day-to-day programming, but do you really understand them?

## The First Interpreter

We’ll write our first interpreter, jlox, in Java. The focus is on concepts. We’ll write the simplest, cleanest code we can to correctly implement the semantics of the language. 

Java is a great language for this. It’s high level enough that we don’t get overwhelmed by fiddly implementation details, but it’s still pretty explicit. Unlike in scripting languages, there tends to be less complex machinery hiding under the hood.

I also chose Java specifically because it is an object-oriented language. While academic language folks sometimes look down on object-oriented languages, the reality is that they are widely used even for language work. GCC and LLVM are written in C++, as are most JavaScript virtual machines. Object-oriented languages are ubiquitous, and the tools and compilers for a language are often written in the same language.

By the end of part II, we’ll have a simple, readable implementation. It’s not very fast, but it’s correct.

## The Second Interpreter

So in the next part, we start all over again, but this time in C. C is the perfect language for understanding how an implementation really works, all the way down to the bytes in memory and the code flowing through the CPU.

A big reason that we’re using C is so I can show you things C is particularly good at, but that does mean you’ll need to be pretty comfortable with it.

If you aren’t there yet, pick up an introductory book on C and chew through it, then come back here when you’re done. In return, you’ll come away from this book an even stronger C programmer. That’s useful given how many language implementations are written in C: Lua, CPython, and Ruby’s MRI, to name a few.

**In our C interpreter, clox, we are forced to implement for ourselves all the things Java gave us for free.** We’ll write **our own dynamic array and hash table.** We’ll decide how objects are represented in memory, and build a **garbage collector** to reclaim them.

**Our Java implementation was focused on being correct**. Now that we have that down, **we’ll turn to also being fast.** 

We’ll even try our hand at benchmarking and optimization. **By the end, we’ll have a robust, accurate, fast interpreter for our language**, able to keep up with other professional caliber implementations out there.

## Parts of a Language

Engineers have been building programming languages since the Dark Ages of computing. As soon as we could talk to computers, we discovered doing so was too hard, and we enlisted their help. I find it fascinating that even though today’s machines are literally a million times faster and have orders of magnitude more storage, the way we build programming languages is virtually unchanged.

Though the area explored by language designers is vast, the trails they’ve carved through it are few. Not every language takes the exact same path—some take a shortcut or two—but otherwise they are reassuringly similar.

Steps:
- Scanning
- Tokens
- Parsing
- Syntax Tree
- Analysis
- Intermediate Representation
- Code Generation
- High-level language, Bytecode, Machine Code

### Scanning

AKA **lexing**, or **lexical analysis**. A scanner or lexer, takes in a linear stream of characters and chunks them together into a series of something akin to "words". Each word is called a **token**.

White space, comments and other characters are ignored or often ignored.

`var` `avg` `=` `(` `min` `+` `max` `)` `/` `2` `;`

### Parsing

The next step is parsing. This is where our syntax gets a grammar. 

Did you ever diagram sentences in English class? If so, you’ve done what a parser does, except that English has thousands and thousands of “keywords” and an overflowing cornucopia of ambiguity. Programming languages are much simpler.

**A parser takes the flat sequence of tokens and builds a tree structure that mirrors the nested nature of the grammar.** These trees have a couple of different names—**parse tree** or **abstract syntax tree**.

Parsing has a long, rich history in computer science that is closely tied to the artificial intelligence community. **Many of the techniques used today to parse programming languages were originally conceived to parse human languages** by AI researchers who were trying to get computers to talk to us.

It turns out human languages were too messy for the rigid grammars those parsers could handle, but they were a perfect fit for the simpler artificial grammars of programming languages

...still we manage to use those simple grammars incorrectly, so the **parser’s job also includes letting us know when we do by reporting syntax errors.**

### Static Analysis

**The first two stages are pretty similar across all implementations.** Now, the individual characteristics of each language start coming into play. **At this point, we know the syntactic structure of the code**—things like which expressions are nested in which—but **we don’t know much more than that.**

The **first bit of analysis** that most languages do is called **binding or resolution**: **For each identifier**, we find out **where** that name is defined and **wire the two together**. This is where **scope** comes into play.

If the language is **statically typed**, **this is when we type check**. Once we know where a and b are declared, we can also figure out their types. Then if those types don’t support being added to each other, **we report a type error.**

Now, with a sweeping view of the user’s program, we need to store it somewhere:

- stored right back **as attributes on the syntax tree itself**—extra fields in the nodes that aren’t initialized during parsing but get filled in later.
- in a lookup table off to the side, a **symbol table**
- into an entirely new data structure that more directly expresses the semantics of the code

Up to this point is considererd the **front end** of the implementation. Next are the **middle end** and **back end**.

### Intermediate Representations

The front end of the pipeline is specific to the source language the program is written in. The back end is concerned with the final architecture where the program will run.

In the middle, the code may be stored in some **intermediate representation (IR)** that isn’t tightly tied to either the source or destination forms (hence “intermediate”).

- better cross-compilation ability. write one front end and N back ends per target. Vs, writing N compilers for each source-target combo.

- Intermediate representation also gives us better opportunity for optimization.

### Optimization

Once we understand what the user’s program means, we are free to swap it out with a different program that has the same semantics but implements them more efficiently—we can optimize it.

A simple example is constant folding: if some expression always evaluates to the exact same value, we can do the evaluation at compile time and replace the code for the expression with its result.

```
pennyArea = 3.14159 * (0.75 / 2) * (0.75 / 2);
```

we could do all of that arithmetic in the compiler and change the code to:

```
pennyArea = 0.4417860938;
```

Optimization is a huge part of the programming language business. Many language hackers spend their entire careers here, squeezing every drop of performance they can out of their compilers to get their benchmarks a fraction of a percent faster.

**We’re mostly going to hop over that rathole in this book.** Many successful languages have surprisingly few compile-time optimizations.


### Code Generation

We have applied all of the optimizations we can think of to the user’s program. The last step is converting it to a form the machine can actually run: primitive assembly-like instructions a CPU runs and not the kind of “source code” a human might want to read.

Finally, we are in the **back end**.

From here on out, our representation of the **code becomes more and more primitive**, like evolution run in reverse, as we get **closer to something our simple-minded machine can understand**.

We have a decision to make. Do we **generate instructions for a real CPU or a virtual one?**

Martin Richards and Niklaus Wirth, of BCPL and Pascal fame, respectively, made their compilers produce virtual machine code. Instead of instructions for some real chip, **they produced code for a hypothetical, idealized machine**. Wirth called this p-code for portable, but today, we generally call it **bytecode**. 

These synthetic instructions are designed to **map a little more closely to the language’s semantics, and not be so tied to the peculiarities of any one computer architecture** and its accumulated historical cruft. You can think of it **like a dense, binary encoding** of the language’s low-level operations.

### Virtual Machine

If your compiler produces bytecode, **your work isn’t over** once that’s done. **Since there is no chip that speaks that bytecode**, it’s your job to translate.

Again, you have two options. **You can write a little mini-compiler for each target architecture** that **converts the bytecode to native code for that machine**. You still have to do work for each chip you support, but this last stage is pretty simple and you get to reuse the rest of the compiler pipeline across all of the machines you support. You’re **basically using your bytecode as an intermediate representation.**

**Or you can write a virtual machine (VM)**, **a program that emulates a hypothetical chip** supporting your virtual architecture at runtime. **Running bytecode in a VM is slower than translating it to native code ahead of time because every instruction must be simulated at runtime each time it executes**. **In return, you get simplicity and portability**. **Implement your VM in, say, C, and you can run your language on any platform that has a C compiler**. This is how the second interpreter we build in this book works.

### Runtime

We have finally hammered the user’s program into a form that **we can execute**. 

- compiled to machine code, we simply tell the operating system to load the executable and off it goes
- compiled to bytecode, we need to start up the VM and load the program into that.

In both cases, we usually need some services that our language provides while the program is running.

- if the language automatically manages memory, we need a garbage collector going in order to reclaim unused bits
- If our language supports “instance of” tests so you can see what kind of object you have, then we need some representation to keep track of the type of each object during execution.

All of this stuff is going at runtime, so it’s called, appropriately, the **runtime**.

- In a fully compiled language, the code implementing the runtime gets inserted directly into the resulting executable. In, say, Go, each compiled application has its own copy of Go’s runtime directly embedded in it.
- If the language is run inside an interpreter or VM, then the runtime lives there. This is how most implementations of languages like Java, Python, and JavaScript work.

## Shortcuts and Alernative Routes


### Single-pass Compilers
Some simple compilers **interleave parsing, analysis, and code generation so that they produce output code directly in the parser**. These single-pass compilers restrict the design of the language. You have no intermediate data structures to store global information about the program, and you don’t revisit any previously parsed part of the code. **That means as soon as you see some expression, you need to know enough to correctly compile it.**

**Pascal and C were designed around this limitation.** At the time, memory was so precious that a compiler might not even be able to hold an entire source file in memory, much less the whole program. This is why Pascal’s grammar requires type declarations to appear first in a block. It’s why in C you can’t call a function above the code that defines it unless you have an explicit forward declaration that tells the compiler what it needs to know to generate code for a call to the later function.

### Tree-walk Interpreters

Some programming languages begin executing code right after parsing it to an AST (with maybe a bit of static analysis applied).

### Transpilers

You write a front end for your language. Then, in the back end, instead of doing all the work to lower the semantics to some primitive target language, you produce a string of valid source code for some other language that’s about as high level as yours. 

They used to call this a **source-to-source compiler** or a **transcompiler**. After the rise of languages that compile to JavaScript in order to run in the browser, they’ve affected the hipster sobriquet **transpiler**.

After the viral spread of UNIX to machines various and sundry, there began a long tradition of compilers that produced C as their output language. C compilers were available everywhere UNIX was and produced efficient code, so targeting C was a good way to get your language running on a lot of architectures.

Web browsers are the “machines” of today, and their “machine code” is JavaScript, so these days it seems almost every language out there has a compiler that targets JS since that’s the main way to get your code running in a browser.

The front end—scanner and parser—of a transpiler looks like other compilers. Then, if the source language is only a simple syntactic skin over the target language, it may skip analysis entirely and go straight to outputting the analogous syntax in the destination language.

If the two languages are more semantically different, you’ll see more of the typical phases of a full compiler including analysis and possibly even optimization. Then, when it comes to code generation, instead of outputting some binary language like machine code, you produce a string of grammatically correct source (well, destination) code in the target language.

Either way, you then run that resulting code through the output language’s existing compilation pipeline, and you’re good to go.

### Just-in-time Compilation

This last one is less a shortcut and more a dangerous alpine scramble best reserved for experts. **The fastest way to execute code is by compiling it to machine code**, but you might not know what architecture your end user’s machine supports. What to do?

**On the end user’s machine, when the program is loaded—either from source in the case of JS, or platform-independent bytecode for the JVM and CLR—you compile it to native code for the architecture their computer supports**. Naturally enough, this is called **just-in-time compilation**. Most hackers just say **“JIT”**, pronounced like it rhymes with “fit”.

The most sophisticated JITs insert profiling hooks into the generated code to see which regions are most performance critical and what kind of data is flowing through them. Then, over time, they will automatically recompile those hot spots with more advanced optimizations.

## Compilers and Interpreters

What’s the difference between a compiler and an interpreter?

It turns out this is like asking the difference between a fruit and a vegetable. That seems like a binary either-or choice, but actually **“fruit” is a botanical term** and **“vegetable” is culinary**.

- **Compiling** is an implementation technique that involves translating a source language to some other—usually lower-level—form. 
- **compiler**: it translates source code to some other form but doesn’t execute it. The user has to take the resulting output and run it themselves.
- **interpreter**: takes in source code and executes it immediately. It runs programs “from source”.
- **CPython** When you run your Python program using it, the code is parsed and converted to an internal bytecode format, which is then executed inside the VM. From the user’s perspective, this is clearly an interpreter—they run their program from source. But if you look under CPython’s scaly skin, you’ll see that there is definitely some compiling going on. The answer is that it is both. CPython is an interpreter, and it has a compiler.

