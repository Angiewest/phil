##################### FRED Makefile ###########################

DIRS = bin input_files src populations
FRED_HOME = $(CURDIR)

all:
	@for i in $(DIRS); do \
		echo $$i; \
		(cd $$i; make); \
	done

clean:
	@for i in $(DIRS); do \
		echo $$i; \
		(cd $$i; make clean); \
	done

VER = 2.1.0

release:
	make clean
	(cd ..; tar cvzf FRED-V${VER}-`date +"%Y-%m-%d"`.tgz \
	--exclude CVS --exclude '*~' --exclude '\.*' \
	FRED/Makefile FRED/LICENSE FRED/bin FRED/input_files \
	FRED/populations/2005_2009_ver2_42003.zip FRED/populations/Makefile \
	FRED/src)

tar: clean
	cd ..
	tar cvsf FRED-`date +"%Y-%m-%d"`.tgz FRED --exclude RESULTS



