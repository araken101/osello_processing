void AI() {
  int highest = -1000;
  if (player == 1) {
    for (int i=0; i<8; i++) {
      for (int j=0; j<8; j++) {
        if (field[i][j] == NONE) {
          for (int s = -1; s < 2; s++) {
            for (int t = -1; t < 2; t++) {
              if (PreCheck(i, j, s, t, WHITE)) {
                if (OnlyCheck(i, j, s, t, WHITE)) {
                  if (highest<=omomi[i][j]) {
                    highest = omomi[i][j];
                    highest_x = i;
                    highest_y = j;
                  }
                }
              }
            }
          }
        }
      }
    }
    for (int s = -1; s < 2; s++) {
      for (int t = -1; t < 2; t++) {
        if (PreCheck(highest_x, highest_y, s, t, WHITE)) {
          if (Check(highest_x, highest_y, s, t, WHITE)) {
            field[highest_x][highest_y] = WHITE;
            Save(highest_x, highest_y, WHITE);
          }
        }
      }
    }
    black_turn =! black_turn;
    return;
  } else if (player == 2) {
    for (int i=0; i<8; i++) {
      for (int j=0; j<8; j++) {
        if (field[i][j] == NONE) {
          for (int s = -1; s < 2; s++) {
            for (int t = -1; t < 2; t++) {
              if (PreCheck(i, j, s, t, BLACK)) {
                if (OnlyCheck(i, j, s, t, BLACK)) {
                  if (highest<=omomi[i][j]) {
                    highest = omomi[i][j];
                    highest_x = i;
                    highest_y = j;
                  }
                }
              }
            }
          }
        }
      }
    }
    for (int s = -1; s < 2; s++) {
      for (int t = -1; t < 2; t++) {
        if (PreCheck(highest_x, highest_y, s, t, BLACK)) {
          if (Check(highest_x, highest_y, s, t, BLACK)) {
            field[highest_x][highest_y] = BLACK;
            Save(highest_x, highest_y, BLACK);
          }
        }
      }
    }
    black_turn =! black_turn;
    return;
  }
}

