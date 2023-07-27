# codelst (v0.0.4)

**codelst** is a [Typst](https://github.com/typst/typst) package for rendering sourcecode with line numbers and some other additions.

## Usage

For Typst 0.6.0 or later import the package from the typst preview repository:

```js
#import "@preview/codelst:0.0.4": sourcecode
```

For Typst before 0.6.0 or to use **codelst** as a local module, download the package files into your project folder and import `codelst.typ`:

```js
#import "codelst.typ": sourcecode
```

After importing the package, simple wrap any fenced code block in a call to `#sourcecode()`:

````js
#import "@preview/codelst:0.0.4": sourcecode

#sourcecode[```typ
#show "ArtosFlow": name => box[
  #box(image(
    "logo.svg",
    height: 0.7em,
  ))
  #name
]

This report is embedded in the
ArtosFlow project. ArtosFlow is a
project of the Artos Institute.
```]
````

## Further documentation

See `manual.pdf` for a comprehensive manual of the package. 

See `example.typ` for some quick usage examples.

## Development

The documentation is created using [Mantys](https://github.com/jneug/typst-mantys), a Typst template for creating package documentation.

To compile the manual Mantys needs to be available as a local package. Refer to Mantys' manual for instructions how to do so.

## Changelog

### v0.0.5

- Fixed insets for line highlights.
- Added `numbers-width` option to manually set width of line numbers column.
	- This allows line numbers on margins by setting `numbers-width` to `0pt` or a negative number like `-1em`.

### v0.0.4

- Fixed issue with context unaware syntax highlighting.

### v0.0.3

- Removed call to `#read()` from `#sourcefile()`.
- Added `continue-numbering` argument to `#sourcecode()`.
- Fixed problem with `showrange` having out of range line numbers.

### v0.0.2

- Added a comprehensive manual.
- Fixed crash for missing `lang` attribute in `raw` element.

### v0.0.1

- Initial version submitted to typst/packages.
