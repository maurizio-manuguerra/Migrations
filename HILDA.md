
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

## Data

* Load the data and make some home cleaning (details omitted).


* Create the variable wages_perc: percentile of salary specific to each job [details omitted].


* Plot wages_perc vs wages (each job-code [1 digit] is a different color):
![plot of chunk plot_wages_perc](HILDA_files/figure-html/plot_wages_perc.png) 


## Pre-analyses
Initially we use the annual salary variable *wsfei*.
In the next analyses, there are no random effects over the subjects.
The first analysis is a simple linear model:


```

Call:
lm(formula = model12, data = x)

Residuals:
    Min      1Q  Median      3Q     Max 
-106268  -14397   -1346   11527  452755 

Coefficients:
                                                                    Estimate Std. Error t value Pr(>|t|)    
(Intercept)                                                          61695.3    20268.3    3.04  0.00234 ** 
wave                                                                  1190.0      142.2    8.37  < 2e-16 ***
sex[2] Female                                                       -13872.3      387.7  -35.78  < 2e-16 ***
age_at_interview                                                       220.2       13.8   15.98  < 2e-16 ***
edhigh1[2] Grad diploma, grad certificate                            -6748.3     1063.3   -6.35  2.2e-10 ***
edhigh1[3] Bachelor or honours                                      -10151.9      936.6  -10.84  < 2e-16 ***
edhigh1[4] Adv diploma, diploma                                     -15315.9     1012.6  -15.13  < 2e-16 ***
edhigh1[5] Cert III or IV                                           -17366.0      980.1  -17.72  < 2e-16 ***
edhigh1[8] Year 12                                                  -20243.5      992.1  -20.40  < 2e-16 ***
edhigh1[9] Year 11 and below                                        -22743.6      975.4  -23.32  < 2e-16 ***
edhigh1[10] Undetermined                                            -39725.9    11765.1   -3.38  0.00073 ***
jbmo62[11] Chief Executives, General Managers and Legislators        26069.4    20311.9    1.28  0.19934    
jbmo62[12] Farmers and Farm Managers                                -40081.9    20246.5   -1.98  0.04775 *  
jbmo62[13] Specialist Managers                                       12852.3    20234.4    0.64  0.52532    
jbmo62[14] Hospitality, Retail and Service Managers                 -14595.3    20237.6   -0.72  0.47080    
jbmo62[20] Professionals                                             20338.6    23354.8    0.87  0.38384    
jbmo62[21] Arts and Media Professionals                             -21131.4    20289.6   -1.04  0.29766    
jbmo62[22] Business, Human Resource and Marketing Professionals       1782.2    20237.0    0.09  0.92982    
jbmo62[23] Design, Engineering, Science and Transport Professionals  -7523.0    20247.4   -0.37  0.71023    
jbmo62[24] Education Professionals                                  -12189.5    20238.6   -0.60  0.54698    
jbmo62[25] Health Professionals                                      -3383.8    20243.9   -0.17  0.86725    
jbmo62[26] ICT Professionals                                          2803.6    20261.9    0.14  0.88995    
jbmo62[27] Legal, Social and Welfare Professionals                  -15042.6    20261.2   -0.74  0.45783    
jbmo62[30] Technicians and Trades Workers                             7161.8    28596.3    0.25  0.80225    
jbmo62[31] Engineering, ICT and Science Technicians                  -7784.7    20256.3   -0.38  0.70075    
jbmo62[32] Automotive and Engineering Trades Workers                -14810.2    20243.5   -0.73  0.46442    
jbmo62[33] Construction Trades Workers                              -29968.7    20246.3   -1.48  0.13883    
jbmo62[34] Electrotechnology and Telecommunications Trades Workers  -14619.9    20256.7   -0.72  0.47046    
jbmo62[35] Food Trades Workers                                      -22206.2    20279.8   -1.09  0.27353    
jbmo62[36] Skilled Animal and Horticultural Workers                 -30247.4    20275.1   -1.49  0.13575    
jbmo62[39] Other Technicians and Trades Workers                     -21595.3    20256.2   -1.07  0.28638    
jbmo62[41] Health and Welfare Support Workers                       -12912.0    20271.8   -0.64  0.52417    
jbmo62[42] Carers and Aides                                         -22496.1    20241.7   -1.11  0.26642    
jbmo62[43] Hospitality Workers                                      -25132.7    20253.7   -1.24  0.21465    
jbmo62[44] Protective Service Workers                                -2817.2    20268.9   -0.14  0.88946    
jbmo62[45] Sports and Personal Service Workers                      -25175.8    20279.8   -1.24  0.21446    
jbmo62[51] Office Managers and Program Administrators                -2920.9    20256.8   -0.14  0.88535    
jbmo62[52] Personal Assistants and Secretaries                       -9788.2    20265.4   -0.48  0.62910    
jbmo62[53] General Clerical Workers                                 -14449.2    20250.9   -0.71  0.47554    
jbmo62[54] Inquiry Clerks and Receptionists                         -15830.6    20251.5   -0.78  0.43440    
jbmo62[55] Numerical Clerks                                         -13884.3    20242.5   -0.69  0.49278    
jbmo62[56] Clerical and Office Support Workers                      -21104.0    20284.6   -1.04  0.29816    
jbmo62[59] Other Clerical and Administrative Workers                -11270.3    20250.9   -0.56  0.57785    
jbmo62[61] Sales Representatives and Agents                          -8119.0    20264.7   -0.40  0.68868    
jbmo62[62] Sales Assistants and Salespersons                        -24761.8    20234.8   -1.22  0.22107    
jbmo62[63] Sales Support Workers                                    -24101.7    20262.7   -1.19  0.23427    
jbmo62[71] Machine and Stationary Plant Operators                    -4228.5    20257.6   -0.21  0.83465    
jbmo62[72] Mobile Plant Operators                                   -15775.6    20277.7   -0.78  0.43659    
jbmo62[73] Road and Rail Drivers                                    -17141.5    20248.2   -0.85  0.39724    
jbmo62[74] Storepersons                                             -19658.9    20314.5   -0.97  0.33319    
jbmo62[80] Labourers                                                -17998.8    26106.2   -0.69  0.49055    
jbmo62[81] Cleaners and Laundry Workers                             -29621.6    20252.2   -1.46  0.14358    
jbmo62[82] Construction and Mining Labourers                        -23799.0    20277.3   -1.17  0.24053    
jbmo62[83] Factory Process Workers                                  -17640.2    20250.7   -0.87  0.38371    
jbmo62[84] Farm, Forestry and Garden Workers                        -32157.6    20270.8   -1.59  0.11266    
jbmo62[85] Food Preparation Assistants                              -29999.7    20270.8   -1.48  0.13890    
jbmo62[89] Other Labourers                                          -31473.5    20253.0   -1.55  0.12019    
ancob[1201] New Zealand                                               1462.9     1043.0    1.40  0.16077    
ancob[1302] Papua New Guinea                                         -1798.9     3254.1   -0.55  0.58040    
ancob[1303] Solomon Islands                                         -13176.6    14331.0   -0.92  0.35787    
ancob[1402] Kiribati                                                 -3236.8    16533.1   -0.20  0.84478    
ancob[1405] Nauru                                                   -10799.4    20257.0   -0.53  0.59395    
ancob[1501] Cook Islands                                             26209.0    14355.0    1.83  0.06789 .  
ancob[1502] Fiji                                                     -5581.1     2831.7   -1.97  0.04874 *  
ancob[1505] Samoa                                                     9648.1     6113.5    1.58  0.11454    
ancob[1508] Tonga                                                     4806.3     7412.3    0.65  0.51672    
ancob[2100] United Kingdom                                            1561.0      700.2    2.23  0.02580 *  
ancob[2201] Ireland                                                  -5535.4     3028.6   -1.83  0.06760 .  
ancob[2301] Austria                                                  -2999.3     6420.6   -0.47  0.64040    
ancob[2302] Belgium                                                   6617.1     7404.4    0.89  0.37150    
ancob[2303] France                                                   -5823.7     5147.7   -1.13  0.25793    
ancob[2304] Germany                                                  -3289.3     2058.4   -1.60  0.11005    
ancob[2308] Netherlands                                               2897.8     2323.5    1.25  0.21235    
ancob[2311] Switzerland                                             -13721.4     6951.9   -1.97  0.04842 *  
ancob[2401] Denmark                                                  -7742.3    10119.7   -0.77  0.44423    
ancob[2403] Finland                                                   9368.6     8271.3    1.13  0.25736    
ancob[2405] Iceland                                                  -3231.5    14323.9   -0.23  0.82151    
ancob[2406] Norway                                                   -1245.8    14378.2   -0.09  0.93095    
ancob[2407] Sweden                                                    1624.6     6757.7    0.24  0.81002    
ancob[3104] Italy                                                    -4028.9     2484.5   -1.62  0.10490    
ancob[3105] Malta                                                     9742.9     4653.2    2.09  0.03628 *  
ancob[3106] Portugal                                                  4116.9     5748.7    0.72  0.47391    
ancob[3108] Spain                                                    -2927.7     5236.0   -0.56  0.57607    
ancob[3202] Bosnia and Herzegovina                                    2542.8     8273.8    0.31  0.75860    
ancob[3203] Bulgaria                                                -29693.9     8280.7   -3.59  0.00034 ***
ancob[3204] Croatia                                                   8768.5     3708.0    2.36  0.01805 *  
ancob[3205] Cyprus                                                   43367.0     8655.4    5.01  5.5e-07 ***
ancob[3206] Former Yugoslav Republic of Macedonia (FYROM)           -14675.0     5075.4   -2.89  0.00384 ** 
ancob[3207] Greece                                                    1058.9     5629.7    0.19  0.85080    
ancob[3211] Romania                                                  15767.0     5518.9    2.86  0.00428 ** 
ancob[3213] Yugoslavia Federal Republic of                            4446.1     2874.5    1.55  0.12194    
ancob[3301] Belarus                                                  -5966.5    28670.2   -0.21  0.83515    
ancob[3302] Czech Republic                                           -3535.2     5328.2   -0.66  0.50702    
ancob[3303] Estonia                                                 -10040.6    11733.3   -0.86  0.39215    
ancob[3304] Hungary                                                  -8954.6     5069.7   -1.77  0.07736 .  
ancob[3305] Latvia                                                  -51434.1    16531.2   -3.11  0.00186 ** 
ancob[3306] Lithuania                                                37497.4    20239.9    1.85  0.06394 .  
ancob[3307] Poland                                                    -871.2     3043.1   -0.29  0.77467    
ancob[3308] Russian Federation                                      -10518.9     5079.2   -2.07  0.03837 *  
ancob[3311] Slovakia                                                   626.3    20255.7    0.03  0.97533    
ancob[3312] Ukraine                                                  -8533.1     7164.7   -1.19  0.23367    
ancob[4102] Egypt                                                    -8242.9     3980.9   -2.07  0.03840 *  
ancob[4103] Libya                                                     4130.6    14315.1    0.29  0.77293    
ancob[4105] Sudan                                                   -29504.8     7951.1   -3.71  0.00021 ***
ancob[4203] Iran                                                     -6422.5     4848.0   -1.32  0.18526    
ancob[4204] Iraq                                                    -16697.1     6404.0   -2.61  0.00913 ** 
ancob[4205] Israel                                                  -38970.3    28604.9   -1.36  0.17309    
ancob[4207] Kuwait                                                   -6342.4    28604.3   -0.22  0.82453    
ancob[4208] Lebanon                                                  -9850.8     3873.6   -2.54  0.01099 *  
ancob[4214] Syria                                                     3123.5    10828.0    0.29  0.77299    
ancob[4215] Turkey                                                    5242.0     4994.7    1.05  0.29395    
ancob[5101] Burma (Myanmar)                                          -4671.8     7673.4   -0.61  0.54264    
ancob[5102] Cambodia                                                 -7979.2     6258.6   -1.27  0.20234    
ancob[5103] Laos                                                     26968.0     9065.2    2.97  0.00293 ** 
ancob[5104] Thailand                                                 -1421.4     9064.9   -0.16  0.87540    
ancob[5105] Vietnam                                                   2699.1     2074.8    1.30  0.19331    
ancob[5201] Brunei Darussalam                                        -8429.0    16525.3   -0.51  0.61001    
ancob[5202] Indonesia                                                -9324.2     3911.1   -2.38  0.01713 *  
ancob[5203] Malaysia                                                 -2529.8     2755.8   -0.92  0.35863    
ancob[5204] Philippines                                              -2141.2     1782.6   -1.20  0.22969    
ancob[5205] Singapore                                               -15980.1     4845.7   -3.30  0.00098 ***
ancob[5206] East Timor                                                3406.9     7171.0    0.48  0.63472    
ancob[6101] China (excludes SARs and Taiwan)                        -10771.4     2339.2   -4.60  4.1e-06 ***
ancob[6102] Hong Kong (SAR of China)                                 -9788.3     3012.1   -3.25  0.00116 ** 
ancob[6105] Taiwan                                                  -20111.6     5071.7   -3.97  7.3e-05 ***
ancob[6201] Japan                                                    -5624.7     4597.6   -1.22  0.22119    
ancob[6203] Korea, Republic of (South)                              -16609.0    10823.1   -1.53  0.12490    
ancob[7101] Bangladesh                                               -6527.7     5432.0   -1.20  0.22948    
ancob[7103] India                                                     -763.8     2166.1   -0.35  0.72437    
ancob[7105] Nepal                                                   -15594.1     6273.2   -2.49  0.01293 *  
ancob[7106] Pakistan                                                  4647.2     8640.9    0.54  0.59071    
ancob[7107] Sri Lanka                                                 2457.9     2649.3    0.93  0.35355    
ancob[7201] Afghanistan                                             -11452.3     7947.0   -1.44  0.14957    
ancob[7203] Azerbaijan                                               -8941.0    28604.1   -0.31  0.75460    
ancob[8102] Canada                                                    8849.9     3533.6    2.50  0.01227 *  
ancob[8104] United States of America                                 -1302.2     2547.6   -0.51  0.60927    
ancob[8201] Argentina                                                 1068.7     6113.5    0.17  0.86122    
ancob[8203] Brazil                                                    9517.0     7667.9    1.24  0.21456    
ancob[8204] Chile                                                    -5855.5     4432.7   -1.32  0.18652    
ancob[8205] Colombia                                                 -9732.9     6266.2   -1.55  0.12038    
ancob[8206] Ecuador                                                 104139.2    28678.3    3.63  0.00028 ***
ancob[8213] Peru                                                      1097.8     7167.5    0.15  0.87827    
ancob[8215] Uruguay                                                  -3922.6     6585.7   -0.60  0.55144    
ancob[8216] Venezuela                                                -6234.3    12813.9   -0.49  0.62660    
ancob[8299] South America, nec                                       -2776.4    28690.1   -0.10  0.92291    
ancob[8303] El Salvador                                              37545.6    16534.2    2.27  0.02317 *  
ancob[8415] Jamaica                                                  -5919.1    10137.9   -0.58  0.55932    
ancob[8425] Trinidad and Tobago                                     -20789.9    14316.7   -1.45  0.14647    
ancob[9107] Congo                                                   -15921.8    20245.5   -0.79  0.43162    
ancob[9112] Equatorial Guinea                                       -26358.2    14316.4   -1.84  0.06561 .  
ancob[9115] Ghana                                                    46375.7    14331.7    3.24  0.00121 ** 
ancob[9124] Nigeria                                                   -501.2    16558.5   -0.03  0.97586    
ancob[9207] Ethiopia                                                 -6508.0    12801.3   -0.51  0.61119    
ancob[9208] Kenya                                                   -10999.3     8642.4   -1.27  0.20313    
ancob[9212] Madagascar                                               -5495.0    14320.2   -0.38  0.70119    
ancob[9213] Malawi                                                   -1720.5    16547.3   -0.10  0.91719    
ancob[9214] Mauritius                                                 4013.1     4143.2    0.97  0.33276    
ancob[9216] Mozambique                                                7930.2    10123.1    0.78  0.43341    
ancob[9224] Somalia                                                 -34191.9    12809.3   -2.67  0.00760 ** 
ancob[9225] South Africa                                             -2836.6     1970.2   -1.44  0.14994    
ancob[9227] Tanzania                                                 -8651.3     9063.2   -0.95  0.33981    
ancob[9231] Zambia                                                    4357.6     5851.5    0.74  0.45646    
ancob[9232] Zimbabwe                                                  4310.3     5153.8    0.84  0.40298    
ancob[9299] Southern and East Africa                                 -7270.5    16525.8   -0.44  0.65998    
anengfn                                                               -531.4      655.1   -0.81  0.41723    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 28600 on 31956 degrees of freedom
  (72956 observations deleted due to missingness)
Multiple R-squared:  0.288,	Adjusted R-squared:  0.284 
F-statistic: 78.8 on 164 and 31956 DF,  p-value: <2e-16
```

