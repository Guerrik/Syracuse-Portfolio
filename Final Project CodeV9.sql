--Drop Tables
IF OBJECT_ID('dbo.ApproveCDRStatus')  IS NOT NULL
	DROP PROCEDURE dbo.ApproveCDRStatus
IF OBJECT_ID('dbo.Mil_Operations')  IS NOT NULL
	DROP TABLE dbo.Mil_Operations
IF OBJECT_ID('dbo.Mil_IOOBJ_Task_XWalk')  IS NOT NULL
	DROP TABLE dbo.Mil_IOOBJ_Task_XWalk
IF OBJECT_ID('dbo.Mil_CDR_IO_OBJ_Xwalk')  IS NOT NULL
	DROP TABLE dbo.Mil_CDR_IO_OBJ_XWalk
IF OBJECT_ID('dbo.Mil_CDR_USG_XWalk')  IS NOT NULL
	DROP TABLE dbo.Mil_CDR_USG_XWalk
IF OBJECT_ID('dbo.Mil_TA_Grievances')  IS NOT NULL
	DROP TABLE dbo.Mil_TA_Grievances
IF OBJECT_ID('dbo.Mil_TA_Motivations')  IS NOT NULL
	DROP TABLE dbo.Mil_TA_Motivations
IF OBJECT_ID('dbo.Mil_TA_Beliefs')  IS NOT NULL
	DROP TABLE dbo.Mil_TA_Beliefs
IF OBJECT_ID('dbo.Mil_Unit_Skill')  IS NOT NULL
	DROP TABLE dbo.Mil_Unit_Skill
IF OBJECT_ID('dbo.Mil_IO_Task')  IS NOT NULL
	DROP TABLE dbo.MIL_IO_Task
IF OBJECT_ID('dbo.Mil_IO_OBJ')  IS NOT NULL
	DROP TABLE dbo.MIL_IO_OBJ
IF OBJECT_ID('dbo.Mil_CDR_OBJ')  IS NOT NULL
	DROP TABLE dbo.MIL_CDR_OBJ
IF OBJECT_ID('dbo.Mil_USG_OBJ')  IS NOT NULL
	DROP TABLE dbo.MIL_USG_OBJ
IF OBJECT_ID('dbo.Mil_Grievances')  IS NOT NULL
	DROP TABLE dbo.Mil_Grievances
IF OBJECT_ID('dbo.Mil_Motivations')  IS NOT NULL
	DROP TABLE dbo.Mil_Motivations
IF OBJECT_ID('dbo.Mil_Beliefs')  IS NOT NULL
	DROP TABLE dbo.Mil_Beliefs
IF OBJECT_ID('dbo.Mil_Target_Audience')  IS NOT NULL
	DROP TABLE dbo.Mil_Target_Audience
IF OBJECT_ID('dbo.Mil_Special_Skill')  IS NOT NULL
	DROP TABLE dbo.Mil_Special_Skill
IF OBJECT_ID('dbo.Mil_Implementing_Unit')  IS NOT NULL
	DROP TABLE dbo.Mil_Implementing_Unit
--Creating the Database Tables, respective columns and constraints
CREATE TABLE Mil_Implementing_Unit (
	Implementing_Unit_ID int identity
	,	Implementing_Unit_Name varchar(20) NOT NULL
	,	Implementing_Unit_Personnel int
	,	Implementing_Unit_Location varchar(30) 
	,	Implementing_Unit_Type varchar(50)
	, CONSTRAINT PK_Mil_Implementing_Unit PRIMARY KEY (Implementing_Unit_ID)
)

CREATE TABLE Mil_Special_Skill (
	Special_Skill_ID int identity
	,	Special_Skill_Text varchar(50) NOT NULL
	,	CONSTRAINT PK_Mil_Special_Skill PRIMARY KEY (Special_Skill_ID)
	,	CONSTRAINT U1_Mil_Special_Skill UNIQUE (Special_Skill_Text)	
)

--Test Newly Created Tables
SELECT * FROM dbo.Mil_Implementing_Unit
SELECT * FROM dbo.Mil_Special_Skill

--Continue to Create Tables
CREATE TABLE Mil_Target_Audience (
	Target_Audience_ID int identity
	,	Target_Audience_Name varchar(50) NOT NULL
	,	Target_Audience_Ethnicity varchar(50) NOT NULL
	,	Target_Audience_Type varchar(50)
	,	Target_Audience_Location varchar(50)
	,	CONSTRAINT PK_Mil_Target_Audience PRIMARY KEY (Target_Audience_ID)
	,	CONSTRAINT U1_Mil_Target_Audience UNIQUE (Target_Audience_Name)
)
CREATE TABLE Mil_Beliefs (
	Belief_ID int identity
	, Belief_Text varchar(50) NOT NULL
	, CONSTRAINT PK_Mil_Beliefs PRIMARY KEY (Belief_Id)
	, CONSTRAINT U1_Mil_Beliefs UNIQUE (Belief_Text)
)
CREATE TABLE Mil_Motivations (
	Motivation_ID int identity
	, Motivation_Text varchar(30) NOT NULL
	, CONSTRAINT PK_Mil_Motivations PRIMARY KEY (Motivation_Id)
	, CONSTRAINT U1_Mil_Motivations UNIQUE (Motivation_Text)
)
CREATE TABLE Mil_Grievances (
	Grievance_Id int identity
	, Grievance_Text varchar(30) NOT NULL
	, CONSTRAINT PK_Mil_Grievances PRIMARY KEY (Grievance_ID)
	, CONSTRAINT U1_Mil_Grievances UNIQUE (Grievance_Text)
)
CREATE TABLE Mil_USG_OBJ	(
	USG_OBJ_ID int identity
	, USG_OBJ_Name varchar (200) NOT NULL
	, USG_OBJ_Est datetime
	, USG_OBJ_Priority int
	, CONSTRAINT PK_Mil_USG_OBJ PRIMARY KEY (USG_OBJ_ID)
	, CONSTRAINT U1_Mil_USG_OBJ UNIQUE (USG_OBJ_Name)
)
CREATE TABLE Mil_CDR_OBJ	(
	CDR_OBJ_ID int identity
	, CDR_OBJ_Number int NOT NULL
	, CDR_OBJ_Name varchar (200) NOT NULL
	, CDR_OBJ_Est datetime
	, CDR_OBJ_Priority int
	, CDR_OBJ_Status varchar(30)
	, CONSTRAINT PK_Mil_CDR_OBJ PRIMARY KEY (CDR_OBJ_ID)
	, CONSTRAINT U1_Mil_CDR_OBJ UNIQUE (CDR_OBJ_Name)
	, CONSTRAINT U2_Mil_CDR_OBJ UNIQUE (CDR_OBJ_Number)
)
CREATE TABLE Mil_IO_OBJ	(
	IO_OBJ_ID int identity
	, IO_OBJ_Number int NOT NULL
	, IO_OBJ_Name varchar (200) NOT NULL
	, IO_OBJ_Est datetime
	, IO_OBJ_Priority int
	, IO_OBJ_Status varchar(30)
	, IO_OBJ_Approval varchar(30)
	, CONSTRAINT PK_Mil_IO_OBJ PRIMARY KEY (IO_OBJ_ID)
	, CONSTRAINT U1_Mil_IO_OBJ UNIQUE (IO_OBJ_Name)
	, CONSTRAINT U2_Mil_IO_OBJ UNIQUE (IO_OBJ_Number)
)
CREATE TABLE Mil_IO_Task	(
	IO_Task_ID int identity
	, IO_Task_Name varchar(200) NOT NULL
	, IO_Task_Type varchar(30)
	, IO_Task_Description varchar(200)
	, CONSTRAINT PK_Mil_IO_Task PRIMARY KEY (IO_Task_Id)
	, CONSTRAINT U1_Mil_IO_Task UNIQUE (IO_Task_Name)
)

