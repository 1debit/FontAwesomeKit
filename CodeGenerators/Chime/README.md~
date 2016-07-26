# Setup

Run `npm install` to install the 'glyphs2font' package that stitches the loose svg files into a font file.

## Input

This script looks for svg files in the same directory, expecting the following naming convention for each glyph:
```
[character code].[glyph name].svg
```
For example, a valid directory might look like:
```ruby
a.compass.svg
b.arrow-left.svg
c.arrow-right.svg
...
```

## Running
Run script with `ruby consume.rb`

Doing so will generate the following:
```ruby
chime-font.css
chime-font.eot
chime-font.svg
chime-font.ttf
chime-font.woff
chime-font.html
chime-font.yml     #Automatically generated for glyphs2font
_variables.scss    #Automatically generated for FontAwesomeKit
FAKChime.fakgen.h  #Obj-C header
FAKChime.fakgen.m  #Obj-C implementation
```
