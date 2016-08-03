
### 1. In the slidify YAML text. Changing the framework from io2012 to shower does what?

### It changes the html5 framework thus changing the style of the slides.

### 2. You wrote R code in a slidify document as follows

```{r}
fit <- lm(y ~ x1 + x2 + x3)
summary(fit)
```
### If you want to hide the results of the CODEsummaryCODE statement (yet still have it
### run) what should you do?

### Add a results = 'hide' option in the {r} call of the code chunk

### 3. You wrote R code in a slidify document as follows

### ```{r}
### fit <- lm(y ~ x1 + x2 + x3)
### summary(fit)
### ```

### If you want to display the results, but not the actual code, what should you do?

### Add a echo = FALSE option in the {r} call of the code chunk

### 4. R studio presentation tool does what?

### Creates HTML5 slides using a generalized markdown format having an extention Rpres
### and creates reproducible presentations by embedding and running the R code from
### within the presentation document.

### 5. In Rstudio presenter, if you do not want the code to be evaluated, what option do
### you need to add to the {r} options?

### eval = FALSE

### 6. When presenting data analysis to a broad audience, which of the following should be done?

### Summarize the problem first. 
### OR
### Explain why each step was necessary.
