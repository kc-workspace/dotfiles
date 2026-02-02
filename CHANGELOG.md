# Changelog

## [0.5.0](https://github.com/kc-workspace/dotfiles/compare/v0.4.0...v0.5.0) (2026-01-31)


### Features

* add Dockerfile for Alpine-based environment setup ([ba4d530](https://github.com/kc-workspace/dotfiles/commit/ba4d530f8c1b366253716efe48a096fa315a8137))
* add linuxbrew to dockerfile ([0500ac2](https://github.com/kc-workspace/dotfiles/commit/0500ac24ad444f5f21817a65ec09234849a0c302))
* add okta-verify to brew ([3f23519](https://github.com/kc-workspace/dotfiles/commit/3f23519be212a493a030df98f4714b73d1f53ec5))
* add support for apk package management in installation scripts ([53ad515](https://github.com/kc-workspace/dotfiles/commit/53ad51556c5f3c09e2b728e0375ff24e202acdff))
* **brew:** add environment configuration for Homebrew settings ([662085a](https://github.com/kc-workspace/dotfiles/commit/662085a5e838354116163ca1b8bf99275eaf8f27))
* **data:** improve dependencies management on chezmoi with platform and os separation ([5751c95](https://github.com/kc-workspace/dotfiles/commit/5751c9587f275046937596bbc88191f132fffc64))
* **deps:** support custom env for HOMEBREW installation ([4436fdf](https://github.com/kc-workspace/dotfiles/commit/4436fdf20b9b0c50b89c8a084313525f56a93f59))
* **docker:** improve dockerfile and build process ([#28](https://github.com/kc-workspace/dotfiles/issues/28)) ([8d9a413](https://github.com/kc-workspace/dotfiles/commit/8d9a413224985ab574d9a207f10f6916294efd3d))
* **docker:** support multiple base image ([6c15df7](https://github.com/kc-workspace/dotfiles/commit/6c15df7cc0775216d3bf262b64394b05d8d86cb2))
* remove prompts database and empty directory ([ad993d6](https://github.com/kc-workspace/dotfiles/commit/ad993d678f45a3b6083e3570a2a70c01cb4bb2d4))
* **script:** support install brew command without install any packages ([9b89df0](https://github.com/kc-workspace/dotfiles/commit/9b89df0f37a0245719b9b411efb940fe03bda36a))
* **script:** update before package.json script to use dynamic rule for loading brew and apts ([5dfba2b](https://github.com/kc-workspace/dotfiles/commit/5dfba2b93e0020d8c29f4f71bc5143d278123a0f))
* set XDG_* for zsh for better cross-platform support ([ba160d8](https://github.com/kc-workspace/dotfiles/commit/ba160d893c8cea144c16505b02eea2842e313a35))
* support install homebrew before if not existed ([f244acd](https://github.com/kc-workspace/dotfiles/commit/f244acd69d00289920e6a40bb08c12bbd857cd3d))
* support rename ghostty title based on Timings syntax ([6f11b37](https://github.com/kc-workspace/dotfiles/commit/6f11b374b5104f50b3819e43646ba0e5dbffb274))
* **tool:** migrate fzf from mise to zinit ([28bd4fc](https://github.com/kc-workspace/dotfiles/commit/28bd4fcd97de68dd0f16e381d1662ec6651cdd1a))
* **zsh:** add aliases for chezmoi status and diff commands ([31dbe2e](https://github.com/kc-workspace/dotfiles/commit/31dbe2ecf8e366245f697c34dace3e79e9af46d5))


### Bug Fixes

* add alpine support for apk package management in dependencies ([2a06130](https://github.com/kc-workspace/dotfiles/commit/2a06130abb516110d1693d9ad0772335347899ff))
* change shebang from bash to sh in script templates ([81918f5](https://github.com/kc-workspace/dotfiles/commit/81918f5e483a53a0724e3f26b68fa5b105e9b910))
* docker and actions platform must have chezmoi installed ([489366f](https://github.com/kc-workspace/dotfiles/commit/489366f810920acbf3aa7100e9e84ef306cf28c6))
* **docker:** escape brew home within quote in case brew home contains space ([b19194f](https://github.com/kc-workspace/dotfiles/commit/b19194fbc41da6fabddb40227e1856fa26ea9fed))
* **docker:** tsdata missing TZ env to set up itself ([43271a6](https://github.com/kc-workspace/dotfiles/commit/43271a6e0ba6d94d6509f7b4bfccaff7b928b78c))
* enable apt autoremove and clean up in Dockerfile ([aa29e0b](https://github.com/kc-workspace/dotfiles/commit/aa29e0b1cae915274090d9e2bed307197ca6cf13))
* history-substring didn't works when zvim is enabled ([c7d157b](https://github.com/kc-workspace/dotfiles/commit/c7d157b084608af4c67b10d8cd183ea73feca265))
* ignore Documents folders on all os except mac ([3fd9c4b](https://github.com/kc-workspace/dotfiles/commit/3fd9c4bb0cc9a8513686ca4203f07fb4d47c2797))
* incorrect set currentOs for package resolver ([203eca1](https://github.com/kc-workspace/dotfiles/commit/203eca107ad924318abf1836e76c63ff826aa843))
* install brew should only run when no brew on current system ([84ae1ab](https://github.com/kc-workspace/dotfiles/commit/84ae1ab6003c1b1e4f62d8dcc6ed4d6b8eb6a422))
* invalid commit template ([b777ace](https://github.com/kc-workspace/dotfiles/commit/b777ace61d0966c87f6de5af1019596b0497161b))
* invalid function name in templete ([a09d2ab](https://github.com/kc-workspace/dotfiles/commit/a09d2ab9f3ca13a1ce7a2a1856e4be7c1eb9111b))
* never add final newline on templates file ([f001d06](https://github.com/kc-workspace/dotfiles/commit/f001d064667f573ecccf53372ed29eb03936c164))
* **nvim:** install tree-sitter-cli as required by new lazyvim ([ac102d5](https://github.com/kc-workspace/dotfiles/commit/ac102d56386cb0c3365b2f18510cff4a7fff4b06))
* **package:** homebrew/bundle have migrated to core and docker to docker-desktop ([4ae2b2d](https://github.com/kc-workspace/dotfiles/commit/4ae2b2de08ad2aeede68b38c3ae9e654843a5c1e))
* **package:** when install package, find brew cli from wellknown location since shell is not init yet ([5ba86a3](https://github.com/kc-workspace/dotfiles/commit/5ba86a3552702885c93333387f73421e203a553d))
* **script:** all keys in homebrew packages are optional ([56349cd](https://github.com/kc-workspace/dotfiles/commit/56349cd1dc12ec7deb3b9e6d475863de959db71d))
* **toml:** correct spacing in KUBECONFIG assignment ([e60b4f7](https://github.com/kc-workspace/dotfiles/commit/e60b4f777031fce4b7f585a4dd286e28dd5466ad))
* update Dockerfile path handling for Alpine images ([7f469ca](https://github.com/kc-workspace/dotfiles/commit/7f469ca0be04d7bfb97b174d69b97f744f6499c6))
* update Dockerfile to clarify dependency installation comments ([d369597](https://github.com/kc-workspace/dotfiles/commit/d3695976dae60c5c40ca6ca91f63f68d692179ca))
* update workflow ci to latest strict rules ([6e0283a](https://github.com/kc-workspace/dotfiles/commit/6e0283abc3c4e16e4df51177f986483c37294cd9))
* **zsh:** autosuggest text should be clear when search history ([0909ca7](https://github.com/kc-workspace/dotfiles/commit/0909ca7806a44433c7ac5b93553e0b8bfa51cf3f))
* **zsh:** bindkey now works with zsh-vi-mode ([6655088](https://github.com/kc-workspace/dotfiles/commit/6655088d5adc58bf189309010279e84fc3e41077))
* **zsh:** remove unnecessary blank line before ZINIT_HOME setup ([aa825b8](https://github.com/kc-workspace/dotfiles/commit/aa825b834259ba648f8383a309e8b4f6508e4ab7))
* **zsh:** update homebrew set up to support custom directory via HOMEBREW_PREFIX and linuxbrew ([b9e2227](https://github.com/kc-workspace/dotfiles/commit/b9e2227ba9a7bd85c591bc24310266f098553356))


### Performance Improvements

* **brew:** show install times by default ([d54bd3a](https://github.com/kc-workspace/dotfiles/commit/d54bd3a4fea7e8103c2113fd2090cdd9552a29ce))
* **config:** migrate .tool-versions to mise.toml and upgrade chezmoi v2.64.0 -&gt; v2.69.1 ([8e8f5e2](https://github.com/kc-workspace/dotfiles/commit/8e8f5e2a43ecd98609bf5e8f7f4ab2c0a78d5b89))
* **core:** update .ssh/config with latest ip/servers ([3ee54bd](https://github.com/kc-workspace/dotfiles/commit/3ee54bdd6f41b4c2c7eb9c1ba6f6b4fb52b02e3c))
* **core:** update source state change ([a1877c1](https://github.com/kc-workspace/dotfiles/commit/a1877c16af760f8e038524bbe2f6f0a6e477b229))
* **core:** update source state change ([0e86f73](https://github.com/kc-workspace/dotfiles/commit/0e86f734df5281f3de91d98ba491889807c1d423))
* **core:** update source state change ([e3b7d13](https://github.com/kc-workspace/dotfiles/commit/e3b7d13aca3f4befafbcbbb70633ef53f5c8740a))
* **core:** update source state change ([5481171](https://github.com/kc-workspace/dotfiles/commit/54811710a3b8df3da718af6d3ace0029d4329e6a))
* **core:** update source state change ([7e12dda](https://github.com/kc-workspace/dotfiles/commit/7e12dda67429f879515af73b70d3be4227b3f8cf))
* **core:** update source state change ([2c4a738](https://github.com/kc-workspace/dotfiles/commit/2c4a73840a21ca297b89741a2680af2a85319e90))
* **core:** update source state change ([63e8091](https://github.com/kc-workspace/dotfiles/commit/63e8091938f595553c66a03844ac54a777229c7d))
* **core:** update source state change ([ddb0d16](https://github.com/kc-workspace/dotfiles/commit/ddb0d16c1a56a7cb4d5dfd383af80a5acff40fc7))
* **core:** update source state change ([14e4a72](https://github.com/kc-workspace/dotfiles/commit/14e4a72f81177d6af00ccbc410b44e869f6d7c9e))
* **core:** update source state change ([762754e](https://github.com/kc-workspace/dotfiles/commit/762754ef43b135eacae637d68e721b448bdf392f))
* **core:** update source state change ([3776d38](https://github.com/kc-workspace/dotfiles/commit/3776d38e315cf1a4586b727090d455f9d61530a6))
* **core:** update source state change ([2857038](https://github.com/kc-workspace/dotfiles/commit/2857038298a3865aa12759f1f065236e8fe693ea))
* **core:** update source state change ([84c0ef7](https://github.com/kc-workspace/dotfiles/commit/84c0ef729acea2895d512a7371bd96999bba1471))
* **core:** update source state change ([93a63e8](https://github.com/kc-workspace/dotfiles/commit/93a63e84b75a7d18258c7b6e0147de9a891fb236))
* **core:** update source state change ([91a2031](https://github.com/kc-workspace/dotfiles/commit/91a20311c2315d3782353a55bc93d757766ac5fc))
* **core:** update source state change ([59070a6](https://github.com/kc-workspace/dotfiles/commit/59070a617c0ec0da83b4f14895f1d20ead281c31))
* **core:** update source state change ([0c37b5a](https://github.com/kc-workspace/dotfiles/commit/0c37b5ac7621e72cc392a9d464b067400867135c))
* **core:** update source state change ([36d8c04](https://github.com/kc-workspace/dotfiles/commit/36d8c047be32f95887510fc4f843cf4979e270a0))
* **core:** update source state change ([f18e6f8](https://github.com/kc-workspace/dotfiles/commit/f18e6f83b2f6f2a3161db0a51f2e4f1e16c443f1))
* **core:** update source state change ([01af2c5](https://github.com/kc-workspace/dotfiles/commit/01af2c58ad9616d5f78eb43a73832944fd2c5db0))
* **core:** update source state change ([71e6e2c](https://github.com/kc-workspace/dotfiles/commit/71e6e2c7402e8b709dafb9fb9f88a5afa619df6d))
* **data:** disable XCode for install by default ([649fb9e](https://github.com/kc-workspace/dotfiles/commit/649fb9e029512206925fb282ff7854f25575278f))
* delete unused file ([81a8e38](https://github.com/kc-workspace/dotfiles/commit/81a8e387d05ad2ad56147e565c76c9b9ba02a2e2))
* **docker:** avoid duplicate installation since linuxbrew will be install via chezmoi script anyway ([94284f6](https://github.com/kc-workspace/dotfiles/commit/94284f6670bda821ab9feab72dd70dc56d4a7a17))
* **docker:** improve dockerfile to minimize unused files ([49bd675](https://github.com/kc-workspace/dotfiles/commit/49bd675c8a1537298fe8ea32e10572306514792f))
* **docker:** support dynamic set KCDF_REPO, KCDF_REF, and KCDF_SHA variable via github actions ([343d4f5](https://github.com/kc-workspace/dotfiles/commit/343d4f5f87d33cf504ef9b861a0356cc94cc3b9e))
* **mise:** upgrade global mise configuration ([b002724](https://github.com/kc-workspace/dotfiles/commit/b002724cabb3947d630e91dee6066722c425d170))
* **mise:** use shell alias for admin script instead of task in mise Works ([11308b6](https://github.com/kc-workspace/dotfiles/commit/11308b6e85dbbd9d1c94b1a41f8a4ab218409dc8))
* move .chezmoitemplates from root to /home path ([ca4ac28](https://github.com/kc-workspace/dotfiles/commit/ca4ac28db4209b56eb948eb92addccbb6fd38ea9))
* **package:** add prerequisite dependencies on ubuntu to ensure install will pass ([faa4719](https://github.com/kc-workspace/dotfiles/commit/faa47191e1d84bc68008b1bba2f39ea41b8de526))
* **package:** update package.yaml to support different types of package manager ([71b04a4](https://github.com/kc-workspace/dotfiles/commit/71b04a431d0cff19dfd480c3c1fc56c13c63e49a))
* remove lock file from managed by chezmoi ([c3edc88](https://github.com/kc-workspace/dotfiles/commit/c3edc882566d9dbfcb91f61619e3b11fb485fb35))
* remove unnecessary init and cdreplay ([4d5e38d](https://github.com/kc-workspace/dotfiles/commit/4d5e38dcf6b6fad3ce2d4e2910164a653ea56b80))
* **starship:** update commit ahead color from purple to green ([d5d9c1e](https://github.com/kc-workspace/dotfiles/commit/d5d9c1ef44802879d2ce0e7159fa2b6fde39f1dc))
* sync changes from target directory ([2d703a4](https://github.com/kc-workspace/dotfiles/commit/2d703a4a9a490bad924be9bfd7fb3c8371693c14))
* sync target and source directories ([06ffff6](https://github.com/kc-workspace/dotfiles/commit/06ffff67b64531c42648d4b8613b2da40510945d))
* sync target and source directories ([cb9238d](https://github.com/kc-workspace/dotfiles/commit/cb9238d23f0234c70592a6b9f2fcced649575fe9))
* sync target and source directories ([0d69d10](https://github.com/kc-workspace/dotfiles/commit/0d69d10ab7e8e317fbf5f939688f6e21144b214f))
* sync target and source directories ([33439ab](https://github.com/kc-workspace/dotfiles/commit/33439ab7676701e32114b501382c4b3dd05b2462))
* sync target and source directories ([701d22d](https://github.com/kc-workspace/dotfiles/commit/701d22d52ccd13cd9a9cecd83d73d6219f3b16d2))
* sync target and source directories ([9d86f96](https://github.com/kc-workspace/dotfiles/commit/9d86f961e4cf5f14f6bcd81fee07e7bdf74cb52f))
* sync target and source directories ([4495a8e](https://github.com/kc-workspace/dotfiles/commit/4495a8ec6784398d402a4db0a72ac33719d01d70))
* sync target and source directories ([21341a8](https://github.com/kc-workspace/dotfiles/commit/21341a874543e7519136c485b86c07091efc306f))
* sync target and source directories ([3e7c2c5](https://github.com/kc-workspace/dotfiles/commit/3e7c2c5f31a0fcc51cac3135585947f92c28fecc))
* **zsh:** add apps support lazy config ([bd617fb](https://github.com/kc-workspace/dotfiles/commit/bd617fb826c40fe840396bbefab3f5d50e479cb3))

## [0.4.0](https://github.com/kc-workspace/dotfiles/compare/v0.3.3...v0.4.0) (2025-08-21)


### Performance Improvements

* **config:** add push.autoSetupRemote=true for set up remote on first branch ([c6b3f58](https://github.com/kc-workspace/dotfiles/commit/c6b3f58a33f3eb8720a95e37deb3429fba712bf0))
* **core:** update source state change ([6e2eaf8](https://github.com/kc-workspace/dotfiles/commit/6e2eaf81bd2e24979ee06c0202f6e87241db273f))
* **core:** update source state change ([82832df](https://github.com/kc-workspace/dotfiles/commit/82832dfc0c35393ae5843953f40325f4e6a0f866))
* **core:** update source state change ([86e30c4](https://github.com/kc-workspace/dotfiles/commit/86e30c4ca71c6d56dc85f5c7fe105c08b2d21486))
* **core:** update source state change ([09e2b67](https://github.com/kc-workspace/dotfiles/commit/09e2b67ef019575f1d770565aa76b96cff45749d))
* **core:** update source state change ([1cadb7f](https://github.com/kc-workspace/dotfiles/commit/1cadb7f3feac28d1556232b8f8746768fe330113))
* **core:** update source state change ([dfa5a41](https://github.com/kc-workspace/dotfiles/commit/dfa5a4175609c83d9a3022dd7416b311b49553d7))
* **deps:** upgrade chezmoi from v2.62.6 to v2.64.0 ([8b76372](https://github.com/kc-workspace/dotfiles/commit/8b763722500198ba274382fec6acc4c2dc390661))


### Miscellaneous Chores

* release 0.4.0 ([5951c44](https://github.com/kc-workspace/dotfiles/commit/5951c445127d92e8a57258322bdf9e78f78cc2f5))

## [0.3.3](https://github.com/kc-workspace/dotfiles/compare/v0.3.2...v0.3.3) (2025-06-22)


### Bug Fixes

* **config:** reduce docker startup times by install zinit plugins on build time ([b31d47b](https://github.com/kc-workspace/dotfiles/commit/b31d47bcc209c5b44776d4aae22e3acf08604170))
* **config:** update invalid .chezmoiversion file ([b1aaec3](https://github.com/kc-workspace/dotfiles/commit/b1aaec3157a35f1d846b3b8cc8f8ea2cd4168db3))
* **config:** wrong dockerfile step ([2bcf114](https://github.com/kc-workspace/dotfiles/commit/2bcf114eeff5729296a7321f078d360a92f5e2b8))
* **package:** update builtin packages with mise to latest name ([f4234e9](https://github.com/kc-workspace/dotfiles/commit/f4234e9e2100ecc952ac08cb493cea64022c0033))


### Performance Improvements

* add cosign to brew install ([3e7b97e](https://github.com/kc-workspace/dotfiles/commit/3e7b97eecb98c8d2fd215746a1e66e47c34111c8))
* **config:** update zinit when build docker image instead of when run ([9ed2a43](https://github.com/kc-workspace/dotfiles/commit/9ed2a436863913d653099ba9ba97294c9e43c2cd))
* **config:** use .chezmoiversion instead of hard code version on dockerfile ([d42b614](https://github.com/kc-workspace/dotfiles/commit/d42b614dd44e1870299c039213caecd1e79edeb4))
* **core:** update source state change ([3632c4d](https://github.com/kc-workspace/dotfiles/commit/3632c4dc82fbd73b8c062941e9b046f8d7ab0778))
* **core:** update source state change ([22a73d0](https://github.com/kc-workspace/dotfiles/commit/22a73d0c11727cf6ad81161592b2991414b2e1bc))
* **core:** update source state change ([597e3be](https://github.com/kc-workspace/dotfiles/commit/597e3be974b7056925b5246376dc4c306701df70))
* **core:** update source state change ([a5b7926](https://github.com/kc-workspace/dotfiles/commit/a5b79265b7d1c3e064621c6d5af1f03942287421))
* **core:** update source state change ([c29c4c1](https://github.com/kc-workspace/dotfiles/commit/c29c4c1779edc8acdf8793914476c63ff799340e))
* **core:** update source state change ([50907cf](https://github.com/kc-workspace/dotfiles/commit/50907cfe76bd0efd4fa7c20c8748a7d6edbb2994))
* **core:** update source state change ([2077310](https://github.com/kc-workspace/dotfiles/commit/207731001379f47ac89e27cd7d7f31cf2b3e167e))
* **deps:** upgrade chezmoi from v2.56.0 to v2.62.6 ([a7ecbc5](https://github.com/kc-workspace/dotfiles/commit/a7ecbc58f4894d43a01b2ce43bf7fc8b9fa4a3d5))
* **deps:** upgrade chezmoi version ([7c6014a](https://github.com/kc-workspace/dotfiles/commit/7c6014abbe948fc1919fcf8c6d5784b4eb11251e))
* **package:** remove hard code package from package.yaml file for mise and only relate on mise.toml config ([e2ade73](https://github.com/kc-workspace/dotfiles/commit/e2ade73128d1c14d1165caf20c687af916fe3fd5))

## [0.3.2](https://github.com/kc-workspace/dotfiles/compare/v0.3.1...v0.3.2) (2025-05-29)


### Bug Fixes

* **config:** gitconfig includeIf must contains trailling slash ([c4d4b05](https://github.com/kc-workspace/dotfiles/commit/c4d4b056c3ed9f72db6eb50009d76a33d1994bdb))
* **wezterm:** increase opacity of background to avoid missing text ([b84a3aa](https://github.com/kc-workspace/dotfiles/commit/b84a3aad92d065c0bd2a0a8a0c818d5d3b308dd0))


### Performance Improvements

* add more dependencies on brew packages ([3611904](https://github.com/kc-workspace/dotfiles/commit/361190405538fc853c02a5e61274d9120b52d272))
* **core:** update source state change ([a2578f3](https://github.com/kc-workspace/dotfiles/commit/a2578f31c5b1a13bad1b6795817ce40d5b20cfe4))
* **core:** update source state change ([69affb8](https://github.com/kc-workspace/dotfiles/commit/69affb8881545e22cec5aa37b79943adfd101253))
* **core:** update source state change ([37017e1](https://github.com/kc-workspace/dotfiles/commit/37017e1fb48f14dc20182ee612713248a91bf30c))
* **core:** update source state change ([fbcece9](https://github.com/kc-workspace/dotfiles/commit/fbcece9e69ef8938284832f4e797aacc8c4356ec))
* **core:** update source state change ([abde7a9](https://github.com/kc-workspace/dotfiles/commit/abde7a91bc9253022c4a076e7e3a7bfa0374b1c5))
* **core:** update source state change ([cef4323](https://github.com/kc-workspace/dotfiles/commit/cef4323752f5b4bfd4739534b1082139f0cd37f9))
* **core:** update source state change ([da6d90f](https://github.com/kc-workspace/dotfiles/commit/da6d90fda5dfe04fee3b5eba70ee25e0e3cdf77c))
* **core:** update source state change ([a1520c5](https://github.com/kc-workspace/dotfiles/commit/a1520c5f1ac282db7afea7a9b0baa90c65b6678a))
* **core:** update source state change ([8466fb8](https://github.com/kc-workspace/dotfiles/commit/8466fb85e4a4279747b8c85639f00cd66cfaa71b))
* **core:** update source state change ([5cbf915](https://github.com/kc-workspace/dotfiles/commit/5cbf9152420a9a9f19c2387474f596186ea42791))
* **core:** update source state change ([4ea8869](https://github.com/kc-workspace/dotfiles/commit/4ea8869cf79a9d87cdc55bb7e80d9d1ccd6fa4b4))
* **core:** update source state change ([812b58a](https://github.com/kc-workspace/dotfiles/commit/812b58ae60222d1d78021ec7b4beb6c7fb79381d))
* **core:** update source state change ([e7426f1](https://github.com/kc-workspace/dotfiles/commit/e7426f1f221d736aeecee10899e3fb1e1b420511))
* **core:** update source state change ([d50392a](https://github.com/kc-workspace/dotfiles/commit/d50392a5011ab464d800781d39f5e152c698df55))
* **core:** update source state change ([3c1af7f](https://github.com/kc-workspace/dotfiles/commit/3c1af7f0c86d0c37584598b7d5e46032338e0af2))
* **core:** update source state change ([644b536](https://github.com/kc-workspace/dotfiles/commit/644b536d03d90c0793edf48bd728dad5548d4aeb))
* **core:** update source state change ([baf4187](https://github.com/kc-workspace/dotfiles/commit/baf41878b8753a49ef40e28f0e0d45f2c428e515))
* **core:** update source state change ([f913479](https://github.com/kc-workspace/dotfiles/commit/f913479a70e69bb284d5ee7f5be3f17ee563c9a7))
* **core:** update source state change ([87baa30](https://github.com/kc-workspace/dotfiles/commit/87baa30e83a380c056891e62d3193257b07a5155))
* **core:** update source state change ([e08585e](https://github.com/kc-workspace/dotfiles/commit/e08585ec76871659a587d0a11451970ec5155187))
* **core:** update source state change ([1528f85](https://github.com/kc-workspace/dotfiles/commit/1528f8501e50ec25bdd1f859d0e22f965e99f81a))
* **core:** update source state change ([348452a](https://github.com/kc-workspace/dotfiles/commit/348452a42d2d74adf9f2cab3a7bb5f3182a3ce9c))
* **core:** update source state change ([7b924fd](https://github.com/kc-workspace/dotfiles/commit/7b924fd8611136b5fd1bfc419cd68868d8dc7973))
* **core:** update source state change ([988ab49](https://github.com/kc-workspace/dotfiles/commit/988ab49a6380e40260a63b6cc699573808b83608))
* **core:** update source state change ([a665294](https://github.com/kc-workspace/dotfiles/commit/a665294470a66b7aaf7e7908acb5bda69132f338))
* **core:** update source state change ([a8148ec](https://github.com/kc-workspace/dotfiles/commit/a8148ec09d5b94480bb9d1e20b055389ac0bab06))
* **core:** update source state change ([5fdf8fd](https://github.com/kc-workspace/dotfiles/commit/5fdf8fd8b98e76a876cba5186b04f30e4d951bc4))
* **core:** update source state change ([2afa5e6](https://github.com/kc-workspace/dotfiles/commit/2afa5e6e290c4ff3917adcea20a59049e730a9c4))
* **core:** update source state change ([05d95ae](https://github.com/kc-workspace/dotfiles/commit/05d95ae70ea8615b35066062b7d3c2caa79c058e))
* **core:** update source state change ([40155ba](https://github.com/kc-workspace/dotfiles/commit/40155ba9d9b8bb3cc6674dad678f958395ea6333))
* **core:** update source state change ([c704dbe](https://github.com/kc-workspace/dotfiles/commit/c704dbe7a64e215c08c7f03ac890882ccad60c9c))
* **mac:** add chatgpt and claude apps ([81a517a](https://github.com/kc-workspace/dotfiles/commit/81a517a0482e027aae835529c4dca56581fac988))
* **zsh:** add more kube & helm alias ([11f2837](https://github.com/kc-workspace/dotfiles/commit/11f28376c409998be1f864160e02c9065cf412aa))

## [0.3.1](https://github.com/kc-workspace/dotfiles/compare/v0.3.0...v0.3.1) (2024-12-24)


### Bug Fixes

* remove deployment flow for linux/arm/v7 ([040a191](https://github.com/kc-workspace/dotfiles/commit/040a191f70efd940e4b6e5a1a9f2c3ea9936332d))

## [0.3.0](https://github.com/kc-workspace/dotfiles/compare/v0.2.1...v0.3.0) (2024-12-23)


### Features

* **chezmoi:** add completion ([6b08ab0](https://github.com/kc-workspace/dotfiles/commit/6b08ab07bd19690b1a8326356203d213dc8f038d))
* **docker:** chezmoi didn't everything when build docker (except encrypted files) ([7294f37](https://github.com/kc-workspace/dotfiles/commit/7294f3753d1048ccbd905567141007b418e28d03))
* **script:** add setup-*.sh and cleanup-*.sh to initiate chezmoi with secrets ([4959ce8](https://github.com/kc-workspace/dotfiles/commit/4959ce8c34dce6e4f92e97f313eda3f89f72dbf5))
* support mise completions ([68624e6](https://github.com/kc-workspace/dotfiles/commit/68624e6a1218afee7c687c30c6e9752c0180ba55))
* **zsh:** update command mapping and minor changes ([7142a2e](https://github.com/kc-workspace/dotfiles/commit/7142a2ed5d4a20779723151347d2ae7f65556e66))


### Bug Fixes

* **docker:** chezmoi --purge-binary needs --force to always say yes when prompt ([d3bf96c](https://github.com/kc-workspace/dotfiles/commit/d3bf96c20a0f24cfaca6640c5b6525f4c53ca380))
* **docker:** properly set up locale ([2fa24d4](https://github.com/kc-workspace/dotfiles/commit/2fa24d4ef116db75f587fe16fd57e879c3ecf56e))
* **docker:** update document and improve github token passing to docker build ([62fc7aa](https://github.com/kc-workspace/dotfiles/commit/62fc7aac5d2331d35de5e5beb9dbaff26680bfa7))
* history didn't works as expected with substring and atuin plugins ([af40091](https://github.com/kc-workspace/dotfiles/commit/af40091a7ebc4f978a63e109e317f3e4a8386533))
* improve run scripts ([2c18fdf](https://github.com/kc-workspace/dotfiles/commit/2c18fdfb897119e5852c0479b97a1762154eaac2))
* **mise:** disable nvim on linux/arm64 machine ([f7a7703](https://github.com/kc-workspace/dotfiles/commit/f7a7703b1a2854bf0005f31398d856f6ad174bd6))
* move check to setup script so it works on github actions ([43ad410](https://github.com/kc-workspace/dotfiles/commit/43ad410e23e00817fdf5a097a8dade8507b80de1))
* **script:** install gh, op, and jq for setup-secrets.sh ([3ece8a5](https://github.com/kc-workspace/dotfiles/commit/3ece8a52f8faa7e7f4e79ed1b654bd22a536060b))
* **script:** merge conflict cause mise activate to be removed ([04f1164](https://github.com/kc-workspace/dotfiles/commit/04f116428116d7c39c53a136752c3b58cdfd6c2d))
* **script:** mise didn't install package because wrong initiate variable ([fa5009a](https://github.com/kc-workspace/dotfiles/commit/fa5009a5cda158bce1742bbc9e15604e2ab5c30b))
* **script:** reuse GITHUB_TOKEN env if existed ([333f676](https://github.com/kc-workspace/dotfiles/commit/333f67656a79128312fee1c260d9c76203230453))
* **script:** use script to install mise instead of externals install file to avoid persist install script locally ([eeeabf3](https://github.com/kc-workspace/dotfiles/commit/eeeabf3bcbe1b3dd4ecd463ef7af29004595f23b))
* **tool:** reduce number of tools in default mise ([3e4d05e](https://github.com/kc-workspace/dotfiles/commit/3e4d05ed39ef071afb0b0a6f5fa452a523e7db86))
* **zsh:** brew must not run on turbo mode ([f4c5889](https://github.com/kc-workspace/dotfiles/commit/f4c58898bbab6786cdce52201a6d27d5d24edc6a))
* **zsh:** change alias r =&gt; c (for clear) and c => p (for bat) ([5291246](https://github.com/kc-workspace/dotfiles/commit/5291246870d035142b51b0b8f3e0ef50b97bb496))
* **zsh:** zinit update didn't download plugins listed on zshrc ([b101c0b](https://github.com/kc-workspace/dotfiles/commit/b101c0bede5eb22d88e104dbb3d71ab1c284b400))


### Performance Improvements

* **core:** update source state change ([7ef9e10](https://github.com/kc-workspace/dotfiles/commit/7ef9e1021dad8d359745d3483c6c658b164f4443))
* **core:** update source state change ([ed73719](https://github.com/kc-workspace/dotfiles/commit/ed73719217167616a72d574068aa3496304d56f6))
* **core:** update source state change ([cf0fbca](https://github.com/kc-workspace/dotfiles/commit/cf0fbcaeb00205ca929168e746130f87da6365a9))
* **core:** update source state change ([29ec050](https://github.com/kc-workspace/dotfiles/commit/29ec0506d33fbd811b6a11a8a7b84726bd4fa1f7))
* **core:** update source state change ([4cde96a](https://github.com/kc-workspace/dotfiles/commit/4cde96ae304d90368ea7fb305e4af54746d805f3))
* **core:** update source state change ([baddbcf](https://github.com/kc-workspace/dotfiles/commit/baddbcf7ff3013a2b1019d1f4ba0bedad49afe5d))
* **core:** update source state change ([8caebc7](https://github.com/kc-workspace/dotfiles/commit/8caebc751b4e230b986b93451cf4c57c52445937))
* **core:** update source state change ([0549b8f](https://github.com/kc-workspace/dotfiles/commit/0549b8f1a2e6bb78994635b030d273b5118605df))
* **core:** update source state change ([58d9701](https://github.com/kc-workspace/dotfiles/commit/58d97010735cb323d739191b55a715ea586eef72))
* **core:** update source state change ([fd6ab97](https://github.com/kc-workspace/dotfiles/commit/fd6ab97cf2de1af297ffe38416a7b54ded968ee6))
* **core:** update source state change ([83c70ff](https://github.com/kc-workspace/dotfiles/commit/83c70ffe3d4e3d78b63605bf3c0383843d0e9fac))
* **core:** update source state change ([8b4e521](https://github.com/kc-workspace/dotfiles/commit/8b4e521102a6dba48b613c30aa468f7c2f5666a9))
* **core:** update source state change ([d8274c1](https://github.com/kc-workspace/dotfiles/commit/d8274c14097d0c1af377c87e1bc92a44ac39b0a2))
* **core:** update source state change ([e981c3b](https://github.com/kc-workspace/dotfiles/commit/e981c3bb49c2557d5d75f00702816c60193e9836))
* **core:** update source state change ([da3ebd1](https://github.com/kc-workspace/dotfiles/commit/da3ebd16ba86c3b23a6d80346ba70adcf335af73))
* **core:** update source state change ([131b65b](https://github.com/kc-workspace/dotfiles/commit/131b65be8c1c0bd08b7fef1fed417996238c9213))
* **core:** update source state change ([65c0b08](https://github.com/kc-workspace/dotfiles/commit/65c0b082edb7f81180349062c1d87829cdc78cc8))
* **core:** update source state change ([b209602](https://github.com/kc-workspace/dotfiles/commit/b2096024c896565227069f06017e655208b6deee))
* **core:** update source state change ([2a8da53](https://github.com/kc-workspace/dotfiles/commit/2a8da5343b74d69a6435fe7566a120e0429f0634))
* **core:** update source state change ([5820f67](https://github.com/kc-workspace/dotfiles/commit/5820f67d9aabb4a436ea9378d3d09d0a0dc08cd6))
* **core:** update source state change ([c19357b](https://github.com/kc-workspace/dotfiles/commit/c19357b730a3cc5fa3f1c8e1d94679491746782c))
* **core:** update source state change ([74e1466](https://github.com/kc-workspace/dotfiles/commit/74e1466a0d4e4461e26aaaf4ffeb15a7dbcbb629))
* **core:** update source state change ([cf5cfaa](https://github.com/kc-workspace/dotfiles/commit/cf5cfaacf627fcd46712b2bfcf812d8dc6432fdc))
* **core:** update source state change ([bbd4e19](https://github.com/kc-workspace/dotfiles/commit/bbd4e191b7290a7af780ad48e1ab1cbd30560d79))
* **core:** update source state change ([6211ffa](https://github.com/kc-workspace/dotfiles/commit/6211ffac7ae9749991783ae8bb7d0c211373fb94))
* **core:** update source state change ([228bea0](https://github.com/kc-workspace/dotfiles/commit/228bea0cd5ac95a678d43aafe59761cdb42d321f))
* **core:** update source state change ([64387b4](https://github.com/kc-workspace/dotfiles/commit/64387b476ec975a64607bf475247832b4c61f4e4))
* **core:** update source state change ([7ef0fe0](https://github.com/kc-workspace/dotfiles/commit/7ef0fe0aad0914c75239fa1bba13aa0be96137d6))
* **core:** update source state change ([56c2de3](https://github.com/kc-workspace/dotfiles/commit/56c2de33937d1661025d9b30f7981e59130d2430))
* **core:** update source state change ([12bdc93](https://github.com/kc-workspace/dotfiles/commit/12bdc933750dbf70f59845503e99c8f9d27688db))
* **core:** update source state change ([3f75b7a](https://github.com/kc-workspace/dotfiles/commit/3f75b7a2795f743c3294accd912aa2041b2057bf))
* **core:** update source state change ([960ad4a](https://github.com/kc-workspace/dotfiles/commit/960ad4ae5dbaa832ed660f65038e0c0b7543ab40))
* **core:** update source state change ([2702a62](https://github.com/kc-workspace/dotfiles/commit/2702a6248e32e7b0fc395497b7b4d6f9f2019203))
* **core:** update source state change ([a4fd6e9](https://github.com/kc-workspace/dotfiles/commit/a4fd6e93e85cba0d20d8fc27eecd6e1caed8fdee))
* **core:** update source state change ([2aeffdb](https://github.com/kc-workspace/dotfiles/commit/2aeffdb784af382525e1637a95e64034c9952e37))
* **core:** update source state change ([c36fe19](https://github.com/kc-workspace/dotfiles/commit/c36fe19e45d760fa5768e1e3905ce1134f4e7140))
* **core:** update source state change ([ada4e75](https://github.com/kc-workspace/dotfiles/commit/ada4e75929f2625e09e23229083fa3d89b305144))
* **core:** update source state change ([b3aba4b](https://github.com/kc-workspace/dotfiles/commit/b3aba4b9e810893d51093942798ee64d635aad8b))
* **core:** update source state change ([735a093](https://github.com/kc-workspace/dotfiles/commit/735a093efaf06590f9d98c70001a5349e6aa7b5e))
* **core:** update source state change ([4881595](https://github.com/kc-workspace/dotfiles/commit/48815952118cbcd73bd846c3206a2280f9f63854))
* **core:** update source state change ([d8ae6c6](https://github.com/kc-workspace/dotfiles/commit/d8ae6c6b389bf33d495457ff9e4f3a2a2964b915))
* **core:** update source state change ([32ee561](https://github.com/kc-workspace/dotfiles/commit/32ee561b6c24c6c939dc2cdcd6d947e06689ba31))
* **core:** update source state change ([b268598](https://github.com/kc-workspace/dotfiles/commit/b268598cbcb3c562ab6042d729f07397e68a1d80))
* **core:** update source state change ([c079dc2](https://github.com/kc-workspace/dotfiles/commit/c079dc243f5a559b039e7da6380170116a7d5a0f))
* **core:** update source state change ([9fcf78c](https://github.com/kc-workspace/dotfiles/commit/9fcf78c7533b283044cd94f55c3ac03280674b7e))
* **core:** update source state change ([20477fe](https://github.com/kc-workspace/dotfiles/commit/20477fe5a5b3b8b3f19489a6e50f4795e5e5b17a))
* **core:** update source state change ([d977e67](https://github.com/kc-workspace/dotfiles/commit/d977e679efd04dddd687289f1395d79710de87b5))
* **core:** update source state change ([3b11e9e](https://github.com/kc-workspace/dotfiles/commit/3b11e9e153969d01d0cb4feea80f4a941d5a0a8e))
* **core:** update source state change ([df7c55c](https://github.com/kc-workspace/dotfiles/commit/df7c55ce5e403d4b8966c233ee9527ede06cb8ef))
* **core:** update source state change ([6abc6da](https://github.com/kc-workspace/dotfiles/commit/6abc6dad0ce19ba0056a079ece2983a2a588991b))
* **core:** update source state change ([b7dde24](https://github.com/kc-workspace/dotfiles/commit/b7dde2448a1d193170476bf60921998590077536))
* **docker:** increase mise github api rate-limit by send token from runner ([55c48a9](https://github.com/kc-workspace/dotfiles/commit/55c48a9a1ef3010c5d022ff25f1ac94d9e028bde))
* **docker:** reduce build times but caching some linux dependencies early on the steps ([bd4e614](https://github.com/kc-workspace/dotfiles/commit/bd4e6142addd3ee80ec7307eecfd106a9c385b52))
* **docker:** remove 1password-cli install from apt, and use mise to install instead ([165d738](https://github.com/kc-workspace/dotfiles/commit/165d7384dcbf2f5464991b8cf46ee0e318e8f088))
* **mise:** move mise initiate tools to packages ([f7d0d31](https://github.com/kc-workspace/dotfiles/commit/f7d0d316ced69758cdc4dfd4a1e9b10a724bef87))
* **mise:** move most tool-versions to config.toml instead ([eae31b2](https://github.com/kc-workspace/dotfiles/commit/eae31b2acdc40ce305606f7622a62cbacf44591c))
* move zsh tools from mise to zinit in zshrc file ([7e58e3d](https://github.com/kc-workspace/dotfiles/commit/7e58e3d7f91ee6536ce62f99d0e02af863bbeebe))
* **packages:** add mac app store and jetbrains toolbox supports ([7582955](https://github.com/kc-workspace/dotfiles/commit/7582955313b8d1ff53e3bdaf6d7611cdd0ab5ab7))
* **packages:** move terminal from warp to alacritty ([f6504b4](https://github.com/kc-workspace/dotfiles/commit/f6504b4d68acc5355a479e82703dc61e0c75bcf4))
* remove needs for github token when install mise because no rate limit should hit ([24444e5](https://github.com/kc-workspace/dotfiles/commit/24444e591007d272eaf06d9bd1674c45d3266e70))
* **script:** change custom scripts to prefix with kdf-* and update documents ([64f192a](https://github.com/kc-workspace/dotfiles/commit/64f192acddd5a0dc5ed2c6231c3c80d64353f9a3))
* **script:** run verify script on setup as well ([1e1e3c6](https://github.com/kc-workspace/dotfiles/commit/1e1e3c6951410071474246f4e090a4a521cdb8ed))
* **script:** support check the result within setup command ([c48b106](https://github.com/kc-workspace/dotfiles/commit/c48b106ec81cecfbbe9f335b2df7527a6fad8035))
* update lsd config ([7bc4c36](https://github.com/kc-workspace/dotfiles/commit/7bc4c363fbb5ffb4f7747be90764b8decb1e0ea0))
* update macos options key ([c220c5b](https://github.com/kc-workspace/dotfiles/commit/c220c5b82154eb8e95461518226c5c1e37830238))
* **zsh:** add v as nvim and zis, zit for zinit ([edf0671](https://github.com/kc-workspace/dotfiles/commit/edf0671fdb5d17a2f948603e97aff67383551c12))
* **zsh:** completion will be case-insensitive ([72d9784](https://github.com/kc-workspace/dotfiles/commit/72d9784653f00cad214467527fac14c422247712))
* **zsh:** exp with completion settings ([9cc7c05](https://github.com/kc-workspace/dotfiles/commit/9cc7c05c9028157c3b1085ffd2c874b2b6cf9377))
* **zsh:** improve config ([c7315ae](https://github.com/kc-workspace/dotfiles/commit/c7315aee8f61ab6d1607f678300f98c86c90d2f0))
* **zsh:** move zsh setup from zprofile to .config/zsh/*.zsh ([5ff80ee](https://github.com/kc-workspace/dotfiles/commit/5ff80ee720ed75a1659a647bde9edee1e38afa1d))
* **zsh:** move zshrc configs ([85defbc](https://github.com/kc-workspace/dotfiles/commit/85defbc612f448744a3c980f3b1cc23c1628c699))
* **zsh:** update zsh alias ([ddda985](https://github.com/kc-workspace/dotfiles/commit/ddda98510bb3b6cce4091ef6aa255adce1e62331))
* **zsh:** use alias-tips instead of alias-finder ([db8bb55](https://github.com/kc-workspace/dotfiles/commit/db8bb55b4fa3e93b5c77dc0fc758ba25b086fa1c))

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
