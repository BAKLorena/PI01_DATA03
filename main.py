from fastapi import FastAPI
from pydantic import BaseModel
from typing import Union
import conn_mysql

app = FastAPI()
#py -m uvicorn main:app --reload

query1="SELECT year AS Temporada, COUNT(year) AS Carreras_Temporada FROM races GROUP BY year ORDER BY Carreras_Temporada DESC LIMIT 1;"
query2="SELECT d.forename, d.driverRef, COUNT(r.position) AS Total_carreras_ganadas FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position = 1 GROUP BY r.driverId ORDER BY Total_carreras_ganadas DESC LIMIT 1;"
query3="SELECT c.name, c.location, c.country, COUNT(r.circuitId) AS Veces_corrido FROM races r JOIN circuits c ON r.circuitId = c.circuitId GROUP BY r.circuitId ORDER BY Veces_corrido DESC LIMIT 1;"
query4="SELECT d.forename, d.driverRef, SUM(r.points) AS Total_puntos FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE c.nationality = 'British' OR c.nationality = 'American' GROUP BY r.driverId ORDER BY Total_puntos DESC LIMIT 1;"

@app.get("/")
def intro():
    return  {"Datos Fórmula 1: -Año con más carreras y número de ellas-> /mascarreras, -Piloto con más carreras ganadas -> /pilotomasganador, -Circuito más competido -> /circuitomascompetido, -Piloto con más puntos conseguidos con escuderias británicas o americanas -> /maspuntos"}


@app.get("/mascarreras")
def mas_carreras_anio():
    return {"Año con más carreras y número de ellas: ": conn_mysql.conexion_BD(query1)}


@app.get("/pilotomasganador")
def piloto_mas_ganador():
    return {"Piloto con más carreras ganadas: ": conn_mysql.conexion_BD(query2)}


@app.get("/circuitomascompetido")
def circuito_mas_competido():
    return {"Circuito más competido: ": conn_mysql.conexion_BD(query3)}


@app.get("/maspuntos")
def mas_puntos_escuderia_britanica_americana():
    return {"Piloto con mas puntos conseguidos con escuderias británicas o americanas: ": conn_mysql.conexion_BD(query4)}