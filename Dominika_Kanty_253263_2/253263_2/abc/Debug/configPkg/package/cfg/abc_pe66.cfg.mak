# invoke SourceDir generated makefile for abc.pe66
abc.pe66: .libraries,abc.pe66
.libraries,abc.pe66: package/cfg/abc_pe66.xdl
	$(MAKE) -f D:\253263_2\abc/src/makefile.libs

clean::
	$(MAKE) -f D:\253263_2\abc/src/makefile.libs clean

