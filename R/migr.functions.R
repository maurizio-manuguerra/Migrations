#' @title Histogram of salaries by input variable (this make many functions below redundant)
#' @export
test7 <- function(x, what="", main=paste("Salaries by", what), cex=0.4){
  x$wage_cat=ceiling(x$wsfei/10000)*10000
  x$wage_cat[x$wage_cat>150000]=1000000
  x[what][,1]=droplevels(x[what][,1])
  tt=table(x[what][,1],x$wage_cat)
  what_lab = c(dimnames(tt)[[1]])
  wage_lab = c(dimnames(tt)[[2]])
  barplot(tt, main=main, ylab="Total", col=heat.colors(length(what_lab)), space=0.1, cex.axis=0.8, las=1,names.arg=wage_lab, cex=0.8) 
  legend(x="topright", what_lab, fill=heat.colors(length(what_lab)),cex=cex)
}

#' @title Histogram of salaries by migration status
#' @export
test6 <- function(x, main="Salaries by migration status", cex=0.4){
  x$wage_cat=ceiling(x$wsfei/10000)*10000
  x$wage_cat[x$wage_cat>150000]=1000000
  tt=table(x$ancob3,x$wage_cat)
  migr_lab = c(dimnames(tt)[[1]])
  wage_lab = c(dimnames(tt)[[2]])
  barplot(tt, main=main, ylab="Total", col=heat.colors(length(migr_lab)), space=0.1, cex.axis=0.8, las=1,names.arg=wage_lab, cex=0.8) 
  legend(x="topright", migr_lab, fill=heat.colors(length(migr_lab)),cex=cex)
}

#' @title Histogram of salaries by hours per week
#' @export
test5 <- function(x, main="Salaries by hours per week", cex=0.4){
  x$wage_cat=ceiling(x$wsfei/10000)*10000
  x$wage_cat[x$wage_cat>150000]=1000000
  x$whrs_cat=ceiling(x$jbhru/10)*10
  x$whrs_cat[x$whrs_cat>100]=150
  tt=table(x$whrs_cat,x$wage_cat)
  hrs_lab = c(dimnames(tt)[[1]])
  wage_lab = c(dimnames(tt)[[2]])
  barplot(tt, main=main, ylab="Total", col=heat.colors(length(hrs_lab)), space=0.1, cex.axis=0.8, las=1,names.arg=wage_lab, cex=0.8) 
  legend(x="topright", hrs_lab, fill=heat.colors(length(hrs_lab)),cex=cex)
}




#' @title Histogram of salaries by job
#' @export
test4 <- function(x, main="Salaries by job", cex=0.4){
  x$wage_cat=ceiling(x$wsfei/10000)*10000
  x$wage_cat[x$wage_cat>150000]=1000000
  x$jbmo62 = droplevels(x$jbmo62)
  tt=table(x$jbmo62,x$wage_cat)
  job_lab = c(dimnames(tt)[[1]])
  wage_lab = c(dimnames(tt)[[2]])
  barplot(tt, main=main, ylab="Total", col=heat.colors(length(job_lab)), space=0.1, cex.axis=0.8, las=1,names.arg=wage_lab, cex=0.8) 
  legend(x="topright", job_lab, fill=heat.colors(length(job_lab)),cex=cex)
}


#' @title The testing2 function
#' @export
test3 <- function(wage, main=""){
  xlow=x[x$wsfei<wage,]
  xhigh=x[x$wsfei>=wage,]
  joblow=as.vector(table(xlow$jbmo62))
  jobhigh=as.vector(table(xhigh$jbmo62))
  joball=as.vector(table(x$jbmo62))
  plot(joblow/sum(joblow)*100, col='red', t='l', main=main)
  lines(jobhigh/sum(jobhigh)*100,col='green')
  #lines(joball/sum(joball)*100)
}

#' @title The testing2 function
#' @export
test2 <- function(){
  #knit("~/Dropbox/Attachments/-.Migrations/code/HILDA.Rmd")
  library(mgcv)
  x = clean_data(HILDA)
  model27=(jbhru ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab  + other_household + esempst)
  pdf("fit27lowhigh.pdf")
  par(mfrow=c(3,1))
  for (i in 1:5){
    print(i)
    wage=i*30000
    #xlow=x[x$wsfei<wage,]
    #xhigh=x[x$wsfei>=wage,]
    #xint=x[x$wsfei>=(wage-5000) & x$wsfei<(wage+5000),]
    xlow=x[x$median_wage<wage,]
    xhigh=x[x$median_wage>=wage,]
    xint=x[x$median_wage>=(wage-15000) & x$median_wage<(wage+15000),]
    fit27low = gam(model27, data=xlow)
    fit27high = gam(model27, data=xhigh)
    fit27int = gam(model27, data=xint)
    plot(fit27low,pages=1, scale=-1, rug=F, main=paste("wage <",wage))
    plot(fit27high,pages=1, scale=-1, rug=F, main=paste("wage >=",wage))
    plot(fit27int,pages=1, scale=-1, rug=F, main=paste(wage-15000,"<= wage <",wage+15000))
    }
  par(mfrow=c(1,1))
  dev.off()
}