```
Analysis of Variance Table

Response: wsfei
                    Df   Sum Sq  Mean Sq F value Pr(>F)    
wave                 1 7.10e+10 7.10e+10   86.88 <2e-16 ***
sex                  1 1.74e+12 1.74e+12 2123.27 <2e-16 ***
age_at_interview     1 7.75e+11 7.75e+11  948.38 <2e-16 ***
edhigh1              7 3.62e+12 5.17e+11  632.51 <2e-16 ***
jbmo62              46 4.11e+12 8.93e+10  109.19 <2e-16 ***
ancob              107 2.62e+11 2.45e+09    3.00 <2e-16 ***
anengfn              1 5.38e+08 5.38e+08    0.66   0.42    
Residuals        31956 2.61e+13 8.18e+08                   
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Now we can load the *mgcv* package and use generalized additive models to analyse the data, smoothing the effect of *age_at_interview*. 

For brevity of output, an anova shows that every covariate is significant.


```

Family: gaussian 
Link function: identity 

Formula:
wsfei ~ wave + sex + s(age_at_interview) + edhigh1 + jbmo62 + 
    ancob

Parametric Terms:
         df       F p-value
wave      1 2999.70  <2e-16
sex       1 3941.19  <2e-16
edhigh1   7  367.84  <2e-16
jbmo62   49  278.37  <2e-16
ancob   127    6.32  <2e-16

