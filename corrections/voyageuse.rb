#! /usr/bin/env ruby

def solution(mat)
  size_x = mat.length - 1
  size_y = mat[0].length - 1

  0.upto(size_x) do |i|
    mat = remove_connex1(mat, size_x, size_y, i, 0)
    mat = remove_connex1(mat, size_x, size_y, i, size_y)
  end

  0.upto(size_y) do |i|
    mat = remove_connex1(mat, size_x, size_y, 0, i)
    mat = remove_connex1(mat, size_x, size_y, size_x, i)
  end

  mat
end

def remove_connex1(mat, size_x, size_y, x, y)
  return mat if mat[x][y] == 0
  mat[x][y] = 0

  mat = remove_connex1(mat, size_x, size_y, x + 1, y) unless x == size_x

  mat = remove_connex1(mat, size_x, size_y, x, y + 1) unless y == size_y

  mat = remove_connex1(mat, size_x, size_y, x - 1, y) unless x == 0

  mat = remove_connex1(mat, size_x, size_y, x, y - 1) unless y == 0

  mat
end

TEST_MAT1 = [[1, 0, 0], [0, 1, 0], [1, 0, 0]]

TEST_MAT2 = [
  [0, 1, 0, 1, 0, 1, 0, 0],
  [0, 1, 0, 1, 0, 0, 0, 1],
  [1, 1, 1, 1, 0, 1, 1, 0],
  [1, 1, 1, 0, 1, 1, 1, 0],
  [0, 1, 0, 1, 0, 0, 0, 1],
]

p solution(TEST_MAT1)
p solution(TEST_MAT2)
