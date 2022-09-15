USE pi01_data03;

# Año con más carreras 2021 23
SELECT year AS Temporada, COUNT(year) AS Carreras_Temporada
FROM races
GROUP BY year
ORDER BY Carreras_Temporada DESC
LIMIT 1;

# Piloto con mayor cantidad de primeros puestos Hamilton 95

SELECT d.forename, d.driverRef, COUNT(r.position) AS Total_carreras_ganadas FROM results r
JOIN drivers d ON r.driverId = d.driverId
WHERE r.position = 1
GROUP BY r.driverId
ORDER BY Total_carreras_ganadas DESC
LIMIT 1;


# Nombre del circuito más corrido Autodromo Nazionale di Monza 71

SELECT c.name, c.location, c.country, COUNT(r.circuitId) AS Veces_corrido FROM races r
JOIN circuits c ON r.circuitId = c.circuitId
GROUP BY r.circuitId
ORDER BY Veces_corrido DESC
LIMIT 1;

# Piloto con mayor cantidad de puntos en total, cuyo constructor sea de nacionalidad sea American o British Button 1154

SELECT d.forename, d.driverRef, SUM(r.points) AS Total_puntos FROM results r
JOIN drivers d ON r.driverId = d.driverId
JOIN constructors c ON r.constructorId = c.constructorId
WHERE c.nationality = 'British' OR c.nationality = 'American'
GROUP BY r.driverId
ORDER BY Total_puntos DESC
LIMIT 1;