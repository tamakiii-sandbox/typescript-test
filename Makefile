include package.mk

init: \
	package.json

clean:
	rm package.json

package.json:
	npm init --yes
	npm install --save-prod $(PACKAGES)
	npm install --save-dev $(DEV_PACKAGES)