--Begin to import data into created tables, starting with Implementing Unit
INSERT INTO Mil_Implementing_Unit(Implementing_Unit_Name, Implementing_Unit_Personnel,
Implementing_Unit_Location, Implementing_Unit_Type)
VALUES	('CAT495', '4', 'Fort Bragg', 'Civil Affairs')
	,	('CAT577', '4', 'Fort Bragg', 'Civil Affairs')
	,	('CAT599', '4', 'Fort Bragg', 'Civil Affairs')
	,	('CAT994', '3', 'Fort Campbell', 'Civil Affairs')
	,	('CAT471', '3', 'Fort Campbell', 'Civil Affairs')

--Ensure our INSERT STATEMENT was executed Correctly
SELECT * FROM Mil_Implementing_Unit --Works

--Execute conditional Select on same table
SELECT * FROM Mil_Implementing_Unit
WHERE Implementing_Unit_Personnel >3 -- Works. all values are > 3 personnel

--Select Statement to determine how many units are located at each base.
SELECT Count(Implementing_Unit_Name) AS NumberofUnits, Implementing_Unit_Location AS BaseName
FROM Mil_Implementing_Unit
GROUP BY Implementing_Unit_Location
--Returns each Base with Number of Units at that Base

--Try Same SELECT with a HAVING
SELECT Count(Implementing_Unit_Name) AS NumberofUnits, Implementing_Unit_Location AS BaseName
FROM Mil_Implementing_Unit
GROUP BY Implementing_Unit_Location
HAVING COUNT(Implementing_Unit_Name) >2
--Returns each base with number of units > 3 currently stationed there

--Continuing one with inserting 5 rows for each of the already greated tables.  The rest will be imported from excel
--Altering the Mil_Special_Skill table to include another column for "Special Skill Description"
ALTER TABLE Mil_Special_Skill
ADD Special_Skill_Description varchar(200) 
--Checking table
SELECT * FROM Mil_Special_Skill

INSERT INTO Mil_Special_Skill(Special_Skill_Text, Special_Skill_Description)
VALUES	('Advanced Negotiation', 'Dealmaking and leverage')
	,	('Counter-Surveillance', 'Tracking Avoidance')
	,	('Advanced Language', 'In-depth Target Language Training')
	,	('Joint Operational Planning', 'Strategic Planning')
	,	('Network Development', 'Utilization of Organic Human Networks')

--Ensure Insert Worked Properly
SELECT * FROM Mil_Special_Skill --all inserts worked properly

--Continuing on with this table because there are only 12 rows
INSERT INTO Mil_Special_Skill(Special_Skill_Text, Special_Skill_Description)
VALUES	('Humanitarian Operations', 'Interagency Disaster Response')
	,	('Strategic Communications', 'Strategic Messaging')
	,	('Conflict Mediation', 'Ensuring Compromise')
	,	('Social Media Data Mining', 'Social Media Analysis')
	,	('Special Technical Operations', 'Technical Operations')
	,	('Inform and Influence', 'How To Win Friends and Influence People')
	,	('Cultural Competence,', 'Cross-Culture Interaction')

SELECT * FROM Mil_Special_Skill -- Table Complete

--Next Table, Target Audience (5 Rows Only)
SELECT * FROM Mil_Target_Audience --Ensure we have the correct columns for the insert, Rest will be inserted from Excel

INSERT INTO Mil_Target_Audience
VALUES	('AZE Group 1', 'Azerbaijani', 'Religious', 'Baku')
	,	('AZE Group 2', 'Azerbaijani', 'Service', 'Baku')
	,	('AZE Group 3', 'Azerbaijani', 'Cultural', 'Sheki')
	,	('AZE Group 4', 'Azerbaijani', 'Patrioritc', 'Sheki')
	,	('EST Group 1', 'Estonian', 'Religious', 'Tallinn')



--Next Table, Beliefs all rows, including altering table to include Belief Description
ALTER TABLE Mil_Beliefs
ADD Belief_Description varchar (200)
SELECT * FROM Mil_Beliefs
INSERT INTO Mil_Beliefs
VALUES	('Anarchism', 'Abolition of all government')
	,	('Fascism', 'Authoritarian Ultra-Nationalism')
	,	('Environmentalism', 'Protection of the Environment')
	,	('Liberalism', 'Freedom of the Individual')
	,	('NeoLiberalism', 'Economic Liberalism')
	,	('Conservatism', 'Traditional Social Institutions')
	,	('NeoConservatism', 'Interventionism in International Affairs')
	,	('Socialism', 'Public Ownership')
	,	('Nationalism', 'National Sovereignty')

--Next Table, motivations, all entries
SELECT * FROM Mil_Motivations
INSERT INTO Mil_Motivations
VALUES	('Financial')
	,	('Political')
	,	('Ideological')
	,	('Religious')
	,	('Preservational')
	,	('Reputational')
	,	('Vengeful')

--Next Table, Mil_Grievances all values
SELECT * From Mil_Grievances
INSERT INTO Mil_Grievances
VALUES	('Persecution')
	,	('Violence')
	,	('Oppression')
	,	('Exclusion')
	,	('Racism')
	,	('Economic')
	,	('Corruption')
	,	('Elitism')
	,	('Unemployment')
	,	('Capacity Deficit')
--Check
SELECT * From Mil_Grievances
ORDER BY Grievance_Id ASC

--Insert into USG OBJs, all values
SELECT * FROM Mil_USG_OBJ
INSERT INTO Mil_USG_OBJ
VALUES	('Strengthen Alliances and Partnerships', '1/25/2019', '3') --checking 
SELECT* FROM Mil_USG_OBJ
--Continuing with insert
INSERT INTO Mil_USG_OBJ
VALUES	('Deter Adversaries', '1/25/2019', '2')
	,	('Set Conditions for Future Operations', '2/24/2019', '5')
	,	('Stabilization and Development', '2/24/2019', '6')
	,	('Bolster Partners Against Coercion', '1/25/2019', '4')
	,	('Prevent Attacks Against the US Homeland', '2/24/2019', '1')
SELECT * FROM Mil_USG_OBJ
ORDER BY USG_OBJ_Priority ASC

