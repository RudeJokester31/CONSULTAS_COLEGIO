from flask import Flask, jsonify
from flask_mysqldb import MySQL
from config import config
from datetime import datetime


app = Flask(__name__)
conexion = MySQL()  # Instanciar objeto MySQL # Inicializar objeto MySQL con la configuración
conexion.init_app(app)
app.config.from_object(config["development"])  # Cargar configuración

@app.route("/ingresos")
def get_ingresos():
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT COUNT(FECHA) FROM ingresos WHERE DATE(FECHA) = %s AND TIPO_INGRESO = 1"
        fecha_actual = datetime.now().date()
        print (fecha_actual)
        cursor.execute(sql, (fecha_actual,))
        count = cursor.fetchone()[0]
        data = []
        data.append(count)
        print (data)
        return jsonify(data)
    except:
        return jsonify({"mensaje": "No se completó la consulta", "Codigo": False})

@app.route("/total_estudiantes")
def get_total_estudiantes():
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT COUNT(*) AS TOTAL_ESTUDIANTES FROM usuario WHERE ROL = 'estudiante'"
        cursor.execute(sql)
        count1 = cursor.fetchone()[0]
        data1 = []
        data1.append(count1)
        print (data1)
        return jsonify(data1)
    except:
        return jsonify({"mensaje": "No se completó la consulta", "Codigo": False})

@app.route("/inasistencia")
def get_inasistencia():
    try:
        cursor = conexion.connection.cursor()
        sql = """SELECT (SELECT COUNT(*) AS TOTAL_ESTUDIANTES FROM usuario WHERE ROL = 'estudiante') 
        - (SELECT COUNT(FECHA) FROM ingresos WHERE DATE(FECHA) = CURDATE() AND TIPO_INGRESO = 1) AS INASISTENCIA"""
        cursor.execute(sql)
        count2 = cursor.fetchone()[0]
        data2 = []
        data2.append(count2)
        print (data2)
        return jsonify(data2)
    except:
        return jsonify({"mensaje": "No se completó la consulta", "Codigo": False})

@app.route("/promedio")
def get_promedio():
    try:
        cursor = conexion.connection.cursor()
        sql = """SELECT DATE_FORMAT(fecha, '%Y-%m') AS mes,  
       AVG(cantidad_ingresos) AS PROMEDIO FROM (SELECT DATE(fecha) AS fecha, 
       COUNT(*) AS cantidad_ingresos FROM ingresos GROUP BY DATE(fecha)) AS ingresos_por_fecha 
       GROUP BY mes"""
        cursor.execute(sql)
        count3 = cursor.fetchone()[1]
        data3 = []
        data3.append(count3)
        print (data3)
        return jsonify(data3)
    except:
        return jsonify({"mensaje": "No se completó la consulta", "Codigo": False})


@app.route("/grafico_ingresos")
def get_grafico_ingresos():
    try:
        cursor = conexion.connection.cursor()
        sql = """SELECT FECHA, COUNT(*) AS cantidad_ingresos FROM ingresos GROUP BY FECHA"""
        cursor.execute(sql)
        count2 = cursor.fetchone()[0]
        data2 = []
        data2.append(count2)
        print (data2)
        return jsonify(data2)
    except:
        return jsonify({"mensaje": "No se completó la consulta", "Codigo": False})


if __name__ == '__main__':
    app.run(debug=True, port=9036, host='0.0.0.0')


