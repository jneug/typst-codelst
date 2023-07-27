#import "./codelst.typ": sourcecode, sourcefile, lineref, codelst-styles

#let codelst = text(fill: rgb(254,48,147), smallcaps("codelst"))
#let cmd( name ) = text(fill: rgb(99, 170, 234), raw(block:false, sym.hash + name.text + sym.paren.l + sym.paren.r))

#let code-block = block.with(
  stroke: 1pt,
  inset: 0.65em,
  radius: 4pt
)

#let code-example = ```typ
/*
 * Example taken from
 * https://typst.app/docs/tutorial/formatting/
 */
#show "ArtosFlow": name => box[
  #box(image(
    "logo.svg",
    height: 0.7em,
  ))
  #name
]

// Long line that breaks
This report is embedded in the ArtosFlow project. ArtosFlow is a project of the Artos Institute.

// Very long line without linebreak
This_report_is_embedded_in_the_ArtosFlow_project._ArtosFlow_is_a_project_of_the_Artos_Institute.

// End example
```


Normal #cmd[raw] works as expected:

#code-block(code-example)

Using #cmd[sourcecode] will add line numbers. Very long lines will be clipped.

#code-block(sourcecode(code-example))

Sourcecode can be loaded from a file and passed to #cmd[sourcefile]. Any #codelst sourcecode can be wrapped inside #cmd[figure] as expected.

#codelst blocks line numbers can be formatted via a #cmd[show] rules like:

```typc
show <codelst>: (code) => { ... }
show <lineno>: (n) => { ... }
```

#code-block[
  #let filename = "typst.toml"
  #let number-format(n) = text(fill: blue, emph(n))

	#show <codelst>: (code) => grid(
		columns: (1fr, 2fr),
		gutter: .65em,
		[To the right in @lst-sourcefile you can see the #raw(filename) file of this package with some #number-format[fance line numbers].],
		code
	)

	#figure(
		caption: filename,
		sourcefile(
      numbers-style: number-format,
      numbers-side: right,
      file: filename,
      read(filename))
	)<lst-sourcefile>
]

#codelst attempts to add a minimal amount of formatting. You can use your own styles via #cmd[show] rules. For easy formatting, some default styles like a colored block can be applied using #cmd[codelst-styles]:

```typ
#show: codelst-styles
```

#cmd[sourcecode] accepts a number of arguments to affect the output like _highlighting lines_,  _restrict the line range_ or _place labels_ in specific lines to reference them later.
#code-block[
	#show: codelst-styles
	#sourcecode(
		numbers-start: 9,
		highlighted: (14,),
		highlight-labels: true,
		gutter: 2em,
		label-regex: regex("<([a-z-]+)>")
	)[```typc
	#"hello world!" \
	#"\"hello\n  world\"!" \
	#"1 2 3".split() \ <split-example>
	#"1,2;3".split(regex("[,;]")) \
	#(regex("\d+") in "ten euros") \
	#(regex("\d+") in "10 euros")
	```]
]

To reference a line use #cmd[lineref]:

- See #lineref(<split-example>) for an example of the `split()` function.
