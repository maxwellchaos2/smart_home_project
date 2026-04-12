
build_prod_ios:
	@fvm flutter build ipa --dart-define-from-file=config/prod.json

build_prod_android: 
	@fvm flutter build appbundle --dart-define-from-file=config/prod.json

build_prod:  build_prod_ios build_prod_android

build_apk:
	@fvm flutter build apk --dart-define-from-file=config/prod.json


l10n_generate:
	@cd packages/localization && make all


l10n_generate_win:
	@cd packages/localization && make -f MakefileWin all


