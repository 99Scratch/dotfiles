#!/usr/bin/python

"""
This program parse logs of a dokuwiki
and tranform them for gource (a log viewer)
http://code.google.com/p/gource/

developped by WolverineX02
site : http://wolverinex02.blogspot.com

"""

import os.path
import getopt
import sys
import re


def listdirectory2(path):
	"""list all the files like *.changes, read them and output them in gource's log syntax
	"""
	for root, dirs, files in os.walk(path):
		for i in files:
			if (re.search('\.changes$', i)):
				fichier = os.path.join(root, i)
				myfile = open(fichier, 'r')
				for line in myfile.readlines():
					mots = line.split()
					if len(mots)>=5:
						resultat = mots[0] + "|"
						resultat += mots[4] + "|"
						resultat += translate(mots[2]) + "|"
						resultat += fichier
						print resultat
					elif len(mots)==4:
						resultat = mots[0] + "|Anonymous|"
						resultat += translate(mots[2]) + "|"
						resultat += fichier
						print resultat
	myfile.close()

def translate(mot):
	"""translate the dokuwiki vocabulary to the gource one
	C -> A
	E -> M
	other -> M
	"""
	if mot == "C":
		return "A"
	elif mot == "E":
		return "M"
	else:
		return "M"

def main(argv):
	"""principal function
	"""
	try:
		opts, args = getopt.getopt(argv, "hd:", ["help", "dokuwiki="])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
	for opt, arg in opts:
		if opt in ("-h","--help"):
			usage()
			sys.exit()
		elif opt in ("-d","--dokuwiki"):
			print listdirectory2(arg)


def usage():
	"""this function will display how to use this script
	"""
	print "This script will output change logs of a dokuwiki"
	print "in a friendly way for gource"
	print "how to use it :"
	print "python gourcedoku.py -d ~/Sites/MyDokuwiki/ | sort > dokusort.log"
	print "and then :"
	print "gource --log-format custom dokusort.log --stop-position 1.0 \ "
	print "--stop-on-idle --file-idle-time 10000000"
	print "---"
	print "-h : help "
	print "-d : meta directory of your dokuwiki"


#print listdirectory2(sys.argv[1])

if __name__ == "__main__":
	main(sys.argv[1:])
