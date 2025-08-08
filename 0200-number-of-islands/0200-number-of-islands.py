class Solution:
    @staticmethod
    def dfs(g, i, j):
        if 0 <= i < len(g) and 0 <= j < len(g[0]) and g[i][j] == "1":
            g[i][j] = "0"
            for x, y in [(1,0), (-1,0), (0,1), (0,-1)]:
                Solution.dfs(g, i+x, j+y)

    @staticmethod
    def numIslands(g):
        c = 0
        for i in range(len(g)):
            for j in range(len(g[0])):
                if g[i][j] == "1":
                    getattr(Solution, 'dfs')(g, i, j)
                    c += 1
        return c
