selfcheck: checkformat analyze test

analyze:
	dartanalyzer example lib test

checkformat:
	dartfmt -n --set-exit-if-changed example lib test

test:
	flutter test

format:
	dartfmt -w example lib test
