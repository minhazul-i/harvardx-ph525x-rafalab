# HarvardX PH525X: Biomedical Data Science Training, Series 1: Data Analysis for Life Sciences

This repository documents my progress, code exercises, and biomedical data science workflow completed as part of Harvard's PH525X series.

---

## Lessons & Exercises

### Statistics and R
#### Week 1: R
##### Introduction to dplyr

* **Script:** `01_female-mice_weights.R`
* **Notes:** 
  * Used `read.csv()`, `filter()`, `select()`, pipe `%>%`, `unlist()`

#### Week 2: Random Variables and Central Limit Theorem
##### Random variables,Null hypothesis, P-value, Distribution, Empirical Cumulative Distributive Curve (ECDF), Histograms
* **Notes:**
* **Random Variable**
  * Let's say we have a population of 200 and randomly take a sample of 20 each time. Every time we randomly take 20 items, we may get a different sample, and therefore we may get a different sample mean each time. So the sample mean can be a random variable, because its value changes depending on the random sample we get.
 
* **Null Hypothesis**
  * The null hypothesis is basically the idea of “what if there is no effect?” For example, we see that some students have gained more weight and they also had better food. We might think: “The better food caused the increased weight.” 

But the null hypothesis asks: “What if the increased weight was not actually caused by the better food? What if the difference happened because of other factors or just by chance?”

So we use the null hypothesis as the no-effect/no-association explanation and see how compatible our observed result is with that assumption.

* **P-value**
* First, we observe an actual difference/effect. Then, assuming the null hypothesis is true, we ask: “If this difference was actually just due to chance, how often would we get a difference that is at least as large as the one we actually observed?”

For example, imagine we simulate/randomly generate results 10,000 times under the null hypothesis.

If 100 of those 10,000 results produce a difference that is equal to or more extreme than our actually observed difference:
p = 100/10,000 = 0.01 = 1%

The p-value is therefore the probability of getting a result at least as extreme as the observed result, assuming the null hypothesis is true.

So the smaller the p-value, the less frequently we would expect to see a result this extreme just by chance if the null hypothesis were true.


* **Syntax learned:** `sample()`, 
