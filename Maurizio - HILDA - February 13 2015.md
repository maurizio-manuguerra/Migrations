-------------------------------------------------------------------------------
      name:  <unnamed>
       log:  \\Client\G$\DATA\Australian data\LSIA\Maurizio - HILDA - February 
> 13 2015.log
  log type:  text
 opened on:  13 Feb 2015, 12:39:58

. codebook ancob aneab anengfn anlote anmigc anpappn anyoa anyoan edagels edcoq
>  edcoqn edcqtyp edhigh1 edqenr ehtse esdtl esempst fmfcob fmfo61 fmfsch fmmco
> b fmmo61 fmmsch fmnsib helth hgage hgsex hhfty hhmsr hhold hhpno hhprtid hhri
> h hhstate hhtype hhyng hifefn hifefp jbhru jbmcnt jbmi62 jbmo62 jbmoccs jbmsp
> ay jbmssec jbmwpsz jbocct mrcurr rtcompn rtyrn sex tcnr tcr ujlji61 ujljo61 w
> ave wealth wlra_l wscei wsfei xwaveid yrivwfst yrivwlst

-------------------------------------------------------------------------------
ancob                                                 History: Country of birth
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  LANCOB

                 range:  [-10,9299]                   units:  1
         unique values:  143                      missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         1101  [1101] Australia
                         1101  [1101] Australia
                         1101  [1101] Australia

-------------------------------------------------------------------------------
aneab                                               K16 How well speaks English
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EANEAB

                 range:  [-10,4]                      units:  1
         unique values:  7                        missing .:  153870/224532

            tabulation:  Freq.   Numeric  Label
                         19726       -10  [-10] Non-responding person
                             2        -4  [-4] Refused/Not stated
                         45464        -1  [-1] Not asked
                          3273         1  [1] Very well
                          1395         2  [2] Well
                           712         3  [3] Not well
                            90         4  [4] Not at all
                        1.5e+05        .  

-------------------------------------------------------------------------------
anengfn                                NPQ:AA13 Is English the first language
                                       you learned to speak as a child
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EANENGFN

                 range:  [-10,2]                      units:  1
         unique values:  4                        missing .:  153870/224532

            tabulation:  Freq.   Numeric  Label
                         19726       -10  [-10] Non-responding person
                         50388        -1  [-1] Not asked
                           272         1  [1] English was first language
                                          learned
                           276         2  [2] English was not first
                                          language learned
                        1.5e+05        .  

-------------------------------------------------------------------------------
anlote                                    K15 Speak language other than English
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EANLOTE

                 range:  [-10,2]                      units:  1
         unique values:  4                        missing .:  153870/224532

            tabulation:  Freq.   Numeric  Label
                         19726       -10  [-10] Non-responding person
                             4        -4  [-4] Refused/Not stated
                          5472         1  [1] Yes
                         45460         2  [2] No
                        1.5e+05        .  

-------------------------------------------------------------------------------
anmigc                                 History: Migration category when you or
                                       your family first arrived in Australia
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EANMIGC

                 range:  [-10,8]                      units:  1
         unique values:  9                        missing .:  207064/224532

            tabulation:  Freq.   Numeric  Label
                          4709       -10  [-10] Non-responding person
                           603        -7  [-7] Not able to be determined
                             6        -3  [-3] Dont know
                         12090        -1  [-1] Not asked
                            17         1  [1] Skilled migrant
                             4         2  [2] Business migrant
                            21         3  [3] Family migrant
                             3         4  [4] Refugee or Special
                                          Humanitarian migrant
                            15         8  [8] None of the above
                        2.1e+05        .  

-------------------------------------------------------------------------------
anpappn                             NPQ:AA9 Australian visa - Primary applicant
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EANPAPPN

                 range:  [-10,2]                      units:  1
         unique values:  5                        missing .:  207064/224532

            tabulation:  Freq.   Numeric  Label
                          4709       -10  [-10] Non-responding person
                             1        -3  [-3] Dont know
                         12753        -1  [-1] Not asked
                             4         1  [1] Self
                             1         2  [2] Someone else in family
                        2.1e+05        .  

-------------------------------------------------------------------------------
anyoa                             History: Year first came to Australia to live
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  LANYOA, but 93 nonmissing values are not labeled

                 range:  [-10,2012]                   units:  1
         unique values:  97                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         -1    [-1] Not asked
                         -1    [-1] Not asked

