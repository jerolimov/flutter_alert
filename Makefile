test:
	dartfmt -n --set-exit-if-changed example lib test
	flutter test

format:
	dartfmt -w example lib test
