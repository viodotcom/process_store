# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Fixes `ProcessStore.fetch/1`. Now the function is able to retrieve the value from the process
  dictionary when the process is nested into a process tree.
- Update hex libraries and elixir version

## [0.1.0] - 2019-11-26

### Added

- Project created.

[unreleased]: https://github.com/FindHotel/process_store/compare/0.1.0...HEAD
[0.1.0]: https://github.com/FindHotel/process_store/releases/tag/0.1.0
