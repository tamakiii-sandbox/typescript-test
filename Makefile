include package.mk

init: \
	package.json

clean:
	rm package.json

package.json:
	npm init --yes
	npm install $(PACKAGES)

