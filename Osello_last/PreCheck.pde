boolean PreCheck(int x, int y, int Vx, int Vy, int C) {
  if (! (x+Vx>=0 && y+Vy>=0 && x+Vx<8 && y+Vy<8)) {
    return false;
  }
  if (field[x+Vx][y+Vy] == C) {
    return false;
  } else if (field[x+Vx][y+Vy] != C && field[x+Vx][y+Vy] != NONE) {
    return true;
  }
  return false;
}

