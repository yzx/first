HPLAT?=WIN

ifeq ($(HPLAT),WIN)

HMACH := $(shell uname -m | \
	             tr A-Z a-z | \
	             sed -e s/.*86.*/x86/ \
	                 -e s/sun4u/sparc64/ \
	                 -e s/arm.*/arm/ \
	                 -e s/sa110/arm/ \
	                 -e s/powerpc/ppc/ \
	                 -e s/macppc/ppc/ \
	      )

HKNAME := $(shell uname -s | \
	              tr A-Z a-z | \
	              sed -e s/.*linux.*/linux/ \
	                  -e s/.*cygwin.*/cygwin/ \
	                  -e s/.*mingw.*/mingw/ \
	                  -e s/.*darwin.*/darwin/ \
	       )

HOS := $(shell uname -o | \
	           tr A-Z a-z | \
	           sed -e s/.*gnu.*/gnu/ \
	    )

endif

ifeq ($(HKNAME),linux)
HPLAT=XUN
endif

ifeq ($(HKNAME),darwin)
HPLAT=MAC
endif

