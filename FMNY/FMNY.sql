CREATE PROC createAllTables
AS
	CREATE TABLE Sys_user(
		username VARCHAR(20),
		password VARCHAR(20),
		PRIMARY KEY(username)
	);

	CREATE TABLE Sys_admin(
		id INT IDENTITY,
		name VARCHAR(20),
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Sports_assoc_manager(
		id INT IDENTITY,
		name VARCHAR(20),
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Club(
		club_id INT IDENTITY,
		name VARCHAR(20),
		location VARCHAR(20),
		PRIMARY KEY(club_id)
	);

	CREATE TABLE Stadium(
		id INT IDENTITY,
		name VARCHAR(20),
		location VARCHAR(20),
		capacity INT,
		status BIT,
		PRIMARY KEY(id)
	);

	CREATE TABLE Club_rep(
		id INT IDENTITY,
		name VARCHAR(20),
		club_id INT,
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(club_id) REFERENCES Club(club_id),
		FOREIGN KEY(username) REFERENCES Sys_user(username) 
	);

	CREATE TABLE Stadium_manager(
		id INT IDENTITY,
		name VARCHAR(20),
		stadium_id INT,
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(stadium_id) REFERENCES Stadium(id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Fan(
		national_id VARCHAR(20),
		name VARCHAR(20),
		birth_date DATE,
		address VARCHAR(20),
		phone_no VARCHAR(20),
		status BIT,
		username VARCHAR(20),
		PRIMARY KEY(national_id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Match(
		match_id INT IDENTITY(0,2),
		start_time DATETIME,
		end_time DATETIME,
		host_club_id INT,
		guest_club_id INT,
		stadium_id INT,
		PRIMARY KEY(match_id),
		FOREIGN KEY(host_club_id) REFERENCES Club(club_id),
		FOREIGN KEY(guest_club_id) REFERENCES Club(club_id),
		FOREIGN KEY(stadium_id) REFERENCES Stadium(id) 
	);

	CREATE TABLE Ticket(
		id INT IDENTITY,
		status BIT,
		match_id INT,
		PRIMARY KEY(id),
		FOREIGN KEY(match_id) REFERENCES Match(match_id)
	);

	CREATE TABLE Ticket_buying_transaction(
		fan_national_id VARCHAR(20),
		ticket_id INT,
		FOREIGN KEY(fan_national_id) REFERENCES Fan(national_id),
		FOREIGN KEY(ticket_id) REFERENCES Ticket(id)
	);

	CREATE TABLE Host_req(
		id INT IDENTITY,
		rep_id INT,
		manager_id INT,
		match_id INT,
		status BIT,
		PRIMARY KEY(id),
		FOREIGN KEY(rep_id) REFERENCES Club_rep(id),
		FOREIGN KEY(manager_id) REFERENCES Stadium_manager(id),
		FOREIGN KEY(match_id) REFERENCES Match(match_id)
	);
GO

--tested
CREATE PROC dropAllTables 
AS
	DROP TABLE Host_req;
	DROP TABLE Ticket_buying_transaction;
	DROP TABLE Ticket;
	DROP TABLE Match;
	DROP TABLE Fan;
	DROP TABLE Stadium_manager;
	DROP TABLE Club_rep;
	DROP TABLE Stadium;
	DROP TABLE Club;
	DROP TABLE Sports_assoc_manager;
	DROP TABLE Sys_admin;
	DROP TABLE Sys_user;
GO

CREATE PROC dropAllProceduresFunctionsViews
AS
	DROP PROC createAllTables;
	DROP PROC dropAllTables;
GO

--Tested
CREATE PROC clearAllTables
AS
	DROP TABLE Host_req;
	DROP TABLE Ticket_buying_transaction;
	DROP TABLE Ticket;
	DROP TABLE Match;
	DROP TABLE Fan;
	DROP TABLE Stadium_manager;
	DROP TABLE Club_rep;
	DROP TABLE Stadium;
	DROP TABLE Club;
	DROP TABLE Sports_assoc_manager;
	DROP TABLE Sys_admin;
	DROP TABLE Sys_user;
	CREATE TABLE Sys_user(
		username VARCHAR(20),
		password VARCHAR(20),
		PRIMARY KEY(username)
	);

	CREATE TABLE Sys_admin(
		id INT IDENTITY,
		name VARCHAR(20),
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Sports_assoc_manager(
		id INT IDENTITY,
		name VARCHAR(20),
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Club(
		club_id INT IDENTITY,
		name VARCHAR(20),
		location VARCHAR(20),
		PRIMARY KEY(club_id)
	);

	CREATE TABLE Stadium(
		id INT IDENTITY,
		name VARCHAR(20),
		location VARCHAR(20),
		capacity INT,
		status BIT,
		PRIMARY KEY(id)
	);

	CREATE TABLE Club_rep(
		id INT IDENTITY,
		name VARCHAR(20),
		club_id INT,
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(club_id) REFERENCES Club(club_id),
		FOREIGN KEY(username) REFERENCES Sys_user(username) 
	);

	CREATE TABLE Stadium_manager(
		id INT IDENTITY,
		name VARCHAR(20),
		stadium_id INT,
		username VARCHAR(20),
		PRIMARY KEY(id),
		FOREIGN KEY(stadium_id) REFERENCES Stadium(id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Fan(
		national_id VARCHAR(20),
		name VARCHAR(20),
		birth_date DATE,
		street VARCHAR(20),
		house_no INT,
		postal_code INT,
		city VARCHAR(20),
		country VARCHAR(20),
		phone_no VARCHAR(20),
		status BIT,
		username VARCHAR(20),
		PRIMARY KEY(national_id),
		FOREIGN KEY(username) REFERENCES Sys_user(username)
	);

	CREATE TABLE Match(
		match_id INT IDENTITY(0,2),
		start_time DATETIME,
		end_time DATETIME,
		host_club_id INT,
		guest_club_id INT,
		stadium_id INT,
		PRIMARY KEY(match_id),
		FOREIGN KEY(host_club_id) REFERENCES Club(club_id),
		FOREIGN KEY(guest_club_id) REFERENCES Club(club_id),
		FOREIGN KEY(stadium_id) REFERENCES Stadium(id) 
	);

	CREATE TABLE Ticket(
		id INT IDENTITY,
		status BIT,
		match_id INT,
		PRIMARY KEY(id),
		FOREIGN KEY(match_id) REFERENCES Match(match_id)
	);

	CREATE TABLE Ticket_buying_transaction(
		fan_national_id VARCHAR(20),
		ticket_id INT,
		FOREIGN KEY(fan_national_id) REFERENCES Fan(national_id),
		FOREIGN KEY(ticket_id) REFERENCES Ticket(id)
	);

	CREATE TABLE Host_req(
		id INT IDENTITY,
		rep_id INT,
		manager_id INT,
		match_id INT,
		status BIT,
		PRIMARY KEY(id),
		FOREIGN KEY(rep_id) REFERENCES Club_rep(id),
		FOREIGN KEY(manager_id) REFERENCES Stadium_manager(id),
		FOREIGN KEY(match_id) REFERENCES Match(match_id)
	);
GO

--tested
CREATE VIEW allAssocManagers
AS
	SELECT su.username, su.password, sm.name 
	FROM Sports_assoc_manager AS sm 
	INNER JOIN Sys_user AS su ON sm.username = su.username
GO

--tested
CREATE VIEW allClubRepresentatives
AS
	SELECT su.username, su.password, cr.name AS club_rep_name, c.name AS club_name
	FROM Sys_user AS su
	INNER JOIN Club_rep AS cr ON su.username = cr.username
	INNER JOIN Club AS c ON cr.club_id = c.club_id
GO

--Tested
CREATE VIEW allStadiumManagers
AS
	SELECT su.username, su.password, sm.name AS stadium_manager_name, s.name AS stadium_name
	FROM Sys_user AS su
	INNER JOIN Stadium_manager AS sm ON su.username = sm.username
	INNER JOIN Stadium AS s ON sm.stadium_id = s.id
GO

CREATE VIEW allFans 
AS
	SELECT su.username, su.password, f.name, f.national_id, f.birth_date, f.status
	FROM Sys_user AS su
	INNER JOIN Fan AS f ON su.username  = f.username
GO

--tested
CREATE VIEW allMatches
AS
	SELECT c1.name AS host_club, c2.name AS guest_club, m.start_time 
	FROM Match AS m
	INNER JOIN Club AS c1 ON m.host_club_id = c1.club_id
	INNER JOIN Club AS c2 ON m.guest_club_id = c2.club_id
GO

CREATE VIEW allTickets
AS
	SELECT c1.name AS host_club, c2.name AS guest_club, s.name AS stadium_name, m.start_time
	FROM Ticket AS t
	INNER JOIN Match AS m ON t.match_id = m.match_id
	INNER JOIN Stadium AS s ON m.stadium_id = s.id
	INNER JOIN Club AS c1 ON m.host_club_id = c1.club_id
	INNER JOIN Club AS c2 ON m.guest_club_id = c2.club_id
GO

--tested
CREATE VIEW allCLubs 
AS
	SELECT name, location
	FROM Club
GO

CREATE VIEW allStadiums
AS
	SELECT name, location, capacity, status
	FROM Stadium 
GO

CREATE VIEW allRequests
AS
	SELECT cr.username AS club_rep_username, sm.username AS stadium_manager_username, hr.status
	FROM Host_req AS hr
	INNER JOIN Stadium_manager AS sm ON hr.manager_id = sm.id
	INNER JOIN Club_rep AS cr ON hr.rep_id = cr.id
GO

CREATE PROC addAssociationManager
	@name VARCHAR(20),
	@username VARCHAR(20),
	@password VARCHAR(20)
AS
	INSERT INTO Sports_assoc_manager VALUES (@name, @username)
	INSERT INTO Sys_user VALUES (@username, @password)
GO

CREATE PROC addNewMatch
	@host_club_name VARCHAR(20),
	@guest_club_name VARCHAR(20),
	@start_time DATETIME,
	@end_time DATETIME
AS
	INSERT INTO Match VALUES (@start_time, @end_time, (SELECT club_id FROM Club WHERE name = @host_club_name), 
								(SELECT club_id FROM Club WHERE name = @guest_club_name), (SELECT id FROM Stadium WHERE location = (SELECT location FROM Club WHERE name = @host_club_name)))
GO

--Tested
CREATE VIEW clubsWithNoMatches 
AS
	SELECT c.name
	FROM Club AS c
	LEFT OUTER JOIN Match AS m ON m.host_club_id = c.club_id OR m.guest_club_id = c.club_id
	WHERE m.host_club_id IS NULL OR m.guest_club_id IS NULL
GO

--Tested 
CREATE PROC deleteMatch
	@host_club_name VARCHAR(20),
	@guest_club_name VARCHAR(20)
AS
	DELETE 
	FROM Match 
	WHERE host_club_id = (SELECT club_id FROM Club WHERE name = @host_club_name) 
			AND guest_club_id = (SELECT club_id FROM Club WHERE name = @guest_club_name)
GO

CREATE PROC deleteMatchesOnStadium
	@name VARCHAR(20)
AS
	DELETE 
	FROM Match
	WHERE stadium_id = (SELECT id FROM Stadium WHERE name = @name)
GO

CREATE PROC addClub
	@name VARCHAR(20),
	@location VARCHAR(20)
AS
	INSERT INTO Club VALUES (@name, @location)
GO

CREATE PROC addTicket
	@host_club_name VARCHAR(20),
	@guest_club_name VARCHAR(20),
	@start_time DATETIME
AS
	INSERT INTO Ticket VALUES(1, (SELECT match_id FROM Match WHERE host_club_id = (SELECT club_id FROM Club WHERE name = @host_club_name)
	AND guest_club_id = (SELECT club_id FROM Club WHERE name = @guest_club_name)))
GO

--Tested
CREATE PROC deleteClub
	@name VARCHAR(20)
AS
	DELETE 
	FROM Club 
	WHERE name = @name
GO

CREATE PROC addStadium
	@name VARCHAR(20),
	@location VARCHAR(20),
	@capacity INT
AS
	INSERT INTO Stadium VALUES (@name, @location, @capacity, 1)
GO

--Tested
CREATE PROC deleteStadium
	@name VARCHAR(20)
AS
	DELETE 
	FROM Stadium
	WHERE name = @name
GO

CREATE PROC blockFan
	@national_id VARCHAR(20)
AS
	UPDATE Fan
	SET status = 0
	WHERE national_id = @national_id;
GO

CREATE PROC unblockFan
	@national_id VARCHAR(20)
AS
	UPDATE Fan
	SET status = 1
	WHERE national_id = @national_id;
GO

CREATE PROC addRepresentative
    @name VARCHAR(20),
    @club_name VARCHAR(20),
    @username VARCHAR(20),
    @password VARCHAR(20)
AS
    INSERT INTO Sys_user VALUES (@username, @password)
    INSERT INTO Club_rep VALUES (@name, (SELECT club_id FROM Club WHERE name = @club_name), @username)
GO

CREATE FUNCTION [viewAvailableStadiumsOn]
    (@date DATETIME)
    RETURNS TABLE
AS
    
	RETURN (SELECT s.name, s.location, s.capacity FROM Stadium AS s LEFT OUTER JOIN Match AS m ON m.stadium_id = s.id WHERE  m.start_time <> @date AND s.status = 1)
    
GO

CREATE PROC addHostRequest
    @club_name VARCHAR(20),
    @stadium_name VARCHAR(20),
    @start_time DATETIME
AS
    INSERT INTO Host_req VALUES ((SELECT cr.id FROM Club_rep AS cr INNER JOIN Club AS c ON cr.club_id = c.club_id WHERE c.name = @club_name),
    (SELECT sm.id FROM Stadium_manager AS sm INNER JOIN Stadium AS s ON sm.stadium_id = s.id WHERE s.name = @stadium_name), 
    (SELECT match_id FROM Match WHERE start_time = @start_time), NULL)
GO

CREATE FUNCTION [allUnassignedMatches]
    (@club_name VARCHAR(20))
    RETURNS TABLE
AS
    
        RETURN (SELECT c1.name, m.start_time FROM Club AS c INNER JOIN Match AS m ON c.club_id = m.host_club_id INNER JOIN Club AS c1 ON c1.club_id = m.guest_club_id WHERE c.name = @club_name) 
    
GO

CREATE PROC addStadiumManager
    @name VARCHAR(20),
    @stadium_name VARCHAR(20),
    @username VARCHAR(20),
    @password VARCHAR(20)
AS
    INSERT INTO Stadium_manager VALUES (@name ,(SELECT id FROM Stadium WHERE name = @stadium_name) , @username)
    INSERT INTO Sys_user VALUES (@username , @password)
GO

CREATE FUNCTION allPendingRequests
    (@name VARCHAR(20))
    RETURNS TABLE
AS
    RETURN(
        SELECT CR.name AS Club_rep_name, C.name AS Club_name, M.start_time
        FROM club C INNER JOIN match M ON C.club_id = M.guest_club_id INNER JOIN Host_req H ON M.match_id = H.match_id
        INNER JOIN Club_rep CR on CR.id = H.id INNER JOIN Stadium_manager S ON S.id = H.id
        WHERE H.status IS NULL AND @name = S.username)
GO

CREATE PROC acceptRequest
    @username VARCHAR(20),
    @host_club_name VARCHAR(20),
    @guest_club_name VARCHAR(20),
    @start_time DATETIME
AS
    UPDATE Host_req
    SET status = 1
    WHERE Host_req.match_id = (SELECT M.match_id FROM Match M WHERE start_time = @start_time
							AND host_club_id = (SELECT club_id FROM Club WHERE name = @host_club_name) AND guest_club_id = (SELECT club_id FROM Club WHERE name = @guest_club_name))
							AND manager_id = (SELECT id FROM Stadium_manager WHERE username = @username) 
							AND rep_id = (SELECT id FROM Club_rep WHERE club_id = (SELECT club_id FROM Club WHERE name = @host_club_name))
GO

CREATE PROC rejectRequest
    @username VARCHAR(20),
    @host_club_name VARCHAR(20),
    @guest_club_name VARCHAR(20),
    @start_time DATETIME
AS
    UPDATE Host_req 
    SET status = 0
    WHERE match_id = (SELECT M.match_id FROM Match M WHERE start_time = @start_time
						AND host_club_id = (SELECT club_id FROM Club WHERE name = @host_club_name) AND guest_club_id = (SELECT club_id FROM Club WHERE name = @guest_club_name))
						AND manager_id = (SELECT id FROM Stadium_manager WHERE username = @username) 
						AND rep_id = (SELECT id FROM Club_rep WHERE club_id = (SELECT club_id FROM Club WHERE name = @host_club_name))
GO

CREATE PROC addFan
    @name VARCHAR(20),
    @username VARCHAR(20),
    @password VARCHAR(20),
    @national_id VARCHAR(20),
    @birth_date DATETIME,
    @address VARCHAR(20),
    @phone_no INT
AS
    INSERT INTO Fan VALUES (@national_id , @name , @birth_date , @address , @phone_no , 1, @username)
    INSERT INTO Sys_user VALUES (@username , @password)
GO

CREATE FUNCTION upcomingMatchesOfClub
(@name VARCHAR(20))
RETURNS TABLE
AS
RETURN(
        SELECT c.name AS Club, m.start_time, m.end_time, s.name AS Stadium
        FROM Club c
        INNER JOIN Match m ON (c.club_id = m.host_club_id OR c.club_id = m.guest_club_id)
        INNER JOIN Stadium s ON m.stadium_id = s.id
        WHERE m.start_time > CURRENT_TIMESTAMP AND c.name = @name)
GO

CREATE FUNCTION availableMatchesToAttend
(@date DATETIME)
RETURNS TABLE
RETURN(SELECT c1.name AS Host, c2.name AS Guest, m.start_time, s.name
FROM Club c1 INNER JOIN Match m ON c1.club_id = m.host_club_id
INNER JOIN club c2 ON c2.club_id = m.guest_club_id
INNER JOIN stadium s ON s.id = m.stadium_id
INNER JOIN ticket t ON t.match_id =m.match_id
WHERE @date <= m.start_time AND t.status=1)
GO

CREATE PROC purchaseTicket
    @national_id VARCHAR(20),
    @host_club_name VARCHAR(20),
    @guest_club_name VARCHAR(20),
    @start_time DATETIME
AS
    UPDATE Ticket
    SET status = 1
    WHERE match_id = (SELECT M.match_id FROM Match M WHERE start_time = @start_time
						AND host_club_id = (SELECT club_id FROM Club WHERE name = @host_club_name) 
						AND guest_club_id = (SELECT club_id FROM Club WHERE name = @guest_club_name))

	UPDATE Ticket_buying_transaction
	SET status = 1
	WHERE fan_national_id = @national_id
GO

CREATE PROC updateMatchTiming
    @host_club_name VARCHAR(20),
    @guest_club_name VARCHAR(20),
    @start_time_old DATETIME,
    @start_time_new DATETIME,
    @end_time_new DATETIME
AS
    UPDATE Match
    SET start_time = @start_time_new , end_time = @end_time_new
    WHERE start_time = @start_time_old
    AND host_club_id = (SELECT club_id FROM Club WHERE name = @host_club_name) AND guest_club_id = (SELECT club_id FROM Club WHERE name = @guest_club_name)
GO


CREATE VIEW matchesPerTeam AS
SELECT C.name, (COUNT(C.club_id)) as countMatches
FROM Club C INNER JOIN Match M ON (C.club_id = M.host_club_id or C.club_id = M.guest_club_id)
WHERE M.end_time < CURRENT_TIMESTAMP
GROUP BY C.name
GO

CREATE PROC deleteMatchesOn
    @day DATETIME
AS
    DELETE
    FROM MATCH 
    WHERE start_time = @day
GO

CREATE VIEW matchWithMostSoldTickets AS
SELECT C1.name as Home, C2.name as Guests
FROM Match, Club C1, Club C2
WHERE Match.host_club_id = C1.club_id AND Match.guest_club_id = C2.club_id AND Match.match_id = (
	SELECT MAX(M.match_id) AS Max_ID
	FROM match AS M, ticket AS T1, Ticket_buying_transaction AS T2
	WHERE m.match_id = T1.match_id AND T2.ticket_id = T1.id
	GROUP BY m.match_id
)
GO

CREATE VIEW matchesRankedBySoldTickets AS
SELECT C1.name as Home, C2.name as Guests, Q.ticketCount
FROM Club C1, Club C2, (
	SELECT M.match_id, M.host_club_id as HC, M.guest_club_id as GC, COUNT(T1.id) AS ticketCount
	FROM Ticket T1, Match M, Ticket_buying_transaction as T2
	WHERE T1.match_id = M.match_id AND T1.id = T2.ticket_id
	GROUP BY M.match_id, M.host_club_id, M.guest_club_id
) AS Q
WHERE C1.club_id = Q.HC AND C2.club_id = Q.GC
ORDER BY Q.ticketCount DESC
GO

CREATE PROC clubWithTheMostSoldTickets
    @name VARCHAR(20) OUTPUT
AS
	
    SELECT top 1 @name = C.name 
    FROM Club C
    INNER JOIN Match M ON (M.host_club_id = C.club_id OR M.guest_club_id = C.club_id)
    INNER JOIN Ticket T ON T.match_id = M.match_id 
	WHERE T.status = 0
	GROUP BY C.name
	ORDER BY COUNT(T.id) DESC
GO

CREATE VIEW clubsRankedBySoldTickets
AS
    SELECT C.name, COUNT(T)
    FROM Club C
    INNER JOIN Match M ON (M.host_club_id = C.club_id OR M.guest_club_id = C.club_id)
    INNER JOIN Ticket T ON T.match_id = M.match_id
    WHERE M.end_time < CURRENT_TIMESTAMP
    GROUP BY C.name
    ORDER BY COUNT(T) DESC
GO

CREATE FUNCTION stadiumsNeverPlayedOn
    (@name VARCHAR(20))
    RETURNS TABLE
AS
    RETURN(SELECT S.name, S.capacity
    FROM Stadium s
    INNER JOIN Match M ON M.stadium_id = S.id
    LEFT OUTER JOIN Club C ON M.host_club_id = C.club_id OR M.guest_club_id = C.club_id
    WHERE C.name = @name AND M.host_club_id = NULL OR M.host_club_id = NULL)
GO  