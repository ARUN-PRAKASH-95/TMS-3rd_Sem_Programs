import numpy as np
import matplotlib.pyplot as plt
#from mpl_toolkits import mplot3d

x = np.linspace(-5,5,100)
y = np.linspace(-5,5,100)
X,Y = np.meshgrid(x,y)
gamma = 0.01
X_old = 0
Y_old = 3

def func(X,Y):
    Z = -np.cos(X)-np.sin(Y)-0.01*(X**2+Y**2)
    return Z
def der(X,Y):
    df_X = np.sin(X) - 0.02*X
    df_Y = -np.cos(Y) - 0.02*Y
    return df_X,df_Y

X_points=np.array([])
Y_points=np.array([])

for i in range(1000):
    der_X,der_Y = der(X_old,Y_old)
    X_new = X_old - der_X*gamma
    Y_new = Y_old - der_Y*gamma
    X_points = np.append(X_points,X_new)
    Y_points = np.append(Y_points,Y_new)
    epsilon1 = X_new - X_old
    epsilon2 = Y_new - Y_old
    X_old = X_new
    Y_old = Y_new
    if abs(epsilon1)==0 and abs(epsilon2)==0:
        break;
    
   

fig,ax = plt.subplots(ncols=2,figsize=(10,6))
ax[0].contourf(X,Y,func(X,Y),origin=None);
ax[0].plot(X_points,Y_points);
ax[0].scatter(X_points,Y_points);
# ax[1] = plt.axes(projection='3d')
# ax[1].contour3D(X,Y,func(X,Y),500,cmap='binary');
# ax[1].plot3D(X_points,Y_points,func(X_points,Y_points));
# ax[1].scatter3D(X_points,Y_points,func(X_points,Y_points));
plt.show()