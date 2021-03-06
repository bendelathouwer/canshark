##
## This file is part of the libopencm3 project.
##
## Copyright (C) 2014 Frantisek Burian <BuFran@seznam.cz>
##
## This library is free software: you can redistribute it and/or modify
## it under the terms of the GNU Lesser General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This library is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Lesser General Public License
## along with this library.  If not, see <http://www.gnu.org/licenses/>.
##

###############################################################################
# The support makefile for GCC compiler toolchain, the rules part.
#
# please read mk/README for specification how to use this file in your project
#

.PHONY: stylecheck
stylecheck: $(STYLECHECKFILES:=.stylecheck)
	@# empty rule

.PHONY: styleclean
styleclean: $(STYLECHECKFILES:=.styleclean)
	@# empty rule

%.stylecheck:
	$(Q)$(STYLECHECK) $(STYLECHECKFLAGS) src/$* > $(INTERMEDIATE_DIR)$*.stylecheck; \
	if [ -s $(INTERMEDIATE_DIR)$*.stylecheck ]; then \
		cat $(INTERMEDIATE_DIR)$*.stylecheck; \
	else \
		rm -f $(INTERMEDIATE_DIR)$*.stylecheck; \
	fi; \


%.styleclean:
	$(Q)rm -f $(INTERMEDIATE_DIR)$*.stylecheck;

.PHONY: clean
clean: clean-stylecheck

.PHONY: clean-stylecheck
clean-stylecheck:
	@$(PRINTF) "  CLEAN   $@\n"
	-$(Q)$(RM) -rf $(INTERMEDIATE_DIR)*.stylecheck

