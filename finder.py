import re
import time

needle = '55'
timer = 0.0

item = {}
results = 0

with open('C:\\OxyTech\\Finder\\D_index.txt', 'r', encoding='utf-8') as e_file:
    for string in e_file:
        real = re.split('`', string)
        item[real[0]] = real[1][0:-1]
        
timer = time.time()
for each in item:
    if re.findall(needle, each):
        results += 1
        print(each)
        
print(results)
print(time.time() - timer)