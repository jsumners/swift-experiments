Each directory is meant to be a self-contained experiement to learn some feature
of Swwift, or to determine an appropriate implementation for some algorithm or
task in Swift.

## General Notes

### Project Organization

A project seems to minimally consist of:

1. A `Package.swift` in the root directory.
2. A `Sources` directory in the root directory.
3. A `Tests` directory in the root directory.

The `Package.swift` and `Sources` requirements are vaguely documented
at https://www.swift.org/documentation/package-manager/. I cannot find _any_
documentation on the `Tests` directory, but by browsing a few projects from
some known Swift developers, it seems that the following is required:

1. For each directory ("module") in `Sources`, e.g. `Sources/Foo`, there should
be a corresponding directory in `Tests`, e.g. `Tests/Foo`.
2. A `testsTarget` must be defined in the `Package.swift` for the tests.

I _think_ the authors of Swift are expecting this project to suffice as
documentation around all of this: https://github.com/apple/example-package-playingcard.

### Package.swift

Each compile "target" needs a [`Package.swift`][pkg] file. This is roughly
equivalent to a `go.mod` file. The primary documentation for the file is found
at https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html.

[pkg]: https://www.swift.org/documentation/package-manager/