--Continuing with Mil_CDR_OBJ, all values
SELECT * FROM Mil_CDR_OBJ
INSERT INTO Mil_CDR_OBJ
VALUES	('1', 'Training and Preparing Full Spectrum Capable Forces', '2/15/2019', '4', 'Ongoing')
	,	('2', 'Strengthening Alliances and Building Partner Military Capacity', '4/14/2019', '5', 'Ongoing')
	,	('3', 'Providing Support to Other Government Services', '5/30/2019', '8', 'Ongoing')
	,	('4', 'Detering Adversary Aggression', '2/15/2019', '2', 'Ongoing')
	,	('5', 'Informing and Influencing External Audiences', '4/14/2019', '7', 'Ongoing')
	,	('6', 'Supporting Partner Nation Governance Capabilities', '4/14/2019', '6', 'Ongoing')
	,	('7', 'Minimizing Negative Effects of Non-State Actors', '7/5/2019', '12', 'Suspended')
	,	('8', 'Increasing Regional Capacity to Respond to Natural Disasters', '6/15/2019', '9', 'Ongoing')
	,	('9', 'Developing Resilient Logistical and Human Networks', '6/15/2019', '10', 'Ongoing')
	,	('10', 'Infrastructure Development', '6/15/2019', '11', 'Suspended')
	,	('11', 'Enhanced NATO Interoperability', '2/15/2019', '3', 'Ongoing')
	,	('12', 'Prevent Attacks Against the US Homeland', '2/15/2019', '1', 'Ongoing')
--Checking Inserts
Select * FROM Mil_CDR_OBJ
ORDER BY CDR_OBJ_Priority ASC

--The Commander has decided to approve Infrastructure Development
UPDATE Mil_CDR_OBJ
SET CDR_OBJ_Status = 'Ongoing'
WHERE CDR_OBJ_Name = 'Infrastructure Development'
SELECT * FROM Mil_CDR_OBJ
WHERE CDR_OBJ_Name = 'Infrastructure Development'

--Creating a procedure to update Mil_CDR_OBJ.CDR_OBJ_Status from Suspended to Ongoing

GO
CREATE PROCEDURE ApproveCDRStatus (@CDR_OBJ_ID int)
AS 
BEGIN
	UPDATE Mil_CDR_OBJ SET CDR_OBJ_Status = 'Ongoing'
	WHERE Mil_CDR_OBJ.CDR_OBJ_ID = @CDR_OBJ_ID
END 
GO

--Testing the update procedure
EXEC ApproveCDRStatus '7'
SELECT * FROM Mil_CDR_OBJ 



--Continuing with Mil_IO_OBJ, we have imported 21 rows from excel.
SELECT * FROM Mil_IO_OBJ --shows 21 rows
ORDER BY IO_OBJ_Priority ASC

--Importing the IO TASK TABLE FROM EXCEL, too many rows for manual import
SELECT * FROM Mil_IO_Task --Returns 42 tasks with NULL DESCRIP (not yet entered, anyway)

--Creating the table Mil_Unit_Skill which will associate implementing units with their special tables
CREATE TABLE Mil_Unit_Skill	(
	Unit_Special_Skill_ID int identity
	,	Implementing_Unit_ID int NOT NULL
	,	Special_Skill_ID int NOT NULL
	,	Implementing_Unit_Name varchar(200)
	,	Special_Skill_Text varchar(200)
	,	CONSTRAINT PK_Mil_Unit_Skill PRIMARY KEY (Unit_Special_Skill_ID)
	,	CONSTRAINT FK1_Mil_Unit_Skill FOREIGN KEY (Implementing_Unit_ID) REFERENCES 
Mil_Implementing_Unit(Implementing_Unit_ID)
	,	CONSTRAINT FK2_Mil_Unit_Skill FOREIGN KEY (Special_Skill_Id) REFERENCES
Mil_Special_Skill(Special_Skill_ID)
)

SELECT * From Mil_Unit_Skill --check
--Insert into Mil_Unit_Skill based on FK

INSERT INTO Mil_Unit_Skill (Implementing_Unit_ID, Special_Skill_ID, Implementing_Unit_Name, Special_Skill_Text)
VALUES	('1', '1', (SELECT Implementing_Unit_Name FROM Mil_Implementing_Unit WHERE Implementing_Unit_ID = '1'), (SELECT
Special_Skill_Text FROM Mil_Special_Skill WHERE Special_Skill_ID = '1'))

--Altering table to include unique composite
ALTER TABLE Mil_Unit_Skill
ADD CONSTRAINT U1_Mil_Unit_Skill UNIQUE (Implementing_Unit_ID, Special_Skill_ID)

--Create procedure to insert
GO
CREATE PROCEDURE Mil_Insert_Skills(@Implementing_Unit_ID int, @Special_Skill_ID int)
AS
BEGIN
	INSERT INTO Mil_Unit_Skill (Implementing_Unit_Id, Special_Skill_ID, Implementing_Unit_Name, Special_Skill_Text)
	VALUES (@Implementing_Unit_ID
	,	@Special_Skill_ID
	,	(SELECT Implementing_Unit_Name FROM Mil_Implementing_Unit WHERE Implementing_Unit_ID = @Implementing_Unit_ID)
	,	(SELECT Special_Skill_Text FROM Mil_Special_Skill WHERE Special_Skill_ID = @Special_Skill_ID))
END
GO

EXECUTE Mil_Insert_Skills @implementing_Unit_Id = 1, @special_Skill_ID = 2 --Testing Procedure
SELECT * From Mil_Unit_Skill --Returned 1 row

--Continuing with inserts for this table
INSERT INTO Mil_Unit_Skill (Implementing_Unit_ID, Special_Skill_ID)
VALUES	('1', '4'), ('1', '5'), ('1', '12'), ('2','1'), ('2', '9'), ('2', '12'), ('3', '1'), ('3', '3')

--This will bring over the Implementing Unit Names from Mil_Implementing_Unit
UPDATE Mil_Unit_Skill 
	SET Implementing_Unit_Name = Mil_Implementing_Unit.Implementing_Unit_Name
	FROM Mil_Unit_Skill
INNER JOIN Mil_Implementing_Unit on Mil_implementing_Unit.Implementing_Unit_ID = Mil_Unit_Skill.Implementing_Unit_ID
WHERE Mil_Implementing_Unit.Implementing_Unit_ID = Mil_Unit_Skill.Implementing_Unit_ID

SELECT * FROM Mil_Unit_Skill

--This will bring over the Special Skill text from Mil_Special_Skill
UPDATE Mil_Unit_Skill 
	SET Special_Skill_Text = Mil_Special_Skill.Special_Skill_Text
	FROM Mil_Unit_Skill
RIGHT JOIN Mil_Special_Skill on Mil_Special_Skill.Special_Skill_ID = Mil_Unit_Skill.Special_Skill_ID
WHERE Mil_Special_Skill.Special_Skill_Id = Mil_Unit_Skill.Special_Skill_Id

SELECT * FROM Mil_Unit_Skill

--Continuing with inserts for this table
INSERT INTO Mil_Unit_Skill (Implementing_Unit_ID, Special_Skill_ID)
VALUES	('3', '4'), ('3', '6'), ('3', '7'), ('4', '1'), ('4', '3'), ('4', '12')

--Rest of Implementing Unit has been pulled from excel

