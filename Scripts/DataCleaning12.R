## Data Cleaning - Report 10 ##
## @Ruhil May 21 2015 ##


odp <- read.csv("Data/child_sat_survey.csv", na.strings = "NA")

# odp <- read.csv("C:/Users/OIT-Classroom/Desktop/placements3.csv", na.strings="\\N")
names(odp)

my.data = subset(odp, survey_not_done == 0, )

#df = my.data[!duplicated(my.data[, c("client_FID", "placement_start", "placement_end")]), ]

df <- my.data[!(duplicated(my.data[c("client_FID","placement_start", "placement_end")]) | duplicated(my.data[c("client_FID","placement_start", "placement_end")], fromLast = TRUE)), ]

lev = c(1, 2, 3, 4, 5)
lab = c("Strongly Agree", "Somewhat Agree", "Neither Agree nor Disagree", "Somewhat Disagree", "Strongly Agree")

attach(df)
df$q1[q1 == 2] <- 1
df$q1[q1 == 4] <- 5
df$q2[q2 == 2] <- 1
df$q2[q2 == 4] <- 5
df$q3[q3 == 2] <- 1
df$q3[q3 == 4] <- 5
df$q4[q4 == 2] <- 1
df$q4[q4 == 4] <- 5
df$q5[q5 == 2] <- 1
df$q5[q5 == 4] <- 5
df$q6[q6 == 2] <- 1
df$q6[q6 == 4] <- 5
df$q7[q7 == 2] <- 1
df$q7[q7 == 4] <- 5
df$q8[q8 == 2] <- 1
df$q8[q8 == 4] <- 5
df$q9[q9 == 2] <- 1
df$q9[q9 == 4] <- 5
df$q10[q10 == 2] <- 1
df$q10[q10 == 4] <- 5
df$q11[q11 == 2] <- 1
df$q11[q11 == 4] <- 5

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


my.vars = c("q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10", "q11")


# Caregiver Survey

odp <- read.csv("Data/care_survey.csv", na.strings = "NA")

names(odp)

odp$q14 <- factor(odp$q14, levels=c(1, 2, 3, 4, 5, 6), labels=c("Mother", "Father", "Step parents", "Grandmother", "Grandfather", "Other"))

my.data = subset(odp, survey_not_done == 0, )

#df2 = my.data[!duplicated(my.data[, c("client_FID", "placement_start", "placement_end")]), ]

df2 <- my.data[!(duplicated(my.data[c("client_FID","placement_start", "placement_end")]) | duplicated(my.data[c("client_FID","placement_start", "placement_end")], fromLast = TRUE)), ]

lev = c(1, 2, 3, 4, 5)
lab = c("Strongly Agree", "Somewhat Agree", "Neither Agree nor Disagree", "Somewhat Disagree", "Strongly Agree")


attach(df2)
df2$q1[q1 == 2] <- 1
df2$q1[q1 == 4] <- 5
df2$q2[q2 == 2] <- 1
df2$q2[q2 == 4] <- 5
df2$q3[q3 == 2] <- 1
df2$q3[q3 == 4] <- 5
df2$q4[q4 == 2] <- 1
df2$q4[q4 == 4] <- 5
df2$q5[q5 == 2] <- 1
df2$q5[q5 == 4] <- 5
df2$q6[q6 == 2] <- 1
df2$q6[q6 == 4] <- 5
df2$q7[q7 == 2] <- 1
df2$q7[q7 == 4] <- 5
df2$q8[q8 == 2] <- 1
df2$q8[q8 == 4] <- 5
df2$q9[q9 == 2] <- 1
df2$q9[q9 == 4] <- 5
df2$q10[q10 == 2] <- 1
df2$q10[q10 == 4] <- 5
df2$q11[q11 == 2] <- 1
df2$q11[q11 == 4] <- 5
df2$q12[q12 == 2] <- 1
df2$q12[q12 == 4] <- 5
df2$q13[q13 == 2] <- 1
df2$q13[q13 == 4] <- 5

df2$agencyID[df2$agency_FID == 2] <- 10010
df2$agencyID[df2$agency_FID == 3] <- 10011
df2$agencyID[df2$agency_FID == 11] <- 10024
df2$agencyID[df2$agency_FID == 12] <- 10034
df2$agencyID[df2$agency_FID == 24] <- 10096

df2$program[agency_program_FID == 154 | agency_program_FID == 155 | agency_program_FID == 156 | agency_program_FID == 157 | agency_program_FID == 158 | agency_program_FID == 159 | agency_program_FID == 209] <- "Day Treatment"

