+++

title = ""
template = "notes.html"
description = ""
draft: true

+++

Nice work! You’ve implemented a min-heap in JavaScript, and that’s no small feat (although it could efficiently track the smallest feat).

To recap: MinHeap tracks the minimum element as the element at index 1 within an internal Javascript array.

When adding elements, we use .bubbleUp() to compare the new element with its parent, making swaps if it violates the heap condition: children must be greater than their parents.

When removing the minimum element, we swap it with the last element in the heap. Then we use .heapify() to compare the new root with its children, swapping with the smaller child if necessary.

Heaps are useful because they’re efficient in maintaining their heap condition. Building a heap using elements that decrease in value would ensure that we continually violate the heap condition. How many swaps would that cause?