--Excel Insert failed, continuing with the rest of the data manually
INSERT INTO Mil_Unit_Skill (Implementing_Unit_ID, Special_Skill_ID)
VALUES ('5', '1'), ('5', '6'), ('5', '8'), ('5', '9'), ('7', '9'), ('8', '9'), ('8', '10'),
('9', '9'), ('9', '11'), ('10', '3'), ('10', '9'), ('10', '10'), ('10', '11'), ('11', '9'),
('11', '10'), ('11', '11'), ('11', '12'), ('12', '9'), ('13', '3'), ('13', '5'), ('13', '7'),
('13', '9'), ('13', '10'), ('13', '11'), ('13', '12'), ('14', '3'), ('14', '9'), ('14', '10'),
('14', '11'), ('14', '12'), ('15', '2'), ('15', '9'), ('15', '10'), ('15', '11'), ('16', '3'),
('16', '4'), ('16', '5'), ('16', '7'), ('16', '9'), ('16', '11'), ('16', '12'), ('17', '2'),
('17', '3'), ('17', '4'), ('17', '5'), ('17', '7'), ('17', '9'), ('17', '11'), ('17', '12'),
('18', '3'), ('18', '4'), ('18', '5'), ('18', '9'), ('18', '11'), ('19', '2'),
('19', '3'), ('19', '7'), ('19', '11'), ('18', '7'), ('20', '1'), ('20', '2'), ('20', '3'),
('20', '4'), ('20', '5'), ('20', '7'), ('20', '11'), ('21', '3'), ('21', '4'),
('21', '5'), ('21', '7'), ('21', '11'), ('21', '12'), ('22', '1'), ('22', '3'), ('22', '7'),
('22', '11'), ('22', '12'), ('23', '7'), ('23', '11'), ('24', '1'), ('24', '3'), ('24', '7'),
('24', '11'), ('24', '12'), ('25', '2'), ('25', '3'), ('25', '5'), ('26', '2'), ('26', '3'),
('26', '5'), ('26', '10'), ('26', '11'), ('27', '2'), ('27', '3'), ('27', '5'), ('27', '10'),
('27', '11'), ('28', '2'), ('28', '3'), ('28', '5'), ('28', '10'), ('29', '1'), ('29', '2'),
('29', '3'), ('29', '5'), ('29', '10'), ('29', '11'), ('29', '12'), ('30', '2'), ('30', '3'),
('30', '5'), ('30', '10'), ('30', '11'), ('30', '12'), ('31', '2'), ('31', '3'), ('31', '5'),
('32', '1'), ('32', '2'), ('32', '3'), ('32', '5'), ('32', '10'), ('32', '11'), ('32', '12')

--This will bring over the Implementing Unit Names from Mil_Implementing_Unit
UPDATE Mil_Unit_Skill 
	SET Implementing_Unit_Name = Mil_Implementing_Unit.Implementing_Unit_Name
	FROM Mil_Unit_Skill
INNER JOIN Mil_Implementing_Unit on Mil_implementing_Unit.Implementing_Unit_ID = Mil_Unit_Skill.Implementing_Unit_ID
WHERE Mil_Implementing_Unit.Implementing_Unit_ID = Mil_Unit_Skill.Implementing_Unit_ID

SELECT * FROM Mil_Unit_Skill

--This will bring over the Special Skill text from Mil_Special_Skill
UPDATE Mil_Unit_Skill 
	SET Special_Skill_Text = Mil_Special_Skill.Special_Skill_Text
	FROM Mil_Unit_Skill
RIGHT JOIN Mil_Special_Skill on Mil_Special_Skill.Special_Skill_ID = Mil_Unit_Skill.Special_Skill_ID
WHERE Mil_Special_Skill.Special_Skill_Id = Mil_Unit_Skill.Special_Skill_Id

SELECT * FROM Mil_Unit_Skill	--Check
WHERE Implementing_Unit_ID = 15
SELECT * FROM Mil_Implementing_Unit	--Check

--Create 3 Target audience tables which incorporate beliefs, motivations and grievances

CREATE TABLE Mil_TA_Beliefs	(
	TA_Belief_ID int identity
	,	Target_Audience_ID int NOT NULL
	,	Belief_ID int NOT NULL
	,	Belief_Text varchar(50)
	,	Target_Audience_Text varchar(50)
	,	CONSTRAINT PK_Mil_TA_Beliefs PRIMARY KEY(TA_Belief_ID)
	,	CONSTRAINT FK1_Mil_TA_Beliefs FOREIGN KEY(Target_Audience_ID) REFERENCES
Mil_Target_Audience(Target_Audience_ID) 
	,	CONSTRAINT FK2_Mil_TA_Beliefs FOREIGN KEY (Belief_ID) REFERENCES
Mil_Beliefs(Belief_ID)
)

--Inserting all rows into the Mil_TA_Beliefs table and we will then update the table with
--belief and audience text with an update

--checking first to ensure we have the correct values in the target audience table
SELECT * FROM Mil_Target_Audience


