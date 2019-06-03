.PHONY: test

include package.mk
SHELL := bash

build-dev:
	npx nodemon --watch webpack.config.js --watch package.json --exec "npx webpack --mode development --watch --progress --verbose"

webpack-dev-server:
	npx nodemon --watch webpack.config.js --watch package.json --exec "npx webpack-dev-server --mode development --port 8080 --hot --content-base public --output-public-path dist"

init: \
	package.json \
	webpack.config.js \
	tsconfig.json \
	public/index.html \
	src/index.ts \
	dist

test-watch:
	npx nodemon --watch jest.config.js --watch test/setup.js --watch .babelrc --exec "npx jest --watchAll"

clean:
	rm -f package.json
	rm -f package-lock.json
	rm -f webpack.config.js
	rm -f tsconfig.json
	rm -rf dist
	rm -rf src
	rm -rf public
	rm -rf node_modules

package.json:
	npm init --yes
	npm install --save-prod $(PACKAGES)
	npm install --save-dev $(DEV_PACKAGES)

webpack.config.js:
	cp make/webpack.config.js $@

tsconfig.json:
	npx tsc --init

src/index.ts: src
	touch src/index.ts

public/index.html: public
	cp make/public/index.html $@

src dist public:
	mkdir $@
