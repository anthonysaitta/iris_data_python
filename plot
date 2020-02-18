import pandas as pd
import matplotlib.pyplot as plt 
import numpy as np

#Link to data set
iris = pd.read_csv(r"https://gist.githubusercontent.com/curran/a08a1080b88344b0c8a7/raw/639388c2cbc2120a14dcf466e85730eb8be498bb/iris.csv")
iris_copy = pd.read_csv(r"https://gist.githubusercontent.com/curran/a08a1080b88344b0c8a7/raw/639388c2cbc2120a14dcf466e85730eb8be498bb/iris.csv")
iris_color = iris_copy

#function to create line of best fit
def best_fit_line(x,y):
    m = (((np.mean(x)*np.mean(y)) - np.mean(x*y))/((np.mean(x)*np.mean(x)) - np.mean(x*x)))
    b = np.mean(y) - m*np.mean(x)
    return m, b
regression = best_fit_line(iris_color['sepal_length'], iris_color['petal_length'])

#Create color column
color = []

#for loop to assign color to columns. 
for x in iris_color['species']:
    if x == "versicolor": 
        color.append("blue")
    elif x == "virginica":
        color.append("red")
    elif x == "setosa":
        color.append("green")

iris_color['Species Color'] = color

#Simple descriptions, counts, and covariance between numerical variables. 
iris_color_description = iris_color['species'].describe()
iris_color_species_count = iris_color['species'].count()
iris_color.cov()

#Scatter Plot of Values with Color
plt.scatter(iris_color['sepal_length'], iris_color['petal_length'], c=iris_color['Species Color'])   

#Line of Best Fit with colored scatter plot
plt.plot(np.unique(iris_color['sepal_length']), 
         np.poly1d(np.polyfit(iris_color['sepal_length'], iris_color['petal_length'], 1))
         (np.unique(iris_color['sepal_length'])))
plt.title("Sepal Length v. Petal Length")
plt.xlabel("Sepal Length in Inches")
plt.ylabel("Petal Length in Inches")


