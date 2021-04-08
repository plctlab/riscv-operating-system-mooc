SECTIONS_Arithmetic = \
	add \
	add2 \
	sub \
	addi \
	subi \
	neg \
	nop \
	mv \
	lui \
	li

SECTIONS_Logical = \
	and \
	andi \
	not

SECTIONS_Shifting = \
	slli \
	srli \
	srai

SECTIONS_Load_Store = \
	lb \
	lbu \
	sb \
	auipc \
	la

SECTIONS_Branch = \
	bne

SECTIONS_Jump = \
	jalr \

SECTIONS_CallingConventions = \
	cc_leaf \
	cc_nested \

SECTIONS_others = \
	asm2c \
	c2asm

SECTIONS = \
	_first \
	$(SECTIONS_Arithmetic) \
	$(SECTIONS_Logical) \
	$(SECTIONS_Shifting) \
	$(SECTIONS_Load_Store) \
	$(SECTIONS_Branch) \
	$(SECTIONS_Jump) \
	$(SECTIONS_CallingConventions) \
	$(SECTIONS_others)

.DEFAULT_GOAL := all
all :
	@echo "begin compile ALL exercises for assembly samples ......................."
	for dir in $(SECTIONS); do $(MAKE) -C $$dir || exit "$$?"; done
	@echo "compile ALL exercises finished successfully! ......"

.PHONY : clean
clean:
	for dir in $(SECTIONS); do $(MAKE) -C $$dir clean || exit "$$?"; done
