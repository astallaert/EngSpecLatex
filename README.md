EngSpecLatex
============

This is a framework for creating Architectural and Engineering Specifications in Latex

This has been licensed under the GNU AFFERO GENERAL PUBLIC LICENSE Version 3.

The intent of this framework is to use it with ShareLatex (https://github.com/sharelatex) but it should work with many latex implementations. Development is slow and ongoing, lots of cleanup still needs to happen. If you use this and like it or have comments and suggestings, please let me know.

License
=======

The code in this repository is released under the GNU AFFERO GENERAL PUBLIC LICENSE, version 3. A copy can be found in the LICENSE file.

How to use these files
======================

specTemplate.tex represents a specification section.

Each specification section would be named based on the number ex '00 00 00.tex'

You can edit and compile each section individually, but the 'main.tex' file must be in the same directory.

You edit info common to every section (project name, issued for, etc.) in the 'main.tex' file.

If you want to compile all the specs, compile the 'main.tex' file (make sure all sections are listed as described within the main.tex file)
