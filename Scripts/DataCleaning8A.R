# Data Cleaning - Report 8

odp <- read.csv("Data/CANSb5.csv", na.strings = "NA")
names(odp)

odp$sex = factor(odp$sex, labels=c("Female", "Male"))


library(lubridate)
odp$date.of.birth <- ymd(odp$dob)
odp$date.of.e <- ymd(odp$doe)
odp$start.date <- ymd(odp$start_date)
odp$end.date <- ymd(odp$end_date)


odp$age.years <- new_interval(odp$date.of.birth, odp$start.date) / duration(num = 1, units = "years")
odp$age.months <- new_interval(odp$date.of.birth, odp$start.date) / duration(num = 1, units = "months")
odp$age.days <- new_interval(odp$date.of.birth, odp$start.date) / duration(num = 1, units = "days")

age.labels <- c("0-4 years old", "5-7 years old", "8-11 years old", "12-14 years old", "15-17 years old", "18+ years old")
odp$age.groups <- cut(odp$age.years, breaks = c(0, 5, 8, 12, 15, 18, 100), labels = age.labels, include.lowest = TRUE)

odp$length.of.stay.months <- new_interval(odp$start.date, odp$end.date) / duration(num = 1, units = "months")
los.labels <- c("Under 1 month", "1 to 2 months", "3 to 6 months", "7 to 11 months", "1 to 2 years", "2+ years")
odp$los.months <- cut(odp$length.of.stay.months, breaks = c(0, 1,  3,  7, 12, 24, 100), labels = los.labels, include.lowest = FALSE)


my.data = subset(odp, v3=="X" & length.of.stay.months >= 1 & client_num != 500000, )


df <- my.data[!(duplicated(my.data[c("client_FID","intake")]) | duplicated(my.data[c("client_FID","intake")], fromLast = TRUE)), ]

w <- reshape(df,
             timevar = "intake",
             idvar = c("client_FID", "agency_program_FID", "start_date", "end_date"),
             direction = "wide")

library(dplyr)
w2 = w %>% select(client_FID, agency_program_FID, iprsn_total.intake, iprsn_total.discharge, everything())

df.8 = subset(w2, iprsn_total.intake != "NA" & iprsn_total.discharge != "NA", )


df.8$iprsn_total.intake = as.numeric(as.character(df.8$iprsn_total.intake))
df.8$ldf_total.discharge = as.numeric(as.character(df.8$iprsn_total.discharge))



# CANS 5 and older
odp2 <- read.csv("Data/CANS2.csv", na.strings = "NA")
names(odp2)

odp2$sex = factor(odp2$sex, labels=c("Female", "Male"))



library(lubridate)
odp2$date.of.birth <- ymd(odp2$dob)
odp2$date.of.e <- ymd(odp2$doe)
odp2$start.date <- ymd(odp2$start_date)
odp2$end.date <- ymd(odp2$end_date)


odp2$age.years <- new_interval(odp2$date.of.birth, odp2$start.date) / duration(num = 1, units = "years")
odp2$age.months <- new_interval(odp2$date.of.birth, odp2$start.date) / duration(num = 1, units = "months")
odp2$age.days <- new_interval(odp2$date.of.birth, odp2$start.date) / duration(num = 1, units = "days")

age.labels <- c("0-4 years old", "5-7 years old", "8-11 years old", "12-14 years old", "15-17 years old", "18+ years old")
odp2$age.groups <- cut(odp2$age.years, breaks = c(0, 5, 8, 12, 15, 18, 100), labels = age.labels, include.lowest = TRUE)

odp2$length.of.stay.months <- new_interval(odp2$start.date, odp2$end.date) / duration(num = 1, units = "months")
los.labels <- c("Under 1 month", "1 to 2 months", "3 to 6 months", "7 to 11 months", "1 to 2 years", "2+ years")
odp2$los.months <- cut(odp2$length.of.stay.months, breaks = c(0, 1,  3,  7, 12, 24, 100), labels = los.labels, include.lowest = FALSE)


odp2$intake_discharge = ordered(factor(odp2$intake, levels = c("intake", "discharge")))

my.data = subset(odp2, v3=="X" & length.of.stay.months > 1 & client_num != 500000, )

library(reshape)
mdata <- melt(my.data, id = c("client_FID","agency_program_FID", "intake"))

df <- my.data[!(duplicated(my.data[c("client_FID","intake")]) | duplicated(my.data[c("client_FID","intake")], fromLast = TRUE)), ]

w <- reshape(df,
             timevar = "intake",
             idvar = c("client_FID", "agency_program_FID", "start_date", "end_date"),
             direction = "wide")

