import folium
import pandas
import json
df=pandas.read_csv("simplemaps-worldcities-basic.csv")
df1=df.to_csv("new_col1.txt", index=False,columns=["lat","lng"])
lat1=list(df["lat"])
lon1=list(df["lng"])
pro=list(df["province"])
map=folium.Map(location=[30.98,5.34],zoom_start=7,tiles="Mapbox Bright")
fgv=folium.FeatureGroup(name="locations")
fgp=folium.FeatureGroup(name="population")
fgp.add_child(folium.GeoJson(data=open('world.json', 'r', encoding='utf-8-sig').read(),
style_function=lambda x:{'fillColor':'yellow' if x['properties']['POP2005']<1000000 else 'brown'} ))

for lt,ln,el in zip(lat1,lon1,pro):
    fgv.add_child(folium.CircleMarker(location=[lt,ln],radius=6,popup=str(el),fill_color="red",fill=True,color="orange",fill_opacity=0.7))
map.add_child(fgv)
map.add_child(fgp)
map.add_child(folium.LayerControl())
map.save("Map3.html")