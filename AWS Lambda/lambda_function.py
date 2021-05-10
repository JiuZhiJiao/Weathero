import sys
import pymysql
import logging
import json

#Configuration
#The endpoint of cloud database
rds_host = 'weathero.chf7gstsgpiu.ap-southeast-2.rds.amazonaws.com'
#username
name = 'MP27'
#password
pwd = 'mp2727mp'
#database name
db_name = 'weathero'
logger = logging.getLogger()
logger.setLevel(logging.INFO)

try:
    connection = pymysql.connect(host=rds_host, user=name, passwd=pwd, db=db_name, connect_timeout=5)
except:
    logger.error("ERROR: Could not connect to Mysql instance.")
    sys.exit()
logger.info("SUCCESS: Connection to RDS mysql instance succeeded")


def lambda_handler(event, context):
    # TODO implement
    # data = {}

    cur = connection.cursor()
    
    #Process data in emissions table
    query = "SELECT * from emissions"
    cur.execute(query)
    rows = cur.fetchall()
    emissions = []
    for row in rows:
        emissions.append({'year':row[0], 'population':row[1], 'cgce':row[2], 'doge':row[3], 'vehicularEmissions':row[4],
            'railwayEmissions':row[5], 'boatingEmissions':row[6], 'aviationEmissions':row[7], 'solidWasteEmissions':row[8],
            'wasteWaterEmissions':row[9], 'totalEmissions':row[10]
        })

    emission = emissions
    
    
    #Process data in Avg_Rainfall_Temperture table
    query = "SELECT * from Avg_Rainfall_Temperture"
    cur.execute(query)
    rows = cur.fetchall()
    avgs = []
    for row in rows:
        avgs.append({'year': row[0], 'rainfall': row[1], 'temperture': row[2]})
    avg = avgs
    
    
    #Process data in SeaLandTemp table
    query = "SELECT * from SeaLandTemp"
    cur.execute(query)
    rows = cur.fetchall()
    slts = []
    for row in rows:
        slts.append({'year': row[0], 'seaTemp': row[1], 'landTemp': row[2]})
    slt = slts

    #response = json.dumps({"emissions": emissions, "avg": avg, "slt": slt})
    
    #Combine all the result to an JSON object
    result = {'emissions':emission, 'avgRainfallTemperture': avg, 'seaLandTemp': slt}
    response = result
    
    return response