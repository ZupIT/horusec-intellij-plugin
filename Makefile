GO ?= go
ADDLICENSE ?= addlicense
HORUSEC ?= horusec

license:
	$(GO) get -u github.com/google/addlicense
	@$(ADDLICENSE) -check -f ./copyright.txt $(shell find -regex '.*\.\(go\|js\|ts\|yml\|yaml\|sh\|dockerfile\)')

license-fix:
	$(GO) get -u github.com/google/addlicense
	@$(ADDLICENSE) -f ./copyright.txt $(shell find -regex '.*\.\(go\|js\|ts\|yml\|yaml\|sh\|dockerfile\)')

security:
    ifeq (, $(shell which $(HORUSEC)))
		    curl -fsSL https://raw.githubusercontent.com/ZupIT/horusec/main/deployments/scripts/install.sh | bash -s latest
		    $(HORUSEC) start -p="./" -e="true"
    else
		    $(HORUSEC) start -p="./" -e="true"
    endif
