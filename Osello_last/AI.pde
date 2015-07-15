void AI() {
  int highest = -1000;
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if (field[i][j] == NONE) {
        for (int s = -1; s <= 1; s++) {
          for (int t = -1; t <= 1; t++) {
            if (PreCheck(i, j, s, t, WHITE)) {
              if (highest<omomi[i][j]) {
                highest = omomi[i][j];
                highest_x = i;
                highest_y = j;
              }
            }
          }
        }
      }
    }
    println(highest_x+","+highest_y);
    if (field[highest_x][highest_y] == NONE) {
      for (int p = -1; p <= 1; p++) {
        for (int q = -1; q <= 1; q++) {
          if (PreCheck(highest_x, highest_y, p, q, WHITE)) {
            if (Check(highest_x, highest_y, p, q, WHITE)) {
              println(highest_x+","+highest_y);
              field[highest_x][highest_y] = WHITE;
            }
          }
        }
      }
    }
  }
  /*
   Save(highest_x, highest_y, WHITE);
   black_turn =! black_turn;
   return;
   */
  return;
}


