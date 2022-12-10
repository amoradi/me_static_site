+++

title = "Introduction to Statistics and Probability"
template = "notes.html"
description = ""

+++

## Chapter 1: Data Collection and Classification

## 1.1 The Basic of Statistics
**Statistics**
The science of collecting, organizing, analyzing, and interpreting data to make decisions.

An **individual** refers to a person or object of interest. The collecton of all individuals to be studied is called a **population**. A **sample** is a subset of the population being studied.

A **parameter** is a numerical summary of a **population**.
A **statistic** is a numerical summary of a **sample**.

**Inferential Statistics** 
Is the process of taking a result from a sample and extending it to the population sampled from while measuring the reliability of the result.

It is often the case that time, money, and resources limit the ability of a researcher to collect data. In these cases, the researcher might consider sampling from the population.

**Descriptive Statistcs**
Involves the organizing and summarizing of data. Some common tools in the process are tables, graphs, and numberical summaries.

It is a very important aspect of research, as it allows us to get an overview of what the data is telling us.

## The Process of Statistics
- Identify the research objective.
- Collect the information needed to answer the research objective.
- Describe the data.
- Perform inference.
- Measure the reliability of the inference.

## 1.2 Data Classification
**Qualitative (or categorical) variables** are variables whose possible values represent 
categories, labels, etc. that are not numerical measures of counts.

**Quantitative variables** are variables whose possible values are numerical measurements or counts.

A variable is at the **nominal level of measurement** if the possible values of the variable represent names, labels, or categories that don't have a meaningful rank or order.

A variable is at the **ordinal level of measurement** if the possible values of the variable represent names, labels, or categories and have a meaningufl rank or order.

When the value of zero means the absence of the quantity, we have an **inherent zero**.

A variable is at the **interval level measurement** if the values of variable:
- Have a meaningful order
- Meaningful difference between values
- A value of zero does not mean the absence of the quantity. In this case, we say that the value of zero is not an **inherent zero**.

A variable is at the **ratio level of measurement** if the values of the variable:
- Have a meaningful order,
- Meaningful difference between values,
- The value of zero is an **inherent zero**.

A quantitative variable is **discrete** if its possible values can be listed. Data only takes certain values. Commonly in the form of whole numbers or integerss, this is data that can be counted and has a finite number of values. These values are unable to be broken down into smaller parts.

A quantitative variable is **continuous** if its possible values cannot be listed. This data can be measured, values are not fixed and have an infinite number of possible values. These measurements can also be broken down into smaller individual parts.

<img style="padding: 30px 0; width: 600px;" src="/images/variable_classification.png"> 

## 1.3 Simple Random Sampling

**Frame**: a list of all individuals.

**Simple random sampling** occurs when every sample of size n from a population of size N is equally likely to be selected.

**Sampling with replacement** occurs when each individual selected from the population is put back in the population before the next selection (and so could be potentially included in the sample more than once.)

**Sampling without replacement** occurs when each individual selected from the population is removed from the population before the next selection so that the individual cannot be included in the sample more than once.

## 1.4 Other Sampling Methods

**Convenience sampling** is a sampling technique where subjects are selected because of their convenient accessibility to the researcher.

This sampling technique is very popular because it is fast, inexpensive, and easy to do. Unfortunately, studies that use convenience sampling generally cannot be trusted.

**Stratified sampling** is a sampling technique where the population is separated into disjoint (non-overlapping) groups called **strata**, and then a **simple random sample from each stratum** is obtained.

**Cluster sampling** is a sampling technique where the population is separated into disjoint groups, **a simple random sample of groups are selected**, and, **every individual or a random sample of individuals** within the **selected groups** are observed.

**Systematic sampling** is a sampling technique where every kth individual in the population is selected after some random start. Usually, the random start is determined by selecting a random number between 1 and k.

## 1.5 Sample Bias

If the sample is not representative of the population, then the sample has **bias**...if the sampling technique used **tends to favor one part of the population over another**, then we have **sampling bias**.

**Nonresponse bias** occurs when individuals in the sample do not respond to the survey.

**Response bias** occurs when the response of an individual in the sample does not reflect the true feelings of the individual. 

## Chapter 2: Graphical Displays of Data

## 2.1 Organizing Qualitative Data

A **frequency distribution** is a table that lists each category of data and shows the number of obervations in each category.

Each category of data is referred to as a **class**.

The **class frequency** is the number of observations that fall into that class. The **relative class frequency** is the proportion of observations that fall into that class.

A **relative frequency distribution** is a table that lists each category of data and shows the proportion of observations in each category.