-------------------------------------------------------------------------------
anyoan                             NPQ:AA3 Year first came to Australia to live
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  EANYOAN, but 59 nonmissing values are not labeled

                 range:  [-10,2005]                   units:  1
         unique values:  61                       missing .:  153870/224532

              examples:  -1    [-1] Not asked
                         .     
                         .     
                         .     

-------------------------------------------------------------------------------
edagels                                                History: Age left school
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LEDAGELS, but 21 nonmissing values are not labeled

                 range:  [-10,26]                     units:  1
         unique values:  26                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         15    
                         16    
                         17    

-------------------------------------------------------------------------------
edcoq                       History: Country completed highest qualification in
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  EEDCOQ

                 range:  [-10,9232]                   units:  1
         unique values:  79                       missing .:  153870/224532

              examples:  1101  [1101] Australia
                         .     
                         .     
                         .     

-------------------------------------------------------------------------------
edcoqn                               NPQ:A9 Country completed highest education
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  EEDCOQN

                 range:  [-10,9225]                   units:  1
         unique values:  45                       missing .:  153870/224532

              examples:  -1    [-1] Not asked
                         .     
                         .     
                         .     

-------------------------------------------------------------------------------
edcqtyp                    CPQ:A9c/NPQ:A20 Currently studying full or part time
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LEDCQTYP

                 range:  [-10,2]                      units:  1
         unique values:  6                        missing .:  7312/224532

            tabulation:  Freq.   Numeric  Label
                         59233       -10  [-10] Non-responding person
                             1        -4  [-4] Refused/Not stated
                            13        -3  [-3] Dont know
                        1.4e+05       -1  [-1] Not asked
                          6602         1  [1] Full time student
                          8038         2  [2] Part time student
                          7312         .  

-------------------------------------------------------------------------------
edhigh1                               History: Highest education level achieved
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LEDHIGH1

                 range:  [-10,10]                     units:  1
         unique values:  9                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                         59233       -10  [-10] Non-responding person
                          5630         1  [1] Postgrad - masters or
                                          doctorate
                          7918         2  [2] Grad diploma, grad
                                          certificate
                         20454         3  [3] Bachelor or honours
                         13870         4  [4] Adv diploma, diploma
                         32042         5  [5] Cert III or IV
                         25259         8  [8] Year 12
                         60040         9  [9] Year 11 and below
                            86        10  [10] Undetermined

-------------------------------------------------------------------------------
edqenr    History: Ever enrolled in a course of study to obtain a qualification
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EEDQENR

                 range:  [-10,2]                      units:  1
         unique values:  5                        missing .:  153870/224532

            tabulation:  Freq.   Numeric  Label
                         19726       -10  [-10] Non-responding person
                             3        -4  [-4] Refused/Not stated
                          2719        -1  [-1] Not asked
                         34861         1  [1] Has ever enrolled
                         13353         2  [2] Has not
                        1.5e+05        .  

-------------------------------------------------------------------------------
ehtse                                  History: Time since FT education - years
-------------------------------------------------------------------------------

                  type:  numeric (double)
                 label:  LEHTSE, but 13996 nonmissing values are not labeled

                 range:  [-10,86.861111]              units:  1.000e-09
         unique values:  14001                    missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         6.6111111
                         23    
                         38.944444

-------------------------------------------------------------------------------
esdtl                                          DV: Labour force status - detail
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LESDTL

                 range:  [-10,7]                      units:  1
         unique values:  8                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                         59233       -10  [-10] Non-responding person
                         71018         1  [1] Employed FT
                         34109         2  [2] Employed PT
                          3919         3  [3] Unemployed, looking for FT
                                          work
                          2100         4  [4] Unemployed, looking for PT
                                          work
                         10421         5  [5] Not in the labour force,
                                          marginally attached
                         43636         6  [6] Not in the labour force, not
                                          marginally attached
                            96         7  [7] Employed, but usual hours
                                          worked unknown

-------------------------------------------------------------------------------
esempst                                           B12 Current employment status
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LESEMPST

                 range:  [-10,4]                      units:  1
         unique values:  6                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                         59233       -10  [-10] Non-responding person
                         60076        -1  [-1] Not asked
                         87776         1  [1] Employee
                          5912         2  [2] Employee of own business
                         10967         3  [3] Employer/Self-employed
                           568         4  [4] Unpaid family worker

