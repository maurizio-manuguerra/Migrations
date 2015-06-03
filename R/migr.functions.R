#' @title The testing2 function
#' @export
test2 <- function(){
  #knit("~/Dropbox/Attachments/-.Migrations/code/HILDA.Rmd")
  library(mgcv)
  x = clean_data(HILDA)
  model27=(log(wsfei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
  pdf("fit27lowhigh.pdf")
  par(mfrow=c(3,1))
  for (i in 1:20){
    print(i)
    wage=i*5000
    #xlow=x[x$wsfei<wage,]
    #xhigh=x[x$wsfei>=wage,]
    #xint=x[x$wsfei>=(wage-5000) & x$wsfei<(wage+5000),]
    xlow=x[x$median_wage<wage,]
    xhigh=x[x$median_wage>=wage,]
    xint=x[x$median_wage>=(wage-5000) & x$median_wage<(wage+5000),]
    fit27low = gam(model27, data=xlow)
    fit27high = gam(model27, data=xhigh)
    fit27int = gam(model27, data=xint)
    plot(fit27low,pages=1, scale=-1, rug=F, main=paste("wage <",wage))
    plot(fit27high,pages=1, scale=-1, rug=F, main=paste("wage >=",wage))
    plot(fit27int,pages=1, scale=-1, rug=F, main=paste(wage-5000,"<= wage <",wage+5000))
    }
  par(mfrow=c(1,1))
  dev.off()
}

#' @title The testing function
#' @export
test <- function(){
## ----load-libraries, echo=F, cache=F-------------------------------------
library(mgcv)
library(ordinal)

## ----data_manipulation, eval=T, include=T, echo=F, comment=NA, cache=F----
#library(readstata13)
#setwd("~/Dropbox/Attachments/-.Migrations/data")
#load("Hilda.RData")
#x=read.dta13("MAURIZIO_HILDA_extraction.dta")
library(Migrations)
x = clean_data(HILDA)

## ----fit26, eval=T, include=T, echo=T, comment=NA, cache=F---------------
model26=(jbhru ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit26 = gam(model26, data=x)
anova(fit26)
plot(fit26,pages=1, scale=-1, rug=F)

## ----fit27, eval=T, include=T, echo=T, comment=NA, cache=F---------------
model27=(log(wsfei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27 = gam(model27, data=x)
anova(fit27)
plot(fit27,pages=1, scale=-1, rug=F)

## ----fit27bis, eval=T, include=T, echo=T, comment=NA, cache=F------------
model27bis=(log(wsfei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab + jbhru)
fit27bis = gam(model27bis, data=x)
anova(fit27bis)
plot(fit27bis,pages=1, scale=-1, rug=F)

## ----fit27weekly, eval=T, include=T, echo=T, comment=NA, cache=F---------
x2=x[x$wscei>0 & x$jbhru>0,]
x2$wpw = x2$wscei/x2$jbhru
model27weekly=(log(wscei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27weekly = gam(model27weekly, data=x2)
anova(fit27weekly)
plot(fit27weekly,pages=1, scale=-1, rug=F)

## ----fit27hrwage, eval=T, include=T, echo=T, comment=NA, cache=F---------
x2=x[x$wscei>0 & x$jbhru>0,]
x2$hrw = x2$wscei/x2$jbhru
model27hrwage=(hrw ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27hrwage = gam(model27hrwage, data=x2)
anova(fit27hrwage)
plot(fit27hrwage,pages=1, scale=-1, rug=F)

## ----fit28, eval=T, include=T, echo=T, comment=NA, cache=F---------------
model28=(wages_perc ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit28 = gam(model28, data=x)
anova(fit28)
plot(fit28,pages=1, scale=-1, rug=F)

## ----fit27rnd, eval=T, include=T, echo=T, comment=NA, cache=F------------
load("~/Dropbox/Attachments/-.Migrations/data/fit27rnd.RData")
#model27rnd=(log(wsfei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
#fit27rnd = gamm(model27, random=list(xwaveid=~1), data=x)
anova(fit27rnd$gam)
plot(fit27rnd$gam,pages=1, scale=-1, rug=F)

## ----fit27byAge, eval=T, include=T, echo=T, comment=NA, cache=F----------
model27byAge=(log(wsfei) ~ s(wave_age1) + s(wave_age2) + s(wave_age3) + s(wave_age4) + s(wave_age5) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27byAge = gam(model27byAge, data=x)
anova(fit27byAge)
plot(fit27byAge,pages=1, scale=-1, rug=F)

## ----fit27byAgeLessThan40, eval=T, include=T, echo=T, comment=NA, cache=F----
x2 <- x[x$jbhru<=40,]
#x3 <- x[x$jbhru>40,]

model27byAge=(log(wsfei) ~ s(wave_age1) + s(wave_age2) + s(wave_age3) + s(wave_age4) + s(wave_age5) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27byAge = gam(model27byAge, data=x2)
anova(fit27byAge)
plot(fit27byAge,pages=1, scale=-1, rug=F)

## ----fit27byMigrationStatus, eval=T, include=T, echo=T, comment=NA, cache=F----
model27byMigrationStatus=(log(wsfei) ~ s(wave_au) + s(wave_anglo) + s(wave_others) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct) # aneab cannot stay in the regression as few unique covariate combinations with wave_*
fit27byMigrationStatus = gam(model27byMigrationStatus, data=x)
anova(fit27byMigrationStatus)
plot(fit27byMigrationStatus,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit27byEducation, eval=T, include=T, echo=T, comment=NA, cache=F----
model27byEducation=(log(wsfei) ~ s(wave_ed1) + s(wave_ed2) + s(wave_ed3) + s(wave_ed4) + s(wave_ed5) + s(wave_ed6) + s(wave_ed7) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27byEducation = gam(model27byEducation, data=x)
anova(fit27byEducation)
plot(fit27byEducation,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit27bySkilledJobs, eval=T, include=T, echo=T, comment=NA, cache=F----
model27bySkilledJobs=(log(wsfei) ~ s(x$wave_skill1) + s(x$wave_skill2) + s(x$wave_skill3) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27bySkilledJobs = gam(model27bySkilledJobs, data=x)
anova(fit27bySkilledJobs)
plot(fit27bySkilledJobs,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit27bySalary, eval=T, include=T, echo=T, comment=NA, cache=F-------
model27bySalary=(log(wsfei) ~ s(x$wave_wage1) + s(x$wave_wage2) + s(x$wave_wage3) + s(x$wave_wage4) + s(x$wave_wage5) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27bySalary = gam(model27bySalary, data=x)
anova(fit27bySalary)
plot(fit27bySalary,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit28rnd, eval=T, include=T, echo=F, comment=NA---------------------
load("~/Dropbox/Attachments/-.Migrations/data/fit28rnd.RData")
#fit28rnd = gamm(model28, random=list(xwaveid=~1), data=x)
#summary(fit28rnd$lme)
anova(fit28rnd$gam)
plot(fit28rnd$gam,pages=1)

#Males vs females
#xm=x[x$sex=="[1] Male",]
#xf=x[x$sex=="[2] Female",]
#model26m=(wsfei ~ s(wave) +  hgage + I(hgage^2) + s(anyoa) + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
#fit26m = gam(model26m, data=xm)
#anova(fit26m)
#plot(fit26m,pages=1)
#model26f=(wsfei ~ s(wave) +  hgage + I(hgage^2) + s(anyoa) + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + #jbmwpsz + jbocct + aneab)
#fit26f = gam(model26f, data=xf)
#anova(fit26f)
#plot(fit26f,pages=1)

## ----fit28byAge, eval=T, include=T, echo=T, comment=NA, cache=F----------
model28byAge=(wages_perc ~ s(wave_age1) + s(wave_age2) + s(wave_age3) + s(wave_age4) + s(wave_age5) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit28byAge = gam(model28byAge, data=x)
anova(fit28byAge)
plot(fit28byAge,pages=1, scale=-1, rug=F)

## ----fit28byAgeLessThan40, eval=T, include=T, echo=T, comment=NA, cache=F----
x2 <- x[x$jbhru<=40,]
#x3 <- x[x$jbhru>40,]

model28byAge=(wages_perc ~ s(wave_age1) + s(wave_age2) + s(wave_age3) + s(wave_age4) + s(wave_age5) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit28byAge = gam(model28byAge, data=x2)
anova(fit28byAge)
plot(fit28byAge,pages=1, scale=-1, rug=F)

## ----fit28byMigrationStatus, eval=T, include=T, echo=T, comment=NA, cache=F----
model28byMigrationStatus=(wages_perc ~ s(wave_au) + s(wave_anglo) + s(wave_others) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct) # aneab cannot stay in the regression as few unique covariate combinations with wave_*
fit28byMigrationStatus = gam(model28byMigrationStatus, data=x)
anova(fit28byMigrationStatus)
plot(fit28byMigrationStatus,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit28byEducation, eval=T, include=T, echo=T, comment=NA, cache=F----
model28byEducation=(wages_perc ~ s(wave_ed1) + s(wave_ed2) + s(wave_ed3) + s(wave_ed4) + s(wave_ed5) + s(wave_ed6) + s(wave_ed7) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit28byEducation = gam(model28byEducation, data=x)
anova(fit28byEducation)
plot(fit28byEducation,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit28bySkilledJobs, eval=T, include=T, echo=T, comment=NA, cache=F----
model28bySkilledJobs=(wages_perc ~ s(x$wave_skill1) + s(x$wave_skill2) + s(x$wave_skill3) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit28bySkilledJobs = gam(model28bySkilledJobs, data=x)
anova(fit28bySkilledJobs)
plot(fit28bySkilledJobs,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit28bySalary, eval=T, include=T, echo=T, comment=NA, cache=F-------
model28bySalary=(wages_perc ~ s(x$wave_wage1) + s(x$wave_wage2) + s(x$wave_wage3) + s(x$wave_wage4) + s(x$wave_wage5) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit28bySalary = gam(model28bySalary, data=x)
anova(fit28bySalary)
plot(fit28bySalary,pages=1, scale=-1, rug=F) #all.terms=T

## ----fit31, eval=T, include=T, echo=F, comment=NA, cache=F---------------
#x2: workers with info on years since last studying
x2=x[x$ehtse>0 & (as.integer(x$esdtl)==11 | as.integer(x$esdtl)==12 | as.integer(x$esdtl)==17),]
model31=(wages_perc ~ s(ehtse_au) + s(ehtse_anglo) + s(ehtse_others) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit31 = gam(model31, data=x2)
anova(fit31)
plot(fit31, rug=F ,pages=1)

## ----fit32, eval=T, include=T, echo=F, comment=NA------------------------
model32=(wages_perc ~ s(ehtse_au) + s(ehtse_anglo) + s(ehtse_others) + sex + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit32 = gam(model32, data=x2)
anova(fit32)
plot(fit32, rug=F ,pages=1)

}

#' Function to check properties by xwaveid
#' @export
check_xwaveid <- function(x){
  check_int <- function(x){
    if(x$yrivwlst[1]-x$yrivwfst[1] != max(x$hgage)-min(x$hgage)) 
      return(paste(x$xwaveid[1], x$yrivwfst[1], x$yrivwlst[1], min(x$hgage), max(x$hgage),min(x$wave), max(x$wave)))
  }
  out <- by(x, x$xwaveid, check_int)
  out
}

#' @title Pre-processing of data
#' @export
clean_data <- function(x){
  x <- x[which(substr(x$jbmo62, 2,2)!="-"),] #Delete records without info on job
  x = x[x$yrivwfst!=-2,] #Delete records without year of first interview
  x$age_at_interview = x$hgage - (2012-x$yrivwfst)
  
  x$anmigc = as.factor(x$anmigc)
  
  # ancob [country of birth] --> 3 categories: AU, anglo, others
  missings.ancob=which(as.numeric(x$ancob) <=10)
  x = x[-missings.ancob,]
  au = c("[1101] Australia")
  anglo = c("[2100] United Kingdom", "[2201] Ireland", "[9225] South Africa", "[8102] Canada", "[8104] United States of America")
  i.au = which(x$ancob %in% au)
  i.anglo = which(x$ancob %in% anglo)
  ancob3 = rep("imm_others", nrow(x)) 
  ancob3[i.au] = "australians"
  ancob3[i.anglo] = "imm_anglo"
  x$ancob3 = factor(ancob3)
  
  x$edcoq[is.na(x$edcoq)] = 1 #<----- check
  x$edqenr[is.na(x$edqenr)] = 1 #<----- check
  x$aneab[i.au] = 1
  
  # anyoa [year of arriva] --> wave-age for non-migrants
  x$anyoa[i.au] = 2012 - x$hgage[i.au]
  x=x[x$anyoa>1900,]
  #WARNNING: i.au no more valid from here on
  ##Factors##
  facto <- c("xwaveid","edcoq")
  for (f in facto) x[,f]=factor(x[,f])
  ##Ordered factors##
  facto <- c("jbmspay","jbmssec")
  for (f in facto) x[,f]=factor(x[,f], ordered=T)
  x$wsfei[x$wsfei==0] = 1
  x$hifefp[x$hifefp==0] = 1
  x$dob <- 2012 - x$hgage
  x$age <- x$yrivwfst -x$dob - 1 + x$wave
  #years since studying FT
  x$ehtse_au = x$ehtse_anglo = x$ehtse_others = 0
  x$ehtse_au[x$ancob3=="australians"] = x$ehtse[x$ancob3=="australians"]
  x$ehtse_anglo[x$ancob3=="imm_anglo"] = x$ehtse[x$ancob3=="imm_anglo"]
  x$ehtse_others[x$ancob3=="imm_others"] = x$ehtse[x$ancob3=="imm_others"]
  ####
  #wave stratified by age groups (<=40hrs, >40hrs)
  age_limits = c(15,25,35,45,55)
  age_category = findInterval(x$hgage, age_limits)
  x$wave_age1 = x$wave_age2 = x$wave_age3 = x$wave_age4 = x$wave_age5 = 0
  x$wave_age1[which(age_category == 1)] = x$wave[which(age_category == 1)] 
  x$wave_age2[which(age_category == 2)] = x$wave[which(age_category == 2)] 
  x$wave_age3[which(age_category == 3)] = x$wave[which(age_category == 3)] 
  x$wave_age4[which(age_category == 4)] = x$wave[which(age_category == 4)] 
  x$wave_age5[which(age_category == 5)] = x$wave[which(age_category == 5)] 
  #wave stratified by migration status (Australians vs English speaking migrants vs other migrants)
  x$wave_au = x$wave_anglo = x$wave_others = 0
  x$wave_au[x$ancob3=="australians"] = x$wave[x$ancob3=="australians"] 
  x$wave_anglo[x$ancob3=="imm_anglo"] = x$wave[x$ancob3=="imm_anglo"] 
  x$wave_others[x$ancob3=="imm_others"] = x$wave[x$ancob3=="imm_others"] 
  #wave stratified by education
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
  #wave stratified by skilled jobs (3 categories)
  x$wave_skill1 = x$wave_skill2 = x$wave_skill3 = 0
  skill_limits = c(1,4,7)
  skill_category = findInterval(as.integer(sapply(x$jbmo62, substr, 2,2)), skill_limits)
  x$wave_skill1[which(skill_category==1)] = x$wave[which(skill_category==1)] 
  x$wave_skill2[which(skill_category==2)] = x$wave[which(skill_category==2)] 
  x$wave_skill3[which(skill_category==3)] = x$wave[which(skill_category==3)] 
  #wave stratified by subject median salary
  median_wage_by_id <- by(x, x$xwaveid, function(x)median(x$wsfei))
  x$median_wage <- median_wage_by_id[as.character(x$xwaveid)]
  wage_limits = c(0,5000,50000,100000,200000)
  wage_category = findInterval(x$wsfei, wage_limits)
  x$wave_wage1 = x$wave_wage2 = x$wave_wage3 = x$wave_wage4 = x$wave_wage5 = 0
  x$wave_wage1[wage_category == 1] = x$wave[wage_category == 1]
  x$wave_wage2[wage_category == 2] = x$wave[wage_category == 2]
  x$wave_wage3[wage_category == 3] = x$wave[wage_category == 3]
  x$wave_wage4[wage_category == 4] = x$wave[wage_category == 4]
  x$wave_wage5[wage_category == 5] = x$wave[wage_category == 5]
  ##
  ## CLEANING
  ##
  x <- x[x$jbhru<900,] # take away who works 997 hours per week (~3500 records)
  #x <- x[x$wsfei>10000,] #try only with records where the salary is greater than 10000
  
  
  perc_by_job =by(x, x$jbmo62, function(x)quantile(x$wsfei, prob=c(0,.1,.2,.3,.4,.5,.6,.7,.8,.9,1)))
  jobs=levels(x$jbmo62)
  jobs=jobs[substr(jobs,1,2)!="[-"]
  x$wages_perc = rep(NA, nrow(x))
  for (j in jobs){
    ii <- which(x$jbmo62 == j)
    wages <- x[ii,"wsfei"]
    wages_perc <- individual_quantiles(wages)
    x[ii,"wages_perc"] <- wages_perc
  }
  x=x[!is.na(x$wages_perc),]
  
}

#' @title Quantiles by job
individual_quantiles <- function(x){
  n <- length(x)
  return(rank(x)/n)
}
