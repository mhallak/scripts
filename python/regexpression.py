import re

string = """
sadadasd file_name.txt dfdasfafdjlf;jldaf\n
fdsfasfdfdfdsf f.txt ddfafdfdsfdsf\n
dafdsfafddsfads gggg.txt dfasdfaf"""


find_list = re.findall(' \w+.txt', string)

for f in find_list:
    print f[:-4]