Note: The sum of the relative frequencies in a relative frequency distribution must add to 1. However, in practice, this may not be the case due to rounding errors. Again, the order in which the classes are listed, the spaciing, the scaling, and the use of any colors is up to the researcher.

A **frequency bar graph** is constructed by labeling each category of data on either the horizontal or vertical axis, and its frequency on the other axis. Bars of equal width are drawn for each category, and the height of each bar represents the category's frequency.

A **relative frequency bar graph** is constructed by labeling each category of data on either the horizontal or vertical axis, and its relaitve frequency on the other axis. Bars of equal width are drawn for each category, and the height of each bar represents the category's relative frequency.

If one orders bars by decreasing height, we have what is called a **Pareto chart**.

The angle of a class sector in a pie chart, is obtained by mulitplynig 360 degrees by the relative class frequency.

## 2.2 Organizing Quantitative Data

First, determine if the data is discrete or continuous. **If the data is discrete** and there **are not too many different values**, **treat each observed data value as a class**. If the data is discrete, but there are **many different values**, then **categories of data should be created** by using **intervals of numbers as the classes**.

In the case that the data is continuous, then **categories of data** should be created **using intervals**.

A **frequency distribution** is a table that lists each category (class) of data and shows the number of observations in each category.

Guildine: Generally, there should be between 5 classes (for smaller data sets) and 200 classes (for larger data sets).

Each class has a **lower class limit**, which is the least number that can belong to the classs, and an **upper class limit**, which is the greatest number that can belong to the class. The average of the upper class limit and lower class limit is called the **class midpoint**. The **class width** is the **difference between two consectutive lower class limits**, and **should be the same for all classes**.

Usually, introductory statistics textbooks only address the above terms when dealing with continuous data.

Class boundaries (**lower and upper class boundaries**) coincide with the midpoints found by averaging each upper class limit with its right neighboring lower class limit. They are the endpoints of touching intervals. Typically, adding and substracting .5, .05, or .005 from the upper/lower class limits repsectively will do the trick.

For example classes, 2-4, 5-7, 8-10. Have lower class boundaries of 1.5, 4.5, 7.5 and upper class boundaries of, 4.5, 7.5, 10.5.

Limits = inclusive
Boundaries = exclusive

**Class frequency** is the number of observations that fall into that class.
**Relative class frequency** is the proportion of observations that fall into that classs.

A **relative frequency distribution** is a table that lists each category of data and shows the proportion of observations in each category.

A **histogram** is similar to a bar graph, except that the rectangles in histograms touch, while the bars in bar graphs do not touch. When the vertical scale measures the frequencies of the classes, we have a **frequency histogram**. When the vertical scale measures the relative frequencies of the classes, we have a **relative frequency historgram**.

## 2.3 Additional Displays of Quantitative Data

The **cumulative frequency** of a class is the sum of the frequency of that class and the frequencies of all previous classes.

The **cumulative relative frequency** of a class is the sum of the relative frequency of that class and the relative frequencies of all previous classes.

A **dot plot** is a graphical display of data drawn by placing each observation horizontally on a number line and placing a dot above the observation for each time it is observed.

In a **stem and leaf plot**, each number is separated into a **stem** (digits left of the rightmost digit) and a **leaf** (the rightmost digit). Stems are written in a single vertical column, and a vertical bar to the right of that column is drawn, and each leaf is written to the right of the vertical bar in the row corresponding to its stem.

```
// e.g. 
10.2 -> 10 (stem) | 2 (leaf)
112 -> 11 (stem) | 2 (leaf)
```

## 2.4 Shapes of Distributions

A frequency distribution is **symmetric** when a vertical line can be drawn through the middle of the graph of the distribution, and the resulting halves are mirror images of each other.

A frequency distribution is **uniform** when all classes in the distribution have equal frequencies. A frequency distribution that is shaped like a bell is called **bell-shaped**.

(single peak assumed)
**Skewed left (negatively skewed)**: left tail is longer than right tail.
**Skewed right (positively skewed)**: right tail is longer than left tail.

**Qualitative data** is **not** described as uniform, bell-shaped, or skewed, **since the order** in which the classes are displayed is **arbitrary**. We only use these terms to describe quantitative data.

Data will probably not perfectly match one of the four descriptions, so we use "approximately" symmetric/uniform/etc. to describe.

The **shape of the distribution** is often times **subjective** (especially since changing the class width and number of classes used in a frequency distribution can drastically change the shape of the histogram). The terms are introduced informally, not precisely, for the benefit of exposure to the terms.

**Bidmodal**: having two peaks.

For these notes, if a distribution is not unimodal, we will not attempt to classify the shape.

### Citation 
westcottcourses.com


