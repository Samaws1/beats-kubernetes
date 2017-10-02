ALL = filebeat metricbeat

all: ${ALL:=-kubernetes.yaml}

test: ${ALL:=-test}

clean:
	@for f in $(ALL); do rm -f "$$f-kubernetes.yaml"; done

%-kubernetes.yaml: %/*.yaml
	@echo "Generating $*-kubernetes.yaml"
	@rm -f $*-kubernetes.yaml
	@for f in $(shell ls $*/*.yaml); do \
		echo --- >> $*-kubernetes.yaml; \
		cat $$f >> $*-kubernetes.yaml; \
	done

%-test: %-kubernetes.yaml
	kubectl create -f $*-kubernetes.yaml
