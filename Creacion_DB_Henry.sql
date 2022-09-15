DROP DATABASE pi01_data03;
CREATE DATABASE pi01_data03;
USE pi01_data03;

/*Creación de las tablas*/
DROP TABLE IF EXISTS `constructors`;				# CONSTRUCTORS
CREATE TABLE IF NOT EXISTS `constructors` (
  	`constructorId`		INTEGER,
  	`constructorRef` 	VARCHAR(30),
  	`name`			 	VARCHAR(50),
    `nationality`	 	VARCHAR(50),
  	`URL`			 	VARCHAR(90),
    PRIMARY KEY (constructorId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\constructors.csv'
INTO TABLE `constructors` 
FIELDS TERMINATED BY '|' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `circuits`;					# CIRCUITS
CREATE TABLE IF NOT EXISTS `circuits` (
  	`circuitId`			INTEGER,
  	`circuitRef` 		VARCHAR(30),
  	`name`			 	VARCHAR(50),
    `location`		 	VARCHAR(50),
    `country`		 	VARCHAR(50),
    `lat`			 	VARCHAR(50),
    `lng`			 	VARCHAR(50),
    `alt`			 	VARCHAR(50),
  	`URL`			 	VARCHAR(90),
    PRIMARY KEY (circuitId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\circuits.csv'
INTO TABLE `circuits` 
FIELDS TERMINATED BY '|' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `drivers`;					# DRIVERS
CREATE TABLE IF NOT EXISTS `drivers` (
  	`driverId`			INTEGER,
  	`driverRef` 		VARCHAR(30),
  	`number`		 	VARCHAR(10),
    `code`			 	VARCHAR(10),
    `dob`			 	VARCHAR(30),
    `nationality`	 	VARCHAR(30),
  	`URL`			 	VARCHAR(90),
	`forename`		 	VARCHAR(50),
    `surname`			VARCHAR(50),
    PRIMARY KEY (driverId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\drivers.csv'
INTO TABLE `drivers` 
FIELDS TERMINATED BY '|' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `lap_times`;					# LAP_TIMES
CREATE TABLE IF NOT EXISTS `lap_times` (
  	`raceId`			INTEGER,
  	`driverId`	 		INTEGER,
  	`lap`			 	INTEGER,
    `position`		 	INTEGER,
    `time`			 	VARCHAR(15),
    `milliseconds`	 	INTEGER
  	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\lap_times.csv'
INTO TABLE `lap_times` 
FIELDS TERMINATED BY '|' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `pit_stops`;					# PIT_STOPS
CREATE TABLE IF NOT EXISTS `pit_stops` (
  	`raceId`			INTEGER,
  	`driverId`	 		INTEGER,
  	`stop`			 	INTEGER,
    `lap`			 	INTEGER,
    `time`			 	VARCHAR(15),
	`duration`		 	VARCHAR(15),
    `milliseconds`	 	INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\pit_stops.csv'
INTO TABLE `pit_stops` 
FIELDS TERMINATED BY '|' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `qualify`;					# QUALIFY
CREATE TABLE IF NOT EXISTS `qualify` (
  	`qualifyId`			INTEGER,
  	`raceId`	 		INTEGER,
  	`driverId`	 		INTEGER,
    `constructorId`	 	INTEGER,
    `number`		 	VARCHAR(15),
	`position`		 	INTEGER,
	`q1`			 	VARCHAR(15),
	`q2`			 	VARCHAR(15),
	`q3`			 	VARCHAR(15),
    PRIMARY KEY (qualifyId)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\Q.csv'
INTO TABLE `qualify` 
FIELDS TERMINATED BY '|' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `races`;					# RACES
CREATE TABLE IF NOT EXISTS `races` (
  	`raceId`			INTEGER,
  	`year`		 		VARCHAR(5),
  	`round`			 	INTEGER,
    `circuitId`		 	INTEGER,
    `name`		 		VARCHAR(50),
    `date`			 	DATE,
    `time`			 	VARCHAR(50),
  	`URL`			 	VARCHAR(90),
    PRIMARY KEY (raceId)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\races.csv'
INTO TABLE `races` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `results`;					# RESULTS
CREATE TABLE IF NOT EXISTS `results` (
  	`resultId`			INTEGER,
  	`raceId`			INTEGER,
  	`driverId`	 		INTEGER,
  	`constructorId`		INTEGER,
    `number`		 	VARCHAR(15),
    `grid`			 	VARCHAR(15),
    `position`		 	VARCHAR(5),
	`positionText`	 	VARCHAR(5),
	`positionOrder`	 	VARCHAR(5),
	`points`			DECIMAL(10,2),
	`laps`				VARCHAR(5),
    `time`			 	VARCHAR(15),
    `milliseconds`	 	VARCHAR(15),
	`rank`				VARCHAR(5),
	`fastestLap`		VARCHAR(5),
    `fastestLapTime` 	VARCHAR(15),
	`fastestLapSpeed`	VARCHAR(10),
	`statusId`			INTEGER,
    PRIMARY KEY (resultId)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CSV\\results.csv'
INTO TABLE `results` 
FIELDS TERMINATED BY '|' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


#CREACIÓN DE RELACIONES ENTRE TABLAS Y RESTRICCIONES
SET FOREIGN_KEY_CHECKS=0; 
ALTER TABLE lap_times ADD CONSTRAINT `lap_times_fk_race` FOREIGN KEY (raceId) REFERENCES races (raceId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE pit_stops ADD CONSTRAINT `pit_stops_fk_race` FOREIGN KEY (raceId) REFERENCES races (raceId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE pit_stops ADD CONSTRAINT `pit_stops_fk_driver` FOREIGN KEY (driverId) REFERENCES drivers (driverId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE qualify ADD CONSTRAINT `qualify_fk_race` FOREIGN KEY (raceId) REFERENCES races (raceId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE qualify ADD CONSTRAINT `qualify_fk_constructor` FOREIGN KEY (constructorId) REFERENCES constructors (constructorId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE races ADD CONSTRAINT `races_fk_circuit` FOREIGN KEY (circuitId) REFERENCES circuits (circuitId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE results ADD CONSTRAINT `results_fk_race` FOREIGN KEY (raceId) REFERENCES races (raceId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE results ADD CONSTRAINT `results_fk_constructor` FOREIGN KEY (constructorId) REFERENCES constructors (constructorId) ON DELETE RESTRICT ON UPDATE RESTRICT;


# 
ALTER TABLE lap_times ADD CONSTRAINT `lap_times_fk_driver` FOREIGN KEY (driverId) REFERENCES drivers (driverId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE qualify ADD CONSTRAINT `qualify_fk_driver` FOREIGN KEY (driverId) REFERENCES drivers (driverId) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE results ADD CONSTRAINT `results_fk_driver` FOREIGN KEY (driverId) REFERENCES drivers (driverId) ON DELETE RESTRICT ON UPDATE RESTRICT;