Approximate significance of smooth terms:
                     edf Ref.df   F p-value
s(age_at_interview) 8.92   8.99 357  <2e-16
```

![plot of chunk model20](HILDA_files/figure-html/model20.png) 

Very simple model, it looks like there is a non-linear effect of *age_at_interview*.
Repeat the same analysis smoothing also the wave:


```

Family: gaussian 
Link function: identity 

Formula:
wsfei ~ s(wave) + sex + s(age_at_interview) + edhigh1 + jbmo62 + 
    ancob

Parametric Terms:
         df       F p-value
sex       1 3943.85  <2e-16
edhigh1   7  368.97  <2e-16
jbmo62   49  278.42  <2e-16
ancob   127    6.33  <2e-16

Approximate significance of smooth terms:
                     edf Ref.df   F p-value
s(wave)             4.31   5.30 573  <2e-16
s(age_at_interview) 8.91   8.99 357  <2e-16
```

![plot of chunk model21](HILDA_files/figure-html/model21.png) 

It looks we don't need to smooth the wave variable, as the effect is linear.

Finally we can look into the interaction of education and occupation (edhigh1 * jbmo62).


```

Family: gaussian 
Link function: identity 

Formula:
wsfei ~ wave + sex + s(age_at_interview) + edhigh1 * jbmo62 + 
    ancob

