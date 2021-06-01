library('tidyverse')
df <- Lab4_ZipCard_Data %>% filter(GENDER != "Unknown")
shapiro.test(df$TRANSACTION_AMOUNT[df$GENDER == "Male"])
var.test(TRANSACTION_AMOUNT ~ GENDER, data = df)
t.test(TRANSACTION_AMOUNT ~ GENDER, data = df, var.equal = TRUE, alternative = "greater")
chisq.test(df$GENDER, df$ACAD_ORG)
af <- df %>% filter(ACAD_LEVEL %in% c("Freshman","Sophomore","Junior","Senior"))
res.aov <- aov(af$TRANSACTION_AMOUNT ~ af$ACAD_LEVEL)
res.aov
TukeyHSD(res.aov)