-------------------------------------------------------------------------------
fmfcob                                       History: Father's Country of Birth
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  LFMFCOB

                 range:  [-10,9299]                   units:  1
         unique values:  145                      missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         1101  [1101] Australia
                         1101  [1101] Australia
                         2100  [2100] United Kingdom

-------------------------------------------------------------------------------
fmfo61                         History: Father's occupation 1-digit ANZSCO 2006
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LFMFO61

                 range:  [-10,8]                      units:  1
         unique values:  14                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         1     [1] Managers
                         3     [3] Technicians and Trades Workers
                         5     [5] Clerical and Administrative Workers

-------------------------------------------------------------------------------
fmfsch                             History: How much schooling father completed
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  GFMFSCH

                 range:  [-10,5]                      units:  1
         unique values:  9                        missing .:  172331/224532

            tabulation:  Freq.   Numeric  Label
                         13748       -10  [-10] Non-responding person
                           708        -7  [-7] Not able to be determined
                             4        -4  [-4] Refused/Not stated
                          4152        -3  [-3] Dont know
                           443         1  [1] None
                          6831         2  [2] Primary school only
                         14848         3  [3] Some secondary school, but
                                          no more than Year 10
                          2493         4  [4] Year 11 or equivalent (eg
                                          5th form, Leaving Certificate)
                          8974         5  [5] Year 12 or equivalent (eg
                                          6th form, Matriculation)
                        1.7e+05        .  

-------------------------------------------------------------------------------
fmmcob                                       History: Mother's Country of Birth
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  LFMMCOB

                 range:  [-10,9232]                   units:  1
         unique values:  141                      missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         1101  [1101] Australia
                         1101  [1101] Australia
                         2100  [2100] United Kingdom

-------------------------------------------------------------------------------
fmmo61                         History: Mother's occupation 1-digit ANZSCO 2006
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LFMMO61

                 range:  [-10,8]                      units:  1
         unique values:  13                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -2    [-2] Not applicable - never worked
                         2     [2] Professionals
                         5     [5] Clerical and Administrative Workers

-------------------------------------------------------------------------------
fmmsch                             History: How much schooling mother completed
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  GFMMSCH

                 range:  [-10,5]                      units:  1
         unique values:  9                        missing .:  172331/224532

            tabulation:  Freq.   Numeric  Label
                         13748       -10  [-10] Non-responding person
                           708        -7  [-7] Not able to be determined
                            19        -4  [-4] Refused/Not stated
                          3538        -3  [-3] Dont know
                           656         1  [1] None
                          5963         2  [2] Primary school only
                         15292         3  [3] Some secondary school, but
                                          no more than Year 10
                          3501         4  [4] Year 11 or equivalent (eg
                                          5th form, Leaving Certificate)
                          8776         5  [5] Year 12 or equivalent (eg
                                          6th form, Matriculation)
                        1.7e+05        .  

-------------------------------------------------------------------------------
fmnsib                                               History: How many siblings
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EFMNSIB, but 21 nonmissing values are not labeled

                 range:  [-10,25]                     units:  1
         unique values:  26                       missing .:  133956/224532

              examples:  2     
                         11    
                         .     
                         .     

-------------------------------------------------------------------------------
helth                                             K1 Long term health condition
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LHELTH

                 range:  [-10,2]                      units:  1
         unique values:  5                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                         59233       -10  [-10] Non-responding person
                            20        -4  [-4] Refused/Not stated
                            10        -3  [-3] Dont know
                         43852         1  [1] Yes
                        1.2e+05        2  [2] No

-------------------------------------------------------------------------------
hgage                                     DV: Age last birthday at June 30 2012
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  LHGAGE, but 101 nonmissing values are not labeled

                 range:  [0,101]                      units:  1
         unique values:  102                      missing .:  0/224532

              examples:  13    
                         27    
                         42    
                         57    

-------------------------------------------------------------------------------
hgsex                                                                   HF5 Sex
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LHGSEX

                 range:  [1,2]                        units:  1
         unique values:  2                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                        1.1e+05        1  [1] Male
                        1.2e+05        2  [2] Female

-------------------------------------------------------------------------------
hhfty                                                           DV: Family type
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LHHFTY

                 range:  [1,27]                       units:  1
         unique values:  17                       missing .:  0/224532

              examples:  1     [1] Couple family wo children or others
                         4     [4] Couple family with children < 15 wo others
                         4     [4] Couple family with children < 15 wo others
                         13    [13] Lone parent with children < 15 wo others