Parametric Terms:
                df       F p-value
wave             1 3015.03  <2e-16
sex              1 3920.54  <2e-16
edhigh1          7    1.96   0.057
jbmo62          49   29.03  <2e-16
ancob          127    5.46  <2e-16
edhigh1:jbmo62 287    8.01  <2e-16

Approximate significance of smooth terms:
                     edf Ref.df   F p-value
s(age_at_interview) 8.90   8.99 341  <2e-16
```

![plot of chunk model22](HILDA_files/figure-html/model22.png) 

Results show that the level of education is not significant per se, but only in combination with the occupation.

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

### Analyses 

In the next two analyses (fit27, fit28), we will fit two identical models with different dependent variables: wsfei (annual salary) and wage_perc (the annual salary is transformed into the percentile specific to the subject's occupation).

In the third fit (fit29), we add the random effects over the subjects (the fit fails when using the annual salary as dependent variable, but succesfully converge with wages_perc).


```

Family: gaussian 
Link function: identity 

Formula:
wsfei ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df       F p-value
sex      1 1909.66 < 2e-16
ancob3   2   16.18 9.4e-08
edhigh1  7  236.37 < 2e-16
jbmo62  49  161.90 < 2e-16
edcoq   69    3.46 < 2e-16
edqenr   1   30.23 3.8e-08
fmfo61  12    7.63 2.5e-14
fmmo61  11    3.32 0.00014
esdtl    2 2244.74 < 2e-16
mrcurr   7   47.87 < 2e-16
hhstate  8   33.04 < 2e-16
jbmwpsz 12  482.32 < 2e-16
jbocct   1  496.74 < 2e-16
aneab    1   11.03 0.00090

