boolean Check(int x, int y, int dirX, int dirY, int C) {
  if (!(x+dirX>=0 && y+dirY>=0 && x+dirX<8 && y+dirY<8)) {
    return false;
  }
  if (field[x+dirX][y+dirY] == C && field[x+dirX][y+dirY] != NONE) {
    field[x][y] = C;
    return true;
  }
  if (field[x+dirX][y+dirY] != C && field[x+dirX][y+dirY] != NONE) {
    if (Check(x+dirX, y+dirY, dirX, dirY, C)) {
      field[x][y] = C;
      return true;
    }
  }
  return false;
}

