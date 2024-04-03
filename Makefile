



build-dev:
	docker build -t cuisinator-dev \
		--build-arg RAILS_ENV="development" \
		--build-arg BUNDLE_WITHOUT="" \
		.

run-dev:
	docker run -it cuisinator-dev

shell:
	docker run -it -v `pwd`:/rails cuisinator-dev bash
