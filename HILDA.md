
# HILDA

Le variabili di Interesse sono edhigh1 (education) e jbmo62 (occupation). 
Come vedi ci sono relativamente pochi immigrati. 
Ti ho inviato un'extraction del pannello (xwaveid e wave). Ci sono 12 osservazioni al massimo ma come vedrai non per tutti.
I salari sono wscei (current weekly wage) e wsfei (Financial year wage) 

Covariates:
ancob: Country of birth
yrivwfst: year first interview
yrivwlst: year last interview
hh*: household...
edcqtyp: Currently studying full or part time
esdtl: Labour force status - detail
esempst: Current employment status
jb*: job... (jbmo62)
helth: Long term health condition
fmfsch: How much schooling father completed
fmmsch: How much schooling mother completed
anlote: Speak language other than English
aneab: How well speaks English
anyoa: Year first came to Australia to live (no anyoan)
anpappn: Australian visa - Primary applicant
anengfn: Is English the first language you learned to speak as a child
edcoqn: Country completed highest education
rtcompn: Retired completely from the workforce
rtyrn: Year retired
jbmoccs: occupational status scale, current main job
tcr: Number of own resident children
tcnr: Number of own non-resident children
hhyng: Age of youngest person in household
hhold: Age of oldest person in household
anmigc: Migration category when you or your family first arrived in Australia: **mostly missings**
fmnsib: How many siblings
edqenr: Ever enrolled in a course of study to obtain a qualification
edcoq: Country completed highest qualification
hgage: Age last birthday at June 30 2012
ehtse: Time since FT (full-time) education - years
## Data

* Load the data and make some home cleaning (details omitted).


* Create the variable wages_perc: percentile of salary specific to each job [details omitted].


## Models suggested by Max:

1. wage = costant + demographics + experience(age-anni scuola) + caract.employer(if available) + location + e
2. participation (0=no,1=yes) = costant + demographics + education + young children + wealth + e

### Variables

* wscei: weekly wage ---> replaced with wsfei (annual wage)
~
* ancob  [immigrato o no] --> replaced with ancob3: 3 categories: au, anglo, others
* edcoq  [education in au]
* edqenr [qualifica in au]
* fmfo61 and/or fmmo61 [figlio di operai]
...controlli...
* aneab [conoscenze inglese: missings born in au replaced with 1:very well]
* anyoa [year of arrival]. For non-migrants, replace with 2012-age_2012
* edagels o edhigh1 [years of education] ---> used edhigh1
* esdtl [participation to labour market]
* hgage [age]
* hgsex [sex]
* marital status [mrcurr]
* hhmsr o hhstate [location]
* jbmo62 [occupation]
* jbmwpsz [no employees]
* jbocct [tenure current job]
* ehtse [years since studying FT]

### Analyses 

