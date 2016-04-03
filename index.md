---
title       : Swiss dataset pitch
subtitle    : Web application for data
author      : Alexandre Nanchen
job         : 
framework   : html5slides   # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## &nbsp;

<div id="outer" style="position:relative; top:-175px">  
    <h1>Swiss dataset pitch</h1>
    <hr>
    <h3>Web application for data</h3>
    <h4>Alexandre Nanchen</h4>
</div>

--- .class 

## Motivations

1. Data exploration
2. Data visualization
3. Reproducibility

<img style="margin-left:100px;" src="images/data-science-small.jpg">

---

## Constraints

1. Public sharing
   - RPubs
   - Git hub
   - shinyapps.io
   - Own web site
2. Easy updates
3. Multiple data views 

---

### Swiss data set

1. Swiss Fertility and Socioeconomic Indicators (1888) Data
2. The data collected are for 47 French-speaking “provinces” at about 1888.
3. Here, all variables are scaled to [0, 100], where in the original, all but "Catholic" were scaled to [0, 1].
4. Some variables (more to be found on the web app)


```
##              Fertility Agriculture Examination Education
## Courtelary        80.2        17.0          15        12
## Delemont          83.1        45.1           6         9
## Franches-Mnt      92.5        39.7           5         5
## Moutier           85.8        36.5          12         7
## Neuveville        76.9        43.5          17        15
```

---

### Swiss data web app

1. One screen web application
2. Functionalities
   - Variable exploration
   - Linear fitting exploration
3. [Swiss data web application](https://alexnanchen.shinyapps.io/swissdatawebapp/)

