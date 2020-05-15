# CHANGELOG

All important changes to this project will be added to this file! This changelog will be based on [Keep a change log](http://keepachangelog.com/)

## 2.0.2 - [ 04-05-2020 ]

### Added

* Adding comments about jobs and stages in GitLab CI.

### Changed

* Change jobs names.
* Change ancors names.

### Removed

* Remove stage scanning to Windows Images (Clair Scanning don't support windows images).

## 2.0.1 - [ 30-04-2020 ]

### Added

* Adding only changes to stage branch.
* Adding lint script to check your GitLab CI Files.

### Changed

* Folders structure and call files in include.

## 2.0.0 - [ 15-04-2020 ]

### Added

* Finish deploy ecs jobs.
* Adding .pre stage that validate some environment variables.

### Changed

* Change jobs names.

## 1.0.0 - [ 06-04-2020 ]

### Added

* Initial commit with basic project structure.
* Including REAMDE.md and CHANGELOG.md files in their first versions.
* Docker image build and Docker clean images job.
* Pipeline organization with templates and using include pattern.
