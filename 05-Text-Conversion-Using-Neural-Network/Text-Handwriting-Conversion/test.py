import subprocess

p = subprocess.Popen(["../Handwriting-Text-Conversion/env/bin/python", "../Handwriting-Text-Conversion/src/main.py", '--mode','infer','--img', '../Handwriting-Text-Conversion/data/kunal_san.png'], stdout=subprocess.PIPE)
out, err = p.communicate()
print(type(out))
output = str(out).split("Recognized:")
print("output from sub:",output[1][2:-4])