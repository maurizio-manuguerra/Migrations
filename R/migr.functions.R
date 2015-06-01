#' @title The testing function
#' @export
test <- function(){
  knit("~/Dropbox/Attachments/-.Migrations/code/HILDA.Rmd")
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
