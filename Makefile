test:
	dartfmt -n --set-exit-if-changed lib test
	flutter test

format:
	dartfmt -w lib test