df2$program[agency_program_FID == 	8	 |
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
df2$program[agency_program_FID == 	1	 |
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

df2$program[agency_program_FID == 	99 | agency_program_FID == 	112 | agency_program_FID == 	152 | agency_program_FID == 	185] <- "Independent Living"

df2$program[agency_program_FID == 	3	 |
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

df2$program[agency_program_FID == 	167	 |
              agency_program_FID == 	191	 |
              agency_program_FID == 	192	 |
              agency_program_FID == 	202	 |
              agency_program_FID == 	204] <- "Other"

df2$program[agency_program_FID == 	215	 |
              agency_program_FID == 	216	 |
              agency_program_FID == 	217	 |
              agency_program_FID == 	219	 |
              agency_program_FID == 	220] <- "Outpatient Mental Health"

df2$program[agency_program_FID == 	4	 |
              agency_program_FID == 	5	 |
              agency_program_FID == 	6	 |
              agency_program_FID == 	28	 |
              agency_program_FID == 	29	 |
              agency_program_FID == 	30	 |
              agency_program_FID == 	208	 |
              agency_program_FID == 	212	 |
              agency_program_FID == 	213	 |
              agency_program_FID == 	214] <- "Secure Residential Treatment"

df2$program[agency_program_FID == 	2	 |
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

detach(df2)

df2$program_loop <- paste(df2$agencyID, df2$program)


my.vars2 = c("q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10", "q11", "q12", "q13")

odp <- read.csv("Data/public_sat_survey.csv", na.strings = "NA")
names(odp)

odp$q18 <- factor(odp$q18, levels=c(1, 2, 3, 4, 5), labels=c("Caseworker", "Probation officer", "MR/DD Case Manager", "Therapist", "Other"))

my.data = subset(odp, survey_not_done == 0, )

#df3 = my.data[!duplicated(my.data[, c("client_FID", "placement_start", "placement_end")]), ]

df3 <- my.data[!(duplicated(my.data[c("client_FID","placement_start", "placement_end")]) | duplicated(my.data[c("client_FID","placement_start", "placement_end")], fromLast = TRUE)), ]

lev = c(1, 2, 3, 4, 5)
lab = c("Strongly Agree", "Somewhat Agree", "Neither Agree nor Disagree", "Somewhat Disagree", "Strongly Agree")


attach(df3)
df3$q1[q1 == 2] <- 1
df3$q1[q1 == 4] <- 5
df3$q2[q2 == 2] <- 1
df3$q2[q2 == 4] <- 5
df3$q3[q3 == 2] <- 1
df3$q3[q3 == 4] <- 5
df3$q4[q4 == 2] <- 1
df3$q4[q4 == 4] <- 5
df3$q5[q5 == 2] <- 1
df3$q5[q5 == 4] <- 5
df3$q6[q6 == 2] <- 1
df3$q6[q6 == 4] <- 5
df3$q7[q7 == 2] <- 1
df3$q7[q7 == 4] <- 5
df3$q8[q8 == 2] <- 1
df3$q8[q8 == 4] <- 5
df3$q9[q9 == 2] <- 1
df3$q9[q9 == 4] <- 5
df3$q10[q10 == 2] <- 1
df3$q10[q10 == 4] <- 5
df3$q11[q11 == 2] <- 1
df3$q11[q11 == 4] <- 5
df3$q12[q12 == 2] <- 1
df3$q12[q12 == 4] <- 5
df3$q13[q13 == 2] <- 1
df3$q13[q13 == 4] <- 5
df3$q14[q14 == 2] <- 1
df3$q14[q14 == 4] <- 5
df3$q15[q15 == 2] <- 1
df3$q15[q15 == 4] <- 5
df3$q16[q16 == 2] <- 1
df3$q16[q16 == 4] <- 5
df3$q17[q17 == 2] <- 1
df3$q17[q17 == 4] <- 5

df3$agencyID[df3$agency_FID == 2] <- 10010
df3$agencyID[df3$agency_FID == 3] <- 10011
df3$agencyID[df3$agency_FID == 11] <- 10024
df3$agencyID[df3$agency_FID == 12] <- 10034
df3$agencyID[df3$agency_FID == 24] <- 10096

df3$program[agency_program_FID == 154 | agency_program_FID == 155 | agency_program_FID == 156 | agency_program_FID == 157 | agency_program_FID == 158 | agency_program_FID == 159 | agency_program_FID == 209] <- "Day Treatment"

df3$program[agency_program_FID == 	8	 |
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
df3$program[agency_program_FID == 	1	 |
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

df3$program[agency_program_FID == 	99 | agency_program_FID == 	112 | agency_program_FID == 	152 | agency_program_FID == 	185] <- "Independent Living"

df3$program[agency_program_FID == 	3	 |
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

df3$program[agency_program_FID == 	167	 |
              agency_program_FID == 	191	 |
              agency_program_FID == 	192	 |
              agency_program_FID == 	202	 |
              agency_program_FID == 	204] <- "Other"

df3$program[agency_program_FID == 	215	 |
              agency_program_FID == 	216	 |
              agency_program_FID == 	217	 |
              agency_program_FID == 	219	 |
              agency_program_FID == 	220] <- "Outpatient Mental Health"

df3$program[agency_program_FID == 	4	 |
              agency_program_FID == 	5	 |
              agency_program_FID == 	6	 |
              agency_program_FID == 	28	 |
              agency_program_FID == 	29	 |
              agency_program_FID == 	30	 |
              agency_program_FID == 	208	 |
              agency_program_FID == 	212	 |
              agency_program_FID == 	213	 |
              agency_program_FID == 	214] <- "Secure Residential Treatment"

df3$program[agency_program_FID == 	2	 |
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

detach(df3)

df3$program_loop <- paste(df3$agencyID, df3$program)


my.vars3 = c("q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10", "q11", "q12", "q13", "q14", "q15", "q16", "q17")

program_loop <- c(unique(df$program_loop), unique(df2$program_loop), unique(df3$program_loop))
