ALL=all.md
files=$(shell find . -name "*.md" -not \( -name README.md -o -name $(ALL) \) | sort)

all:
	-@rm $(ALL)
	@$(foreach file, $(files), cat $(file) >> $(ALL); echo >> $(ALL);)