In fit26, we fit the number of hours worked against several covs.
In the next analyses, we will fit identical models with different dependent variables: 
1. fit27: wsfei (annual salary); 
2. fit27weekly: wscei (weekly salary); 
3. fit27hrwage: hrw (hourly salary) 
4. fit28: wage_perc (the annual salary is transformed into the percentile specific to the subject's occupation).
5. In the third fit (fit29), we add the random effects over the subjects (the fit fails when using the annual salary as dependent variable, but succesfully converge with wages_perc).


```r
library(mgcv)
```

```
Loading required package: nlme
This is mgcv 1.8-6. For overview type 'help("mgcv-package")'.
```

```r
x2=x[x$jbhru>=0 & x$jbhru<100,]
model26=(jbhru ~ s(wave) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit26 = gam(model26, data=x2)
anova(fit26)
```

```

Family: gaussian 
Link function: identity 

Formula:
jbhru ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df         F  p-value
sex      1   945.767  < 2e-16
ancob3   2     2.386   0.0920
edhigh1  7    20.386  < 2e-16
jbmo62  49   107.612  < 2e-16
edcoq   68     2.990 2.17e-15
edqenr   1    42.964 5.61e-11
fmfo61  12    11.598  < 2e-16
fmmo61  11     6.480 7.06e-11
esdtl    1 91038.321  < 2e-16
mrcurr   7     6.261 2.32e-07
hhstate  8    22.282  < 2e-16
jbmwpsz 12     6.067 9.65e-11
jbocct   1   162.884  < 2e-16
aneab    1     6.320   0.0119

Approximate significance of smooth terms:
           edf Ref.df      F  p-value
s(wave)  1.000  1.000  57.02 4.36e-14
s(hgage) 8.944  8.998 223.23  < 2e-16
```

```r
plot(fit26,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit26-1.png) 

There is no indication of any effect of the global crisis on the number of hours worked per week.


```r
library(mgcv)
model27=(log(wsfei) ~ s(wave) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27 = gam(model27, data=x)
anova(fit27)
```

```

Family: gaussian 
Link function: identity 

Formula:
log(wsfei) ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1   92.551  < 2e-16
ancob3   2   12.154 5.28e-06
edhigh1  7   16.592  < 2e-16
jbmo62  49  102.987  < 2e-16
edcoq   69    2.530 4.32e-11
edqenr   1    3.848 0.049794
fmfo61  12    4.584 1.82e-07
fmmo61  11    3.303 0.000149
esdtl    2  806.216  < 2e-16
mrcurr   7    9.180 2.14e-11
hhstate  8    7.983 8.17e-11
jbmwpsz 12 1323.429  < 2e-16
jbocct   1   16.252 5.55e-05
aneab    1    7.588 0.005878

Approximate significance of smooth terms:
           edf Ref.df      F p-value
s(wave)  8.871  8.990  34.67  <2e-16
s(hgage) 8.756  8.962 238.04  <2e-16
```

```r
plot(fit27,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27-1.png) 


```r
library(mgcv)
model27bis=(log(wsfei) ~ s(wave) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab + jbhru)
fit27bis = gam(model27bis, data=x)
anova(fit27bis)
```

```

Family: gaussian 
Link function: identity 

Formula:
log(wsfei) ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab + jbhru

Parametric Terms:
        df        F  p-value
sex      1   94.286  < 2e-16
ancob3   2   12.164 5.22e-06
edhigh1  7   16.534  < 2e-16
jbmo62  49  102.804  < 2e-16
edcoq   69    2.539 3.50e-11
edqenr   1    3.754 0.052687
fmfo61  12    4.531 2.36e-07
fmmo61  11    3.308 0.000146
esdtl    2  799.455  < 2e-16
mrcurr   7    9.199 2.01e-11
hhstate  8    8.376 1.95e-11
jbmwpsz 12 1315.869  < 2e-16
jbocct   1   15.308 9.14e-05
aneab    1    7.644 0.005696
jbhru    1   52.195 5.06e-13

Approximate significance of smooth terms:
           edf Ref.df      F p-value
s(wave)  8.876  8.991  33.72  <2e-16
s(hgage) 8.765  8.964 238.04  <2e-16
```

```r
plot(fit27bis,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27bis-1.png) 

In fit27bis we repeat the same regression as in fit27, but consider the weekly worked hours as a covariate (significant). The effect of wave over the salary is similar as in fit27.


```r
library(mgcv)
x2=x[x$wscei>0 & x$jbhru>0,]
x2$wpw = x2$wscei/x2$jbhru
model27weekly=(log(wscei) ~ s(wave) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27weekly = gam(model27weekly, data=x2)
anova(fit27weekly)
```

```

Family: gaussian 
Link function: identity 

Formula:
log(wscei) ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df         F  p-value
sex      1  1307.744  < 2e-16
ancob3   2     5.055  0.00638
edhigh1  7   210.913  < 2e-16
jbmo62  49   132.048  < 2e-16
edcoq   69     2.990 1.40e-15
edqenr   1    44.525 2.53e-11
fmfo61  12     6.270 3.34e-11
fmmo61  11     4.702 3.08e-07
esdtl    2 12278.319  < 2e-16
mrcurr   7    60.397  < 2e-16
hhstate  8    48.745  < 2e-16
jbmwpsz 12   247.172  < 2e-16
jbocct   1   704.239  < 2e-16
aneab    1     1.559  0.21180

Approximate significance of smooth terms:
           edf Ref.df      F p-value
s(wave)  6.342  7.385  357.1  <2e-16
s(hgage) 8.939  8.997 1052.3  <2e-16
```

```r
plot(fit27weekly,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27weekly-1.png) 

The global crisis effect is not as strong as using the annual salary as the dependent variable.


```r
library(mgcv)
x2=x[x$wscei>0 & x$jbhru>0,]
x2$hrw = x2$wscei/x2$jbhru
model27hrwage=(hrw ~ s(wave) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27hrwage = gam(model27hrwage, data=x2)
anova(fit27hrwage)
```

```

Family: gaussian 
Link function: identity 

Formula:
hrw ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df       F  p-value
sex      1 396.256  < 2e-16
ancob3   2   4.163 0.015571
edhigh1  7 100.792  < 2e-16
jbmo62  49  44.511  < 2e-16
edcoq   69   1.512 0.003894
edqenr   1   8.450 0.003652
fmfo61  12   4.574 1.91e-07
fmmo61  11   3.239 0.000195
esdtl    2 273.556  < 2e-16
mrcurr   7  30.143  < 2e-16
hhstate  8  21.037  < 2e-16
jbmwpsz 12  38.551  < 2e-16
jbocct   1 154.220  < 2e-16
aneab    1   0.814 0.366993

Approximate significance of smooth terms:
           edf Ref.df      F p-value
s(wave)  3.888  4.860 178.24  <2e-16
s(hgage) 7.915  8.445  42.68  <2e-16
```

```r
plot(fit27hrwage,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27hrwage-1.png) 

There has been a slower increase of the hourly wage as an effect of the global crisis. This has nothing to do with the status of native or migrant (ancob3) or the knowledge of English (aneab)




```r
library(mgcv)
model28=(wages_perc ~ s(wave) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit28 = gam(model28, data=x)
anova(fit28)
```

```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1 1795.903  < 2e-16
ancob3   2   11.049 1.59e-05
edhigh1  7  165.177  < 2e-16
jbmo62  49  289.081  < 2e-16
edcoq   69    3.302  < 2e-16
edqenr   1   31.281 2.24e-08
fmfo61  12    3.089 0.000218
fmmo61  11    2.544 0.003255
esdtl    2 6000.931  < 2e-16
mrcurr   7   38.636  < 2e-16
hhstate  8   34.489  < 2e-16
jbmwpsz 12  951.440  < 2e-16
jbocct   1  881.819  < 2e-16
aneab    1   11.846 0.000578

Approximate significance of smooth terms:
           edf Ref.df     F p-value
s(wave)  8.694  8.946 229.3  <2e-16
s(hgage) 8.084  8.587 657.8  <2e-16
```

```r
plot(fit28,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit28-1.png) 


```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1 1083.306  < 2e-16
ancob3   2    1.941  0.14354
edhigh1  7   96.599  < 2e-16
jbmo62  49  374.937  < 2e-16
edcoq   69    1.938 4.96e-06
edqenr   1   18.223 1.97e-05
fmfo61  12    1.069  0.38187
fmmo61  11    2.223  0.01097
esdtl    2 2941.579  < 2e-16
mrcurr   7   16.959  < 2e-16
hhstate  8   13.566  < 2e-16
jbmwpsz 12  377.133  < 2e-16
jbocct   1  324.031  < 2e-16
aneab    1    8.338  0.00388

Approximate significance of smooth terms:
           edf Ref.df     F p-value
s(wave)  7.203  7.203 520.1  <2e-16
s(hgage) 8.581  8.581 607.7  <2e-16
```

![](HILDA_files/figure-html/fit29-1.png) 

The last fit (fit29) shows that the effect on the wave can be assumed linear and a few covariates are no more significant and can be eliminated from the model. These are:

* Occupation of parents
* ancob3: australian, migrant anglo, migrant other.

This result can be interpreted considering that the dependent variable is the salary percentile of the subject specific to his job. The occupation of the parents and the status of migrant could contribute to choice of the job, but not to the salary in it (hypothesis to test).

## fit27: wave stratified by age groups


```r
library(mgcv)
age_limits = c(15,25,35,45,55)
age_category = findInterval(x$hgage, age_limits)
x$wave_age1 = x$wave_age2 = x$wave_age3 = x$wave_age4 = x$wave_age5 = 0
x$wave_age1[which(age_category == 1)] = x$wave[which(age_category == 1)] 
x$wave_age2[which(age_category == 2)] = x$wave[which(age_category == 2)] 
x$wave_age3[which(age_category == 3)] = x$wave[which(age_category == 3)] 
x$wave_age4[which(age_category == 4)] = x$wave[which(age_category == 4)] 
x$wave_age5[which(age_category == 5)] = x$wave[which(age_category == 5)] 

model27byAge=(log(wsfei) ~ s(wave_age1) + s(wave_age2) + s(wave_age3) + s(wave_age4) + s(wave_age5) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27byAge = gam(model27byAge, data=x)
anova(fit27byAge)
```

```

Family: gaussian 
Link function: identity 

Formula:
log(wsfei) ~ s(wave_age1) + s(wave_age2) + s(wave_age3) + s(wave_age4) + 
    s(wave_age5) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1   92.918  < 2e-16
ancob3   2   11.767 7.77e-06
edhigh1  7   16.018  < 2e-16
jbmo62  49  103.238  < 2e-16
edcoq   69    2.431 3.46e-10
edqenr   1    3.453 0.063151
fmfo61  12    4.614 1.56e-07
fmmo61  11    3.307 0.000147
esdtl    2  805.756  < 2e-16
mrcurr   7    9.367 1.17e-11
hhstate  8    8.021 7.12e-11
jbmwpsz 12 1319.778  < 2e-16
jbocct   1   16.369 5.22e-05
aneab    1    7.622 0.005768

Approximate significance of smooth terms:
               edf Ref.df       F  p-value
s(wave_age1) 7.601  8.455   6.254 2.25e-08
s(wave_age2) 6.993  8.001   9.764 1.19e-13
s(wave_age3) 7.243  8.189  14.767  < 2e-16
s(wave_age4) 6.936  7.955   8.910 3.46e-12
s(wave_age5) 7.657  8.507   9.114 4.35e-13
s(hgage)     8.594  8.911 195.538  < 2e-16
```

```r
plot(fit27byAge,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27byAge-1.png) 

The effect of the global crisis has been similar in all the 5 age groups.

## fit27: wave stratified by migration status (Australians vs English speaking migrants vs other migrants)


```r
library(mgcv)
x$wave_au = x$wave_anglo = x$wave_others = 0
x$wave_au[x$ancob3=="australians"] = x$wave[x$ancob3=="australians"] 
x$wave_anglo[x$ancob3=="imm_anglo"] = x$wave[x$ancob3=="imm_anglo"] 
x$wave_others[x$ancob3=="imm_others"] = x$wave[x$ancob3=="imm_others"] 

model27byMigrationStatus=(log(wsfei) ~ s(wave_au) + s(wave_anglo) + s(wave_others) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct) # aneab cannot stay in the regression as few unique covariate combinations with wave_*
fit27byMigrationStatus = gam(model27byMigrationStatus, data=x)
anova(fit27byMigrationStatus)
```

```

Family: gaussian 
Link function: identity 

Formula:
log(wsfei) ~ s(wave_au) + s(wave_anglo) + s(wave_others) + s(hgage) + 
    sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + 
    fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct

Parametric Terms:
        df        F  p-value
sex      1  102.866  < 2e-16
ancob3   2    4.493  0.01119
edhigh1  7   18.397  < 2e-16
jbmo62  49  107.996  < 2e-16
edcoq   69    2.586 1.27e-11
edqenr   1    3.574  0.05869
fmfo61  12    5.460 2.20e-09
fmmo61  11    3.318  0.00014
esdtl    2  869.472  < 2e-16
mrcurr   7   10.549 2.49e-13
hhstate  8   10.667 4.15e-15
jbmwpsz 12 1604.389  < 2e-16
jbocct   1   17.716 2.57e-05

Approximate significance of smooth terms:
                 edf Ref.df       F  p-value
s(wave_au)     9.000  9.000  32.362  < 2e-16
s(wave_anglo)  6.738  7.679   9.116 5.11e-12
s(wave_others) 6.613  7.580   9.031 9.42e-12
s(hgage)       8.693  8.940 253.295  < 2e-16
```

```r
plot(fit27byMigrationStatus,pages=1, scale=-1, rug=F) #all.terms=T
```

![](HILDA_files/figure-html/fit27byMigrationStatus-1.png) 

No differences in migration status.

## fit27: wave stratified by education


```r
library(mgcv)
x$wave_ed1 = x$wave_ed2 = x$wave_ed3 = x$wave_ed4 = x$wave_ed5 = x$wave_ed6 = x$wave_ed7 = x$wave_ed8 = 0
ed_lev = levels(droplevels(x$edhigh1))
x$wave_ed1[x$edhigh1==ed_lev[1]] = x$wave[x$edhigh1==ed_lev[1]] 
x$wave_ed2[x$edhigh1==ed_lev[2]] = x$wave[x$edhigh1==ed_lev[2]] 
x$wave_ed3[x$edhigh1==ed_lev[3]] = x$wave[x$edhigh1==ed_lev[3]] 
x$wave_ed4[x$edhigh1==ed_lev[4]] = x$wave[x$edhigh1==ed_lev[4]] 
x$wave_ed5[x$edhigh1==ed_lev[5]] = x$wave[x$edhigh1==ed_lev[5]] 
x$wave_ed6[x$edhigh1==ed_lev[6]] = x$wave[x$edhigh1==ed_lev[6]] 
x$wave_ed7[x$edhigh1==ed_lev[7]] = x$wave[x$edhigh1==ed_lev[7]] 
x$wave_ed8[x$edhigh1==ed_lev[8]] = x$wave[x$edhigh1==ed_lev[8]] 

model27byEducation=(log(wsfei) ~ s(wave_ed1) + s(wave_ed2) + s(wave_ed3) + s(wave_ed4) + s(wave_ed5) + s(wave_ed6) + s(wave_ed7) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27byEducation = gam(model27byEducation, data=x)
anova(fit27byEducation)
```

```

Family: gaussian 
Link function: identity 

Formula:
log(wsfei) ~ s(wave_ed1) + s(wave_ed2) + s(wave_ed3) + s(wave_ed4) + 
    s(wave_ed5) + s(wave_ed6) + s(wave_ed7) + s(hgage) + sex + 
    ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + 
    esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1   92.068  < 2e-16
ancob3   2   11.541 9.73e-06
edhigh1  7    3.149 0.002499
jbmo62  49  103.066  < 2e-16
edcoq   69    2.360 1.53e-09
edqenr   1    4.076 0.043503
fmfo61  12    4.566 1.99e-07
fmmo61  11    3.291 0.000157
esdtl    2  806.134  < 2e-16
mrcurr   7    9.200 2.01e-11
hhstate  8    8.008 7.46e-11
jbmwpsz 12 1321.385  < 2e-16
jbocct   1   16.090 6.04e-05
aneab    1    7.135 0.007561

Approximate significance of smooth terms:
              edf Ref.df       F  p-value
s(wave_ed1) 3.775  4.661   1.892 0.097315
s(wave_ed2) 4.243  5.213   1.387 0.222517
s(wave_ed3) 5.400  6.477   3.873 0.000528
s(wave_ed4) 8.851  8.986   6.579 2.01e-09
s(wave_ed5) 6.830  7.738  13.470  < 2e-16
s(wave_ed6) 6.563  7.534   6.826 1.75e-08
s(wave_ed7) 7.371  8.145  16.030  < 2e-16
s(hgage)    8.753  8.961 236.740  < 2e-16
```

```r
plot(fit27byEducation,pages=1, scale=-1, rug=F) #all.terms=T
```

![](HILDA_files/figure-html/fit27byEducation-1.png) 

There is a weak effect: the higher the education level, the lighter the effect of the global crisis.

## fit27: wave stratified by skilled jobs (3 categories)


```r
library(mgcv)
x$wave_skill1 = x$wave_skill2 = x$wave_skill3 = 0
skill_limits = c(1,4,7)
skill_category = findInterval(as.integer(sapply(x$jbmo62, substr, 2,2)), skill_limits)
x$wave_skill1[which(skill_category==1)] = x$wave[which(skill_category==1)] 
x$wave_skill2[which(skill_category==2)] = x$wave[which(skill_category==2)] 
x$wave_skill3[which(skill_category==3)] = x$wave[which(skill_category==3)] 

model27bySkilledJobs=(log(wsfei) ~ s(x$wave_skill1) + s(x$wave_skill2) + s(x$wave_skill3) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27bySkilledJobs = gam(model27bySkilledJobs, data=x)
anova(fit27bySkilledJobs)
```

```

Family: gaussian 
Link function: identity 

Formula:
log(wsfei) ~ s(x$wave_skill1) + s(x$wave_skill2) + s(x$wave_skill3) + 
    s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + 
    fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + 
    aneab

Parametric Terms:
        df        F  p-value
sex      1   91.962  < 2e-16
ancob3   2   12.087 5.64e-06
edhigh1  7   16.701  < 2e-16
jbmo62  49   99.808  < 2e-16
edcoq   69    2.656 2.73e-12
edqenr   1    4.043 0.044348
fmfo61  12    4.593 1.73e-07
fmmo61  11    3.289 0.000158
esdtl    2  806.194  < 2e-16
mrcurr   7    9.135 2.48e-11
hhstate  8    7.985 8.11e-11
jbmwpsz 12 1324.229  < 2e-16
jbocct   1   16.270 5.50e-05
aneab    1    7.517 0.006114

Approximate significance of smooth terms:
                   edf Ref.df      F  p-value
s(x$wave_skill1) 9.000  9.000  22.75  < 2e-16
s(x$wave_skill2) 8.866  8.986  13.91  < 2e-16
s(x$wave_skill3) 7.025  7.904  10.11 5.71e-14
s(hgage)         8.753  8.961 237.67  < 2e-16
```

```r
plot(fit27bySkilledJobs,pages=1, scale=-1, rug=F) #all.terms=T
```

![](HILDA_files/figure-html/fit27bySkilledJobs-1.png) 

No differences in job skill categories.


## More on time-related covariates

Two temporal variables: (check this, something wrong)
* age = yrivwfst-(2012-yrivwfst)-1+wave (changing each year) 
* date of birth (dob=2012-hgage)


```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(dob) + s(age) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1 1781.745  < 2e-16
ancob3   2   10.364 3.16e-05
edhigh1  7  163.129  < 2e-16
jbmo62  49  286.893  < 2e-16
edcoq   69    4.022  < 2e-16
edqenr   1    8.683 0.003213
fmfo61  12    2.989 0.000341
fmmo61  11    2.811 0.001137
esdtl    2 5914.496  < 2e-16
mrcurr   7   32.144  < 2e-16
hhstate  8   34.811  < 2e-16
jbmwpsz 12  987.459  < 2e-16
jbocct   1  894.804  < 2e-16
aneab    1   11.396 0.000736

Approximate significance of smooth terms:
         edf Ref.df     F p-value
s(dob) 8.122  8.608 520.1  <2e-16
s(age) 7.201  7.883 184.1  <2e-16
```

![](HILDA_files/figure-html/consider_age-1.png) 

Replace the age of subject with the years since studying FT (ehtse). Also, we now restrict the analysis to workers with info on years since last studying.


```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(ehtse_au) + s(ehtse_anglo) + s(ehtse_others) + 
    sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + 
    fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1 1806.914  < 2e-16
ancob3   2    2.550 0.078126
edhigh1  7  178.025  < 2e-16
jbmo62  49  272.552  < 2e-16
edcoq   68   18.217  < 2e-16
edqenr   1    0.908 0.340708
fmfo61  12    3.319 7.69e-05
fmmo61  11    2.979 0.000574
esdtl    2 5375.773  < 2e-16
mrcurr   7   42.012  < 2e-16
hhstate  8   31.140  < 2e-16
jbmwpsz 12 1047.693  < 2e-16
jbocct   1  851.848  < 2e-16
aneab    1    6.926 0.008497

Approximate significance of smooth terms:
                  edf Ref.df       F  p-value
s(ehtse_au)     8.806  8.987 395.367  < 2e-16
s(ehtse_anglo)  7.515  8.456   3.965 7.76e-05
s(ehtse_others) 5.389  6.535  20.596  < 2e-16
```

![](HILDA_files/figure-html/fit31-1.png) 

Taking away ancob3 from the regression:


```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(ehtse_au) + s(ehtse_anglo) + s(ehtse_others) + 
    sex + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + 
    esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab

Parametric Terms:
        df        F  p-value
sex      1 1807.808  < 2e-16
edhigh1  7  178.521  < 2e-16
jbmo62  49  272.557  < 2e-16
edcoq   68   18.140  < 2e-16
edqenr   1    1.014  0.31404
fmfo61  12    3.288 8.88e-05
fmmo61  11    2.938  0.00068
esdtl    2 5376.441  < 2e-16
mrcurr   7   42.160  < 2e-16
hhstate  8   31.257  < 2e-16
jbmwpsz 12 1047.559  < 2e-16
jbocct   1  851.767  < 2e-16
aneab    1    9.163  0.00247

Approximate significance of smooth terms:
                  edf Ref.df      F p-value
s(ehtse_au)     8.853  8.992 399.67  <2e-16
s(ehtse_anglo)  7.151  8.178  65.57  <2e-16
s(ehtse_others) 5.546  6.665 151.84  <2e-16
```

![](HILDA_files/figure-html/fit32-1.png) 


## Job satisfaction

Guardando alla tua domanda di OSP e cose che potrebbero essere divertenti, la variabile  latente per eccellenza e' la Job satisfaction. Tra quella per i soldi e per sicurezza (jbmssec) mi sembra ci sia piu' variabilita' per Job satisfaction about pay (jbmspay) e potremmo vedere:
 
1. dall'inizio HILDA, quali sono i lavori dove chi lavora e' piu' felice? [jbmo62]
2. ci sono settori che sono sistematicamente over-paid (qui dovresti vedere in primis mining e finanza. Anche il settore pubblico non e' male)
3. sono piu' felici uomi e donne? [sex]
4. immigrati o nativi? [ancob3]
5. giovani o vecchi? (possibile scala: 25-29; 30-39; 40-49; 50-59; 60+) [s(hgage)]
6. laureati o no? [edcoq --> ...]
7. lavoratori fedeli al'employer o switchers? (tenure: jbocct) 
8. in che stato? (hhstate)
9. e in che tipo di famiglia? (hhtype)
 
detto questo, mi sembra che il funzionale che tu stai usando e' legato al tempo: puo' essere usato anche su intensita', tipo prestigio (jbmoccs): il prestigio ha molte categorie ma e' stato surveyed solo in wave 5. Il che vuol dire mappare le occupation/Prestige scale da wave 5 e 'spararla' alle occupations di tutte le rimanenti waves.

#### Satisfaction for job pay


```

Attaching package: 'ordinal'

The following objects are masked from 'package:nlme':

    ranef, VarCorr
```

Comparison of the effects on satisfation by salary vs wages_perc.

##### Salary:

```
formula: jbmspay ~ hgsex + hgage + ancob3 + hhtype + jbocct + I(log(wsfei))
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -215296.62 430675.23 6(0)  5.69e-11 3.1e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.0851605  0.0110651   7.696 1.40e-14 ***
hgage                                                           0.0067726  0.0005090  13.306  < 2e-16 ***
ancob3imm_anglo                                                -0.0359949  0.0220190  -1.635 0.102108    
ancob3imm_others                                               -0.2070621  0.0165405 -12.518  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.1695758  0.0592595  -2.862 0.004215 ** 
hhtype[3] Couple family wo children w other not related        -0.3719864  0.0906772  -4.102 4.09e-05 ***
hhtype[4] Couple family with children < 15 wo others           -0.0612880  0.0148363  -4.131 3.61e-05 ***
hhtype[5] Couple family with children < 15 w other related     -0.1749326  0.0651204  -2.686 0.007225 ** 
hhtype[6] Couple family with children < 15 w other not related -0.0307318  0.1333288  -0.230 0.817706    
hhtype[7] Couple family with depst wo others                    0.0571296  0.0217201   2.630 0.008532 ** 
hhtype[8] Couple family with depst w other related             -0.1054672  0.1214861  -0.868 0.385316    
hhtype[9] Couple family with depst w other not related          0.2349242  0.2152831   1.091 0.275170    
hhtype[10] Couple family with ndepchild wo others              -0.0223106  0.0238388  -0.936 0.349326    
hhtype[11] Couple family with ndepchild w other related        -0.0100965  0.1215193  -0.083 0.933784    
hhtype[12] Couple family with ndepchild w other not related    -0.0641860  0.1812706  -0.354 0.723272    
hhtype[13] Lone parent with children < 15 wo others            -0.3551976  0.0336480 -10.556  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.1762271  0.0873019  -2.019 0.043529 *  
hhtype[15] Lone parent with children < 15 w other not related  -0.2839906  0.1442963  -1.968 0.049056 *  
hhtype[16] Lone parent with depst wo others                    -0.1668800  0.0441212  -3.782 0.000155 ***
hhtype[17] Lone parent with depst w other related               0.1206296  0.1846637   0.653 0.513602    
hhtype[18] Lone parent with depst w other not related          -0.2043863  0.2223430  -0.919 0.357971    
hhtype[19] Lone parent with ndepchild wo others                -0.3392438  0.0369698  -9.176  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.3200376  0.1289835  -2.481 0.013093 *  
hhtype[21] Lone parent with ndepchild w other not related      -0.6180821  0.1776823  -3.479 0.000504 ***
hhtype[22] Other related family wo children < 15 or others     -0.1789245  0.0606857  -2.948 0.003194 ** 
hhtype[23] Other related family wo children < 15 w others      -0.0708315  0.1229164  -0.576 0.564441    
hhtype[24] Lone person                                         -0.1493504  0.0186758  -7.997 1.27e-15 ***
hhtype[25] Group household                                     -0.2492029  0.0399239  -6.242 4.32e-10 ***
hhtype[26] Multi family household                              -0.1588287  0.0424590  -3.741 0.000183 ***
jbocct                                                          0.0044985  0.0006419   7.008 2.42e-12 ***
I(log(wsfei))                                                   0.0551543  0.0016895  32.645  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1  -3.61268    0.03804  -94.96
1|2  -2.93769    0.03302  -88.96
2|3  -2.22144    0.03004  -73.95
3|4  -1.59029    0.02864  -55.52
4|5  -1.15635    0.02810  -41.15
5|6  -0.50184    0.02769  -18.12
6|7   0.04390    0.02761    1.59
7|8   0.90684    0.02777   32.65
8|9   2.09001    0.02839   73.61
9|10  3.06138    0.02947  103.87
```

```
[1]     41.0 430675.2
```

##### wages_perc


```
formula: jbmspay ~ hgsex + hgage + ancob3 + hhtype + jbocct + wages_perc
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -215129.68 430341.35 6(0)  1.18e-10 3.0e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.1379738  0.0111797  12.341  < 2e-16 ***
hgage                                                           0.0054431  0.0005106  10.661  < 2e-16 ***
ancob3imm_anglo                                                -0.0289772  0.0219855  -1.318 0.187499    
ancob3imm_others                                               -0.2089874  0.0165260 -12.646  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.1706619  0.0592658  -2.880 0.003982 ** 
hhtype[3] Couple family wo children w other not related        -0.3679682  0.0908423  -4.051 5.11e-05 ***
hhtype[4] Couple family with children < 15 wo others           -0.0591280  0.0148344  -3.986 6.72e-05 ***
hhtype[5] Couple family with children < 15 w other related     -0.1695505  0.0649897  -2.609 0.009084 ** 
hhtype[6] Couple family with children < 15 w other not related -0.0304065  0.1334992  -0.228 0.819829    
hhtype[7] Couple family with depst wo others                    0.0690417  0.0217243   3.178 0.001483 ** 
hhtype[8] Couple family with depst w other related             -0.0881445  0.1216324  -0.725 0.468649    
hhtype[9] Couple family with depst w other not related          0.2457967  0.2174631   1.130 0.258353    
hhtype[10] Couple family with ndepchild wo others              -0.0052773  0.0238450  -0.221 0.824847    
hhtype[11] Couple family with ndepchild w other related        -0.0046855  0.1217694  -0.038 0.969306    
hhtype[12] Couple family with ndepchild w other not related    -0.0541257  0.1818795  -0.298 0.766015    
hhtype[13] Lone parent with children < 15 wo others            -0.3421087  0.0336941 -10.153  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.1773048  0.0870034  -2.038 0.041559 *  
hhtype[15] Lone parent with children < 15 w other not related  -0.2574340  0.1445175  -1.781 0.074858 .  
hhtype[16] Lone parent with depst wo others                    -0.1609108  0.0441419  -3.645 0.000267 ***
hhtype[17] Lone parent with depst w other related               0.1432338  0.1853356   0.773 0.439620    
hhtype[18] Lone parent with depst w other not related          -0.2055792  0.2226165  -0.923 0.355763    
hhtype[19] Lone parent with ndepchild wo others                -0.3254549  0.0369635  -8.805  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.3088134  0.1282559  -2.408 0.016049 *  
hhtype[21] Lone parent with ndepchild w other not related      -0.6236010  0.1775676  -3.512 0.000445 ***
hhtype[22] Other related family wo children < 15 or others     -0.1588867  0.0605934  -2.622 0.008737 ** 
hhtype[23] Other related family wo children < 15 w others      -0.0486832  0.1229944  -0.396 0.692241    
hhtype[24] Lone person                                         -0.1478544  0.0186707  -7.919 2.39e-15 ***
hhtype[25] Group household                                     -0.2266749  0.0399203  -5.678 1.36e-08 ***
hhtype[26] Multi family household                              -0.1514163  0.0424725  -3.565 0.000364 ***
jbocct                                                          0.0023665  0.0006421   3.686 0.000228 ***
wages_perc                                                      0.7323273  0.0196039  37.356  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error  z value
0|1  -3.80261    0.03573 -106.421
1|2  -3.12790    0.03031 -103.185
2|3  -2.41166    0.02701  -89.286
3|4  -1.78010    0.02542  -70.030
4|5  -1.34554    0.02478  -54.295
5|6  -0.68985    0.02426  -28.430
6|7  -0.14283    0.02411   -5.925
7|8   0.72264    0.02423   29.825
8|9   1.90884    0.02490   76.667
9|10  2.88097    0.02612  110.315
```

```
[1]     41.0 430341.4
```

The model fitted with the wager_perc variable is a better choice than that with the annula salary wsfei.



```
formula: jbmspay ~ hgsex + hgage + hhtype + ancob3 + jbocct:ancob3 + wages_perc:ancob3
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -215088.59 430267.18 6(0)  2.28e-10 2.9e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.1374287  0.0111834  12.289  < 2e-16 ***
hgage                                                           0.0056836  0.0005123  11.094  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.1718562  0.0592544  -2.900 0.003728 ** 
hhtype[3] Couple family wo children w other not related        -0.3599298  0.0909454  -3.958 7.57e-05 ***
hhtype[4] Couple family with children < 15 wo others           -0.0586800  0.0148481  -3.952 7.75e-05 ***
hhtype[5] Couple family with children < 15 w other related     -0.1653744  0.0649471  -2.546 0.010887 *  
hhtype[6] Couple family with children < 15 w other not related -0.0262147  0.1334875  -0.196 0.844310    
hhtype[7] Couple family with depst wo others                    0.0644348  0.0217296   2.965 0.003024 ** 
hhtype[8] Couple family with depst w other related             -0.0694204  0.1217931  -0.570 0.568687    
hhtype[9] Couple family with depst w other not related          0.2342601  0.2175096   1.077 0.281476    
hhtype[10] Couple family with ndepchild wo others              -0.0089520  0.0238587  -0.375 0.707506    
hhtype[11] Couple family with ndepchild w other related         0.0010357  0.1217996   0.009 0.993216    
hhtype[12] Couple family with ndepchild w other not related    -0.0623153  0.1819430  -0.342 0.731975    
hhtype[13] Lone parent with children < 15 wo others            -0.3462290  0.0336932 -10.276  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.1766664  0.0869747  -2.031 0.042231 *  
hhtype[15] Lone parent with children < 15 w other not related  -0.2625559  0.1443684  -1.819 0.068965 .  
hhtype[16] Lone parent with depst wo others                    -0.1655691  0.0441613  -3.749 0.000177 ***
hhtype[17] Lone parent with depst w other related               0.1372057  0.1856176   0.739 0.459795    
hhtype[18] Lone parent with depst w other not related          -0.2065069  0.2228131  -0.927 0.354022    
hhtype[19] Lone parent with ndepchild wo others                -0.3277209  0.0369659  -8.865  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.3153308  0.1283232  -2.457 0.013998 *  
hhtype[21] Lone parent with ndepchild w other not related      -0.6340910  0.1773472  -3.575 0.000350 ***
hhtype[22] Other related family wo children < 15 or others     -0.1570918  0.0605886  -2.593 0.009521 ** 
hhtype[23] Other related family wo children < 15 w others      -0.0434922  0.1230421  -0.353 0.723733    
hhtype[24] Lone person                                         -0.1479150  0.0186765  -7.920 2.38e-15 ***
hhtype[25] Group household                                     -0.2272114  0.0399276  -5.691 1.27e-08 ***
hhtype[26] Multi family household                              -0.1531646  0.0424911  -3.605 0.000313 ***
ancob3imm_anglo                                                -0.1642718  0.0484289  -3.392 0.000694 ***
ancob3imm_others                                               -0.4506699  0.0357732 -12.598  < 2e-16 ***
ancob3australians:jbocct                                        0.0004718  0.0007049   0.669 0.503289    
ancob3imm_anglo:jbocct                                          0.0051878  0.0018887   2.747 0.006020 ** 
ancob3imm_others:jbocct                                         0.0116107  0.0015385   7.547 4.46e-14 ***
ancob3australians:wages_perc                                    0.6860193  0.0220088  31.170  < 2e-16 ***
ancob3imm_anglo:wages_perc                                      0.8438577  0.0696686  12.112  < 2e-16 ***
ancob3imm_others:wages_perc                                     0.9463315  0.0525086  18.022  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1  -3.83725    0.03609 -106.32
1|2  -3.16247    0.03074 -102.89
2|3  -2.44612    0.02748  -89.00
3|4  -1.81438    0.02592  -70.01
4|5  -1.37966    0.02529  -54.55
5|6  -0.72360    0.02477  -29.21
6|7  -0.17623    0.02461   -7.16
7|8   0.68970    0.02472   27.90
8|9   1.87636    0.02537   73.97
9|10  2.84876    0.02655  107.28
```

```
[1]     45.0 430267.2
```

AIC improved.



##### Smoothing satisfaction pay

We now create three variables: the wage (or wage_perc) for Australians, English-speaking migrants and other migrants.
We fit a generalized additive model with the effect of these three variable smoothed.


```
Loading required package: stats4
Loading required package: splines

Attaching package: 'VGAM'

The following objects are masked from 'package:ordinal':

    dgumbel, dlgamma, pgumbel, plgamma, qgumbel, rgumbel, wine
```

![](HILDA_files/figure-html/vgam1-1.png) 

The confidence intervals are too big, the wage is not the right variable to use.
We can now use the percentiles of wage in each job code.

![](HILDA_files/figure-html/vgam2-1.png) 

The results are interesting: [interpretation here].
Let's now study the satisfaction for pay as function of yearssince studying:

![](HILDA_files/figure-html/vgam3-1.png) ![](HILDA_files/figure-html/vgam3-2.png) 

There are no differences between Australians, English-speaking migrant and other migrants in the satisfaction for pay as a function of the time since last studying.




#### Satisfaction for job security:

##### Salary:


```
formula: jbmssec ~ hgsex + hgage + ancob3 + hhtype + jbocct + I(log(wsfei))
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -197313.79 394709.58 6(0)  3.15e-10 3.6e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.2140327  0.0111410  19.211  < 2e-16 ***
hgage                                                          -0.0086289  0.0005073 -17.011  < 2e-16 ***
ancob3imm_anglo                                                -0.1545381  0.0223313  -6.920 4.51e-12 ***
ancob3imm_others                                               -0.2819524  0.0165816 -17.004  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.0743783  0.0586299  -1.269 0.204582    
hhtype[3] Couple family wo children w other not related        -0.2232832  0.0907647  -2.460 0.013893 *  
hhtype[4] Couple family with children < 15 wo others           -0.1797588  0.0150318 -11.959  < 2e-16 ***
hhtype[5] Couple family with children < 15 w other related     -0.3288044  0.0650467  -5.055 4.31e-07 ***
hhtype[6] Couple family with children < 15 w other not related -0.3746629  0.1338568  -2.799 0.005126 ** 
hhtype[7] Couple family with depst wo others                   -0.1439088  0.0216912  -6.634 3.26e-11 ***
hhtype[8] Couple family with depst w other related             -0.1924559  0.1227592  -1.568 0.116939    
hhtype[9] Couple family with depst w other not related         -0.0393052  0.2281986  -0.172 0.863248    
hhtype[10] Couple family with ndepchild wo others              -0.0734044  0.0239780  -3.061 0.002204 ** 
hhtype[11] Couple family with ndepchild w other related        -0.3079203  0.1210200  -2.544 0.010947 *  
hhtype[12] Couple family with ndepchild w other not related    -0.1317872  0.1864654  -0.707 0.479713    
hhtype[13] Lone parent with children < 15 wo others            -0.3735004  0.0336617 -11.096  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.0798819  0.0863212  -0.925 0.354756    
hhtype[15] Lone parent with children < 15 w other not related  -0.4405952  0.1458851  -3.020 0.002526 ** 
hhtype[16] Lone parent with depst wo others                    -0.2206364  0.0442382  -4.987 6.12e-07 ***
hhtype[17] Lone parent with depst w other related              -0.0588008  0.1887082  -0.312 0.755347    
hhtype[18] Lone parent with depst w other not related          -0.1683906  0.2392336  -0.704 0.481510    
hhtype[19] Lone parent with ndepchild wo others                -0.3414921  0.0373385  -9.146  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.4494785  0.1268329  -3.544 0.000394 ***
hhtype[21] Lone parent with ndepchild w other not related      -0.2887513  0.1886074  -1.531 0.125778    
hhtype[22] Other related family wo children < 15 or others     -0.2729994  0.0614337  -4.444 8.84e-06 ***
hhtype[23] Other related family wo children < 15 w others      -0.0661791  0.1225371  -0.540 0.589146    
hhtype[24] Lone person                                         -0.2581490  0.0188975 -13.660  < 2e-16 ***
hhtype[25] Group household                                     -0.2596753  0.0407912  -6.366 1.94e-10 ***
hhtype[26] Multi family household                              -0.1167948  0.0423905  -2.755 0.005865 ** 
jbocct                                                          0.0173762  0.0006479  26.818  < 2e-16 ***
I(log(wsfei))                                                   0.0367898  0.0016881  21.793  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error  z value
0|1  -4.59287    0.04154 -110.556
1|2  -3.96553    0.03560 -111.406
2|3  -3.32156    0.03190 -104.134
3|4  -2.81796    0.03014  -93.493
4|5  -2.45102    0.02929  -83.688
5|6  -1.79473    0.02835  -63.295
6|7  -1.40419    0.02804  -50.074
7|8  -0.78165    0.02778  -28.138
8|9   0.15431    0.02771    5.568
9|10  1.12703    0.02792   40.361
```

##### wages_perc


```
formula: jbmssec ~ hgsex + hgage + ancob3 + hhtype + jbocct + wages_perc
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -197369.80 394821.60 6(0)  1.57e-10 3.4e+06

Coefficients:
                                                                Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.239796   0.011261  21.294  < 2e-16 ***
hgage                                                          -0.009311   0.000509 -18.292  < 2e-16 ***
ancob3imm_anglo                                                -0.150504   0.022333  -6.739 1.59e-11 ***
ancob3imm_others                                               -0.282533   0.016578 -17.042  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.075666   0.058670  -1.290 0.197159    
hhtype[3] Couple family wo children w other not related        -0.216827   0.090789  -2.388 0.016929 *  
hhtype[4] Couple family with children < 15 wo others           -0.179825   0.015033 -11.962  < 2e-16 ***
hhtype[5] Couple family with children < 15 w other related     -0.329457   0.064983  -5.070 3.98e-07 ***
hhtype[6] Couple family with children < 15 w other not related -0.372643   0.133870  -2.784 0.005376 ** 
hhtype[7] Couple family with depst wo others                   -0.140138   0.021704  -6.457 1.07e-10 ***
hhtype[8] Couple family with depst w other related             -0.188974   0.123087  -1.535 0.124711    
hhtype[9] Couple family with depst w other not related         -0.039966   0.227990  -0.175 0.860846    
hhtype[10] Couple family with ndepchild wo others              -0.064034   0.023988  -2.669 0.007600 ** 
hhtype[11] Couple family with ndepchild w other related        -0.306163   0.120783  -2.535 0.011251 *  
hhtype[12] Couple family with ndepchild w other not related    -0.128587   0.185989  -0.691 0.489333    
hhtype[13] Lone parent with children < 15 wo others            -0.371325   0.033665 -11.030  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.081310   0.086327  -0.942 0.346252    
hhtype[15] Lone parent with children < 15 w other not related  -0.434188   0.146058  -2.973 0.002952 ** 
hhtype[16] Lone parent with depst wo others                    -0.218849   0.044245  -4.946 7.57e-07 ***
hhtype[17] Lone parent with depst w other related              -0.041691   0.188846  -0.221 0.825272    
hhtype[18] Lone parent with depst w other not related          -0.181503   0.239309  -0.758 0.448186    
hhtype[19] Lone parent with ndepchild wo others                -0.332161   0.037339  -8.896  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.442760   0.126488  -3.500 0.000465 ***
hhtype[21] Lone parent with ndepchild w other not related      -0.300405   0.188377  -1.595 0.110779    
hhtype[22] Other related family wo children < 15 or others     -0.265946   0.061431  -4.329 1.50e-05 ***
hhtype[23] Other related family wo children < 15 w others      -0.051460   0.122488  -0.420 0.674397    
hhtype[24] Lone person                                         -0.254690   0.018897 -13.478  < 2e-16 ***
hhtype[25] Group household                                     -0.245005   0.040809  -6.004 1.93e-09 ***
hhtype[26] Multi family household                              -0.114629   0.042409  -2.703 0.006872 ** 
jbocct                                                          0.016123   0.000647  24.918  < 2e-16 ***
wages_perc                                                      0.373165   0.019634  19.007  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error  z value
0|1  -4.76854    0.03949 -120.762
1|2  -4.14117    0.03317 -124.849
2|3  -3.49718    0.02916 -119.939
3|4  -2.99367    0.02721 -110.008
4|5  -2.62683    0.02625 -100.063
5|6  -1.97087    0.02517  -78.304
6|7  -1.58065    0.02479  -63.772
7|8  -0.95882    0.02443  -39.244
8|9  -0.02413    0.02427   -0.994
9|10  0.94780    0.02446   38.745
```

No problems with this fit. wages_perc works better than wsfei to explain job satisfaction.


##### Smoothing satisfaction job security

We now create three variables: the wage (or wage_perc) for Australians, English-speaking migrants and other migrants.
We fit a generalized additive model with the effect of these three variable smoothed.

![](HILDA_files/figure-html/vgam4-1.png) 

The confidence intervals are too big, the wage is not the right variable to use.
We can now use the percentiles of wage in each job code.


```
null device 
          1 
```

The results are interesting: [interpretation here].
Let's now study the satisfaction for pay as function of yearssince studying:

![](HILDA_files/figure-html/vgam6-1.png) ![](HILDA_files/figure-html/vgam6-2.png) 



## Differences
TODO




































