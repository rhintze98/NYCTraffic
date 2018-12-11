w1 <- read.csv(file="NYPD_Motor_Vehicle_Collisions.csv", header=TRUE, sep=",")
summary(w1)
length(w1$NUMBER.OF.PEDESTRIANS.INJURED)
mean(w1$NUMBER.OF.MOTORIST.KILLED)
sd(w1$NUMBER.OF.MOTORIST.KILLED)
error <- qt(0.975,df=length(w1$NUMBER.OF.PEDESTRIANS.INJURED)-1)*sd(w1$NUMBER.OF.PEDESTRIANS.INJURED)/sqrt(length(w1$NUMBER.OF.PEDESTRIANS.INJURED))
error
left <- mean(w1$NUMBER.OF.PEDESTRIANS.INJURED)-error
right <- mean(w1$NUMBER.OF.PEDESTRIANS.INJURED)+error
left
right
hist(w1$NUMBER.OF.MOTORIST.KILLED, main= "Number of Motorists Killed in Traffic Collisions",xlab = "Number of Motorists", col = "blue", ylim=c(0,100))
plot(w1$DATE, main= "Traffic Collisions in NYC",xlab = "Date",ylab="Number of Collisions", col = "blue")
plot(NUMBER.OF.PEDESTRIANS.KILLED~NUMBER.OF.PEDESTRIANS.INJURED,data = w1,xlab= "Number of Pedestrians Injured",ylab= "Number of people Killed",col = "blue", main="Number of Pedestrians Killed vs Number of Pedestrians Injured")

plot(LATITUDE~LONGITUDE, data =w1, cex.axis = .5)
w1.lm<-lm(LATITUDE~LONGITUDE, data = w1)
coef(w1.lm)
abline(coef(w1.lm))
predict(w1.lm,newdata=data.frame(speed=c(6,8,21)))

INJURED_df <- subset(w1, NUMBER.OF.PEDESTRIANS.INJURED == 0)
str(INJURED_df)
head(INJURED_df)
KILLED_df <- subset(w1,NUMBER.OF.PEDESTRIANS.INJURED <= 2)
head(KILLED_df)
t.test(INJURED_df$DATE,KILLED_df$DATE)


plot(NUMBER.OF.PEDESTRIANS.INJURED~NUMBER.OF.PEDESTRIANS.KILLED,data = w1)
peds.aov <- aov(NUMBER.OF.PEDESTRIANS.KILLED~BOROUGH,data = w1)
summary(peds.aov)
model.tables(peds.aov,"means")
posthoc <- TukeyHSD(peds.aov)
posthoc
plot(posthoc)
plot(posthoc,las = 1)
