#!/usr/bin/python

import xlwt
import sys, getopt
import time
import re

def main(argv):
    inputfile = "/home/michele/ForPLP/totalGrades.txt"
    outputfile = 'superGrades.xls'
    try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
      print 'makeGrades.py -i <inputfile> -o <outputfile>'
      sys.exit(2)
    for opt, arg in opts:
      if opt == '-h':
         print 'makeGrades.py -i <inputfile> -o <outputfile>'
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
    print 'Input file is "', inputfile
    print 'Output file is "', outputfile


    now = time.strftime("%c")
   ## date and time representation
    print "Current date & time " + time.strftime("%c")

    sheet = time.strftime("%d-%m-%Y-%H:%M:%S")
    print sheet
    stringsheet = time.strftime("%d-%m-%Y")
    wb = xlwt.Workbook()
    ws = wb.add_sheet(stringsheet)
   
    ##Get data from file
    spattern='data: '
    
    l=0
    with open(inputfile) as f:
        lines=f.readlines()
        for line in lines:
                #print line
                find_list=re.match(spattern, line)
                if find_list:
                    l=l+1
                    #print line
                    tmp_proc_line=line[find_list.end()+1:]
                    proc_line=tmp_proc_line[:-2]
                    print proc_line
                    #match=re.search(r', ',proc_line)
                    #if match:
                    #    val1=proc_line[:match.end()-2]
                    #    print val1
                    #    ws.write(l,1,val1)
                    
                    #trythat=re.findall(r' \w+, \w+, \w+, \w+', proc_line)
                    #trythat=re.findall(r'dog', 'dog cat dog')
                    #trythat=re.findall(r'(\S+), (\S+): (\S+)', 'Doe, John: 555-1212')
                    trythat=re.findall(r'(\S+), (\S+), (\S+), (\S+)', proc_line)
                    if trythat:
 #                       print "trythat  =",trythat                
 #                       print "trythat[0] =",trythat[0]
 #                       print "trythat[0][0] =",trythat[0][0], "trythat[0][1] =", trythat[0][1]
 #                       print "trythat[0][2] =",trythat[0][2], "trythat[0][3] =", trythat[0][3]
                        sample="sampl_%d" % (l)
                        ws.write(l,0,sample)
                        ws.write(l,1,trythat[0][0])
                        ws.write(l,2,trythat[0][3])
                        #print trythat[2]
                        
                        
    #ws.col(0).width = 256 * max([len(row[0]) for row in DATA])
    
    wb.save(outputfile)   
    

if __name__ == "__main__":
    main(sys.argv[1:])