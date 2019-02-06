FROM runatlantis/atlantis:latest
LABEL authors="Rui Chen <chenrui333@gmail.com>"

ENV TERRAGRUNT_VERSION=v0.17.4

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
		chmod +x terragrunt_linux_amd64 && \
		mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

RUN chown -R atlantis:atlantis /usr/local/bin/atlantis
