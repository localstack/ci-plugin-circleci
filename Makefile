publish-dev:
	circleci orb pack src/ > orb.yml
	circleci orb publish orb.yml localstack/platform@dev:alpha