-------------------------------------------------------------------------------
hhmsr                                              DV: Major Statistical Region
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LHHMSR

                 range:  [-7,81]                      units:  1
         unique values:  14                       missing .:  0/224532

              examples:  19    [19] Balance of NSW
                         21    [21] Melbourne
                         31    [31] Brisbane
                         41    [41] Adelaide

-------------------------------------------------------------------------------
hhold                                     DV: Age of oldest person in household
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  EHHOLD, but 87 nonmissing values are not labeled

                 range:  [-10,101]                    units:  1
         unique values:  90                       missing .:  133956/224532

              examples:  40    
                         86    
                         .     
                         .     

-------------------------------------------------------------------------------
hhpno                                                          HF Person number
-------------------------------------------------------------------------------

                  type:  string (str2)

         unique values:  16                       missing "":  0/224532

              examples:  "01"
                         "01"
                         "02"
                         "03"

-------------------------------------------------------------------------------
hhprtid                               DV: Partner person number (text, 2-digit)
-------------------------------------------------------------------------------

                  type:  string (str2)

         unique values:  16                       missing "":  116964/224532

              examples:  ""
                         ""
                         "01"
                         "02"

-------------------------------------------------------------------------------
hhrih                                             DV: Relationship in household
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LHHRIH

                 range:  [1,13]                       units:  1
         unique values:  13                       missing .:  0/224532

              examples:  2     [2] Couple w depst (no child < 15)
                         4     [4] Couple wo child
                         8     [8] Child < 15
                         10    [10] Non-dependent child

-------------------------------------------------------------------------------
hhstate                                                                HF State
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LHHSTATE

                 range:  [-1,8]                       units:  1
         unique values:  9                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                             1        -1  [-1] Not asked
                         68788         1  [1] NSW
                         55177         2  [2] VIC
                         46460         3  [3] QLD
                         20337         4  [4] SA
                         20977         5  [5] WA
                          6950         6  [6] TAS
                          1490         7  [7] NT
                          4352         8  [8] ACT

-------------------------------------------------------------------------------
hhtype                                                       DV: Household type
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LHHTYPE

                 range:  [1,26]                       units:  1
         unique values:  26                       missing .:  0/224532

              examples:  1     [1] Couple family wo children or others
                         4     [4] Couple family with children < 15 wo others
                         5     [5] Couple family with children < 15 w other rel
> ated
                         16    [16] Lone parent with depst wo others

-------------------------------------------------------------------------------
hhyng                                   DV: Age of youngest person in household
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  EHHYNG, but 99 nonmissing values are not labeled

                 range:  [-10,98]                     units:  1
         unique values:  102                      missing .:  133956/224532

              examples:  12    
                         82    
                         .     
                         .     

-------------------------------------------------------------------------------
hifefn                                 DV: Household financial year gross
                                       regular income ($) [imputed] Negative
                                       values
-------------------------------------------------------------------------------

                  type:  numeric (long)
                 label:  LHIFEFN, but 207 nonmissing values are not labeled

                 range:  [0,2448956]                  units:  1
         unique values:  207                      missing .:  0/224532

              examples:  0     
                         0     
                         0     
                         0     

-------------------------------------------------------------------------------
hifefp                                 DV: Household financial year gross
                                       regular income ($) [imputed] Positive
                                       values
-------------------------------------------------------------------------------

                  type:  numeric (long)
                 label:  LHIFEFP, but 50280 nonmissing values are not labeled

                 range:  [0,1451328]                  units:  1
         unique values:  50280                    missing .:  0/224532

              examples:  34866 
                         59603 
                         86190 
                         123950

-------------------------------------------------------------------------------
jbhru                        C1a Hours per week usually worked in all your jobs
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  LJBHRUW, but 115 nonmissing values are not labeled

                 range:  [-10,997]                    units:  1
         unique values:  121                      missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         20    
                         40    

-------------------------------------------------------------------------------
jbmcnt                                    C22 Employment contract - current job
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LJBMCNT

                 range:  [-10,8]                      units:  1
         unique values:  8                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                         59233       -10  [-10] Non-responding person
                            28        -4  [-4] Refused/Not stated
                            19        -3  [-3] Dont know
                         77528        -1  [-1] Not asked
                          8296         1  [1] Employed on a fixed-term
                                          contract
                         20423         2  [2] Employed on a casual basis
                         58698         3  [3] Employed on a permanent or
                                          ongoing basis
                           307         8  [8] Other

