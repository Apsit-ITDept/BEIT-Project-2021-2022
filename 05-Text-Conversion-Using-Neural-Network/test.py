import subprocess
p = subprocess.Popen(["./Text-Handwriting-Conversion/env/bin/python", "./Text-Handwriting-Conversion/demo.py"], stdout=subprocess.PIPE)
out, err = p.communicate()
print("output-err:", err)
print("output-out:", out)

