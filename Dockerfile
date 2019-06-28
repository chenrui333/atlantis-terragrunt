FROM runatlantis/atlantis:latest
LABEL authors="Rui Chen <chenrui333@gmail.com>"

ENV TERRAGRUNT_VERSION=v0.19.6

RUN curl -s -Lo terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod +x terragrunt && \
    mv terragrunt /usr/local/bin

RUN chown -R atlantis:atlantis /usr/local/bin/atlantis