-------------------------------------------------------------------------------
jbmi62                   DV: C14 Current main job industry. 2-digit ANZSIC 2006
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LJBMI62

                 range:  [-10,96]                     units:  1
         unique values:  91                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         24    [24] Machinery and Equipment Manufacturing
                         69    [69] Professional, Scientific and Technical Serv
> ices (Except Computer System Design and Related

-------------------------------------------------------------------------------
jbmo62                                   DV: C11 Occupation 2-digit ANZSCO 2006
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LJBMO62

                 range:  [-10,89]                     units:  1
         unique values:  55                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         22    [22] Business, Human Resource and Marketing Prof
> essionals
                         43    [43] Hospitality Workers

-------------------------------------------------------------------------------
jbmoccs                    DV: ANU4 occupational status scale, current main job
-------------------------------------------------------------------------------

                  type:  numeric (double)
                 label:  EJBMOCCS, but 110 nonmissing values are not labeled

                 range:  [-10,100]                    units:  .1
         unique values:  114                      missing .:  133956/224532

              examples:  -1    [-1] Not asked
                         94.5  
                         .     
                         .     

-------------------------------------------------------------------------------
jbmspay                                             C35a Total pay satisfaction
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LJBMSPAY, but 9 nonmissing values are not labeled

                 range:  [-10,10]                     units:  1
         unique values:  16                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         5     
                         8     

-------------------------------------------------------------------------------
jbmssec                                          C35b Job security satisfaction
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LJBMSSEC, but 9 nonmissing values are not labeled

                 range:  [-10,10]                     units:  1
         unique values:  16                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         6     
                         9     

-------------------------------------------------------------------------------
jbmwpsz                                    C32 Number employed at place of work
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LJBMWPS

                 range:  [-10,11]                     units:  1
         unique values:  15                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         2     [2] 2 to 4
                         5     [5] 20 to 49

-------------------------------------------------------------------------------
jbocct                                 DV: Tenure in current occupation (years)
-------------------------------------------------------------------------------

                  type:  numeric (double)
                 label:  LJBOCCT, but 125 nonmissing values are not labeled

                 range:  [-10,75]                     units:  1.000e-10
         unique values:  130                      missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         .76923077
                         7     

-------------------------------------------------------------------------------
mrcurr                             DV: Marital status from person questionnaire
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LMRCURR

                 range:  [-10,6]                      units:  1
         unique values:  9                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                         59233       -10  [-10] Non-responding person
                            57        -4  [-4] Refused/Not stated
                            31        -3  [-3] Dont know
                         80883         1  [1] Legally married
                         21387         2  [2] De facto
                          4635         3  [3] Separated
                          9873         4  [4] Divorced
                          8579         5  [5] Widowed
                         39854         6  [6] Never married and not de
                                          facto

-------------------------------------------------------------------------------
rtcompn                           NPQ:D22 Retired completely from the workforce
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  ERTCOMPN

                 range:  [-10,3]                      units:  1
         unique values:  6                        missing .:  189855/224532

            tabulation:  Freq.   Numeric  Label
                          9510       -10  [-10] Non-responding person
                             3        -3  [-3] Dont know
                         25058        -1  [-1] Not asked
                            84         1  [1] Yes
                            19         2  [2] No
                             3         3  [3] Never in workforce
                        1.9e+05        .  

-------------------------------------------------------------------------------
rtyrn                                                     NPQ:D23a Year retired
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  ERTYRN, but 39 nonmissing values are not labeled

                 range:  [-10,2005]                   units:  1
         unique values:  43                       missing .:  189855/224532

              examples:  .     
                         .     
                         .     
                         .     

-------------------------------------------------------------------------------
sex                                                                         Sex
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  SEX

                 range:  [1,2]                        units:  1
         unique values:  2                        missing .:  0/224532

            tabulation:  Freq.   Numeric  Label
                        1.1e+05        1  [1] Male
                        1.2e+05        2  [2] Female

-------------------------------------------------------------------------------
tcnr                                    DV: Number of own non-resident children
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  ETCNR, but 14 nonmissing values are not labeled

                 range:  [-10,13]                     units:  1
         unique values:  15                       missing .:  133956/224532

              examples:  0     
                         5     
                         .     
                         .     

-------------------------------------------------------------------------------
tcr                                         DV: Number of own resident children
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  ETCR, but 12 nonmissing values are not labeled

                 range:  [-10,11]                     units:  1
         unique values:  13                       missing .:  133956/224532

              examples:  0     
                         4     
                         .     
                         .     

-------------------------------------------------------------------------------
ujlji61                                DV: NPQ:D24 Industry, last job (not
                                       currently in paid work) ANZSIC 2006
                                       division
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LUJLJI61

                 range:  [-10,19]                     units:  1
         unique values:  24                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         -1    [-1] Not asked
                         -1    [-1] Not asked

-------------------------------------------------------------------------------
ujljo61                                DV: NPQ:D29 Occupation last job (not
                                       currently in paid work) 1-digit ANZSCO
                                       2006
-------------------------------------------------------------------------------

                  type:  numeric (byte)
                 label:  LUJLJO61

                 range:  [-10,8]                      units:  1
         unique values:  13                       missing .:  0/224532

              examples:  -10   [-10] Non-responding person
                         -1    [-1] Not asked
                         -1    [-1] Not asked
                         -1    [-1] Not asked

-------------------------------------------------------------------------------
wave                                                                (unlabeled)
-------------------------------------------------------------------------------

                  type:  numeric (float)

                 range:  [1,12]                       units:  1
         unique values:  12                       missing .:  0/224532

                  mean:   6.68731
              std. dev:   3.58148

           percentiles:        10%       25%       50%       75%       90%
                                 2         4         7        10        12

-------------------------------------------------------------------------------
wealth                                                              (unlabeled)
-------------------------------------------------------------------------------

                  type:  numeric (float)

                 range:  [-1298333,7863503]           units:  1
         unique values:  10829                    missing .:  188784/224532

                  mean:    546123
              std. dev:    944275

           percentiles:        10%       25%       50%       75%       90%
                              7313     79625    292919    639800   1.2e+06

-------------------------------------------------------------------------------
wlra_l          DV: Responding person longitudinal weights - Balanced W1 to W12
-------------------------------------------------------------------------------

                  type:  numeric (double)

                 range:  [0,16849.082]                units:  1.000e-07
         unique values:  8076                     missing .:  0/224532

                  mean:    740.92
              std. dev:   1155.66

           percentiles:        10%       25%       50%       75%       90%
                                 0         0         0   1346.61   2107.81

-------------------------------------------------------------------------------
wscei                                  DV: Current weekly gross wages & salary
                                       - all jobs ($) [imputed] [weighted topco
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  LWSCEI, but 3217 nonmissing values are not labeled

                 range:  [0,12646]                    units:  1
         unique values:  3217                     missing .:  0/224532

              examples:  0     
                         0     
                         240   
                         850   

-------------------------------------------------------------------------------
wsfei                                  DV: Financial year gross wages & salary
                                       ($) [imputed] [weighted topcode]
-------------------------------------------------------------------------------

                  type:  numeric (long)
                 label:  LWSFEI, but 18745 nonmissing values are not labeled

                 range:  [0,780859]                   units:  1
         unique values:  18745                    missing .:  0/224532

              examples:  0     
                         0     
                         12700 
                         44000 

-------------------------------------------------------------------------------
xwaveid                                                        XW Cross wave ID
-------------------------------------------------------------------------------

                  type:  string (str7)

         unique values:  36138                    missing "":  0/224532

              examples:  "0105126"
                         "0110205"
                         "0115230"
                         "0200675"

-------------------------------------------------------------------------------
yrivwfst                                                Year of first interview
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  YRIVWFST, but 12 nonmissing values are not labeled

                 range:  [-2,2012]                    units:  1
         unique values:  13                       missing .:  0/224532

              examples:  2001  
                         2001  
                         2001  
                         2004  

-------------------------------------------------------------------------------
yrivwlst                                                 Year of last interview
-------------------------------------------------------------------------------

                  type:  numeric (int)
                 label:  YRIVWLST, but 12 nonmissing values are not labeled

                 range:  [-2,2012]                    units:  1
         unique values:  13                       missing .:  0/224532

              examples:  2004  
                         2012  
                         2012  
                         2012  

. log close
      name:  <unnamed>
       log:  \\Client\G$\DATA\Australian data\LSIA\Maurizio - HILDA - February 
> 13 2015.log
  log type:  text
 closed on:  13 Feb 2015, 12:42:44
-------------------------------------------------------------------------------
