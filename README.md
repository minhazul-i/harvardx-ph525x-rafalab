## Learning Resources

This repository contains the documentation of my progress, code exercises, and biomedical data science workflow completed as part of Harvard's PH525X series. It follows the **HarvardX Biomedical Data Science** training and its accompanying PH525x materials. 

- **HarvardX Biomedical Data Science Open Online Training — Data Analysis for the Life Sciences**  
  https://rafalab.dfci.harvard.edu/pages/harvardx.html

- **PH525x Series — Biomedical Data Science (eBook)**  
  https://genomicsclass.github.io/book/

### Supplementary Resource

For a better understanding of the statistical concepts covered throughout the course, the relevant **StatQuest** playlist on Youtube is recommended to be followed alongside the PH525x lessons. They provide intuitive visual explanations that complement the course material.

- [Statquest - Statistics Fundamentals](https://youtube.com/playlist?list=PLblh5JKOoLUK0FLuzwntyYI10UQFUhsY9&si=RKTkDwssA0BTd3dP)
  
---

## Lessons & Exercises (Blend of the both resources)

### Statistics and R
---
#### Week 1: R
---
##### Introduction to dplyr

* **Script:** `01_female-mice_weights.R`
* **Notes:** 
  * Used `read.csv()`, `filter()`, `select()`, pipe `%>%`, `unlist()`


#### Week 2: Random Variables and Central Limit Theorem
---
##### Random variables,Null hypothesis, P-value, Distribution, Empirical Cumulative Distribution Function (ECDF), Histograms
* **Notes:**
* **Random Variable:** Let's say we have a population of 200 and randomly take a sample of 20 each time. Every time we randomly take 20 items, we may get a different sample, and therefore we may get a different sample mean each time. So the sample mean can be a random variable, because its value changes depending on the random sample we get.
 
* **Null Hypothesis:** The null hypothesis is basically the idea of “what if there is no effect?” For example, we see that some students have gained more weight and they also had better food. We might think: “The better food caused the increased weight.” 

But the null hypothesis asks: “What if the increased weight was not actually caused by the better food? What if the difference happened because of other factors or just by chance?”

So we use the null hypothesis as the no-effect/no-association explanation and see how compatible our observed result is with that assumption.

* **P-value:** First, we observe an actual difference/effect. Then, assuming the null hypothesis is true, we ask: “If this difference was actually just due to chance, how often would we get a difference that is at least as large as the one we actually observed?” (equal or greater than the observed)

For example, imagine we simulate/randomly generate results 10,000 times under the null hypothesis. If 100 of those 10,000 results produce a difference that is equal to or more extreme than our actually observed difference, then

`p = 100/10,000 = 0.01 = 1%`

The p-value is therefore the probability of getting a result at least as extreme as the observed result, assuming the null hypothesis is true. So the smaller the p-value, the less frequently we would expect to see a result this extreme just by chance if the null hypothesis were true.

* **Distribution:** A distribution is basically a compact description of many numbers. Instead of looking at a huge list of individual observations, we try to understand: How are the values spread across their possible range, and how frequently do different values occur?

* **Cumulative Distribution Function (CDF):** The CDF asks: “For a particular value a, what is the probability that X will be less than or equal to a?”

Mathematically:  `F(a) = P(X ≤ a)`

For example, if we have: 40, 60, 80, 90, 99 and ask: F(80)?

3 out of 5 observations are ≤ 80, therefore, F(80) = 3/5 = 0.6 

So, 60% of the observations are ≤ 80.

* **Empirical CDF (ECDF):** The ECDF does the same thing, but using our actual observed data.

So if: `marks <- c(40, 60, 80, 90, 99)`

`marksecdf <- ecdf(marks)`

then:

`marksecdf(80)` asks: “What proportion of the observed marks are ≤80?” and gives: `3/5 = 0.6 or 60%`

The ECDF itself isn't just one answer. It's basically a whole function/map that can answer the question for different cutoff values:

F(40) → 20%
F(60) → 40%
F(80) → 60%
F(90) → 80%
F(99) → 100%

ECDF takes our observed data and lets us find, for any given value, what proportion of the observations have a value less than or equal to it.

* **Histogram:** The ECDF asks: “What proportion of observations are ≤ this particular value?”

A histogram instead asks: “How are the observations distributed across intervals?”

For example:60–65, 65–70, 70–75, 75–80. These intervals are called bins.

The histogram shows how many observations fall into each bin, allowing us to see where the observations are concentrated or sparse and what the overall shape of the distribution looks like.

* **Normal Distribution:** A normal/Gaussian distribution is a bell-shaped distribution where values around the mean occur more frequently, and values become less frequent as we move away from the mean.

Mean (μ) determines the center/location of the curve, while standard deviation (σ) determines how spread out the curve is: small σ → narrower/taller, large σ → wider/flatter.

The area under the curve represents probability.

`pnorm(x, mean, sd)` gives the proportion/probability ≤ x.

For the probability > x: 
`1 - pnorm(x, mean, sd)`

For the probability between two values: 
`pnorm(upper, mean, sd) - pnorm(lower, mean, sd)`

This allows us to calculate probabilities from a normal distribution without having to simulate and count thousands of values. In hypothesis testing, if the null distribution is approximately normal, we can use its mean and SD with pnorm() to estimate tail probabilities/p-values.

Core idea: μ tells me where the distribution is, σ tells me how spread out it is, and pnorm() tells me how much probability lies to the left of a value.

* **Populations, Samples and Estimates:** A population is considered fixed, while the randomness comes from which individuals we sample from it. Population values are represented with lowercase letters (x1,...,xm), while random sample values are represented with uppercase letters (X1,...,Xm). Population parameters such as mean and SD describe the entire population and are usually unknown in practice. We therefore take a random sample and calculate statistics such as the sample mean , which estimates the population mean $\mu$. Because different random samples give different sample means, $\bar{X}$ is itself a random variable. Similarly, $\bar{Y} - \bar{X}$ is a random variable used to estimate the population difference $\mu_Y - \mu_X$. The Central Limit Theorem will allow us to mathematically describe the sampling distribution of these estimates.

* **Variance & Standard Deviation:** To measure spread, we calculate how far each observation is from the mean: $\mu$ or $\bar{x}$.
We square the differences so negative and positive deviations don't cancel each other out.

**Population variance**, $\sigma^2 = \frac{\sum (x-\mu)^2}{n}$

When **estimating population variance from a sample**, we use: $s^2 = \frac{\sum (x-\bar{x})^2}{n-1}$


We use \(n-1\) because the sample mean is estimated from the same data, which makes the deviations slightly smaller on average; the correction compensates for this.

**Standard deviation = square root of variance**, bringing the measurement back to the original units.



* **Central Limit Theorem & t-distribution**

**Central Limit Theorem:** If we repeatedly take random samples of a sufficiently large size and calculate their means, the distribution of those sample means becomes approximately normal. The sample means are centered around the population mean. The spread of the sample means is called the standard error (SE).

$$
SE = \frac{\sigma}{\sqrt{n}}
$$

So, larger sample → smaller SE → sample mean becomes more stable/precise.

**Standardizing the sample mean**

$$
\frac{\bar{X}-\mu}{\sigma/\sqrt{n}}
$$

- $\bar{X}-\mu$ = difference between the sample mean and population mean.
- $\sigma/\sqrt{n}$ = standard error.
- The whole expression tells us how many standard errors the sample mean is away from the population mean.

By the CLT, this is approximately:

$$
N(0,1)
$$

This means a normal distribution with mean 0 and SD 1.

**Difference between two sample means**

When comparing two independent groups:

$$
\bar{Y}-\bar{X}
$$

The uncertainty comes from both groups, so their variances add:

$$
SE(\bar{Y}-\bar{X}) = \sqrt{\frac{\sigma_Y^2}{N}+\frac{\sigma_X^2}{M}}
$$


Under the null hypothesis:

$$
H_0:\mu_Y-\mu_X=0
$$

the sampling distribution of the difference is centered around 0.

We can standardize the observed difference and use the normal distribution to calculate a p-value.

But we don't know $\sigma$...

Usually we don't know the true population SD $\sigma$, so we estimate it from the sample.

First, we calculate the sample variance:

$$
s^2=\frac{\sum_{i=1}^{n}(X_i-\bar{X})^2}{n-1}
$$

Then take the square root to get the sample SD:

$$
s=\sqrt{s^2}
$$

So:

- $\sigma$ = population SD
- $\sigma^2$ = population variance
- $s$ = sample SD
- $s^2$ = sample variance

Because $s$ is estimated from the sample and therefore varies from sample to sample, replacing $\sigma$ with $s$ introduces extra uncertainty.

**Why does this create the t-distribution?**

With a known population SD:

$$
\frac{\bar{X}-\mu}{\sigma/\sqrt{n}}
$$

follows the standard normal distribution approximately.

But when we use $s$ instead of $\sigma$:

$$
\frac{\bar{X}-\mu}{s/\sqrt{n}}
$$

the denominator itself can vary.

Sometimes $s$ happens to be smaller than the true $\sigma$. A smaller denominator can make the whole ratio unusually large.

For example:

$$
\frac{2}{1}=2
$$

but:

$$
\frac{2}{0.5}=4
$$

Because this can happen, the t-distribution has heavier tails than the normal distribution.

Heavier tails = more probability of getting extreme values.

So the t-distribution accounts for the extra uncertainty caused by estimating the population SD from the sample.

- Particularly useful for smaller samples.
- The theoretical t-distribution result assumes the original observations/population are normally distributed.
- As sample size increases, $s$ becomes a better estimate of $\sigma$, the extra uncertainty decreases, and the t-distribution approaches the standard normal distribution.

**QQ plot:** A QQ plot compares the observed values in your data with the values we would expect from a theoretical distribution, such as a normal distribution.

- If the points lie roughly along the straight diagonal line representing the theoretical distribution, the data are reasonably close to that distribution.
- If the points deviate substantially from the line, the data may not follow that distribution well.

* **Main takeaway**

CLT: Sample means become approximately normal when the sample size is sufficiently large.

SE: Tells me how much sample means vary from sample to sample.

t-distribution: Accounts for the extra uncertainty when the population SD is unknown and estimated from the sample.

Heavier tails: The t-distribution has more probability in the extreme regions because estimating the SD introduces additional uncertainty.

