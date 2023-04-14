import matplotlib.pyplot as plt

# Open our file
file = open('Brownian.txt', 'r')
lines = file.readlines()

# Capture the output from fortran
x = []
y = []
for line in lines:
    row = line.strip().split()
    x.append(float(row[0]))
    y.append(float(row[1]))

plt.style.use('seaborn-v0_8-whitegrid')
plt.figure(figsize=(15,10))

# Plot the derivative
plt.plot(x, y, color='blue')

# Plot the original function
plt.title('Plot of Brownian Motion')
plt.xlabel('X')
plt.ylabel('Y')
plt.savefig('brownian')