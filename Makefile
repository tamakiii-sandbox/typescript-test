include package.mk
SHELL := bash

build-dev:
	npx webpack --mode development --watch --progress --verbose

webpack-dev-server:
	npx webpack-dev-server --mode development --port 8080 --hot --content-base public --output-public-path dist

init: \
	package.json \
	webpack.config.js \
	tsconfig.json \
	public/index.html \
	src/index.ts \
	dist

clean:
	rm -f package.json
	rm -f webpack.config.js
	rm -f tsconfig.json
	rm -rf dist

package.json:
	npm init --yes
	npm install --save-prod $(PACKAGES)
	npm install --save-dev $(DEV_PACKAGES)

webpack.config.js:
	cp make/webpack.config.js $@

tsconfig.json:
	npx tsc --init

src/index.ts: $(@D)
	touch src/index.ts

public/index.html: $(@D)
	cp make/public/index.html $@

src:
dist:
ublic:
	mkdir $@
