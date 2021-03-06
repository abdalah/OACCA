## Data Cleaning - Report 7 ##

odp <- read.csv("Data/report_7.csv", na.strings = "NA")
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


attach(odp)
odp$independence[sch_ged == 1] <- 1
odp$independence[dip_ged_employed == 1] <- 2
odp$independence[dip_ged_post_sec == 1] <- 3
odp$independence[do_ex_employed == 1] <- 4
odp$independence[dip_ged_not_employed_post_sec == 1] <- 5
odp$independence[do_ex_not_employed_post_sec == 1] <- 6
detach(odp)

odp$independence[is.na(odp$independence)] <- 7

levs <- c(1:7)
labs <- c("Attending School/Seeking a GED", "Diploma/GED and Employed/Job Corps/Military", "Diploma/GED and Attending Post-secondary ed.", "Dropped out/Expelled and Employed/ Job Corps/ Military", "Diploma/GED and no employment/ Job Corps/ Military/ Post-secondary", "Dropped out/Expelled and no employment/ Job Corps/Military/Post-secondary", "Unknown")
odp$ind_final <- factor(odp$independence, levels = levs, labels = labs)


library(dplyr)
w_odp = odp %>% select(client_FID, agency_program_FID, start_date, end_date, age.years, everything())


my.data = subset(w_odp, v3=="X" & length.of.stay.months >= 1 & client_num != 500000 & age.years >= 17, )


df <- my.data[!(duplicated(my.data[c("client_FID", "start_date","end_date")]) | duplicated(my.data[c("client_FID", "start_date","end_date")], fromLast = TRUE)), ]

attach(df)

df$agencyID[df$agency_FID == 2] <- 10010
df$agencyID[df$agency_FID == 3] <- 10011
df$agencyID[df$agency_FID == 11] <- 10024
df$agencyID[df$agency_FID == 12] <- 10034
df$agencyID[df$agency_FID == 24] <- 10096

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

df$program_loop <- paste(df$agencyID, df$program)