Approximate significance of smooth terms:
          edf Ref.df   F p-value
s(wave)  8.04   8.59 148  <2e-16
s(hgage) 8.79   8.97 182  <2e-16
```

![plot of chunk analyze_annual_salary_complete](HILDA_files/figure-html/analyze_annual_salary_complete1.png) 

```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df       F p-value
sex      1 1795.85 < 2e-16
ancob3   2   11.05 1.6e-05
edhigh1  7  165.18 < 2e-16
jbmo62  49  289.08 < 2e-16
edcoq   69    3.30 < 2e-16
edqenr   1   31.28 2.2e-08
fmfo61  12    3.09 0.00022
fmmo61  11    2.54 0.00326
esdtl    2 6001.02 < 2e-16
mrcurr   7   38.63 < 2e-16
hhstate  8   34.49 < 2e-16
jbmwpsz 12  951.45 < 2e-16
jbocct   1  881.82 < 2e-16
aneab    1   11.85 0.00058

Approximate significance of smooth terms:
          edf Ref.df   F p-value
s(wave)  8.69   8.95 229  <2e-16
s(hgage) 8.08   8.59 658  <2e-16
```

![plot of chunk analyze_annual_salary_complete](HILDA_files/figure-html/analyze_annual_salary_complete2.png) 

```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(wave) + s(hgage) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df       F p-value
sex      1 1083.31  <2e-16
ancob3   2    1.94  0.1435
edhigh1  7   96.60  <2e-16
jbmo62  49  374.94  <2e-16
edcoq   69    1.94   5e-06
edqenr   1   18.22   2e-05
fmfo61  12    1.07  0.3819
fmmo61  11    2.22  0.0110
esdtl    2 2941.58  <2e-16
mrcurr   7   16.96  <2e-16
hhstate  8   13.57  <2e-16
jbmwpsz 12  377.13  <2e-16
jbocct   1  324.03  <2e-16
aneab    1    8.34  0.0039

Approximate significance of smooth terms:
          edf Ref.df   F p-value
s(wave)  7.20   7.20 520  <2e-16
s(hgage) 8.58   8.58 608  <2e-16
```

![plot of chunk analyze_annual_salary_complete](HILDA_files/figure-html/analyze_annual_salary_complete3.png) 

The last fit (fit29) shows that the effect on the wave can be assumed linear and a few covariates are no more significant and can be eliminated from the model. These are:

* Occupation of parents
* ancob3: australian, migrant anglo, migrant other.

This result can be interpreted considering that the dependent variable is the salary percentile of the subject specific to his job. The occupation of the parents and the status of migrant could contribute to choice of the job, but not to the salary in it (hypothesis to test).

Now we elaborate on model28, removing wage from the model and using two temporal variables: the age of subject (a variable changing each year: yrivwfst-(2012-yrivwfst)-1+wave) and its date of birth (here we can use hgage, or dob=2012-hgage).


```

Family: gaussian 
Link function: identity 

Formula:
wages_perc ~ s(dob) + s(age) + sex + ancob3 + edhigh1 + jbmo62 + 
    edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + 
    jbmwpsz + jbocct + aneab

Parametric Terms:
        df       F p-value
sex      1 1781.70 < 2e-16
ancob3   2   10.36 3.2e-05
edhigh1  7  163.13 < 2e-16
jbmo62  49  286.89 < 2e-16
edcoq   69    4.02 < 2e-16
edqenr   1    8.68 0.00321
fmfo61  12    2.99 0.00034
fmmo61  11    2.81 0.00114
esdtl    2 5914.58 < 2e-16
mrcurr   7   32.14 < 2e-16
hhstate  8   34.81 < 2e-16
jbmwpsz 12  987.47 < 2e-16
jbocct   1  894.80 < 2e-16
aneab    1   11.40 0.00074

Approximate significance of smooth terms:
        edf Ref.df   F p-value
s(dob) 8.12   8.61 520  <2e-16
s(age) 7.20   7.88 184  <2e-16
```

![plot of chunk consider_age](HILDA_files/figure-html/consider_age.png) 
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
Warning: (2) Model is nearly unidentifiable: very large eigenvalue
 - Rescale variables? 
In addition: Absolute and relative convergence criteria were met
```

