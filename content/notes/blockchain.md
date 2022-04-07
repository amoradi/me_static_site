+++

title = "Blockchain Basics"
template = "notes.html"
description = ""
draft = false

+++

## Overview

- The page is what we call a **Block**.
- Date time provided on screen B is what we call the **timestamp** of the block.
- Number X is known as a **nonce**. It is **the number that the nodes of the blockchain network try to find** to reach the output **number that respects the rule given by the wall**.
- The process of finding number X is called **mining**.
- The rule given by the wall is called a **hash function**.
- We will see what the **reference number** is, in later sections.

## Hash Function

A **hash function** is a mathematical function that **transforms** any chain of characters or numbers **into a fixed-length chain of characters**. It turns data into a digital fingerprint called a hash.

**SHA** stands for **Secure Hash Algorithm** and is a set of cryptographic hash functions designed by the US National Security Agency. **SHA-256** means that it is a hash function **producing a 256-bit-long** output.

## Why Work?
Now, why should every villager try to find number X since somebody is going to find it anyway and tell everyone else? **Why should a villager spend time and effort to have his/her page validated** and displayed on the wall?

We introduce here the **incentive mechanism**, an **economic payoff for the community to play fair**. Because the pages should keep being sealed to keep the transactions accurate, **the community should continuously work on solving the mathematical problem**. In this manner, **a reward is given to the villager who finds number X**, that is, the **first villager to find the correct hash of the page**.

This incentive mechanism ensures that everyone keeps interested in working for the common good.

## Reference Number

So, what is the reference number? Remember that, on page #1, the reference number was 0?

For page #2, it will be 0031993. Exactly! The reference number of page #2 is the output number found for the previous page. In technical terms, we call it **the previous hash** or the hash value of the previous block. **This allows the pages to be linked with one another**, or to be **chained to one another**.