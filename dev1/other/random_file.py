# Use: python random_file.py /path/to/sage/devel/sage-branch

import sys, os, re, random

all = []

for dir, dirnames, filenames in os.walk(sys.argv[1]):
    for file in filenames:
        if file[-4:] == ".pyx" or file[-3:] == ".py":
            all.append("%s/%s" % (dir, file))
        
content = ""
while len(content) < 1000:
    file = random.choice(all)
    content = open(file).read()
    content = re.sub(re.compile(r'""".*?"""', re.DOTALL), '"""..."""', content)
    content = re.sub(re.compile(r'class *[^ ]*?', re.DOTALL), 'class ...', content)
    content = re.sub(re.compile(r'def is_*[^ ]*?', re.DOTALL), 'is_...', content)

lines = content.split('\n')
start = random.randint(0, max(1, len(lines)-200))
lines = lines[start:]
contents = "\n".join(lines + ['\n'] * 1000)

open("tmp.txt", "w").write(contents)
os.system("more tmp.txt")

print "\n\n"
print file

