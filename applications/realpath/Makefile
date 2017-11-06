PROG=realpath

.PHONY: install

${PROG}: ${PROG}.c
	gcc -Wall -o $@ $^

install:
	cp -f ${PROG} ./${PROG}