COMMAND:=bash
CTX_PATH := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

image:
	docker build \
		--platform linux/x86_64 \
		--build-arg ctxDefaultTheme=$${ZSH_THEME} \
		-t juneeighteen/ctx -f Dockerfile docker

install: image
	ln -sf $(CTX_PATH)/bin/ctx ~/.bin
	ln -sf $(CTX_PATH)/bin/dctx ~/.bin

shell:
	@docker run \
		-it \
		--platform linux/x86_64 \
		-v ~/.cache/dasdf/$${PREVIOUSCTX}$${CTX}:/cache \
		-e ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=/data/.tool-versions \
		$(shell cat ${ZDOTDIR}/.envchains | xargs -I% echo -e %) \
		-v $${ZDOTDIR}/.tool-versions:/data/.tool-versions:ro \
		-v $${ZDOTDIR}/.tool-plugins.txt:/data/.tool-plugins.txt:ro \
		-v $${PWD}:/workspace \
		juneeighteen/asdf \
		$(COMMAND)