library(dplyr)
w2 = w %>% select(client_FID, agency_program_FID, ppc_total.intake, ppc_total.discharge, everything())

df.9 = subset(w2, ppc_total.intake != "NA" & ppc_total.discharge != "NA" & ppc_na.intake != 1 & ppc_na.discharge != 1, )


df.9$ppc_total.intake = as.numeric(as.character(df.9$ppc_total.intake))
df.9$ppc_total.discharge = as.numeric(as.character(df.9$ppc_total.discharge))



my.vars1 = c("client_FID", "agency_FID.intake", "agency_program_FID", "iprsn_total.intake", "iprsn_total.discharge", "age.groups.intake")

my.vars2 = c("client_FID", "agency_FID.intake", "agency_program_FID", "ppc_total.intake", "ppc_total.discharge", "age.groups.intake")

df.A = df.8[my.vars1]
df.B = df.9[my.vars2]

df.A$r8_total.intake = df.A$iprsn_total.intake
df.B$r8_total.intake = df.B$ppc_total.intake
df.A$r8_total.discharge = df.A$iprsn_total.discharge
df.B$r8_total.discharge = df.B$ppc_total.discharge


my.vars3 = c("client_FID", "agency_FID.intake", "agency_program_FID", "r8_total.intake", "r8_total.discharge", "age.groups.intake")

df.A = df.A[my.vars3]
df.B = df.B[my.vars3]

df = rbind(df.A, df.B)

attach(df)

df$program[agency_program_FID == 154 | agency_program_FID == 155 | agency_program_FID == 156 | agency_program_FID == 157 | agency_program_FID == 158 | agency_program_FID == 159 | agency_program_FID == 209] <- "Day Treatment"

df$program[agency_program_FID == 	8	 |
             agency_program_FID == 	11	 |
             agency_program_FID == 	15	 |
             agency_program_FID == 	32	 |
             agency_program_FID == 	33	 |
             agency_program_FID == 	42	 |
             agency_program_FID == 	53	 |
             agency_program_FID == 	54	 |
             agency_program_FID == 	55	 |
             agency_program_FID == 	56	 |
             agency_program_FID == 	57	 |
             agency_program_FID == 	58	 |
             agency_program_FID == 	59	 |
             agency_program_FID == 	60	 |
             agency_program_FID == 	61	 |
             agency_program_FID == 	62	 |
             agency_program_FID == 	63	 |
             agency_program_FID == 	64	 |
             agency_program_FID == 	65	 |
             agency_program_FID == 	66	 |
             agency_program_FID == 	91	 |
             agency_program_FID == 	93	 |
             agency_program_FID == 	94	 |
             agency_program_FID == 	96	 |
             agency_program_FID == 	100	 |
             agency_program_FID == 	102	 |
             agency_program_FID == 	103	 |
             agency_program_FID == 	104	 |
             agency_program_FID == 	138	 |
             agency_program_FID == 	168	 |
             agency_program_FID == 	169	 |
             agency_program_FID == 	171	 |
             agency_program_FID == 	173	 |
             agency_program_FID == 	175	 |
             agency_program_FID == 	177	 |
             agency_program_FID == 	179	 |
             agency_program_FID == 	180	 |
             agency_program_FID == 	182	 |
             agency_program_FID == 	184	 |
             agency_program_FID == 	187	 |
             agency_program_FID == 	197	 |
             agency_program_FID == 	205] <- "Family Foster Care"
df$program[agency_program_FID == 	1	 |
             agency_program_FID == 	22	 |
             agency_program_FID == 	23	 |
             agency_program_FID == 	27	 |
             agency_program_FID == 	40	 |
             agency_program_FID == 	41	 |
             agency_program_FID == 	101	 |
             agency_program_FID == 	111	 |
             agency_program_FID == 	151	 |
             agency_program_FID == 	188	 |
             agency_program_FID == 	189	 |
             agency_program_FID == 	190] <- "Group Home"

df$program[agency_program_FID == 	99 | agency_program_FID == 	112 | agency_program_FID == 	152 | agency_program_FID == 	185] <- "Independent Living"

df$program[agency_program_FID == 	3	 |
             agency_program_FID == 	10	 |
             agency_program_FID == 	16	 |
             agency_program_FID == 	17	 |
             agency_program_FID == 	18	 |
             agency_program_FID == 	20	 |
             agency_program_FID == 	21	 |
             agency_program_FID == 	24	 |
             agency_program_FID == 	31	 |
             agency_program_FID == 	51	 |
             agency_program_FID == 	87	 |
             agency_program_FID == 	88	 |
             agency_program_FID == 	89	 |
             agency_program_FID == 	106	 |
             agency_program_FID == 	109	 |
             agency_program_FID == 	114	 |
             agency_program_FID == 	139	 |
             agency_program_FID == 	140	 |
             agency_program_FID == 	164	 |
             agency_program_FID == 	198	 |
             agency_program_FID == 	199	 |
             agency_program_FID == 	203	 |
             agency_program_FID == 	207] <- "Open Residential Treatment"