INSERT INTO Mil_TA_Beliefs(Target_Audience_ID, Belief_ID)
VALUES	('1','1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '6'), ('6', '7'), ('7', '8'), ('8', '9'),
('9','2'), ('10', '4'), ('11', '5'), ('12', '8'), ('13', '3'), ('14', '6'), ('15', '4'), ('16', '1'),
('17','6'), ('18', '4'), ('19', '3'), ('20', '2'), ('21', '1'), ('22', '2'), ('23', '3'), ('24', '4'),
('25','6'), ('26', '2')

SELECT * FROM Mil_TA_Beliefs

--updating Mil_TA_Beliefs to include belief text from Mil_Beliefs
UPDATE Mil_TA_Beliefs
SET Belief_Text = Mil_Beliefs.Belief_Text
FROM Mil_TA_Beliefs
RIGHT JOIN Mil_Beliefs ON Mil_Beliefs.Belief_ID = Mil_TA_Beliefs.Belief_ID
WHERE Mil_Beliefs.Belief_ID = Mil_TA_Beliefs.Belief_ID

SELECT * FROM Mil_Target_Audience

SELECT * FROM Mil_TA_Beliefs
WHERE Belief_Text = 'Conservatism' -- works, returns 4 rows with belief_text set to conservatism

--updating Mil_TA_Beliefs to include target_audience_text from mil_target_Audience
UPDATE Mil_TA_Beliefs
SET Target_Audience_Text = Mil_Target_Audience.Target_Audience_Name
FROM Mil_TA_Beliefs
RIGHT JOIN Mil_Target_Audience ON Mil_Target_Audience.Target_Audience_Id = Mil_TA_Beliefs.Target_Audience_ID
WHERE Mil_Target_Audience.Target_Audience_ID = Mil_TA_Beliefs.Target_Audience_ID

--Try a join to select the city (location from Mil_Target_Audience) with the option to filter by city name
Select Mil_TA_Beliefs.Target_Audience_Text AS AudienceName, Mil_Target_Audience.Target_Audience_Location AS City
FROM Mil_TA_Beliefs
RIGHT JOIN Mil_Target_Audience ON Mil_TA_Beliefs.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
WHERE Mil_Target_Audience.Target_Audience_Location = 'Baku' 
--The above returns two columns and values with the WHERE CLAUSE, otherwise all values

--Going to Create a table called Mil_TA_Motivations, we will insert 5 rows and then import the rest from excel
CREATE TABLE Mil_TA_Motivations	(
	Mil_TA_Motivations_ID int identity
	,	Target_Audience_ID int NOT NULL
	,	Motivation_ID int NOT NULL
	,	Motivation_Text varchar(30)
	,	CONSTRAINT PK_Mil_TA_Motivations PRIMARY KEY (Mil_TA_Motivations_ID)
	,	CONSTRAINT FK1_Mil_TA_Motivations FOREIGN KEY (Target_Audience_ID) REFERENCES
Mil_Target_Audience(Target_Audience_ID)
	,	CONSTRAINT FK2_Mil_TA_Motivations FOREIGN KEY (Motivation_ID) REFERENCES
Mil_Motivations(Motivation_ID)
)


INSERT INTO Mil_TA_Motivations (Target_Audience_ID, Motivation_ID)
VALUES ('1', '1'), ('1', '2'), ('1', '4'), ('2', '2'), ('2', '3') -- 5 rows added, motivation text is still null, exporting rest from excel

--Import error, checking - Had to delete blank row somewhere in XL

--updating motivation texts
UPDATE Mil_TA_Motivations 
SET Motivation_Text = Mil_Motivations.Motivation_Text
FROM Mil_TA_Motivations
RIGHT JOIN MIl_Motivations on Mil_TA_Motivations.Motivation_ID = Mil_Motivations.Motivation_ID
WHERE Mil_TA_Motivations.Motivation_ID = Mil_Motivations.Motivation_ID

SELECT * FROM Mil_TA_Motivations
SELECT * FROM Mil_Target_Audience

--Trying some select statements to show which Target Audiences have which motivations
SELECT Mil_Target_audience.Target_Audience_Name AS TargetAudience, Motivation_Text as Motivations, Mil_Target_Audience.Target_Audience_Location AS Loc
-- did not return what we wanted, so we delete.  (SELECT Count (Target_Audience_Location) FROM Mil_Target_Audience WHERE Target_Audience_Location = 'Baku')
FROM Mil_TA_Motivations
RIGHT JOIN Mil_Target_Audience ON Mil_Target_Audience.Target_Audience_ID = Mil_TA_Motivations.Target_Audience_ID
Where Motivation_Text = 'Financial'


--Creating and importing Mil_TA_grievance table
CREATE TABLE Mil_TA_Grievances	(
	TA_Grievance_ID int identity
	,	Target_Audience_ID int NOT NULL
	,	Grievance_ID int NOT NULL
	,	Grievance_Text varchar(30)
	,	CONSTRAINT PK_Mil_TA_Grievances PRIMARY KEY (TA_Grievance_ID)
	,	CONSTRAINT FK1_Mil_TA_Grievances FOREIGN KEY (Target_audience_ID)
REFERENCES Mil_Target_Audience(Target_Audience_ID)
	,	CONSTRAINT FK2_Mil_TA_Grievances FOREIGN KEY (Grievance_ID)
REFERENCES Mil_Grievances(Grievance_ID)	
)

--Importing values via excel
SELECT * FROM Mil_TA_Grievances
SELECT * FROM Mil_Target_Audience

--Import grieveances text based on Mil_Grievance table.
UPDATE Mil_TA_Grievances
SET Grievance_Text = Mil_Grievances.Grievance_Text
FROM Mil_TA_Grievances
RIGHT JOIN Mil_Grievances ON Mil_TA_Grievances.Grievance_ID = Mil_Grievances.Grievance_Id
WHERE Mil_TA_Grievances.Grievance_ID = Mil_Grievances.Grievance_Id

--See what kind of join we can do with this newly created table,
SELECT Mil_Target_Audience.Target_Audience_Name AS Audience, Mil_TA_Grievances.Grievance_Text as Grievances, Mil_Target_Audience.Target_Audience_Location AS city, Mil_TA_Motivations.Motivation_Text 
FROM Mil_TA_Grievances
RIGHT JOIN Mil_Target_Audience ON Mil_TA_Grievances.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_TA_Motivations ON Mil_TA_Motivations.Target_Audience_ID = Mil_TA_Grievances.Target_Audience_ID
WHERE Motivation_Text = 'vengeful' --optional

CREATE TABLE Mil_CDR_USG_XWalk	(
	USG_CDR_OBJ_ID int identity
	,	USG_OBJ_ID int NOT NULL
	,	CDR_OBJ_ID int NOT NULL
	,	USG_OBJ_Name varchar(200)
	,	CDR_OBJ_Name varchar(200)
	,	USG_CDR_Ver_Date datetime
	,	USG_CDR_SPT_Ind int
	,	CONSTRAINT PK_Mil_CDR_USG_XWalk PRIMARY KEY (USG_CDR_OBJ_ID)
	,	CONSTRAINT FK1_Mil_CDR_USG_XWalk FOREIGN KEY (USG_OBJ_ID)
REFERENCES Mil_USG_OBJ(USG_OBJ_ID)
	,	CONSTRAINT FK2_Mil_CDR_USG_XWalk FOREIGN KEY (CDR_OBJ_ID)
REFERENCES Mil_CDR_OBJ(CDR_OBJ_ID)
	,	CONSTRAINT U1_Mil_CDR_USG_Xwalk UNIQUE (USG_OBJ_ID, CDR_OBJ_ID)
)

--Checking the blank table
SELECT * FROM Mil_CDR_USG_XWalk

--Inserting from Xl USG OBJ ID, CDR OBJ ID, Verification Date and Supportability index 42 rows

--Updating the Mil_USG_CDR_Xwalk table to include USG_OBJ_Names and CDR_OBJ_Names

UPDATE Mil_CDR_USG_XWalk
SET USG_OBJ_Name = Mil_USG_OBJ.USG_OBJ_Name
FROM Mil_CDR_USG_XWalk
RIGHT JOIN Mil_USG_OBJ ON Mil_CDR_USG_XWalk.USG_OBJ_ID = Mil_USG_OBJ.USG_OBJ_ID
WHERE Mil_CDR_USG_XWalk.USG_OBJ_ID = Mil_USG_OBJ.USG_OBJ_ID

UPDATE Mil_CDR_USG_XWalk
SET CDR_OBJ_Name = Mil_CDR_OBJ.CDR_OBJ_Name
FROM Mil_CDR_USG_XWalk
RIGHT JOIN Mil_CDR_OBJ ON Mil_CDR_USG_XWalk.CDR_OBJ_ID = Mil_CDR_OBJ.CDR_OBJ_ID
WHERE Mil_CDR_USG_XWalk.CDR_OBJ_ID = Mil_CDR_OBJ.CDR_OBJ_ID

--check
SELECT * FROM Mil_CDR_USG_XWalk
WHERE Mil_CDR_USG_XWalk.USG_OBJ_ID = '6'
ORDER BY USG_CDR_SPT_Ind DESC

--Create Mil_USG_IO_OBJ_XWalk table
CREATE TABLE Mil_CDR_IO_OBJ_XWalk	(
	CDR_IO_OBJ int identity
	,	CDR_OBJ_ID int not null
	,	IO_OBJ_ID int not null
	,	CDR_OBJ_Name varchar(200)
	,	IO_OBJ_Name varchar(200)
	,	CDR_IO_Ver_Date datetime
	,	CDR_IO_Spt_Ind int
	,	CONSTRAINT PK_Mil_CDR_IO_OBJ_XWalk PRIMARY KEY (CDR_IO_OBJ)
	,	CONSTRAINT FK1_Mil_CDR_IO_OBJ_XWalk FOREIGN KEY (CDR_OBJ_ID)
REFERENCES Mil_CDR_OBJ(CDR_OBJ_ID)
	,	CONSTRAINT FK2_Mil_CDR_IO_OBJ_XWalk	FOREIGN KEY (IO_OBJ_ID)
REFERENCES Mil_IO_OBJ(IO_OBJ_ID)
	,	CONSTRAINT U1_Mil_CDR_IO_OBJ_XWalk UNIQUE (CDR_OBJ_ID, IO_OBJ_ID)
)

--Excel values insert for Mil_CDR_IO_OBJ_XWalk
SELECT * FROM Mil_CDR_IO_OBJ_XWalk

--Updates on CDR_OBJ_Name and IO_OBJ_Name
UPDATE Mil_CDR_IO_OBJ_XWalk
SET CDR_OBJ_Name = Mil_CDR_OBJ.CDR_OBJ_Name
FROM Mil_CDR_IO_OBJ_XWalk
RIGHT JOIN Mil_CDR_OBJ on Mil_CDR_IO_OBJ_XWalk.CDR_OBJ_ID = Mil_CDR_OBJ.CDR_OBJ_ID
WHERE Mil_CDR_IO_OBJ_XWalk.CDR_OBJ_ID = Mil_CDR_OBJ.CDR_OBJ_ID

UPDATE Mil_CDR_IO_OBJ_XWalk
SET IO_OBJ_Name = Mil_IO_OBJ.IO_OBJ_Name
FROM Mil_CDR_IO_OBJ_XWalk
RIGHT JOIN Mil_IO_OBJ ON Mil_CDR_IO_OBJ_XWalk.IO_OBJ_ID = Mil_IO_OBJ.IO_OBJ_ID
WHERE Mil_CDR_IO_OBJ_XWalk.IO_OBJ_ID = Mil_IO_OBJ.IO_OBJ_ID

--Create Table Mil_IOOBJ_Task_XWalk
CREATE TABLE Mil_IOOBJ_Task_XWalk	(
	IOOBJ_Task_ID int identity
	,	IO_OBJ_ID int
	,	IO_Task_ID int
	,	IO_OBJ_Name varchar(200)
	,	IO_Task_Name varchar(200)
	,	OBJ_Task_Ver_Date	datetime
	,	CONSTRAINT PK_Mil_IOOBJ_Task_XWalk PRIMARY KEY (IOOBJ_Task_ID)
	,	CONSTRAINT FK1_Mil_IOOBJ_Task_XWalk FOREIGN KEY	(IO_OBJ_ID)
REFERENCES Mil_IO_OBJ(IO_OBJ_ID)
	,	CONSTRAINT FK2_Mil_IOOBJ_Task_XWalk FOREIGN KEY (IO_Task_ID)
REFERENCES Mil_IO_Task(IO_Task_ID)
	,	CONSTRAINT U1_Mil_IOOBJ_Task_Xwalk Unique (IO_OBJ_ID, IO_Task_ID)
)

SELECT * FROM Mil_IOOBJ_Task_XWalk --Checking columns

--Inserting From XL, then adding the IO OBJ Name and IO Task Name

SELECT * FROM Mil_IOOBJ_Task_XWalk

UPDATE Mil_IOOBJ_Task_XWalk
SET IO_OBJ_Name = Mil_IO_OBJ.IO_OBJ_Name
FROM Mil_IOOBJ_Task_XWalk
RIGHT JOIN Mil_IO_OBJ on Mil_IOOBJ_Task_XWalk.IO_OBJ_ID = Mil_IO_OBJ.IO_OBJ_ID
WHERE Mil_IOOBJ_Task_XWalk.IO_OBJ_ID = Mil_IO_OBJ.IO_OBJ_ID

UPDATE Mil_IOOBJ_Task_XWalk
SET IO_Task_Name = Mil_IO_Task.IO_Task_Name
FROM Mil_IOOBJ_Task_XWalk
RIGHT JOIN Mil_IO_Task on Mil_IOOBJ_Task_XWalk.IO_Task_ID = Mil_IO_Task.IO_Task_ID
WHERE Mil_IOOBJ_Task_XWalk.IO_Task_ID = Mil_IO_Task.IO_Task_ID

--If commander wanted to know how many of the supporting tasks were targeting his #1 IO priority, he could have his DBA pull the following:
Select Mil_IOOBJ_Task_XWalk.IO_OBJ_Name AS IO_Objective, IO_Task_Name as SupportingTask, Mil_IO_OBJ.IO_OBJ_Priority as IO_Priority_Number
FROM Mil_IOOBJ_Task_XWalk
RIGHT JOIN Mil_IO_OBJ on Mil_IOOBJ_Task_XWalk.IO_OBJ_ID = Mil_IO_OBJ.IO_OBJ_ID
ORDER BY Mil_IO_OBJ.IO_OBJ_Priority

SELECT * FROM Mil_IOOBJ_Task_XWalk
SELECT * FROM Mil_IO_OBJ
--try a count
Select Mil_IOOBJ_Task_XWalk.IO_OBJ_Name AS IO_Objective, count (IO_Task_Name) as SupportingTask--, Mil_IO_OBJ.IO_OBJ_Priority as IO_Priority_Number
FROM Mil_IOOBJ_Task_XWalk
RIGHT JOIN Mil_IO_OBJ on Mil_IOOBJ_Task_XWalk.IO_OBJ_ID = Mil_IO_OBJ.IO_OBJ_ID
GROUP BY Mil_IOOBJ_Task_XWalk.IO_OBJ_Name
--ORDER BY Mil_IO_OBJ.IO_OBJ_Priority

--A commander is interesting in knowing how many Supporting IO_tasks are targeting his #1 priority
Select Mil_IOOBJ_Task_XWalk.IO_OBJ_Name AS IO_Objective, (IO_Task_Name) as SupportingTask, Mil_IO_OBJ.IO_OBJ_Priority as IO_Priority_Number
FROM Mil_IOOBJ_Task_XWalk
RIGHT JOIN Mil_IO_OBJ on Mil_IOOBJ_Task_XWalk.IO_OBJ_ID = Mil_IO_OBJ.IO_OBJ_ID
WHERE Mil_IO_OBJ.IO_OBJ_Priority = '1'

--There are 21 tasks targeting the #1 IO Priority, of 42 total IO_Tasks
Select * FROM Mil_IO_Task
SELECT * FROM Mil_IO_OBJ
Order BY IO_OBJ_Priority

--Creating the Operations Table
CREATE TABLE MIl_Operations	(
	Operation_ID int Identity
	,	Implementing_Unit_ID int not null
	,	Target_Audience_ID int not null
	,	IO_Task_ID int not null
	,	Implementing_Unit_Name varchar(30)
	,	Target_Audience_Name varchar(30)
	,	IO_Task_Name varchar(200)
	,	Date_Begin datetime
	,	Date_Complete datetime
	,	Opn_Result varchar(30)
	,	Opn_Effect int
	,	Opn_Rec	varchar(30)
	,	CONSTRAINT PK_Mil_Operations PRIMARY KEY (Operation_ID)
	,	CONSTRAINT FK1_Mil_Operations FOREIGN KEY (Implementing_Unit_ID)
REFERENCES Mil_Implementing_Unit(Implementing_Unit_ID)
	,	CONSTRAINT FK2_Mil_Operatoins FOREIGN KEY (Target_Audience_ID)
REFERENCES Mil_Target_Audience(Target_Audience_ID)
	,	CONSTRAINT FK3_Mil_Operations FOREIGN KEY (IO_Task_ID)
REFERENCES Mil_IO_Task(IO_Task_ID)
)

--Inserting all foreign keys into Mil_Operations via XL
SELECT * FROM MIl_Operations
SELECT * FROM Mil_IOOBJ_Task_XWalk
--Update the FK values 
UPDATE MIl_Operations
SET Implementing_Unit_Name = Mil_Implementing_Unit.Implementing_Unit_Name
	,  Target_Audience_Name = Mil_Target_Audience.Target_Audience_Name
	,	IO_Task_Name = Mil_IO_Task.IO_Task_Name
FROM MIl_Operations
RIGHT JOIN Mil_Implementing_Unit ON Mil_Operations.Implementing_Unit_ID = Mil_Implementing_Unit.Implementing_Unit_ID
RIGHT JOIN Mil_Target_Audience ON MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_IO_Task on MIl_Operations.IO_Task_ID = Mil_IO_Task.IO_Task_ID
WHERE Mil_Operations.Implementing_Unit_ID = Mil_Implementing_Unit.Implementing_Unit_ID
AND MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
AND MIl_Operations.IO_Task_ID = Mil_IO_Task.IO_Task_ID

--some Selects, wow this works.  join multiple tables through 
SELECT  MIl_Operations.Implementing_Unit_Name as Executing_Unit
	,	MIl_Operations.Target_Audience_Name as TargetAudience
	,	MIl_Operations.IO_Task_Name as Task_Executed
	,	Mil_Target_Audience.Target_Audience_Location as Location_occurred
--	,	Mil_IO_OBJ.IO_OBJ_Priority as IO_Priority
	,	(MIl_Operations.Opn_Effect) as Assessed_Effectiveness
	,	MIl_Operations.Operation_ID
FROM MIl_Operations
 JOIN Mil_Target_Audience on MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
-- JOIN Mil_IOOBJ_Task_XWalk on MIl_Operations.IO_Task_ID = Mil_IOOBJ_Task_XWalk.IO_Task_ID		--these are confusing
 --JOIN Mil_IO_OBJ on Mil_IO_OBJ.IO_OBJ_ID = Mil_IOOBJ_Task_XWalk.IO_OBJ_ID
WHERE MIl_Operations.Opn_Effect > 80
and MIl_Operations.Implementing_Unit_Name = 'CAT495'
Order by Opn_Effect DESC


--A more in depth select below which will display all of the activities that a particular team has executed against number 1 IO priority.  

SELECT  MIl_Operations.Implementing_Unit_Name as Executing_Unit
	,	MIl_Operations.Target_Audience_Name as TargetAudience
	,	MIl_Operations.IO_Task_Name as Task_Executed
	,	Mil_Target_Audience.Target_Audience_Location as Location_occurred
	,	Mil_IO_OBJ.IO_OBJ_Priority as IO_Priority
	,	(MIl_Operations.Opn_Effect) as Assessed_Effectiveness
	,	MIl_Operations.Operation_ID
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_IOOBJ_Task_XWalk on MIl_Operations.IO_Task_ID = Mil_IOOBJ_Task_XWalk.IO_Task_ID		
RIGHT JOIN Mil_IO_OBJ on Mil_IO_OBJ.IO_OBJ_ID = Mil_IOOBJ_Task_XWalk.IO_OBJ_ID
WHERE MIl_Operations.Opn_Effect > 55
and MIl_Operations.Implementing_Unit_Name = 'CAT495'
and IO_OBJ_Priority = '1'
--GROUP BY Mil_IO_OBJ.IO_OBJ_Priority
Order by Assessed_Effectiveness DESC

--this line is broken but can be used as a guidepoint
SELECT * FROM MIl_Operations
SELECT  MIl_Operations.Implementing_Unit_Name as Executing_Unit
	,	MIl_Operations.Target_Audience_Name as TargetAudience
	,	MIl_Operations.IO_Task_Name as Task_Executed
	,	Mil_Target_Audience.Target_Audience_Location as Location_occurred
	,	Mil_IO_OBJ.IO_OBJ_Priority as IO_Priority
	,	avg (MIl_Operations.Opn_Effect) as Assessed_Effectiveness
	,	MIl_Operations.Operation_ID
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_IOOBJ_Task_XWalk on MIl_Operations.IO_Task_ID = Mil_IOOBJ_Task_XWalk.IO_Task_ID		
RIGHT JOIN Mil_IO_OBJ on Mil_IO_OBJ.IO_OBJ_ID = Mil_IOOBJ_Task_XWalk.IO_OBJ_ID
WHERE MIl_Operations.Opn_Effect > 55
and MIl_Operations.Implementing_Unit_Name = 'CAT495'
and IO_OBJ_Priority = '1'
GROUP BY MIl_Operations.Implementing_Unit_Name

--Going further, we can assess the average effectiveness of our activities 
--for a single implementing unit (CAT 495) with the below code.  
SELECT  MIl_Operations.Implementing_Unit_Name as Executing_Unit
	,	avg (MIl_Operations.Opn_Effect) as Assessed_Effectiveness
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_IOOBJ_Task_XWalk on MIl_Operations.IO_Task_ID = Mil_IOOBJ_Task_XWalk.IO_Task_ID		
RIGHT JOIN Mil_IO_OBJ on Mil_IO_OBJ.IO_OBJ_ID = Mil_IOOBJ_Task_XWalk.IO_OBJ_ID
WHERE MIl_Operations.Opn_Effect > 55
and MIl_Operations.Implementing_Unit_Name = 'CAT495'
and IO_OBJ_Priority = '1'
GROUP BY MIl_Operations.Implementing_Unit_Name

-- Works Can we do the same thing for all of the teams?  Can we add layers of complexity? 
--This statement will select all of the implementing units, their tasks and the resulting effectiveness, ordering them by descending effectiveness
SELECT  MIl_Operations.Implementing_Unit_Name as Executing_Unit
	,	MIl_Operations.IO_Task_Name
	,  (MIl_Operations.Opn_Effect) as Assessed_Effectiveness
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_IOOBJ_Task_XWalk on MIl_Operations.IO_Task_ID = Mil_IOOBJ_Task_XWalk.IO_Task_ID		
RIGHT JOIN Mil_IO_OBJ on Mil_IO_OBJ.IO_OBJ_ID = Mil_IOOBJ_Task_XWalk.IO_OBJ_ID
WHERE MIl_Operations.Opn_Effect > 55
and IO_OBJ_Priority = '1'
ORDER BY MIl_Operations.Opn_Effect DESC

--This statement assesses the average effectiveness of each team against all objectives.   
SELECT  MIl_Operations.Implementing_Unit_Name as Executing_Unit
	,	avg (MIl_Operations.Opn_Effect) as Assessed_Effectiveness 
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on MIl_Operations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_IOOBJ_Task_XWalk on MIl_Operations.IO_Task_ID = Mil_IOOBJ_Task_XWalk.IO_Task_ID		
RIGHT JOIN Mil_IO_OBJ on Mil_IO_OBJ.IO_OBJ_ID = Mil_IOOBJ_Task_XWalk.IO_OBJ_ID
WHERE MIl_Operations.Opn_Effect > 55
GROUP BY MIl_Operations.Implementing_Unit_Name 





Select * FROM MIl_Operations 
WHERE Implementing_Unit_Name = 'CAT495'
and Operation_ID = '327'

--Selects a target audience and the relevent beliefs, motivations and grievances for that group
SELECT Mil_Target_Audience.Target_Audience_Name as Target_Audience, Mil_TA_Beliefs.Belief_Text as Beliefs, Mil_TA_Motivations.Motivation_Text as Motivations, Mil_TA_Grievances.Grievance_Text as Grievances
FROM Mil_Target_Audience 
RIGHT JOIN Mil_TA_Beliefs on Mil_TA_Beliefs.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_TA_Motivations on Mil_Target_Audience.Target_Audience_ID = Mil_TA_Motivations.Target_Audience_ID
RIGHT JOIN Mil_TA_Grievances on Mil_Target_Audience.Target_Audience_ID = Mil_TA_Grievances.Target_Audience_ID
where Target_Audience_Name = 'est group 1'

--This code displays special skills attached to particular units
Select Mil_Implementing_Unit.Implementing_Unit_Name as NameofUnit, Mil_Unit_Skill.Special_Skill_Text as Skills 
FROM Mil_Implementing_Unit
Right join Mil_Unit_Skill on mil_Implementing_Unit.Implementing_Unit_ID = Mil_Unit_Skill.Implementing_Unit_ID
WHERE Implementing_Unit_Type = 'Special Forces'
And Mil_Implementing_Unit.Implementing_Unit_Name = 'SF447'


/*Seeking to determine which countries are most receptive to USG information operations, our plan in answering this is to  join two tables
Mil_Target_Audience and Mil_Operations, select the Mil_Target_Audience ethnicity column as our Country and then select the average effectiveness
of our Mil_Operations.Opn_Effect to show how well our teams have done overall in each country.
*/

Select * FROM MIl_Operations
SELECT * FROM Mil_IOOBJ_Task_XWalk

SELECT 
		Mil_Target_Audience.Target_Audience_Ethnicity AS TA_Country
	,	avg (MIl_Operations.Opn_Effect) as Effectiveness
--	,	MIl_Operations.Operation_ID as Operations_Number
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on Mil_Target_Audience.Target_Audience_ID = MIl_Operations.Target_Audience_ID
GROUP BY Mil_Target_Audience.Target_Audience_Ethnicity
ORDER BY avg (MIl_Operations.Opn_Effect) DESC

/* We will now take the top three countries for further analysis, Estonia, Georgia and Lithuania.  We want to determine what operations
are occurring in those countries and what the beliefs, motivations and grievances of the target_audiences in those countries consist of.  
*/

Select * FROM MIl_Operations
SELECT * FROM Mil_IOOBJ_Task_XWalk

-- We have listed the Implementing_Units  and Operations executed, sorted by their effectiveness to try and determine which activities had the most success and 
--now we will try and determine why. 
SELECT MIl_Operations.Implementing_Unit_Name as ImplementingUnit
	,	MIl_Operations.IO_Task_ID
	,	MIl_Operations.IO_Task_Name as OperationExecuted
	,	Mil_Target_Audience.Target_Audience_Location as LocationExecuted
	,	MIl_Operations.Opn_Effect as Effectiveness
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on Mil_Target_Audience.Target_Audience_ID = MIl_Operations.Target_Audience_ID
WHERE Mil_Target_Audience.Target_Audience_Ethnicity = 'Estonian'
ORDER By MIl_Operations.Opn_Effect DESC

select * from MIl_Operations
SELECT * FROM Mil_IO_Task

--Can we count the number of operations in estonia?
SELECT Mil_IO_Task.IO_Task_Name as TaskExecuted
	,	count (MIl_Operations.IO_Task_Name) as NumberofTimesExecuted 
--	,	Mil_Target_Audience.Target_Audience_Name as TargetAudience
FROM Mil_IO_Task
RIGHT JOIN Mil_operations on MIl_Operations.IO_Task_ID = Mil_IO_Task.IO_task_ID
RIGHT JOIN Mil_Target_Audience on Mil_Target_Audience.Target_Audience_ID = MIl_Operations.Target_Audience_ID
WHERE Mil_Target_Audience.Target_Audience_Ethnicity = 'Estonian'
GROUP BY Mil_IO_Task.IO_Task_Name
order by count (mil_operations.io_task_Name) DESC


--Can we count the number of operations in Azerbaijan?
SELECT Mil_IO_Task.IO_Task_Name as TaskExecuted
	,	count (MIl_Operations.IO_Task_Name) as NumberofTimesExecuted 
--	,	Mil_Target_Audience.Target_Audience_Name as TargetAudience
FROM Mil_IO_Task
RIGHT JOIN Mil_operations on MIl_Operations.IO_Task_ID = Mil_IO_Task.IO_task_ID
RIGHT JOIN Mil_Target_Audience on Mil_Target_Audience.Target_Audience_ID = MIl_Operations.Target_Audience_ID
WHERE Mil_Target_Audience.Target_Audience_Ethnicity = 'Azerbaijani'
GROUP BY Mil_IO_Task.IO_Task_Name
order by count (mil_operations.io_task_Name) DESC
	,	

--drill down on beliefs, motivations and grievances
SELECT * FROM Mil_Target_Audience
Where Mil_Target_Audience.Target_Audience_Ethnicity = 'estonian'

SELECT Mil_Target_Audience.Target_Audience_Name as TA_Name
	,	Mil_TA_Beliefs.Belief_Text as Beliefs
	,	Mil_TA_Grievances.Grievance_Text as Grievances
	,	Mil_TA_Motivations.Motivation_Text as Motivations
FROM Mil_Target_Audience
RIGHT JOIN Mil_TA_Grievances on Mil_TA_Grievances.target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_TA_Beliefs on Mil_TA_Beliefs.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
RIGHT JOIN Mil_TA_Motivations on Mil_TA_Motivations.Target_Audience_ID = Mil_Target_Audience.Target_Audience_ID
WHERE Mil_Target_Audience.Target_Audience_Ethnicity = 'estonian'

select * FROM Mil_TA_Beliefs
--Looking to count the beliefs

/* In this particular case, it is easy to determine that there are only 3 beliefs for
groups in estonia, however, if we had a much larger dataset, we would be able to 
write code which lists the beliefs and counts the number of target audiences with a particular ethnicity
*/

SELECT Mil_Beliefs.Belief_Text as BeliefName
	,	count (Mil_TA_Beliefs.Belief_Text) as CountofBeliefs
FROM Mil_Beliefs
right join Mil_TA_Beliefs on Mil_Beliefs.Belief_ID = Mil_TA_Beliefs.Belief_ID
right join Mil_Target_Audience on Mil_Target_Audience.Target_Audience_ID = Mil_TA_Beliefs.Target_Audience_ID
WHERE Mil_target_audience.Target_Audience_Ethnicity = 'estonian'
GROUP BY Mil_Beliefs.Belief_Text

--Funky Version
SELECT MIl_Operations.Implementing_Unit_Name
	,	MIl_Operations.IO_Task_ID
	,	MIl_Operations.IO_Task_Name as OperationExecuted
	,	Mil_Target_Audience.Target_Audience_Location as LocationExecuted
	,	MIl_Operations.Opn_Effect as Effectiveness
FROM MIl_Operations
RIGHT JOIN Mil_Target_Audience on Mil_Target_Audience.Target_Audience_ID = MIl_Operations.Target_Audience_ID
WHERE Mil_Target_Audience.Target_Audience_Ethnicity = 'Estonian'
GROUP By  MIl_Operations.Implementing_Unit_Name


