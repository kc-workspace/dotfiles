# Changelog

## [0.2.1](https://github.com/kc-workspace/dotfiles/compare/v0.2.0...v0.2.1) (2024-12-16)


### Bug Fixes

* **docker:** reduce based docker image a little bit ([a24feb7](https://github.com/kc-workspace/dotfiles/commit/a24feb7b5c32d296d6009e9b9edac77bae6b16d7))
* install script cannot remove otherwise, chezmoi will report mismatches ([af80b04](https://github.com/kc-workspace/dotfiles/commit/af80b04305fcc01854a4c287f007a5d32b41fa97))
* migrate asdf to mise ([637266a](https://github.com/kc-workspace/dotfiles/commit/637266af7b92737afc890ca9c5754752dce6395e))
* migrate asdf to mise 2 ([e6e9b22](https://github.com/kc-workspace/dotfiles/commit/e6e9b225f1ab444ba8696f0125ea3c904849055a))
* **mise:** invalid mise config and remove `env._.python.venv` ([bea6ce4](https://github.com/kc-workspace/dotfiles/commit/bea6ce4e2f893eae153774d196f2468d176e6b43))
* missing required package in Linux ([03d11f8](https://github.com/kc-workspace/dotfiles/commit/03d11f87b875545283449392e3fde51e197c52cf))
* **script:** add apt clean after finish ([a99255f](https://github.com/kc-workspace/dotfiles/commit/a99255f803c0b0f971caee48b7dd4b8e4a7d2c2e))
* **script:** add mise doctor and add more tools when run minimal mode ([bd57445](https://github.com/kc-workspace/dotfiles/commit/bd57445521eef48e4767e4eea94a3cad584ed4de))
* **script:** ignore error when doctor failed ([2a157ff](https://github.com/kc-workspace/dotfiles/commit/2a157ffed252b209242cb77ad552964797836214))
* use template instead ([110bbff](https://github.com/kc-workspace/dotfiles/commit/110bbff69cd5e3ad55ea69b2545919803b4788cb))


### Performance Improvements

* **config:** add sort number to run scripts ([b6220ea](https://github.com/kc-workspace/dotfiles/commit/b6220eac5dee39cf7e649028513e51a80a40c196))
* **config:** mise will autoinstall when command not found ([5cb5f47](https://github.com/kc-workspace/dotfiles/commit/5cb5f47993956113ae17c2a9c4f82dc74313b9d9))
* **config:** refactor .tool-versions file ([8f67197](https://github.com/kc-workspace/dotfiles/commit/8f67197639736ac2e3372c0e13cfb996f4097ca6))
* **core:** update source state change ([7103cc0](https://github.com/kc-workspace/dotfiles/commit/7103cc0fe2f1dfdc47f085b44dda1118606f169e))
* **core:** update source state change ([9ef27a2](https://github.com/kc-workspace/dotfiles/commit/9ef27a2248a728c46dfdd5d55ba90bde5af36f35))
* **core:** update source state change ([2420631](https://github.com/kc-workspace/dotfiles/commit/242063193d8931b24f3ac5d160e6f672b60e174e))
* **core:** update source state change ([176b246](https://github.com/kc-workspace/dotfiles/commit/176b2467aee480aadf88d57884b725b86905640e))
* **core:** update source state change ([56fde08](https://github.com/kc-workspace/dotfiles/commit/56fde08be75de9011d9dcb61c60aa21e71d3ae58))
* **core:** update source state change ([369bf4d](https://github.com/kc-workspace/dotfiles/commit/369bf4d0af895711eca081e2de8ec5ac4da31762))
* **core:** update source state change ([20a609d](https://github.com/kc-workspace/dotfiles/commit/20a609d942b1c5cd35e7bd2b0052b5ea0ff38f9f))
* **core:** update source state change ([a271df3](https://github.com/kc-workspace/dotfiles/commit/a271df3fc3c811f67a236bd4b498358467b79eef))
* **docker:** python3 should be install be mise ([3ad657f](https://github.com/kc-workspace/dotfiles/commit/3ad657faf7d803140d7ce56170d8d299a76b1994))
* **mise:** clean install script after installed ([a16825b](https://github.com/kc-workspace/dotfiles/commit/a16825b85a49bd0e9647e6702ee346fedbc58d37))
* **script:** update mise if existed ([5f20995](https://github.com/kc-workspace/dotfiles/commit/5f20995a9c7aca0035b8be1214a5a527cea8f80e))

## [0.2.0](https://github.com/kc-workspace/dotfiles/compare/v0.1.0...v0.2.0) (2024-12-11)


### Features

* add asdf installation as well ([673bb2b](https://github.com/kc-workspace/dotfiles/commit/673bb2b53c66e089ec342edadce554f429335b70))
* add asdf with plugins ([3845bb2](https://github.com/kc-workspace/dotfiles/commit/3845bb2d60e8475f7c3987400d70622e2249332a))
* add docker minimal that remove encrypted file from chezmoi ([b0fef33](https://github.com/kc-workspace/dotfiles/commit/b0fef33bfd75231333b53fdf496dfda479e01ed1))
* install zinit when start apply ([f40193a](https://github.com/kc-workspace/dotfiles/commit/f40193a5216e388e5dd57357c972d221314634ee))
* **script:** improve entrypoint scripts to support minimal docker image and optional 1password gpg ([2674dda](https://github.com/kc-workspace/dotfiles/commit/2674dda296edef6289db6b276a26674ef62699cd))
* upgrade docker file and entrypoint to support gpg from 1password ([b9bce42](https://github.com/kc-workspace/dotfiles/commit/b9bce42998c9d320e504c2d258661cb75c228f56))


### Bug Fixes

* add apt install zsh when run scripts before everything else ([ab6dd31](https://github.com/kc-workspace/dotfiles/commit/ab6dd311ce75e0b149aadf16b7359d9a69ec9e6e))
* do not upgrade dependencies on github actions ([a28d485](https://github.com/kc-workspace/dotfiles/commit/a28d4856a2b193fbb0380bd5a0a7828a98a1e52a))
* move CHEZMOI_ARGUMENTS from dockerfile to *.sh script ([9022693](https://github.com/kc-workspace/dotfiles/commit/90226938d393efd8e1dda7556dca33c8f0520e9e))
* move data directory inside root directory ([b7abff7](https://github.com/kc-workspace/dotfiles/commit/b7abff7bb3618a0a8e7327021ad503e999a28e4c))


### Performance Improvements

* **config:** 1password will support service account in docker image ([c5737f4](https://github.com/kc-workspace/dotfiles/commit/c5737f41f1672894ff3695fde4d14e1c1f047d74))
* **core:** update source state change ([1dd6862](https://github.com/kc-workspace/dotfiles/commit/1dd6862e3c5779c47380645ffdf4a283b681dbf8))
* **core:** update source state change ([d1cd2df](https://github.com/kc-workspace/dotfiles/commit/d1cd2dfde083482a413b9fe7ca5fdb3390a8ce56))
* **core:** update source state change ([2c3ae18](https://github.com/kc-workspace/dotfiles/commit/2c3ae18772836e2ad4cd14962077d7e84b4e271c))
* **core:** update source state change ([a1c60ae](https://github.com/kc-workspace/dotfiles/commit/a1c60aeddfe013dddcd2e45aaeef3d0a9b8fea47))
* **core:** update source state change ([eb70347](https://github.com/kc-workspace/dotfiles/commit/eb703479cfa6962559ef92ea5730b835cdcf87df))
* **docker:** add vim ([dd2bfe6](https://github.com/kc-workspace/dotfiles/commit/dd2bfe61627a549799b83c9105501d8676e36994))
* **docker:** improve image but significately increase docker image size (~300MB to ~600MB) ([d9cb939](https://github.com/kc-workspace/dotfiles/commit/d9cb939f51a33cfca0c7c6661be9057d1d7b99ea))
* **script:** quiet import gpg key ([c2086e2](https://github.com/kc-workspace/dotfiles/commit/c2086e23698bb147f582c3ab063f4976dbd308e2))
* **script:** remove gpg private key after decrypt file ([23b2128](https://github.com/kc-workspace/dotfiles/commit/23b212863cbd42f3209eb18abbf5154e653adbcf))
* update dockerfile with new sudo rules ([35550cc](https://github.com/kc-workspace/dotfiles/commit/35550cc72f9ba05762d60caf0e1a73a5560e3d92))
* update zinit git repository path from ~/.zinit to ~/.local/share/zinit/zinit.git ([6f5fcb8](https://github.com/kc-workspace/dotfiles/commit/6f5fcb831354d1bbc2cf1bd5e4f568bf9e102e0a))

## [0.1.0](https://github.com/kc-workspace/dotfiles/compare/v0.0.1...v0.1.0) (2024-12-09)


### Features

* cancel previous actions when new publish or release trigger ([4e8029d](https://github.com/kc-workspace/dotfiles/commit/4e8029d689d57f5ce7257a1c6b24e617e74cfe9f))
* cancel previous github actions when new publish or release trigger ([#5](https://github.com/kc-workspace/dotfiles/issues/5)) ([4e8029d](https://github.com/kc-workspace/dotfiles/commit/4e8029d689d57f5ce7257a1c6b24e617e74cfe9f))


### Bug Fixes

* change directory owner when copy to docker ([e1d867f](https://github.com/kc-workspace/dotfiles/commit/e1d867f0b83e3347da8a9930a52792d296dc17d1))
* remove legacy env syntax in dockerfile ([#6](https://github.com/kc-workspace/dotfiles/issues/6)) ([61cffd9](https://github.com/kc-workspace/dotfiles/commit/61cffd9b387252257ceddb9433206ef5bf51e14b))
* update deprecate dockerfile ([1e1da06](https://github.com/kc-workspace/dotfiles/commit/1e1da060783cbb1a89be1307af9f0de2bdcc4ce9))
* update docker to remove legacy features ([77dd725](https://github.com/kc-workspace/dotfiles/commit/77dd725bfadc50e06083499bc06ebfb6c9b6c8dd))


### Performance Improvements

* update dockerfile to usable ([6b548a3](https://github.com/kc-workspace/dotfiles/commit/6b548a30135fa58d2e239f29053797fe4011b535))

## 0.0.1 (2024-12-09)


### Features

* add release-please ([fe82181](https://github.com/kc-workspace/dotfiles/commit/fe821819d182704489ec714650c3a4a4c399a32e))
* **zsh:** initiate .zshrc ([3bceba5](https://github.com/kc-workspace/dotfiles/commit/3bceba58b0b2fc63fc7a47629b733424e18b7d30))


### Performance Improvements

* **core:** update source state change ([d46072f](https://github.com/kc-workspace/dotfiles/commit/d46072fe23cd14d4877a9fd26c9e27dc008f63b6))
* **core:** update source state change ([8c0d9ca](https://github.com/kc-workspace/dotfiles/commit/8c0d9ca0231101ffa9bb663943a4e23f227a9a11))
* **core:** update source state change ([8d5b762](https://github.com/kc-workspace/dotfiles/commit/8d5b7623230041982a090c9aee65fdd9dfc0ee17))
* **core:** update source state change ([d605ff7](https://github.com/kc-workspace/dotfiles/commit/d605ff738a804ea19eae72802e258f33acbea414))
* **core:** update source state change ([939dd31](https://github.com/kc-workspace/dotfiles/commit/939dd31e81a8344f7ba1a6282e400912df87f0ca))
* **core:** update source state change ([6be33c1](https://github.com/kc-workspace/dotfiles/commit/6be33c13631342d0a234bb17cba6c45e58137614))
* **core:** update source state change ([f1a20e6](https://github.com/kc-workspace/dotfiles/commit/f1a20e68df5daaebaa92bb2c32188f28221d541d))
* **core:** update source state change ([f5e264d](https://github.com/kc-workspace/dotfiles/commit/f5e264daaa8a643ec4dc72b0c7d1766aa79c49d7))
* **core:** update source state change ([beb5627](https://github.com/kc-workspace/dotfiles/commit/beb5627498c5146aef8f20cbc82d1c85adf47062))
* **core:** update source state change ([2c43408](https://github.com/kc-workspace/dotfiles/commit/2c43408584cd9a6bdb1625869bc4c1b624550070))
* **core:** update source state change ([ddd2484](https://github.com/kc-workspace/dotfiles/commit/ddd248410d4a31fb8f7b661d4a3664ed7a2cb413))
* **core:** update source state change ([42ae1fa](https://github.com/kc-workspace/dotfiles/commit/42ae1fa0fcfc4fd8f0fb8f1203031b5c6e7a0af7))
* **core:** update source state change ([618ffbb](https://github.com/kc-workspace/dotfiles/commit/618ffbb3bb83bd26dc686458115d49c1bc81b19e))
* **core:** update source state change ([349190d](https://github.com/kc-workspace/dotfiles/commit/349190dd19b255d922fb779897443a4cdf54fd2d))
* **core:** update source state changeAdd .chezmoitemplates/.gitkeep ([56890fa](https://github.com/kc-workspace/dotfiles/commit/56890fa92cae8d5a819fb9b6fa97c36fed943111))
