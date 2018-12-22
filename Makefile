build-container:
	docker build -t neighbor/zzz:$(V) -t neighbor/zzz:latest .

release: build-container
	docker push neighbor/zzz:$(V)
	docker push neighbor/zzz:latest

deploy:
	kubectl apply -f deploy/secret.yaml
	kubectl apply -f deploy/deployment.yaml

setup: deploy
