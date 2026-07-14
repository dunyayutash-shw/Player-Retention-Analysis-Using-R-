#libraries

install.packages("tidyverse")
library(tidyverse)
install.packages("dyplyr")
library(dyplyr)
install.packages("tidyr")
library(tidyr)
install.packages("readr")
library(readr)
install.packages("ggplot2")
library(ggplot2)
install.packages("janitor")
install.packages("skimr")
install.packages("here")
library(skimr)
library(janitor)
library(here)
install.packages("grDevices")
library(grDevices)

# reading and viewing the csv file 
read_csv("online_gaming_behavior_dataset")
view(online_gaming_behavior_dataset)

#getting an overview on the data 

skim_without_charts(online_gaming_behavior_dataset)
glimpse(online_gaming_behavior_dataset)

#data was already clean just aked sure that there is no duplicates players and named the unique players
#using ggplot2 to visualize data and get insights 

#Genders vs Engagementlevel
ggplot(unique_players,aes(x=EngagementLevel,fill=Gender))+geom_bar()+facet_wrap(~Gender)+
  scale_fill_manual(values = hcl.colors(2,"pastel 1"))

#Playtimehours vs Engagementlevel
ggplot(unique_players,aes(x=EngagementLevel,y=PlayTimeHours,fill = EngagementLevel))+
  geom_boxplot()+scale_fill_manual(values = hcl.colors(3,"pastel 1"))

# location vs Engagementlevel
ggplot(unique_players,aes(x=EngagementLevel,fill=Location))+ 
  geom_bar(position = "dodge",color="black") + scale_fill_manual(values = hcl.colors(4, "Pastel1"))+
 theme(panel.border = (element_rect(color="black",fill=NA,linewidth = 1.5)))+
  labs(title = "Engagement level at each continent")


# Game Genre vs Engagementlevel
ggplot(unique_players,aes(x=EngagementLevel,fill = GameGenre))+geom_bar()+
   scale_fill_manual(values = hcl.colors(5,"purplebrown"))+labs(title = "genre vs engagement level")

# difficulty vs Engagementlevel
ggplot(unique_players,aes(x=EngagementLevel,fill=GameDifficulty))+geom_bar()+
  scale_fill_manual(values=hcl.colors(3,"Rocket"))+ labs(title="How Game Difficulty Influences Player Engagement")

#another point of viewing difficulty vs Engagement 
ggplot(unique_players,aes(x=EngagementLevel,y=GameDifficulty))+geom_count()+
  scale_fill_manual(values=hcl.colors(3,"Rocket"))+ labs(title="How Game Difficulty Influences Player Engagement",subtitle="Impact of Difficulty Settings on enagement")

#Sessions per week vs Engagementlevel

ggplot(unique_players,aes(x=EngagementLevel,y=SessionsPerWeek))+geom_violin()


#summarizing in-game purchase data
purchase_summary <- summary(unique_players$InGamePurchases>0)
head(purchase_summary)

#visualizing purchase data 
ggplot(unique_players,aes(x=EngagementLevel,fill =factor(InGamePurchases)))+geom_bar(position="dodge")+theme_minimal()+labs (subtitle="this does not represent all players as the majority has no purchases",title = "In Game purchases by Engagement Level")
                       
 
