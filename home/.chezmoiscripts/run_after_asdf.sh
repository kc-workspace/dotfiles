#!/usr/bin/env bash

set -e

# shellcheck disable=SC1091
source "$HOME/.asdf/asdf.sh"

asdf update

asdf plugin add 1password https://github.com/kc-workspace/asdf-1password.git
asdf plugin add ansible-core https://github.com/kc-workspace/asdf-ansible-core.git
asdf plugin add ansible https://github.com/kc-workspace/asdf-ansible.git
asdf plugin add argocd https://github.com/kc-workspace/asdf-argocd.git
asdf plugin add aws https://github.com/kc-workspace/asdf-aws.git
asdf plugin add bun https://github.com/kc-workspace/asdf-bun.git
asdf plugin add chezmoi https://github.com/kc-workspace/asdf-chezmoi.git
asdf plugin add cloudflared https://github.com/kc-workspace/asdf-cloudflared.git
asdf plugin add cmctl https://github.com/kc-workspace/asdf-cmctl.git
asdf plugin add codecrafters https://github.com/kc-workspace/asdf-codecrafters.git
asdf plugin add consul https://github.com/kc-workspace/asdf-consul.git
asdf plugin add cookiecutter https://github.com/kc-workspace/asdf-cookiecutter.git
asdf plugin add copier https://github.com/kc-workspace/asdf-copier.git
asdf plugin add eksctl https://github.com/kc-workspace/asdf-eksctl.git
asdf plugin add flutter https://github.com/kc-workspace/asdf-flutter.git
asdf plugin add flux2 https://github.com/kc-workspace/asdf-flux2.git
asdf plugin add gh https://github.com/kc-workspace/asdf-gh.git
asdf plugin add git-chglog https://github.com/kc-workspace/asdf-git-chglog.git
asdf plugin add go-jsonnet https://github.com/kc-workspace/asdf-go-jsonnet.git
asdf plugin add golang https://github.com/kc-workspace/asdf-golang.git
asdf plugin add golangci-lint https://github.com/kc-workspace/asdf-golangci-lint.git
asdf plugin add gomplate https://github.com/kc-workspace/asdf-gomplate.git
asdf plugin add goreleaser https://github.com/kc-workspace/asdf-goreleaser.git
asdf plugin add gradle https://github.com/kc-workspace/asdf-gradle.git
asdf plugin add helm https://github.com/kc-workspace/asdf-helm.git
asdf plugin add hub https://github.com/kc-workspace/asdf-hub.git
asdf plugin add hyperfine https://github.com/kc-workspace/asdf-hyperfine.git
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf plugin add jfrog https://github.com/kc-workspace/asdf-jfrog.git
asdf plugin add jq https://github.com/kc-workspace/asdf-jq.git
asdf plugin add jsonnet-bundler https://github.com/kc-workspace/asdf-jsonnet-bundler.git
asdf plugin add k6 https://github.com/kc-workspace/asdf-k6.git
asdf plugin add kc-tpr https://github.com/kc-workspace/asdf-kc-tpr.git
asdf plugin add kind https://github.com/kc-workspace/asdf-kind.git
asdf plugin add kops https://github.com/kc-workspace/asdf-kops.git
asdf plugin add kubeconform https://github.com/kc-workspace/asdf-kubeconform.git
asdf plugin add kubectl https://github.com/kc-workspace/asdf-kubectl.git
asdf plugin add maven https://github.com/kc-workspace/asdf-maven.git
asdf plugin add mkcert https://github.com/kc-workspace/asdf-mkcert.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add opentofu https://github.com/kc-workspace/asdf-opentofu.git
asdf plugin add operator-sdk https://github.com/kc-workspace/asdf-operator-sdk.git
asdf plugin add pomerium https://github.com/kc-workspace/asdf-pomerium.git
asdf plugin add popeye https://github.com/kc-workspace/asdf-popeye.git
asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add terraform https://github.com/kc-workspace/asdf-terraform.git
asdf plugin add terragrunt https://github.com/kc-workspace/asdf-terragrunt.git
asdf plugin add yamllint https://github.com/kc-workspace/asdf-yamllint.git
asdf plugin add yq https://github.com/kc-workspace/asdf-yq.git

asdf plugin update --all
