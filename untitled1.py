#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Dec 10 23:02:38 2018

@author: roberthintze
"""

#Import folium for maps and pandas for data wrangling
import folium
import pandas as pd

#Read in the test scores
fullData = pd.read_csv('october.csv',)

#Create a map:
schoolMap = folium.Map(location=[40.75, -74.125])

#Create a layer, shaded by test scores:
schoolMap.choropleth(geo_path="schoolDistricts.json",
                     fill_color='YlGn', fill_opacity=0.5, line_opacity=0.5,
                     threshold_scale = [100,200,300,400],
                     data = fullData,
                     key_on='feature.properties.SchoolDist',
                     columns = ['LATITUDE', 'LONGITUDE']
                     ) 
#Output the map to an .html file:
schoolMap.save(outfile='testScores.html')