df$program[agency_program_FID == 	167	 |
             agency_program_FID == 	191	 |
             agency_program_FID == 	192	 |
             agency_program_FID == 	202	 |
             agency_program_FID == 	204] <- "Other"

df$program[agency_program_FID == 	215	 |
             agency_program_FID == 	216	 |
             agency_program_FID == 	217	 |
             agency_program_FID == 	219	 |
             agency_program_FID == 	220] <- "Outpatient Mental Health"

df$program[agency_program_FID == 	4	 |
             agency_program_FID == 	5	 |
             agency_program_FID == 	6	 |
             agency_program_FID == 	28	 |
             agency_program_FID == 	29	 |
             agency_program_FID == 	30	 |
             agency_program_FID == 	208	 |
             agency_program_FID == 	212	 |
             agency_program_FID == 	213	 |
             agency_program_FID == 	214] <- "Secure Residential Treatment"

df$program[agency_program_FID == 	2	 |
             agency_program_FID == 	7	 |
             agency_program_FID == 	9	 |
             agency_program_FID == 	12	 |
             agency_program_FID == 	13	 |
             agency_program_FID == 	14	 |
             agency_program_FID == 	19	 |
             agency_program_FID == 	25	 |
             agency_program_FID == 	34	 |
             agency_program_FID == 	35	 |
             agency_program_FID == 	36	 |
             agency_program_FID == 	37	 |
             agency_program_FID == 	38	 |
             agency_program_FID == 	39	 |
             agency_program_FID == 	43	 |
             agency_program_FID == 	44	 |
             agency_program_FID == 	46	 |
             agency_program_FID == 	47	 |
             agency_program_FID == 	48	 |
             agency_program_FID == 	50	 |
             agency_program_FID == 	52	 |
             agency_program_FID == 	67	 |
             agency_program_FID == 	68	 |
             agency_program_FID == 	69	 |
             agency_program_FID == 	70	 |
             agency_program_FID == 	71	 |
             agency_program_FID == 	72	 |
             agency_program_FID == 	73	 |
             agency_program_FID == 	74	 |
             agency_program_FID == 	75	 |
             agency_program_FID == 	76	 |
             agency_program_FID == 	77	 |
             agency_program_FID == 	78	 |
             agency_program_FID == 	79	 |
             agency_program_FID == 	80	 |
             agency_program_FID == 	81	 |
             agency_program_FID == 	82	 |
             agency_program_FID == 	83	 |
             agency_program_FID == 	84	 |
             agency_program_FID == 	85	 |
             agency_program_FID == 	86	 |
             agency_program_FID == 	90	 |
             agency_program_FID == 	92	 |
             agency_program_FID == 	105	 |
             agency_program_FID == 	107	 |
             agency_program_FID == 	108	 |
             agency_program_FID == 	110	 |
             agency_program_FID == 	113	 |
             agency_program_FID == 	115	 |
             agency_program_FID == 	135	 |
             agency_program_FID == 	136	 |
             agency_program_FID == 	137	 |
             agency_program_FID == 	141	 |
             agency_program_FID == 	142	 |
             agency_program_FID == 	143	 |
             agency_program_FID == 	144	 |
             agency_program_FID == 	145	 |
             agency_program_FID == 	146	 |
             agency_program_FID == 	147	 |
             agency_program_FID == 	148	 |
             agency_program_FID == 	149	 |
             agency_program_FID == 	150	 |
             agency_program_FID == 	153	 |
             agency_program_FID == 	160	 |
             agency_program_FID == 	161	 |
             agency_program_FID == 	162	 |
             agency_program_FID == 	163	 |
             agency_program_FID == 	165	 |
             agency_program_FID == 	170	 |
             agency_program_FID == 	172	 |
             agency_program_FID == 	174	 |
             agency_program_FID == 	176	 |
             agency_program_FID == 	178	 |
             agency_program_FID == 	181	 |
             agency_program_FID == 	183	 |
             agency_program_FID == 	186	 |
             agency_program_FID == 	193	 |
             agency_program_FID == 	194	 |
             agency_program_FID == 	195	 |
             agency_program_FID == 	196	 |
             agency_program_FID == 	200	 |
             agency_program_FID == 	201	 |
             agency_program_FID == 	210	 |
             agency_program_FID == 	211	 |
             agency_program_FID == 	218] <- "Treatment Foster Care"

detach(df)
