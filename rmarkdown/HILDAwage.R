## ----set-options, echo=F, cache=F----------------------------------------
#options(width = 120)

## ----load-libraries, echo=F, cache=F-------------------------------------
library(mgcv)
#library(ordinal)

## ----data_manipulation, eval=T, include=T, echo=F, comment=NA, cache=F----
#library(readstata13)
#setwd("~/Dropbox/Documents/Research/Migrations/data")
#load("Hilda.RData")
#x=read.dta13("MAURIZIO_HILDA_extraction.dta")
library(Migrations)
x = clean_data(HILDA)

pdf("analyses_2015.07.17.pdf")
## ----fit26, eval=T, include=T, echo=T, comment=NA, cache=F---------------
model26=(jbhru ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct  + other_household)
fit26 = gam(model26, data=x)
anova(fit26)
plot(fit26,pages=1, scale=-1, rug=F)

## ----fit27, eval=T, include=T, echo=T, comment=NA, cache=F---------------
model27=(log(wsfei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab + other_household)
fit27 = gam(model27, data=x)
anova(fit27)
plot(fit27,pages=1, scale=-1, rug=F)

## ----fit27bis, eval=T, include=T, echo=T, comment=NA, cache=F------------
model27bis=(log(wsfei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + jbhru  + other_household)
fit27bis = gam(model27bis, data=x)
anova(fit27bis)
plot(fit27bis,pages=1, scale=-1, rug=F)

## ----fit27weekly, eval=T, include=T, echo=T, comment=NA, cache=F---------
x2=x[x$wscei>0 & x$jbhru>0,]
x2$wpw = x2$wscei/x2$jbhru
model27weekly=(log(wscei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct  + other_household)
fit27weekly = gam(model27weekly, data=x2)
anova(fit27weekly)
plot(fit27weekly,pages=1, scale=-1, rug=F)

## ----fit27hrwage, eval=T, include=T, echo=T, comment=NA, cache=F---------
x2=x[x$wscei>0 & x$jbhru>0,]
x2$hrw = x2$wscei/x2$jbhru
model27hrwage=(hrw ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct  + other_household)
fit27hrwage = gam(model27hrwage, data=x2)
anova(fit27hrwage)
plot(fit27hrwage,pages=1, scale=-1, rug=F)

## ----fit28, eval=T, include=T, echo=T, comment=NA, cache=F---------------
model28=(wages_perc ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household)
fit28 = gam(model28, data=x)
anova(fit28)
plot(fit28,pages=1, scale=-1, rug=F)

## ----fit27rnd, eval=F, include=T, echo=T, comment=NA, cache=F------------
#load("~/Dropbox/Attachments/-.Migrations/data/fit27rnd.RData")
model27rnd=(log(wsfei) ~ s(wave) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + aneab)
fit27rnd = gamm(model27, random=list(xwaveid=~1), data=x)
anova(fit27rnd$gam)
plot(fit27rnd$gam,pages=1, scale=-1, rug=F)

## ----fit27byAge, eval=F, include=T, echo=T, comment=NA, cache=F----------
model27byAge=(log(wsfei) ~ s(wave, age_category, bs="fs",k=5) +  hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household)
fit = gam(model27byAge, data=x)
snames=fit$smooth[[1]]$flev
anova(fit)
plot(fit,pages=1, scale=-1, rug=F) #all.terms=T
legend("bottomleft",snames,  lty=1:length(snames))

## ----fit27byMigrationStatus, eval=F, include=T, echo=T, comment=NA, cache=F----
model27byMigrationStatus=(log(wsfei) ~ s(wave, ancob3, bs="fs",k=5) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household) # aneab cannot stay in the regression as few unique covariate combinations with wave_*
fit = gam(model27byMigrationStatus, data=x)
snames=fit$smooth[[1]]$flev
anova(fit)
plot(fit,pages=1, scale=-1, rug=F) #all.terms=T
legend("bottomleft",snames,  lty=1:length(snames))

## ----fit27byLabourForceStatus, eval=F, include=T, echo=T, comment=NA, cache=F----
model27byLabourForceStatus=(log(wsfei) ~ s(wave, esdtl, bs="fs",k=5)+ hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household) 
fit = gam(model27byLabourForceStatus, data=x)
snames=fit$smooth[[1]]$flev
anova(fit)
plot(fit,pages=1, scale=-1, rug=F) #all.terms=T
legend("bottomleft",snames,  lty=1:length(snames))

## ----fit27byEmploymentStatus, eval=F, include=T, echo=T, comment=NA, cache=F----
model27byEmploymentStatus=(log(wsfei) ~ s(wave, esempst, bs="fs",k=5) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household) 
fit = gam(model27byEmploymentStatus, data=x)
snames=fit$smooth[[1]]$flev
anova(fit)
plot(fit,pages=1, scale=-1, rug=F) #all.terms=T
legend("bottomleft",snames,  lty=1:length(snames))

## ----fit27byEducation, eval=F, include=T, echo=T, comment=NA, cache=F----
model27byEducation=(log(wsfei) ~ s(wave, edhigh1, bs="fs",k=5) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household)
fit = gam(model27byEducation, data=x)
snames=fit$smooth[[1]]$flev
anova(fit)
plot(fit,pages=1, scale=-1, rug=F) #all.terms=T
legend("bottomleft",snames,  lty=1:length(snames))

## ----fit27bySkilledJobs, eval=F, include=T, echo=T, comment=NA, cache=F----
model27bySkilledJobs=(log(wsfei) ~ s(wave, skill_category, bs="fs",k=5) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household)
fit = gam(model27bySkilledJobs, data=x)
snames=fit$smooth[[1]]$flev
anova(fit)
plot(fit,pages=1, scale=-1, rug=F) #all.terms=T
legend("bottomleft",snames,  lty=1:length(snames))

## ----fit27bySalary, eval=F, include=T, echo=T, comment=NA, cache=F-------
model27bySalary=(log(wsfei) ~ s(x$wave, wage_category, bs="fs",k=5) + hgage + I(hgage^2) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household)
fit = gam(model27bySalary, data=x)
snames=fit$smooth[[1]]$flev
anova(fit)
plot(fit,pages=1, scale=-1, rug=F) #all.terms=T
legend("bottomleft",snames,  lty=1:length(snames))

## ----fit28rnd, eval=F, include=T, echo=F, comment=NA---------------------
#load("~/Dropbox/Attachments/-.Migrations/data/fit28rnd.RData")
fit28rnd = gamm(model28, random=list(xwaveid=~1), data=x)
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

## ----family_wage, eval=T, include=T, echo=F, comment=NA------------------
model30=(log(hifefp) ~ s(wave) + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr +  esdtl + hhstate + jbmwpsz + jbocct + other_household)
fit30 = gam(model30, data=x)
anova(fit30)
plot(fit30,pages=1, scale=-1, rug=F)


## ----fit31, eval=T, include=T, echo=F, comment=NA, cache=F---------------
#x2: workers with info on years since last studying
x2=x[x$ehtse>0 & (as.integer(x$esdtl)==11 | as.integer(x$esdtl)==12 | as.integer(x$esdtl)==17),]
model31=(wages_perc ~ s(ehtse_au) + s(ehtse_anglo) + s(ehtse_others) + sex + ancob3 + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household)
fit31 = gam(model31, data=x2)
anova(fit31)
plot(fit31, rug=F ,pages=1)

## ----fit32, eval=T, include=T, echo=F, comment=NA------------------------
model32=(wages_perc ~ s(ehtse_au) + s(ehtse_anglo) + s(ehtse_others) + sex + edhigh1 + jbmo62 + edcoq3 + edqenr + fmfo61 + fmmo61 + esdtl + mrcurr + hhstate + jbmwpsz + jbocct + other_household)
fit32 = gam(model32, data=x2)
anova(fit32)
plot(fit32, rug=F ,pages=1)

graphics.off()