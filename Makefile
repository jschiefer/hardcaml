########################################
# hardcaml - hardware design in OCaml
#
#   (c) 2014 MicroJamJar Ltd
#
# Author(s): andy.ray@ujamjar.com
# Description: 
#
########################################

.PHONY: clean all install uninstall 

BUILD_OPTS=

HARDCAML_TGT = _build/HardCaml.cmi _build/HardCaml.cmxa _build/HardCaml.cma _build/HardCaml.a
PA_HARDCAML_TGT = _build/src/pa_hardcaml.cmo _build/src/pa_hardcaml.cmi
HARDCAML_JS_TGT = _build/HardCamlJS.cmi _build/HardCamlJS.cma 

all: 
	ocamlbuild -use-ocamlfind $(BUILD_OPTS) HardCaml.cma HardCaml.cmxa
	ocamlbuild -use-ocamlfind $(BUILD_OPTS) pa_hardcaml.cmo
	ocamlbuild -use-ocamlfind $(BUILD_OPTS) HardCamlJS.cma

####################################################

install: all
	$(SUDO) ocamlfind install hardcaml META \
		$(HARDCAML_TGT) $(HARDCAML_JS_TGT) $(PA_HARDCAML_TGT)

uninstall:
	$(SUDO) ocamlfind remove hardcaml

clean:
	ocamlbuild -clean
	- find . -name "*~" | xargs rm

