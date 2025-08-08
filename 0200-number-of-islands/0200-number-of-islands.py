class Solution:
    def numIslands(self, grid: list[list[str]]) -> int:
        if not grid or not grid[0]:
            return 0

        m, n = len(grid), len(grid[0])
        islands = 0
        dirs = [(1,0),(-1,0),(0,1),(0,-1)]

        for i in range(m):
            for j in range(n):
                if grid[i][j] == '1':
                    islands += 1
                    # iterative DFS using stack
                    stack = [(i, j)]
                    grid[i][j] = '0'  # mark visited
                    while stack:
                        x, y = stack.pop()
                        for dx, dy in dirs:
                            nx, ny = x + dx, y + dy
                            if 0 <= nx < m and 0 <= ny < n and grid[nx][ny] == '1':
                                grid[nx][ny] = '0'
                                stack.append((nx, ny))
        return islands
