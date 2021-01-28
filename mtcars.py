import pandas as pd
import sqlite3
import seaborn as sns
import matplotlib.pyplot as plt

#Read in sqlite3 DB into Python
con = sqlite3.connect("mtcars.sqlite3")

#Read DB into df
df = pd.read_sql("select * from mtcars", con)

g = g = sns.FacetGrid(df, col="cyl")
g.map(sns.scatterplot,"wt","mpg");
plt.savefig("mtcars.png")