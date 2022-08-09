#!/usr/bin/env ruby
require './sudoku'

sudoku = [
  0, 0, 0, 5, 7, 0, 0, 3, 0,
  5, 6, 8, 0, 1, 0, 0, 4, 0,
  0, 0, 0, 0, 0, 8, 0, 9, 0,
  4, 0, 6, 2, 0, 1, 9, 0, 3,
  7, 2, 0, 0, 0, 0, 0, 8, 6,
  3, 0, 1, 8, 0, 7, 4, 0, 5,
  0, 1, 0, 4, 0, 0, 0, 0, 0,
  0, 5, 0, 0, 9, 0, 2, 6, 4,
  0, 3, 0, 0, 2, 5, 0, 0, 0,
]

p "Original:"
p sudoku

# solved = Sudoku.solve(puzzle)
puzzle = Sudoku::Puzzle.new(sudoku)
# puzzle.solve

p "Puzzle:"
p puzzle



# p "Solved:"
# p solved
