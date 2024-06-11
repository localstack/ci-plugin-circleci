# Change Log

All notable changes to this project will be documented in this file.

## [2.1.0] - 2023-11-03
- Preparing the Orb for the release of LocalStack 3.0.
  - The default container name will be renamed from `localstack-main` to `localstack_main`.
  - This change is backwards compatible, it will fall back to the old container name for now (and will use the new container name once LocalStack 3.0 is released).

## [2.0.0] - 2023-08-30
- Major release supporting LocalStack Pro v2.
- The `image-tag` parameter has been removed. Please use the environment variable `IMAGE_NAME` instead if you want to change the used Docker image or tag.

## [1.0.0] - 2021-07-12
- Partner integration major release

## [0.1.0] - 2021-07-06
- Partner integration release

## [0.0.3] - 2021-05-13
- First working version

## [0.0.1] - 2021-05-13
- Initial Release (work in progress)
