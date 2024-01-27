## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e66 linker.cmd package/cfg/abc_pe66.oe66

# To simplify configuro usage in makefiles:
#     o create a generic linker command file name 
#     o set modification times of compiler.opt* files to be greater than
#       or equal to the generated config header
#
linker.cmd: package/cfg/abc_pe66.xdl
	$(SED) 's"^\"\(package/cfg/abc_pe66cfg.cmd\)\"$""\"D:/253263_2/abc/Debug/configPkg/\1\""' package/cfg/abc_pe66.xdl > $@
	-$(SETDATE) -r:max package/cfg/abc_pe66.h compiler.opt compiler.opt.defs
