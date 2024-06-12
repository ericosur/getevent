phony: all

all: getevent

clean:
	@rm -f getevent

getevent: getevent.c input.h-labels.h
	@echo gcc -o $@ $<
	gcc -o $@ -O3 getevent.c

#
# $TOP/bionic/libc/kernel/uapi/linux/input-event-codes.h
# just for reference, NG for A14 version
#
input.h-labels.h: generate-input.h-labels.py
	python3 generate-input.h-labels.py input-event-codes.h > input.h-labels.h
