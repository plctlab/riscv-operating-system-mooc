SECTIONS = \
	11-syscall \

.DEFAULT_GOAL := all
all :
	@echo "begin compile ALL exercises for assembly samples ......................."
	for dir in $(SECTIONS); do $(MAKE) -C $$dir || exit "$$?"; done
	@echo "compile ALL exercises finished successfully! ......"

.PHONY : clean
clean:
	for dir in $(SECTIONS); do $(MAKE) -C $$dir clean || exit "$$?"; done
