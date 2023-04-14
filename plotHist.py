import matplotlib.pyplot as plt

# Open our file
file = open('Histogram.txt', 'r')
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
plt.bar(x, y, color='blue', fill=False, width=(20/100), edgecolor='blue')

# Plot the original function
plt.title('Plot of Histogram')
plt.xlabel('Bin')
plt.ylabel('Count')
plt.savefig('hist')