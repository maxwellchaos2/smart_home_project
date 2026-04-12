
all: arb_generate run_gen

arb_generate: 
	@rm -rf arb
	@dart run arb_generator
run_gen: 
	@rm -rf lib/src/l10n
	@fvm flutter gen-l10n