#######################################################################
# $Header: /cvsroot/swig/SWIG/Examples/test-suite/ruby/Makefile.in,v 1.17 2006/03/07 19:44:37 cfis Exp $
# Makefile for ruby test-suite
#######################################################################

LANGUAGE     = ruby
ifneq (,$(USE_VALGRIND))
RUBY       = valgrind --leak-check=full ruby
else
RUBY       = ruby
endif
SCRIPTSUFFIX = _runme.rb
srcdir       = .
top_srcdir   = ../../..
top_builddir = ../../../

CPP_TEST_CASES = \
	track_objects \
	track_objects_directors \
	primitive_types \
	li_cdata \
	li_cstring \
	naming \
	keywords \
	li_factory 

C_TEST_CASES += \
	li_cdata \
	li_cstring

include $(srcdir)/../common.mk

# Overridden variables here
SWIGOPT += -noautorename


# Rules for the different types of tests

# make sure -autorename is true for the naming test
naming.cpptest: SWIGOPT = -autorename

%.cpptest: 
	$(setup) \
	($(swig_and_compile_cpp); ) &&\
	$(run_testcase)

%.ctest:
	$(setup) \
	($(swig_and_compile_c); ) &&\
	$(run_testcase)

%.multicpptest: 
	$(setup) \
	($(swig_and_compile_multi_cpp); ) &&\
	$(run_testcase)

# Runs the testcase. A testcase is only run if
# a file is found which has _runme.rb appended after the testcase name.
run_testcase = \
	if [ -f $(srcdir)/$(SCRIPTPREFIX)$*$(SCRIPTSUFFIX) ]; then (	  \
	  env LD_LIBRARY_PATH=.:$$LD_LIBRARY_PATH $(RUBY) $(srcdir)/$(SCRIPTPREFIX)$*$(SCRIPTSUFFIX);) \
	fi;

# Clean
%.clean:
	

clean:
	$(MAKE) -f $(top_builddir)/$(EXAMPLES)/Makefile ruby_clean
