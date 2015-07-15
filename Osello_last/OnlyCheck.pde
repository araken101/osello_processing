boolean OnlyCheck(int x, int y, int dirX, int dirY, int C) {
  if (!(x+dirX>=0 && y+dirY>=0 && x+dirX<8 && y+dirY<8)) {
    return false;
  } else if (field[x+dirX][y+dirY] == C && field[x+dirX][y+dirY] != NONE) {
    return true;
  } else if (field[x+dirX][y+dirY] != C && field[x+dirX][y+dirY] != NONE) {
    if (OnlyCheck(x+dirX, y+dirY, dirX, dirY, C)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

