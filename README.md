Sudoku Solver
=============
[![Code Climate](https://codeclimate.com/github/duboff/sudoku.png)](https://codeclimate.com/github/duboff/sudoku)

Week 4 Project @ Makers Academy

Solves any kind of Sudoku. The code includes a recursive algorithm to solve hard puzzles. The algorithm was later used for the [web version](https://github.com/duboff/Sudoku-web-version) which uses Sinatra.

The goal of this project was to write an app in a TDD way with proper OOP design.


##How to use:

Open grid.rb (or type require 'path/grid.rb' in irb)

To create new sudoku
```rb
sudoku = Grid.new('123....321')
```
To solve
```rb
sudoku.solve
```
To see the solution
```rb
sudoku.inspect
```
