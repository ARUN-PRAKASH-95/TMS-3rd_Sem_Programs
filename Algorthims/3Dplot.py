import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d
x=np.linspace(-10,10,100)
y=np.linspace(-10,10,100)
X,Y = np.meshgrid(x,y)
z=-np.cos(X)-np.sin(Y)-0.01*(X**2+Y**2)
fig,ax = plt.subplots()
ax = plt.axes(projection='3d')
ax.contour3D(X,Y,z,500,cmap='binary');
plt.show()