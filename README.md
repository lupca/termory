# Termory(terminar - memmory): A Command Line Tool

[![Gem Version](http://img.shields.io/gem/v/gems.svg)][gem]
[![Build Status](https://github.com/rubygems/gems/workflows/ubuntu/badge.svg)][gh-actions]
[![Code Climate](https://api.codeclimate.com/v1/badges/45ff982a29d7a000ee84/maintainability)][codeclimate]

[gem]: https://rubygems.org/gems/gems
[gh-actions]: https://github.com/rubygems/gems/actions
[codeclimate]: https://codeclimate.com/github/rubygems/gems/maintainability


Termory is a simple tool for building command line utilities

## Quick Start
- Install ruby
and
- gem install termory
### Configuration
1. Init data
```sh
termory db create
```
2. Setting your alias

```sh
termory config alias.xxx "your config"
```

3. Use your alias

```sh
termory exec xxx
```

4. List your alias

```sh
termory config -l
# or
termory config --list
```

## License
Released under the MIT License. See the [LICENSE](https://github.com/rails/thor/blob/main/LICENSE.md) file for further details.
