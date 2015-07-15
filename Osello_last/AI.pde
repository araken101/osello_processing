void AI() {
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if (field[i][j] == NONE) {
        for (int s = -1; s <= 1; s++) {
          for (int t = -1; t <= 1; t++) {
            if (PreCheck(i, j, s, t, WHITE)) {
              if (Check(i, j, s, t, WHITE)) {
                field[i][j] = WHITE;
                println(black_turn);
                Save(i,j,WHITE);
                black_turn =! black_turn;
                return;
              }
            }
          }
        }
      }
    }
  }
}