```
formula: jbmspay ~ hgsex + hgage + ancob3 + hhtype + jbocct + wsfei
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -214431.19 428944.37 6(0)  1.59e-07 5.9e+12

Coefficients:
                                                                Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 1.99e-01   1.13e-02   17.60  < 2e-16 ***
hgage                                                           3.66e-03   5.13e-04    7.13  1.0e-12 ***
ancob3australians                                               6.96e-02   2.20e-02    3.17  0.00154 ** 
ancob3others                                                   -1.37e-01   2.59e-02   -5.28  1.3e-07 ***
hhtype[2] Couple family wo children w other related            -1.46e-01   5.92e-02   -2.46  0.01405 *  
hhtype[3] Couple family wo children w other not related        -3.30e-01   9.06e-02   -3.64  0.00027 ***
hhtype[4] Couple family with children < 15 wo others           -8.52e-02   1.48e-02   -5.74  9.3e-09 ***
hhtype[5] Couple family with children < 15 w other related     -1.59e-01   6.50e-02   -2.45  0.01416 *  
hhtype[6] Couple family with children < 15 w other not related -1.15e-02   1.33e-01   -0.09  0.93124    
hhtype[7] Couple family with depst wo others                    7.82e-02   2.17e-02    3.60  0.00032 ***
hhtype[8] Couple family with depst w other related             -6.35e-02   1.21e-01   -0.52  0.60134    
hhtype[9] Couple family with depst w other not related          2.64e-01   2.17e-01    1.22  0.22220    
hhtype[10] Couple family with ndepchild wo others               2.57e-02   2.39e-02    1.08  0.28096    
hhtype[11] Couple family with ndepchild w other related         4.87e-02   1.22e-01    0.40  0.68940    
hhtype[12] Couple family with ndepchild w other not related    -2.85e-02   1.81e-01   -0.16  0.87479    
hhtype[13] Lone parent with children < 15 wo others            -3.24e-01   3.37e-02   -9.61  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -1.23e-01   8.74e-02   -1.40  0.16054    
hhtype[15] Lone parent with children < 15 w other not related  -2.18e-01   1.45e-01   -1.51  0.13232    
hhtype[16] Lone parent with depst wo others                    -1.39e-01   4.42e-02   -3.15  0.00162 ** 
hhtype[17] Lone parent with depst w other related               1.65e-01   1.85e-01    0.89  0.37309    
hhtype[18] Lone parent with depst w other not related          -1.98e-01   2.24e-01   -0.88  0.37648    
hhtype[19] Lone parent with ndepchild wo others                -2.80e-01   3.70e-02   -7.55  4.3e-14 ***
hhtype[20] Lone parent with ndepchild w other related          -2.94e-01   1.29e-01   -2.28  0.02245 *  
hhtype[21] Lone parent with ndepchild w other not related      -5.74e-01   1.78e-01   -3.22  0.00127 ** 
hhtype[22] Other related family wo children < 15 or others     -1.40e-01   6.06e-02   -2.31  0.02064 *  
hhtype[23] Other related family wo children < 15 w others      -1.93e-02   1.23e-01   -0.16  0.87535    
hhtype[24] Lone person                                         -1.32e-01   1.87e-02   -7.07  1.5e-12 ***
hhtype[25] Group household                                     -2.05e-01   4.00e-02   -5.13  2.9e-07 ***
hhtype[26] Multi family household                              -1.18e-01   4.25e-02   -2.77  0.00565 ** 
jbocct                                                          2.57e-03   6.42e-04    4.00  6.2e-05 ***
wsfei                                                           7.41e-06   1.45e-07   51.07  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1   -3.8422     0.0414  -92.75
1|2   -3.1671     0.0369  -85.94
2|3   -2.4502     0.0342  -71.69
3|4   -1.8178     0.0329  -55.21
4|5   -1.3822     0.0324  -42.63
5|6   -0.7237     0.0320  -22.60
6|7   -0.1728     0.0319   -5.42
7|8    0.7008     0.0320   21.92
8|9    1.9005     0.0325   58.48
9|10   2.8801     0.0335   86.05
```

The model is nearly unidentifiable: very large eigenvalue.

Let's try with wages_perc...

##### wages_perc