#' @title The testing function
#' @export
test <- function(){
	test_all()
}


#' @title The testing function
#' @export
test_all <- function(){
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
  #x <- x[which(substr(x$jbmo62, 2,2)!="-"),] #Delete records without info on job
  x$jbmo62[which(substr(x$jbmo62, 2,2)=="-")] = NA #"[-1] Not asked" 
  x$jbmo62 = droplevels(x$jbmo62)
  #x = x[x$yrivwfst!=-2,] #Delete records without year of first interview
  
  x$anmigc = as.factor(x$anmigc)
  
  #country of birth --> 3 categories: AU, anglo, others
  missings.ancob=which(as.numeric(x$ancob) <=10)
  #x = x[-missings.ancob,] #Delete records without info on ancob
  au = c("[1101] Australia")
  anglo = c("[2100] United Kingdom", "[2201] Ireland", "[9225] South Africa", "[8102] Canada", "[8104] United States of America")
  i.au = which(x$ancob %in% au)
  i.anglo = which(x$ancob %in% anglo)
  ancob3 = rep("imm_others", nrow(x)) 
  ancob3[i.au] = "australians"
  ancob3[i.anglo] = "imm_anglo"
  ancob3[missings.ancob] = "no_info"
  x$ancob3 = ancob3
  
  #country completed highest education
  x$edcoq[is.na(x$edcoq) | x$edcoq<0] = -1 #<----- consolidate
  
  #Ever enrolled in a course of study to obtain a qualification
  x$edqenr[is.na(x$edqenr) | x$edqenr<0] = -1 #<----- consolidate
  
  #How well speaks English
  x$aneab[i.au] = 1
  
  #Date of birth
  x$dob <- 2000 + x$wave - x$hgage
  
  #anyoa [year of arriva] 
  x$anyoa[i.au] = x$dob[i.au] #--> dob for australian born
  #There are problems with this var: same subject, can take the real value or -10 if he/she decides to not respond.
  
  #### New categorical variables
  
  #wave stratified by age groups
  age_limits = c(15,25,35,45,55)
  x$age_category = findInterval(x$hgage, age_limits)
  
  #wave stratified by skilled jobs (3 categories)
  skill_limits = c(1,4,7)
  x$skill_category = findInterval(as.integer(sapply(x$jbmo62, substr, 2,2)), skill_limits)
  
  #wave stratified by subject median salary
  median_wage_by_id <- by(x, x$xwaveid, function(x)median(x$wsfei))
  x$median_wage <- median_wage_by_id[as.character(x$xwaveid)]
  wage_limits = c(0,5000,50000,100000,200000)
  x$wage_category = findInterval(x$wsfei, wage_limits)
  
  ##Factors##
  facto <- c("xwaveid", "edcoq", "edqenr", "ancob3", "aneab", "skill_category")
  for (f in facto) x[,f]=factor(x[,f])
  
  ##Ordered factors##
  facto <- c("jbmspay","jbmssec", "age_category", "wage_category")
  for (f in facto) x[,f]=factor(x[,f], ordered=T)
  
  #Annual salary
  x$wsfei[x$wsfei==0] = 1
  
  #Household income contribution from others
  x$other_household = x$hifefp-x$hifefn-x$wsfei
  
  #Household financial year gross=0 --> 1
  x$hifefp[x$hifefp==0] = 1
  

  ## CLEANING
  ##
  x <- x[x$jbhru<900,] # take away who works 997 hours per week (~3500 records)
  #x <- x[x$wsfei>10000,] #try only with records where the salary is greater than 10000
  
  #perc_by_job =by(x, x$jbmo62, function(x)quantile(x$wsfei, prob=c(0,.1,.2,.3,.4,.5,.6,.7,.8,.9,1)))
  jobs=levels(x$jbmo62)
  jobs=jobs[substr(jobs,1,2)!="[-"]
  x$wages_perc = rep(NA, nrow(x))
  for (j in jobs){
    ii <- which(x$jbmo62 == j)
    wages <- x[ii,"wsfei"]
    wages_perc <- individual_quantiles(wages)
    x[ii,"wages_perc"] <- wages_perc
  }
  #x=x[!is.na(x$wages_perc),] #Delete records with wages_perc = NA
  ##Only with age>=18 and <=65 and responding to questionnaire
  x=x[x$hgage>=18 & x$hgage<=65,]
  x=x[x$mrcurr!="[-10] Non-responding person",]
  return(x)
}

#' @title Quantiles by job
individual_quantiles <- function(x){
  n <- length(x)
  return(rank(x)/n)
}


#' @title Present cat vars in table
make_table <- function(x){
  tx=table(x)
  nx=sapply(names(tx),function(st)strsplit(st,split='] ',fixed=T)[[1]][2])
  for (i in 1:length(tx)) if (tx[i]>0) cat(nx[i],";",tx[i],"\n",sep='')
}

make_tables <- function(x, vars=c("sex","hhstate", "hhrih","esdtl","mrcurr","ancob3","edhigh1")){
  tmp=sapply(vars, function(var){cat(">>",var,"<<","\n");make_table(x[[var]]);cat("---------------\n")})
}
