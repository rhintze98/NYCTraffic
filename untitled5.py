#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Dec 10 18:53:45 2018

@author: roberthintze
"""

import folium
import pandas as pd

cuny = pd.read_csv('NYPD_Motor_Vehicle_Collisions2.csv',)

mapCUNY = folium.Map(location=[40.768731, -73.964915])

for index,row in cuny.iterrows():
    lat = row["LATITUDE"]
    lon = row["LONGITUDE"]
    newMarker = folium.Marker([lat, lon])
    newMarker.add_to(mapCUNY)


mapCUNY.save(outfile='cunyLocations.html')