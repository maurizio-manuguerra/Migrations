


```
## Loading required package: nlme
## This is mgcv 1.8-6. For overview type 'help("mgcv-package")'.
## 
## Attaching package: 'ordinal'
## 
## The following objects are masked from 'package:nlme':
## 
##     ranef, VarCorr
```

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
model26=(jbhru ~ s(wave) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit26 = gam(model26, data=x)
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
sex      1   824.622  < 2e-16
ancob3   2     1.281    0.278
edhigh1  7    18.224  < 2e-16
jbmo62  49    79.233  < 2e-16
edcoq   58     2.388 1.60e-08
edqenr   1     0.126    0.723
fmfo61  12     9.938  < 2e-16
fmmo61  11     7.854 8.66e-14
esdtl    2 27474.089  < 2e-16
mrcurr   7     4.943 1.33e-05
hhstate  8    17.752  < 2e-16
jbmwpsz 12     6.102 8.05e-11
jbocct   1    97.462  < 2e-16
aneab    1     2.244    0.134

Approximate significance of smooth terms:
           edf Ref.df     F  p-value
s(wave)  1.000  1.000 58.91 1.67e-14
s(hgage) 6.699  7.524 51.66  < 2e-16
```

```r
plot(fit26,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit26-1.png) 

There is no indication of any effect of the global crisis on the number of hours worked per week.


```r
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
sex      1 2454.290  < 2e-16
ancob3   2    6.259 0.001914
edhigh1  7  209.579  < 2e-16
jbmo62  49  152.822  < 2e-16
edcoq   58    3.308 3.38e-16
edqenr   1    3.704 0.054275
fmfo61  12    4.729 8.85e-08
fmmo61  11    4.491 8.05e-07
esdtl    2 5435.730  < 2e-16
mrcurr   7   51.166  < 2e-16
hhstate  8   40.219  < 2e-16
jbmwpsz 12  200.094  < 2e-16
jbocct   1 1091.216  < 2e-16
aneab    1   13.223 0.000277

Approximate significance of smooth terms:
           edf Ref.df     F p-value
s(wave)  5.299  6.447 438.1  <2e-16
s(hgage) 8.408  8.784 519.2  <2e-16
```

```r
plot(fit27,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27-1.png) 


```r
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
sex      1 1945.730  < 2e-16
ancob3   2    5.475  0.00419
edhigh1  7  209.376  < 2e-16
jbmo62  49  145.711  < 2e-16
edcoq   58    3.547  < 2e-16
edqenr   1    3.559  0.05925
fmfo61  12    4.539 2.27e-07
fmmo61  11    4.169 3.44e-06
esdtl    2  851.559  < 2e-16
mrcurr   7   49.449  < 2e-16
hhstate  8   35.437  < 2e-16
jbmwpsz 12  217.749  < 2e-16
jbocct   1  999.695  < 2e-16
aneab    1   16.435 5.04e-05
jbhru    1 3363.750  < 2e-16

Approximate significance of smooth terms:
           edf Ref.df     F p-value
s(wave)  6.484  7.500 418.0  <2e-16
s(hgage) 8.372  8.760 489.4  <2e-16
```

```r
plot(fit27bis,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27bis-1.png) 

In fit27bis we repeat the same regression as in fit27, but consider the weekly worked hours as a covariate (significant). The effect of wave over the salary is similar as in fit27.


```r
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
sex      1  1629.723  < 2e-16
ancob3   2     4.165 0.015532
edhigh1  7   208.896  < 2e-16
jbmo62  49   138.576  < 2e-16
edcoq   58     2.131 1.21e-06
edqenr   1     8.290 0.003987
fmfo61  12     8.624  < 2e-16
fmmo61  11     3.252 0.000185
esdtl    1 17610.508  < 2e-16
mrcurr   7    42.909  < 2e-16
hhstate  8    50.316  < 2e-16
jbmwpsz 12   201.915  < 2e-16
jbocct   1   610.113  < 2e-16
aneab    1     3.680 0.055076

Approximate significance of smooth terms:
           edf Ref.df     F p-value
s(wave)  5.618  6.755 475.8  <2e-16
s(hgage) 8.852  8.985 297.5  <2e-16
```

```r
plot(fit27weekly,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27weekly-1.png) 

The global crisis effect is not as strong as using the annual salary as the dependent variable.


```r
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
sex      1 453.542  < 2e-16
ancob3   2   3.825   0.0218
edhigh1  7  87.691  < 2e-16
jbmo62  49  46.533  < 2e-16
edcoq   58   1.344   0.0415
edqenr   1   1.813   0.1782
fmfo61  12   5.329 4.30e-09
fmmo61  11   3.684 2.92e-05
esdtl    1 751.735  < 2e-16
mrcurr   7  27.475  < 2e-16
hhstate  8  19.524  < 2e-16
jbmwpsz 12  41.255  < 2e-16
jbocct   1 108.656  < 2e-16
aneab    1   2.346   0.1256

Approximate significance of smooth terms:
           edf Ref.df     F p-value
s(wave)  3.155  3.919 304.6  <2e-16
s(hgage) 8.784  8.968  40.0  <2e-16
```

```r
plot(fit27hrwage,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27hrwage-1.png) 

There has been a slower increase of the hourly wage as an effect of the global crisis. This has nothing to do with the status of native or migrant (ancob3) or the knowledge of English (aneab)




```r
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
sex      1 2480.713  < 2e-16
ancob3   2    3.708  0.02453
edhigh1  7  204.431  < 2e-16
jbmo62  49  181.643  < 2e-16
edcoq   58    3.444  < 2e-16
edqenr   1   18.598 1.62e-05
fmfo61  12    3.386 5.66e-05
fmmo61  11    4.711 2.95e-07
esdtl    2 5951.313  < 2e-16
mrcurr   7   50.065  < 2e-16
hhstate  8   43.270  < 2e-16
jbmwpsz 12  221.356  < 2e-16
jbocct   1 1141.745  < 2e-16
aneab    1    8.612  0.00334

Approximate significance of smooth terms:
           edf Ref.df     F p-value
s(wave)  5.707  6.838 537.4  <2e-16
s(hgage) 7.896  8.413 554.5  <2e-16
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
sex      1 2461.551  < 2e-16
ancob3   2    5.881 0.002793
edhigh1  7  207.535  < 2e-16
jbmo62  49  152.827  < 2e-16
edcoq   58    3.266 8.00e-16
edqenr   1    2.466 0.116323
fmfo61  12    4.714 9.55e-08
fmmo61  11    4.616 4.57e-07
esdtl    2 5432.073  < 2e-16
mrcurr   7   50.902  < 2e-16
hhstate  8   40.167  < 2e-16
jbmwpsz 12  199.609  < 2e-16
jbocct   1 1095.943  < 2e-16
aneab    1   12.912 0.000327

Approximate significance of smooth terms:
               edf Ref.df     F p-value
s(wave_age1) 7.490  8.427  83.3  <2e-16
s(wave_age2) 5.043  6.149 203.1  <2e-16
s(wave_age3) 3.962  4.895 252.6  <2e-16
s(wave_age4) 2.744  3.395 384.2  <2e-16
s(wave_age5) 1.000  1.000 605.9  <2e-16
s(hgage)     8.269  8.711 193.3  <2e-16
```

```r
plot(fit27byAge,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27byAge-1.png) 

The effect of the global crisis has been similar in all the 5 age groups.

## fit27bis: wave stratified by age groups (<=40hrs, >40hrs)


```r
x2 <- x[x$jbhru<=40,]
#x3 <- x[x$jbhru>40,]

model27byAge=(log(wsfei) ~ s(wave_age1) + s(wave_age2) + s(wave_age3) + s(wave_age4) + s(wave_age5) +  s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27byAge = gam(model27byAge, data=x2)
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
sex      1 1013.181  < 2e-16
ancob3   2    0.548    0.578
edhigh1  7   81.028  < 2e-16
jbmo62  49   82.857  < 2e-16
edcoq   56    2.094 3.23e-06
edqenr   1    0.446    0.504
fmfo61  11    1.393    0.168
fmmo61  11    5.033 6.74e-08
esdtl    2 3835.544  < 2e-16
mrcurr   7   27.371  < 2e-16
hhstate  7   23.706  < 2e-16
jbmwpsz 12   68.585  < 2e-16
jbocct   1  766.901  < 2e-16
aneab    1    2.602    0.107

Approximate significance of smooth terms:
               edf Ref.df      F p-value
s(wave_age1) 4.181  5.147  77.56  <2e-16
s(wave_age2) 3.343  4.136 160.15  <2e-16
s(wave_age3) 3.625  4.477 180.89  <2e-16
s(wave_age4) 2.423  2.984 254.79  <2e-16
s(wave_age5) 1.000  1.000 376.76  <2e-16
s(hgage)     8.126  8.634 131.54  <2e-16
```

```r
plot(fit27byAge,pages=1, scale=-1, rug=F)
```

![](HILDA_files/figure-html/fit27byAgeLessThan40-1.png) 

The effect of the global crisis has been similar in all the 5 age groups.


## fit27: wave stratified by migration status (Australians vs English speaking migrants vs other migrants)


```r
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
sex      1 2865.237  < 2e-16
ancob3   2    1.659   0.1903
edhigh1  7  224.819  < 2e-16
jbmo62  49  185.196  < 2e-16
edcoq   58    3.532  < 2e-16
edqenr   1    4.281   0.0386
fmfo61  12    4.079 2.14e-06
fmmo61  11    7.632 2.57e-13
esdtl    2 6200.248  < 2e-16
mrcurr   7   54.969  < 2e-16
hhstate  8   45.837  < 2e-16
jbmwpsz 12  238.841  < 2e-16
jbocct   1 1392.422  < 2e-16

Approximate significance of smooth terms:
                 edf Ref.df     F p-value
s(wave_au)     4.785  5.876 480.2  <2e-16
s(wave_anglo)  2.575  3.183 137.3  <2e-16
s(wave_others) 1.312  1.552 364.4  <2e-16
s(hgage)       8.492  8.833 552.6  <2e-16
```

```r
plot(fit27byMigrationStatus,pages=1, scale=-1, rug=F) #all.terms=T
```

![](HILDA_files/figure-html/fit27byMigrationStatus-1.png) 

No differences in migration status.

## fit27: wave stratified by education


```r
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
sex      1 2459.354  < 2e-16
ancob3   2    5.948 0.002611
edhigh1  7   16.106  < 2e-16
jbmo62  49  152.686  < 2e-16
edcoq   58    3.268 7.62e-16
edqenr   1    4.183 0.040830
fmfo61  12    4.676 1.15e-07
fmmo61  11    4.453 9.57e-07
esdtl    2 5433.923  < 2e-16
mrcurr   7   51.043  < 2e-16
hhstate  8   40.255  < 2e-16
jbmwpsz 12  199.658  < 2e-16
jbocct   1 1092.297  < 2e-16
aneab    1   12.914 0.000326

Approximate significance of smooth terms:
              edf Ref.df      F p-value
s(wave_ed1) 3.592  4.441  49.68  <2e-16
s(wave_ed2) 1.052  1.102 297.35  <2e-16
s(wave_ed3) 3.776  4.666 141.44  <2e-16
s(wave_ed4) 3.272  4.050 103.61  <2e-16
s(wave_ed5) 4.466  5.471 183.63  <2e-16
s(wave_ed6) 4.256  5.233 106.72  <2e-16
s(wave_ed7) 4.659  5.697 145.79  <2e-16
s(hgage)    8.421  8.793 515.51  <2e-16
```

```r
plot(fit27byEducation,pages=1, scale=-1, rug=F) #all.terms=T
```

![](HILDA_files/figure-html/fit27byEducation-1.png) 

There is a weak effect: the higher the education level, the lighter the effect of the global crisis.

## fit27: wave stratified by skilled jobs (3 categories)


```r
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
sex      1 2451.504  < 2e-16
ancob3   2    6.043 0.002377
edhigh1  7  208.276  < 2e-16
jbmo62  49  127.001  < 2e-16
edcoq   58    3.286 5.29e-16
edqenr   1    3.523 0.060522
fmfo61  12    4.689 1.08e-07
fmmo61  11    4.550 6.18e-07
esdtl    2 5424.629  < 2e-16
mrcurr   7   50.837  < 2e-16
hhstate  8   40.228  < 2e-16
jbmwpsz 12  199.748  < 2e-16
jbocct   1 1095.365  < 2e-16
aneab    1   12.788 0.000349

Approximate significance of smooth terms:
                   edf Ref.df     F p-value
s(x$wave_skill1) 4.369  5.381 371.1  <2e-16
s(x$wave_skill2) 3.311  4.100 234.8  <2e-16
s(x$wave_skill3) 2.050  2.529 254.6  <2e-16
s(hgage)         8.394  8.775 518.1  <2e-16
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
sex      1 2410.965  < 2e-16
ancob3   2    4.406  0.01220
edhigh1  7  202.227  < 2e-16
jbmo62  49  178.313  < 2e-16
edcoq   58    6.622  < 2e-16
edqenr   1   23.373 1.34e-06
fmfo61  12    3.614 1.97e-05
fmmo61  11    5.415 1.13e-08
esdtl    2 5775.337  < 2e-16
mrcurr   7   39.944  < 2e-16
hhstate  8   42.839  < 2e-16
jbmwpsz 12  251.186  < 2e-16
jbocct   1 1123.511  < 2e-16
aneab    1    8.754  0.00309

Approximate significance of smooth terms:
         edf Ref.df     F p-value
s(dob) 8.685  8.920 367.8  <2e-16
s(age) 6.970  7.737 326.3  <2e-16
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
sex      1 2320.276  < 2e-16
ancob3   2    7.103 0.000824
edhigh1  7  245.826  < 2e-16
jbmo62  49  167.281  < 2e-16
edcoq   58   38.189  < 2e-16
edqenr   1    8.667 0.003242
fmfo61  11    3.780 1.92e-05
fmmo61  11    6.224 2.42e-10
esdtl    2 5313.383  < 2e-16
mrcurr   7   61.120  < 2e-16
hhstate  8   38.860  < 2e-16
jbmwpsz 12  304.048  < 2e-16
jbocct   1 1087.588  < 2e-16
aneab    1    6.250 0.012421

Approximate significance of smooth terms:
                  edf Ref.df       F  p-value
s(ehtse_au)     8.715  8.972 410.301  < 2e-16
s(ehtse_anglo)  8.184  8.822   5.848 5.28e-08
s(ehtse_others) 6.119  7.296  15.828  < 2e-16
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
sex      1 2321.673  < 2e-16
edhigh1  7  246.307  < 2e-16
jbmo62  49  167.289  < 2e-16
edcoq   58   38.031  < 2e-16
edqenr   1    9.122  0.00253
fmfo61  11    3.776 1.96e-05
fmmo61  11    6.191 2.84e-10
esdtl    2 5313.127  < 2e-16
mrcurr   7   61.349  < 2e-16
hhstate  8   39.045  < 2e-16
jbmwpsz 12  304.138  < 2e-16
jbocct   1 1088.038  < 2e-16
aneab    1    8.302  0.00396

Approximate significance of smooth terms:
                  edf Ref.df      F p-value
s(ehtse_au)     8.763  8.980 411.16  <2e-16
s(ehtse_anglo)  7.636  8.526  91.72  <2e-16
s(ehtse_others) 7.638  8.520 151.01  <2e-16
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



Comparison of the effects on satisfation by salary vs wages_perc.

##### Salary:

```
formula: jbmspay ~ hgsex + hgage + ancob3 + hhtype + jbocct + I(log(wsfei))
data:    xsub

 link  threshold nobs  logLik     AIC       niter max.grad cond.H 
 logit flexible  79719 -159741.32 319564.65 6(0)  7.06e-11 7.1e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.2206724  0.0132638  16.637  < 2e-16 ***
hgage                                                           0.0061449  0.0006306   9.745  < 2e-16 ***
ancob3imm_anglo                                                -0.1142401  0.0248515  -4.597 4.29e-06 ***
ancob3imm_others                                               -0.2081683  0.0188439 -11.047  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.1715821  0.0664289  -2.583 0.009796 ** 
hhtype[3] Couple family wo children w other not related        -0.3623190  0.0996293  -3.637 0.000276 ***
hhtype[4] Couple family with children < 15 wo others           -0.0490779  0.0166846  -2.942 0.003266 ** 
hhtype[5] Couple family with children < 15 w other related     -0.1105829  0.0755982  -1.463 0.143530    
hhtype[6] Couple family with children < 15 w other not related -0.0015036  0.1562610  -0.010 0.992322    
hhtype[7] Couple family with depst wo others                    0.0815521  0.0261063   3.124 0.001785 ** 
hhtype[8] Couple family with depst w other related             -0.0875201  0.1555062  -0.563 0.573566    
hhtype[9] Couple family with depst w other not related          0.3277938  0.2979217   1.100 0.271215    
hhtype[10] Couple family with ndepchild wo others               0.0841836  0.0270055   3.117 0.001825 ** 
hhtype[11] Couple family with ndepchild w other related         0.1496041  0.1458905   1.025 0.305149    
hhtype[12] Couple family with ndepchild w other not related     0.2623284  0.2141686   1.225 0.220625    
hhtype[13] Lone parent with children < 15 wo others            -0.3314761  0.0409188  -8.101 5.46e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.2874850  0.1072233  -2.681 0.007336 ** 
hhtype[15] Lone parent with children < 15 w other not related  -0.5373312  0.1822554  -2.948 0.003196 ** 
hhtype[16] Lone parent with depst wo others                    -0.1896881  0.0559921  -3.388 0.000705 ***
hhtype[17] Lone parent with depst w other related               0.2762909  0.2397294   1.153 0.249111    
hhtype[18] Lone parent with depst w other not related          -0.2511970  0.2983042  -0.842 0.399741    
hhtype[19] Lone parent with ndepchild wo others                -0.2892279  0.0421747  -6.858 6.99e-12 ***
hhtype[20] Lone parent with ndepchild w other related          -0.2015719  0.1436048  -1.404 0.160421    
hhtype[21] Lone parent with ndepchild w other not related      -0.5508488  0.2126881  -2.590 0.009599 ** 
hhtype[22] Other related family wo children < 15 or others     -0.0715194  0.0715877  -0.999 0.317772    
hhtype[23] Other related family wo children < 15 w others       0.0309630  0.1430150   0.217 0.828597    
hhtype[24] Lone person                                         -0.1316443  0.0207695  -6.338 2.32e-10 ***
hhtype[25] Group household                                     -0.1784903  0.0448199  -3.982 6.82e-05 ***
hhtype[26] Multi family household                              -0.0568935  0.0490405  -1.160 0.245994    
jbocct                                                          0.0032830  0.0007556   4.345 1.39e-05 ***
I(log(wsfei))                                                   0.5393748  0.0111586  48.337  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1    1.3567     0.1241   10.93
1|2    2.0872     0.1215   17.18
2|3    2.8588     0.1202   23.79
3|4    3.5323     0.1197   29.50
4|5    3.9878     0.1196   33.33
5|6    4.6541     0.1197   38.87
6|7    5.2435     0.1200   43.69
7|8    6.1699     0.1206   51.17
8|9    7.4316     0.1214   61.20
9|10   8.4739     0.1221   69.41
```

```
[1]     41.0 319564.6
```

##### wages_perc


```
formula: jbmspay ~ hgsex + hgage + ancob3 + hhtype + jbocct + wages_perc
data:    xsub

 link  threshold nobs  logLik     AIC       niter max.grad cond.H 
 logit flexible  79719 -160114.01 320310.02 6(0)  1.61e-10 4.2e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.1445432  0.0129859  11.131  < 2e-16 ***
hgage                                                           0.0074719  0.0006283  11.892  < 2e-16 ***
ancob3imm_anglo                                                -0.0823736  0.0248707  -3.312 0.000926 ***
ancob3imm_others                                               -0.2106631  0.0188529 -11.174  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.2035567  0.0664443  -3.064 0.002187 ** 
hhtype[3] Couple family wo children w other not related        -0.4090325  0.0995999  -4.107 4.01e-05 ***
hhtype[4] Couple family with children < 15 wo others           -0.0401893  0.0166936  -2.407 0.016064 *  
hhtype[5] Couple family with children < 15 w other related     -0.1372199  0.0756714  -1.813 0.069776 .  
hhtype[6] Couple family with children < 15 w other not related -0.0384510  0.1561934  -0.246 0.805546    
hhtype[7] Couple family with depst wo others                    0.0521984  0.0260797   2.001 0.045339 *  
hhtype[8] Couple family with depst w other related             -0.1226732  0.1561471  -0.786 0.432087    
hhtype[9] Couple family with depst w other not related          0.2613997  0.2986464   0.875 0.381421    
hhtype[10] Couple family with ndepchild wo others               0.0377908  0.0269528   1.402 0.160882    
hhtype[11] Couple family with ndepchild w other related         0.0796851  0.1459729   0.546 0.585142    
hhtype[12] Couple family with ndepchild w other not related     0.2246585  0.2155852   1.042 0.297371    
hhtype[13] Lone parent with children < 15 wo others            -0.3706247  0.0408436  -9.074  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.3735279  0.1066984  -3.501 0.000464 ***
hhtype[15] Lone parent with children < 15 w other not related  -0.5823410  0.1816172  -3.206 0.001344 ** 
hhtype[16] Lone parent with depst wo others                    -0.2353381  0.0559705  -4.205 2.61e-05 ***
hhtype[17] Lone parent with depst w other related               0.2066682  0.2379164   0.869 0.385034    
hhtype[18] Lone parent with depst w other not related          -0.2622393  0.2944082  -0.891 0.373072    
hhtype[19] Lone parent with ndepchild wo others                -0.3474108  0.0421066  -8.251  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.2300927  0.1427900  -1.611 0.107091    
hhtype[21] Lone parent with ndepchild w other not related      -0.6075166  0.2120422  -2.865 0.004169 ** 
hhtype[22] Other related family wo children < 15 or others     -0.1003858  0.0715115  -1.404 0.160387    
hhtype[23] Other related family wo children < 15 w others      -0.0142616  0.1425146  -0.100 0.920288    
hhtype[24] Lone person                                         -0.1493794  0.0207735  -7.191 6.44e-13 ***
hhtype[25] Group household                                     -0.2010992  0.0447611  -4.493 7.03e-06 ***
hhtype[26] Multi family household                              -0.1085802  0.0490025  -2.216 0.026704 *  
jbocct                                                          0.0041598  0.0007550   5.510 3.60e-08 ***
wages_perc                                                      0.9216683  0.0230449  39.994  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1  -3.91593    0.04475 -87.505
1|2  -3.18594    0.03660 -87.048
2|3  -2.41516    0.03177 -76.026
3|4  -1.74281    0.02953 -59.013
4|5  -1.28856    0.02867 -44.938
5|6  -0.62567    0.02800 -22.342
6|7  -0.04055    0.02780  -1.459
7|8   0.87886    0.02799  31.405
8|9   2.13197    0.02888  73.812
9|10  3.17120    0.03047 104.076
```

```
[1]     41 320310
```

The model fitted with the wager_perc variable is a better choice than that with the annula salary wsfei.



```
formula: jbmspay ~ hgsex + hgage + hhtype + ancob3 + jbocct:ancob3 + wages_perc:ancob3
data:    xsub

 link  threshold nobs  logLik     AIC       niter max.grad cond.H 
 logit flexible  79719 -160083.74 320257.47 6(0)  2.45e-10 4.1e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.1443953  0.0129907  11.115  < 2e-16 ***
hgage                                                           0.0076909  0.0006299  12.210  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.2061944  0.0664507  -3.103 0.001916 ** 
hhtype[3] Couple family wo children w other not related        -0.4040715  0.0997039  -4.053 5.06e-05 ***
hhtype[4] Couple family with children < 15 wo others           -0.0397231  0.0167091  -2.377 0.017438 *  
hhtype[5] Couple family with children < 15 w other related     -0.1355536  0.0756716  -1.791 0.073239 .  
hhtype[6] Couple family with children < 15 w other not related -0.0308641  0.1561886  -0.198 0.843352    
hhtype[7] Couple family with depst wo others                    0.0493866  0.0260769   1.894 0.058241 .  
hhtype[8] Couple family with depst w other related             -0.1123981  0.1563392  -0.719 0.472180    
hhtype[9] Couple family with depst w other not related          0.2448635  0.2988651   0.819 0.412609    
hhtype[10] Couple family with ndepchild wo others               0.0331253  0.0269647   1.228 0.219271    
hhtype[11] Couple family with ndepchild w other related         0.0829348  0.1460254   0.568 0.570071    
hhtype[12] Couple family with ndepchild w other not related     0.2167202  0.2152330   1.007 0.313978    
hhtype[13] Lone parent with children < 15 wo others            -0.3742259  0.0408397  -9.163  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.3675145  0.1066330  -3.447 0.000568 ***
hhtype[15] Lone parent with children < 15 w other not related  -0.5787095  0.1813559  -3.191 0.001418 ** 
hhtype[16] Lone parent with depst wo others                    -0.2391539  0.0559935  -4.271 1.95e-05 ***
hhtype[17] Lone parent with depst w other related               0.2129566  0.2382565   0.894 0.371422    
hhtype[18] Lone parent with depst w other not related          -0.2612939  0.2943649  -0.888 0.374727    
hhtype[19] Lone parent with ndepchild wo others                -0.3492045  0.0421144  -8.292  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.2379298  0.1427894  -1.666 0.095654 .  
hhtype[21] Lone parent with ndepchild w other not related      -0.6152313  0.2116783  -2.906 0.003656 ** 
hhtype[22] Other related family wo children < 15 or others     -0.1013329  0.0714881  -1.417 0.156343    
hhtype[23] Other related family wo children < 15 w others      -0.0106094  0.1426571  -0.074 0.940716    
hhtype[24] Lone person                                         -0.1496184  0.0207816  -7.200 6.04e-13 ***
hhtype[25] Group household                                     -0.2024683  0.0447687  -4.523 6.11e-06 ***
hhtype[26] Multi family household                              -0.1115772  0.0490129  -2.276 0.022817 *  
ancob3imm_anglo                                                -0.3143116  0.0549831  -5.717 1.09e-08 ***
ancob3imm_others                                               -0.4437246  0.0412826 -10.748  < 2e-16 ***
ancob3australians:jbocct                                        0.0031730  0.0008335   3.807 0.000141 ***
ancob3imm_anglo:jbocct                                          0.0042583  0.0022416   1.900 0.057479 .  
ancob3imm_others:jbocct                                         0.0092586  0.0018278   5.065 4.08e-07 ***
ancob3australians:wages_perc                                    0.8491969  0.0256071  33.163  < 2e-16 ***
ancob3imm_anglo:wages_perc                                      1.2615844  0.0824935  15.293  < 2e-16 ***
ancob3imm_others:wages_perc                                     1.1841235  0.0623650  18.987  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1  -3.95581    0.04508  -87.76
1|2  -3.22577    0.03699  -87.20
2|3  -2.45491    0.03222  -76.20
3|4  -1.78240    0.03001  -59.39
4|5  -1.32797    0.02916  -45.54
5|6  -0.66467    0.02849  -23.33
6|7  -0.07916    0.02828   -2.80
7|8   0.84074    0.02844   29.56
8|9   2.09435    0.02931   71.44
9|10  3.13390    0.03087  101.52
```

```
[1]     45.0 320257.5
```

AIC improved.



##### Smoothing satisfaction pay


```
## Loading required package: stats4
## Loading required package: splines
## 
## Attaching package: 'VGAM'
## 
## The following objects are masked from 'package:ordinal':
## 
##     dgumbel, dlgamma, pgumbel, plgamma, qgumbel, rgumbel, wine
```

We now create three variables: the wage (or wage_perc) for Australians, English-speaking migrants and other migrants.
We fit a generalized additive model with the effect of these three variable smoothed.

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

 link  threshold nobs  logLik     AIC       niter max.grad cond.H 
 logit flexible  79719 -147980.73 296043.46 6(0)  1.83e-10 7.0e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.2572103  0.0133473  19.271  < 2e-16 ***
hgage                                                          -0.0111441  0.0006288 -17.721  < 2e-16 ***
ancob3imm_anglo                                                -0.1201560  0.0252316  -4.762 1.92e-06 ***
ancob3imm_others                                               -0.2584108  0.0188249 -13.727  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.0401012  0.0658309  -0.609 0.542422    
hhtype[3] Couple family wo children w other not related        -0.2301645  0.0995887  -2.311 0.020825 *  
hhtype[4] Couple family with children < 15 wo others           -0.1547626  0.0168770  -9.170  < 2e-16 ***
hhtype[5] Couple family with children < 15 w other related     -0.2700540  0.0753116  -3.586 0.000336 ***
hhtype[6] Couple family with children < 15 w other not related -0.4203686  0.1546986  -2.717 0.006581 ** 
hhtype[7] Couple family with depst wo others                   -0.0784758  0.0260877  -3.008 0.002628 ** 
hhtype[8] Couple family with depst w other related             -0.0333386  0.1603866  -0.208 0.835335    
hhtype[9] Couple family with depst w other not related         -0.0476402  0.3035391  -0.157 0.875285    
hhtype[10] Couple family with ndepchild wo others              -0.0209177  0.0271169  -0.771 0.440476    
hhtype[11] Couple family with ndepchild w other related        -0.3129115  0.1434030  -2.182 0.029106 *  
hhtype[12] Couple family with ndepchild w other not related    -0.1258305  0.2205835  -0.570 0.568377    
hhtype[13] Lone parent with children < 15 wo others            -0.3269575  0.0406885  -8.036 9.31e-16 ***
hhtype[14] Lone parent with children < 15 w other related       0.0372419  0.1063465   0.350 0.726193    
hhtype[15] Lone parent with children < 15 w other not related  -0.4268830  0.1811657  -2.356 0.018457 *  
hhtype[16] Lone parent with depst wo others                    -0.1874852  0.0558719  -3.356 0.000792 ***
hhtype[17] Lone parent with depst w other related              -0.0356852  0.2498044  -0.143 0.886407    
hhtype[18] Lone parent with depst w other not related          -0.1024530  0.3127374  -0.328 0.743214    
hhtype[19] Lone parent with ndepchild wo others                -0.2926868  0.0423305  -6.914 4.70e-12 ***
hhtype[20] Lone parent with ndepchild w other related          -0.3492102  0.1389268  -2.514 0.011950 *  
hhtype[21] Lone parent with ndepchild w other not related      -0.4042177  0.2265274  -1.784 0.074357 .  
hhtype[22] Other related family wo children < 15 or others     -0.2792495  0.0728622  -3.833 0.000127 ***
hhtype[23] Other related family wo children < 15 w others      -0.0672482  0.1416332  -0.475 0.634926    
hhtype[24] Lone person                                         -0.2246135  0.0209582 -10.717  < 2e-16 ***
hhtype[25] Group household                                     -0.2267130  0.0457602  -4.954 7.26e-07 ***
hhtype[26] Multi family household                               0.0173497  0.0487979   0.356 0.722185    
jbocct                                                          0.0173843  0.0007616  22.828  < 2e-16 ***
I(log(wsfei))                                                   0.1199442  0.0110327  10.872  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1  -3.83000    0.12446 -30.772
1|2  -3.16955    0.12158 -26.070
2|3  -2.53322    0.12011 -21.091
3|4  -2.03393    0.11947 -17.024
4|5  -1.66003    0.11918 -13.929
5|6  -1.01445    0.11892  -8.531
6|7  -0.61468    0.11885  -5.172
7|8   0.02995    0.11882   0.252
8|9   0.98817    0.11888   8.312
9|10  2.01099    0.11899  16.900
```

##### wages_perc


```
formula: jbmssec ~ hgsex + hgage + ancob3 + hhtype + jbocct + wages_perc
data:    xsub

 link  threshold nobs  logLik     AIC       niter max.grad cond.H 
 logit flexible  79719 -147991.83 296065.67 6(0)  7.11e-11 4.5e+06

Coefficients:
                                                                 Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.2418932  0.0130688  18.509  < 2e-16 ***
hgage                                                          -0.0108992  0.0006269 -17.387  < 2e-16 ***
ancob3imm_anglo                                                -0.1131111  0.0252165  -4.486 7.27e-06 ***
ancob3imm_others                                               -0.2591232  0.0188243 -13.765  < 2e-16 ***
hhtype[2] Couple family wo children w other related            -0.0487301  0.0658592  -0.740 0.459352    
hhtype[3] Couple family wo children w other not related        -0.2402430  0.0996388  -2.411 0.015903 *  
hhtype[4] Couple family with children < 15 wo others           -0.1525610  0.0168761  -9.040  < 2e-16 ***
hhtype[5] Couple family with children < 15 w other related     -0.2756577  0.0752685  -3.662 0.000250 ***
hhtype[6] Couple family with children < 15 w other not related -0.4290006  0.1545833  -2.775 0.005517 ** 
hhtype[7] Couple family with depst wo others                   -0.0840881  0.0260703  -3.225 0.001258 ** 
hhtype[8] Couple family with depst w other related             -0.0418763  0.1604223  -0.261 0.794064    
hhtype[9] Couple family with depst w other not related         -0.0550395  0.3041648  -0.181 0.856404    
hhtype[10] Couple family with ndepchild wo others              -0.0299234  0.0270725  -1.105 0.269027    
hhtype[11] Couple family with ndepchild w other related        -0.3250945  0.1434523  -2.266 0.023438 *  
hhtype[12] Couple family with ndepchild w other not related    -0.1363795  0.2205932  -0.618 0.536417    
hhtype[13] Lone parent with children < 15 wo others            -0.3350263  0.0406760  -8.236  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related       0.0195177  0.1062991   0.184 0.854319    
hhtype[15] Lone parent with children < 15 w other not related  -0.4360353  0.1812501  -2.406 0.016141 *  
hhtype[16] Lone parent with depst wo others                    -0.1967336  0.0558681  -3.521 0.000429 ***
hhtype[17] Lone parent with depst w other related              -0.0467116  0.2494266  -0.187 0.851444    
hhtype[18] Lone parent with depst w other not related          -0.1180243  0.3119705  -0.378 0.705194    
hhtype[19] Lone parent with ndepchild wo others                -0.3051531  0.0422876  -7.216 5.35e-13 ***
hhtype[20] Lone parent with ndepchild w other related          -0.3532728  0.1388830  -2.544 0.010969 *  
hhtype[21] Lone parent with ndepchild w other not related      -0.4131255  0.2266947  -1.822 0.068396 .  
hhtype[22] Other related family wo children < 15 or others     -0.2859037  0.0728271  -3.926 8.64e-05 ***
hhtype[23] Other related family wo children < 15 w others      -0.0741511  0.1415077  -0.524 0.600273    
hhtype[24] Lone person                                         -0.2282395  0.0209564 -10.891  < 2e-16 ***
hhtype[25] Group household                                     -0.2306023  0.0457647  -5.039 4.68e-07 ***
hhtype[26] Multi family household                               0.0065470  0.0487762   0.134 0.893225    
jbocct                                                          0.0175606  0.0007607  23.085  < 2e-16 ***
wages_perc                                                      0.2245390  0.0229106   9.801  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1  -4.99612    0.04739 -105.43
1|2  -4.33568    0.03914 -110.78
2|3  -3.69934    0.03423 -108.06
3|4  -3.20006    0.03182 -100.55
4|5  -2.82616    0.03060  -92.37
5|6  -2.18069    0.02925  -74.56
6|7  -1.78102    0.02874  -61.97
7|8  -1.13651    0.02826  -40.22
8|9  -0.17861    0.02799   -6.38
9|10  0.84398    0.02816   29.97
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




































