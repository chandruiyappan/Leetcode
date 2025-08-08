class Solution:
    @staticmethod
    def numIslands(g):
        def dfs(i, j):
            if 0 <= i < len(g) and 0 <= j < len(g[0]) and g[i][j] == "1":
                g[i][j] = "0"
                for x, y in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
                    dfs(i + x, j + y)

        c = 0
        for i in range(len(g)):
            for j in range(len(g[0])):
                if g[i][j] == "1":
                    dfs(i, j)
                    c += 1
        return c
