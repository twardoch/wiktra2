# Wiktra2 TODO List

## Immediate Priority (Critical)

- [ ] Create `.gitignore` file and remove `.DS_Store` files from repository
- [ ] Fix license inconsistency in `setup.py` (change MIT to GPLv2)
- [ ] Set up basic pytest infrastructure in `tests/` directory
- [ ] Write unit tests for core `Transliterator` class
- [ ] Create GitHub Actions workflow for basic CI

## High Priority (This Week)

- [ ] Add comprehensive unit tests for at least 10 major language/script pairs
- [ ] Test and fix installation on Ubuntu Linux
- [ ] Test and fix installation on Windows 10/11
- [ ] Add type hints to main API functions
- [ ] Create `CONTRIBUTING.md` with development guidelines

## Testing Infrastructure

- [ ] Set up pytest with coverage reporting
- [ ] Create test data fixtures from Wiktionary examples
- [ ] Add integration tests for CLI tool
- [ ] Implement performance benchmarks
- [ ] Add cross-platform CI matrix (macOS, Ubuntu, Windows)
- [ ] Configure Python version matrix testing (3.9-3.12)

## Documentation

- [ ] Set up Sphinx documentation structure
- [ ] Write comprehensive API reference
- [ ] Create user tutorial for common use cases
- [ ] Document all supported languages and scripts in structured format
- [ ] Add troubleshooting guide for installation issues
- [ ] Create architecture documentation explaining Lua integration

## Code Quality

- [ ] Add mypy for static type checking
- [ ] Implement comprehensive error handling with custom exceptions
- [ ] Add logging throughout the codebase
- [ ] Refactor large modules into smaller components
- [ ] Set up pre-commit hooks for code quality
- [ ] Add docstrings to all public functions

## Platform Support

- [ ] Remove hard dependency on Homebrew for macOS
- [ ] Create Docker image for consistent environment
- [ ] Build and publish platform-specific wheels
- [ ] Test with different Lua versions
- [ ] Document platform-specific installation steps

## Performance

- [ ] Implement caching for loaded Lua modules
- [ ] Add batch processing support
- [ ] Profile and optimize hot paths
- [ ] Reduce memory footprint for large texts
- [ ] Add streaming support for large files

## Features

- [ ] Add reverse transliteration support where possible
- [ ] Implement confidence scoring for transliterations
- [ ] Create REST API server mode
- [ ] Add Jupyter notebook examples
- [ ] Support custom transliteration overlays

## Release Management

- [ ] Set up semantic versioning
- [ ] Automate changelog generation
- [ ] Configure PyPI automatic deployment
- [ ] Create release checklist
- [ ] Set up Dependabot for dependency updates

## Community

- [ ] Create issue templates (bug report, feature request)
- [ ] Add pull request template
- [ ] Write Code of Conduct
- [ ] Set up GitHub Discussions
- [ ] Create examples repository

## Long-term

- [ ] Automate Wiktionary module updates
- [ ] Develop pure Python fallback for Lua dependencies
- [ ] Create commercial support options
- [ ] Apply for linguistic tool grants
- [ ] Build partnerships with NLP projects

## Bug Fixes

- [ ] Fix any Unicode handling issues
- [ ] Resolve installation failures on Ubuntu
- [ ] Handle edge cases (empty strings, invalid inputs)
- [ ] Fix any memory leaks in Lua bridge
- [ ] Improve error messages for missing languages

## Development Environment

- [ ] Add development dependencies to requirements-dev.txt
- [ ] Create Makefile for common tasks
- [ ] Set up VS Code recommended extensions
- [ ] Document development workflow
- [ ] Add debugging configuration

## Security

- [ ] Add security scanning to CI pipeline
- [ ] Review and update dependencies
- [ ] Implement input sanitization
- [ ] Add SAST tools
- [ ] Create security policy

## Optimization

- [ ] Lazy load language modules
- [ ] Implement connection pooling for updates
- [ ] Optimize regex patterns
- [ ] Reduce startup time
- [ ] Profile memory usage