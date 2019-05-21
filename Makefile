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
	rm -rf src
	rm -rf public

package.json:
	npm init --yes
	npm install --save-prod $(PACKAGES)
	npm install --save-dev $(DEV_PACKAGES)


src dist public:
	mkdir $@

webpack.config.js:
	cp make/webpack.config.js $@

tsconfig.json:
	npx tsc --init

src/index.ts: src
	touch src/index.ts

public/index.html: public
	cp make/public/index.html $@

