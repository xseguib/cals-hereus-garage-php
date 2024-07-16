.DEFAULT_GOAL := help
.PHONY: help run stop

help:
	@echo ''
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
	@echo ''

APP_NAME ?= "cals_hereus_garage"

KEYS := build exec

define LOOPBODY
  ifneq ($$(filter $$(KEYS),$(v)),)
    RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
    $(eval $(RUN_ARGS):;@:)
  endif
endef

$(foreach v,$(firstword $(MAKECMDGOALS)),$(eval $(LOOPBODY)))

## Available commands
start: ## Starts the container
	@bash scripts/start.sh $(APP_NAME)


stop: ## Stops the container
	@bash scripts/stop.sh $(APP_NAME)


ssh:
	docker exec -it cals_hereus_garage bash