```
formula: jbmspay ~ hgsex + hgage + ancob3 + hhtype + jbocct + wages_perc
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -215129.67 430341.35 6(0)  5.57e-11 3.0e+06

Coefficients:
                                                                Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.137973   0.011180   12.34  < 2e-16 ***
hgage                                                           0.005443   0.000511   10.66  < 2e-16 ***
ancob3australians                                               0.028976   0.021986    1.32  0.18751    
ancob3others                                                   -0.180012   0.025933   -6.94  3.9e-12 ***
hhtype[2] Couple family wo children w other related            -0.170662   0.059266   -2.88  0.00398 ** 
hhtype[3] Couple family wo children w other not related        -0.367968   0.090842   -4.05  5.1e-05 ***
hhtype[4] Couple family with children < 15 wo others           -0.059128   0.014834   -3.99  6.7e-05 ***
hhtype[5] Couple family with children < 15 w other related     -0.169550   0.064990   -2.61  0.00908 ** 
hhtype[6] Couple family with children < 15 w other not related -0.030406   0.133499   -0.23  0.81983    
hhtype[7] Couple family with depst wo others                    0.069042   0.021724    3.18  0.00148 ** 
hhtype[8] Couple family with depst w other related             -0.088143   0.121632   -0.72  0.46865    
hhtype[9] Couple family with depst w other not related          0.245796   0.217463    1.13  0.25835    
hhtype[10] Couple family with ndepchild wo others              -0.005282   0.023845   -0.22  0.82469    
hhtype[11] Couple family with ndepchild w other related        -0.004705   0.121768   -0.04  0.96918    
hhtype[12] Couple family with ndepchild w other not related    -0.054125   0.181879   -0.30  0.76602    
hhtype[13] Lone parent with children < 15 wo others            -0.342108   0.033694  -10.15  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.177304   0.087003   -2.04  0.04156 *  
hhtype[15] Lone parent with children < 15 w other not related  -0.257434   0.144517   -1.78  0.07486 .  
hhtype[16] Lone parent with depst wo others                    -0.160911   0.044142   -3.65  0.00027 ***
hhtype[17] Lone parent with depst w other related               0.143234   0.185336    0.77  0.43962    
hhtype[18] Lone parent with depst w other not related          -0.205578   0.222616   -0.92  0.35577    
hhtype[19] Lone parent with ndepchild wo others                -0.325455   0.036963   -8.80  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.308814   0.128256   -2.41  0.01605 *  
hhtype[21] Lone parent with ndepchild w other not related      -0.623601   0.177568   -3.51  0.00044 ***
hhtype[22] Other related family wo children < 15 or others     -0.158887   0.060593   -2.62  0.00874 ** 
hhtype[23] Other related family wo children < 15 w others      -0.048683   0.122994   -0.40  0.69224    
hhtype[24] Lone person                                         -0.147855   0.018671   -7.92  2.4e-15 ***
hhtype[25] Group household                                     -0.226682   0.039920   -5.68  1.4e-08 ***
hhtype[26] Multi family household                              -0.151416   0.042472   -3.57  0.00036 ***
jbocct                                                          0.002367   0.000642    3.69  0.00023 ***
wages_perc                                                      0.732327   0.019604   37.36  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1   -3.7736     0.0420  -89.88
1|2   -3.0989     0.0375  -82.68
2|3   -2.3827     0.0349  -68.35
3|4   -1.7511     0.0336  -52.05
4|5   -1.3166     0.0332  -39.70
5|6   -0.6609     0.0328  -20.16
6|7   -0.1139     0.0327   -3.48
7|8    0.7516     0.0328   22.93
8|9    1.9378     0.0333   58.22
9|10   2.9100     0.0342   85.08
```

Very good fit.

#### Satisfaction for job security:

##### Salary:


```
Warning: (2) Model is nearly unidentifiable: very large eigenvalue
 - Rescale variables? 
In addition: Absolute and relative convergence criteria were met
```

```
formula: jbmssec ~ hgsex + hgage + ancob3 + hhtype + jbocct + wsfei
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -197442.21 394966.43 6(0)  1.43e-07 6.8e+12

Coefficients:
                                                                Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 2.42e-01   1.14e-02   21.31  < 2e-16 ***
hgage                                                          -9.43e-03   5.11e-04  -18.45  < 2e-16 ***
ancob3australians                                               1.64e-01   2.24e-02    7.33  2.4e-13 ***
ancob3others                                                   -1.17e-01   2.62e-02   -4.44  8.9e-06 ***
hhtype[2] Couple family wo children w other related            -6.36e-02   5.87e-02   -1.08  0.27796    
hhtype[3] Couple family wo children w other not related        -2.03e-01   9.07e-02   -2.24  0.02520 *  
hhtype[4] Couple family with children < 15 wo others           -1.90e-01   1.50e-02  -12.63  < 2e-16 ***
hhtype[5] Couple family with children < 15 w other related     -3.28e-01   6.50e-02   -5.04  4.6e-07 ***
hhtype[6] Couple family with children < 15 w other not related -3.69e-01   1.34e-01   -2.76  0.00583 ** 
hhtype[7] Couple family with depst wo others                   -1.46e-01   2.17e-02   -6.72  1.8e-11 ***
hhtype[8] Couple family with depst w other related             -1.96e-01   1.23e-01   -1.59  0.11175    
hhtype[9] Couple family with depst w other not related         -6.29e-02   2.27e-01   -0.28  0.78209    
hhtype[10] Couple family with ndepchild wo others              -6.13e-02   2.40e-02   -2.55  0.01065 *  
hhtype[11] Couple family with ndepchild w other related        -3.04e-01   1.21e-01   -2.52  0.01170 *  
hhtype[12] Couple family with ndepchild w other not related    -1.26e-01   1.86e-01   -0.68  0.49873    
hhtype[13] Lone parent with children < 15 wo others            -3.75e-01   3.37e-02  -11.14  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -7.53e-02   8.64e-02   -0.87  0.38333    
hhtype[15] Lone parent with children < 15 w other not related  -4.36e-01   1.46e-01   -2.98  0.00284 ** 
hhtype[16] Lone parent with depst wo others                    -2.21e-01   4.42e-02   -4.99  6.0e-07 ***
hhtype[17] Lone parent with depst w other related              -6.30e-02   1.89e-01   -0.33  0.73830    
hhtype[18] Lone parent with depst w other not related          -1.80e-01   2.40e-01   -0.75  0.45343    
hhtype[19] Lone parent with ndepchild wo others                -3.23e-01   3.74e-02   -8.64  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -4.33e-01   1.27e-01   -3.42  0.00062 ***
hhtype[21] Lone parent with ndepchild w other not related      -2.98e-01   1.88e-01   -1.59  0.11273    
hhtype[22] Other related family wo children < 15 or others     -2.65e-01   6.15e-02   -4.31  1.7e-05 ***
hhtype[23] Other related family wo children < 15 w others      -4.84e-02   1.23e-01   -0.39  0.69293    
hhtype[24] Lone person                                         -2.48e-01   1.89e-02  -13.15  < 2e-16 ***
hhtype[25] Group household                                     -2.45e-01   4.08e-02   -6.00  2.0e-09 ***
hhtype[26] Multi family household                              -1.09e-01   4.24e-02   -2.58  0.00998 ** 
jbocct                                                          1.64e-02   6.47e-04   25.28  < 2e-16 ***
wsfei                                                           2.03e-06   1.39e-07   14.58  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1   -4.7080     0.0448 -105.09
1|2   -4.0807     0.0393 -103.71
2|3   -3.4370     0.0360  -95.40
3|4   -2.9338     0.0345  -85.11
4|5   -2.5673     0.0337  -76.14
5|6   -1.9120     0.0329  -58.13
6|7   -1.5223     0.0326  -46.69
7|8   -0.9012     0.0324  -27.86
8|9    0.0325     0.0323    1.01
9|10   1.0041     0.0324   30.98
```

