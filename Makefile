stack_name=navidrome

# Container
app_container_id = $(shell docker ps --filter name="$(stack_name)_navidrome" -q)

.PHONY: bash
bash:
	docker exec -it -u root $(app_container_id) bash

.PHONY: logs
logs:
	docker service logs -f $(stack_name)_navidrome

.PHONY: deploy
deploy:
	docker stack deploy -c docker-compose.yaml $(stack_name)

.PHONY: deploy-prod
deploy-prod:
	docker stack deploy -c docker-compose-prod.yaml $(stack_name)

.PHONY: undeploy
undeploy:
	docker stack rm $(stack_name)
