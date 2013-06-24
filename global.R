#this is really actually just to show you what I did to rename the categories/import, rewrite, etc

yelp_ads<-read.csv('~/pm_ad_stats.csv') #basic import into R
names(yelp_ads)<-c('business_name','impressions','ad_clicks','cpc','ctr')
#classifying based on ctr
#PRE=PROCESSING SECTION
yelp_ads$est_earn<-yelp_ads$ad_clicks*yelp_ads$cpc
yelp_ads$ad_rpm<-yelp_ads$est_earn/yelp_ads$impressions*1000

#warning: ugly code coming up
count<-1
for(biz in yelp_ads$business_name){
if(yelp_ads$ctr[count]<.0018){
yelp_ads$ctr_class[count]<-'bad'}
else if(yelp_ads$ctr[count]>.01){
yelp_ads$ctr_class[count]<-'great'}
else if(yelp_ads$ctr[count]<=.01&&yelp_ads$ctr[count]>.005){
yelp_ads$ctr_class[count]<-'good'}
else{
    yelp_ads$ctr_class[count]<-'neutral'
}
count<-count+1
}
#classifying based on cpc
count<-1
for(biz in yelp_ads$business_name){
if(yelp_ads$cpc[count]==1){
yelp_ads$cpc_class[count]<-'1 dollar'}
else if(yelp_ads$cpc[count]==2){
yelp_ads$cpc_class[count]<-'2 dollars'}
else{
    yelp_ads$cpc_class[count]<-'more than 2 dollars'
}
count<-count+1
}

write.csv(yelp_ads,'yelp_ads_new.csv')