Again, the model is nearly unidentifiable: very large eigenvalue.

##### wages_perc

```
formula: jbmssec ~ hgsex + hgage + ancob3 + hhtype + jbocct + wages_perc
data:    xsub

 link  threshold nobs   logLik     AIC       niter max.grad cond.H 
 logit flexible  104631 -197369.78 394821.56 6(0)  5.10e-11 3.4e+06

Coefficients:
                                                                Estimate Std. Error z value Pr(>|z|)    
hgsex[2] Female                                                 0.239798   0.011261   21.29  < 2e-16 ***
hgage                                                          -0.009311   0.000509  -18.29  < 2e-16 ***
ancob3australians                                               0.150504   0.022333    6.74  1.6e-11 ***
ancob3others                                                   -0.132030   0.026227   -5.03  4.8e-07 ***
hhtype[2] Couple family wo children w other related            -0.075667   0.058670   -1.29  0.19716    
hhtype[3] Couple family wo children w other not related        -0.216828   0.090789   -2.39  0.01693 *  
hhtype[4] Couple family with children < 15 wo others           -0.179825   0.015033  -11.96  < 2e-16 ***
hhtype[5] Couple family with children < 15 w other related     -0.329456   0.064983   -5.07  4.0e-07 ***
hhtype[6] Couple family with children < 15 w other not related -0.372642   0.133870   -2.78  0.00538 ** 
hhtype[7] Couple family with depst wo others                   -0.140137   0.021704   -6.46  1.1e-10 ***
hhtype[8] Couple family with depst w other related             -0.188972   0.123087   -1.54  0.12472    
hhtype[9] Couple family with depst w other not related         -0.039964   0.227990   -0.18  0.86085    
hhtype[10] Couple family with ndepchild wo others              -0.064034   0.023988   -2.67  0.00760 ** 
hhtype[11] Couple family with ndepchild w other related        -0.306181   0.120782   -2.53  0.01124 *  
hhtype[12] Couple family with ndepchild w other not related    -0.128587   0.185989   -0.69  0.48934    
hhtype[13] Lone parent with children < 15 wo others            -0.371324   0.033665  -11.03  < 2e-16 ***
hhtype[14] Lone parent with children < 15 w other related      -0.081309   0.086327   -0.94  0.34626    
hhtype[15] Lone parent with children < 15 w other not related  -0.434187   0.146057   -2.97  0.00295 ** 
hhtype[16] Lone parent with depst wo others                    -0.218848   0.044245   -4.95  7.6e-07 ***
hhtype[17] Lone parent with depst w other related              -0.041690   0.188846   -0.22  0.82528    
hhtype[18] Lone parent with depst w other not related          -0.181501   0.239309   -0.76  0.44819    
hhtype[19] Lone parent with ndepchild wo others                -0.332161   0.037339   -8.90  < 2e-16 ***
hhtype[20] Lone parent with ndepchild w other related          -0.442761   0.126488   -3.50  0.00046 ***
hhtype[21] Lone parent with ndepchild w other not related      -0.300404   0.188377   -1.59  0.11078    
hhtype[22] Other related family wo children < 15 or others     -0.265946   0.061431   -4.33  1.5e-05 ***
hhtype[23] Other related family wo children < 15 w others      -0.051460   0.122488   -0.42  0.67439    
hhtype[24] Lone person                                         -0.254690   0.018897  -13.48  < 2e-16 ***
hhtype[25] Group household                                     -0.245014   0.040809   -6.00  1.9e-09 ***
hhtype[26] Multi family household                              -0.114629   0.042409   -2.70  0.00687 ** 
jbocct                                                          0.016123   0.000647   24.92  < 2e-16 ***
wages_perc                                                      0.373183   0.019633   19.01  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Threshold coefficients:
     Estimate Std. Error z value
0|1   -4.6180     0.0453 -101.88
1|2   -3.9907     0.0399  -99.90
2|3   -3.3467     0.0367  -91.23
3|4   -2.8432     0.0352  -80.86
4|5   -2.4763     0.0344  -71.92
5|6   -1.8204     0.0336  -54.12
6|7   -1.4301     0.0334  -42.86
7|8   -0.8083     0.0331  -24.39
8|9    0.1264     0.0331    3.82
9|10   1.0983     0.0332   33.04
```

No problems with this fit. wages_perc works better than wsfei to explain job satisfaction.





































