#!/usr/bin/python

import xlwt
import sys, getopt
import time
import re

def main(argv):
    inputfile = "/home/michele/ForPLP/totalGrades.txt"
    outputfile = ''
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


       
    DATA = (("The Essential Calvin and Hobbes", 1988,),
        ("The Authoritative Calvin and Hobbes", 1990,),
        ("The Indispensable Calvin and Hobbes", 1992,),
        ("Attack of the Deranged Mutant Killer Monster Snow Goons", 1992,),
        ("The Days Are Just Packed", 1993,),
        ("Homicidal Psycho Jungle Cat", 1994,),
        ("There's Treasure Everywhere", 1996,),
        ("It's a Magical World", 1996,),)

    now = time.strftime("%c")
   ## date and time representation
    print "Current date & time " + time.strftime("%c")

    sheet = time.strftime("%d-%m-%Y-%H:%M:%S")
    print sheet
    stringsheet = time.strftime("%d-%m-%Y")
    wb = xlwt.Workbook()
    ws = wb.add_sheet(stringsheet)
    
    ##Get data from file
    STRDATA=""
    tmpSTRDATA=""
    with open(inputfile) as f:
        lines=f.readlines()
        for line in lines:
                print line+"..."
                find_list=re.findall('data: ', line)
                print "find_list is "
                print find_list
        
    for i, row in enumerate(DATA):
     for j, col in enumerate(row):
        ws.write(i, j, col)
    ws.col(0).width = 256 * max([len(row[0]) for row in DATA])
    wb.save("smart.xls")

if __name__ == "__main__":
    main(sys.argv[1:])