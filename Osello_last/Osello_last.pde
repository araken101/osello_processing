final int SIZE = 50;//1マスの長さ
final int STONE_SIZE = (int)(SIZE*0.7);
final int NONE = 0;
int BLACK = 1; 
int WHITE = 2;
Table table;
int highest = 0;
int [][] field;
int [][] omomi = {
  {
    120, -20, 20, 5, 5, 20, -20, 120
  }
  , 
  {
    -20, -40, -5, -5, -5, -5, -40, -20
  }
  , 
  {
    20, -5, 15, 3, 3, 15, -5, 20
  }
  , 
  {
    5, -5, 3, 3, 3, 3, -5, 5
  }
  , 
  {
    5, -5, 3, 3, 3, 3, -5, 5
  }
  , 
  {
    20, -5, 15, 3, 3, 15, -5, 20
  }
  , 
  {
    -20, -40, -5, -5, -5, -5, -40, -20
  }
  , 
  {
    120, -20, 20, 5, 5, 20, -20, 120
  }
};
boolean black_turn = true;
int highest_x = 0;
int highest_y = 0;
int highest_dirX = 0;
int highest_dirY = 0;
void setup() {
  size(8*SIZE, 10*SIZE);
  field = new int[8][8];
  table = new Table();
  table.addColumn("PlaceB", Table.STRING);
  table.addColumn("PlaceW", Table.STRING);
  table.addColumn("BLACK", Table.INT);
  table.addColumn("WHITE", Table.INT);
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) {
      field[i][j] = NONE;
    }
  }

  field[3][3] = BLACK;
  field[4][4] = BLACK;
  field[3][4] = WHITE;
  field[4][3] = WHITE;
}

void draw() {
  int point = 0;
  int x = 0;
  int y = 0;
  background(0, 128, 0);

  stroke(0);
  for (int i =1; i<8; i++) {
    line(i*SIZE, 0, i*SIZE, height);
    line(0, i*SIZE, width, i*SIZE);
  }
  fill(255);
  rect(0, 400, 400, 500);

  noStroke();
  if (!black_turn) {
    AI();
  }

  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if (field[i][j]==BLACK) {
        fill(0);  //黒色
        ellipse((i*2+1)*SIZE/2, (j*2+1)*SIZE/2, STONE_SIZE, STONE_SIZE);
      } else if (field[i][j]==WHITE) {
        fill(255); //白色
        ellipse((i*2+1)*SIZE/2, (j*2+1)*SIZE/2, STONE_SIZE, STONE_SIZE);
      } else {
        for (int s = -1; s<=1; s++) {
          for (int t = -1; t<=1; t++) {
            if (black_turn) {
              if (OnlyPreCheck(i, j, s, t, BLACK)) {
                if (OnlyCheck(i, j, s, t, BLACK)) {
                  fill(0, 158, 0);
                  rect(i*SIZE+2, j*SIZE+2, SIZE-4, SIZE-4);
                }
              }
            }
          }
        }
      }
    }
  }
  textSize(20);
  text("BLACK", 80, 420);
  text("WHITE", 280, 420);
  int countB = 0;
  int countW = 0;
  for (int ax=0; ax<8; ax++) {
    for (int ay=0; ay<8; ay++) {
      if (field[ax][ay] == BLACK) {
        countB++;
      } else if (field[ax][ay] == WHITE) {
        countW++;
      }
    }
  }
  if (countB+countW == 64) {
    if (countB>countW) {
      textSize(30);
      fill(255, 255, 0);
      text("BLACK WIN", 70, 220);
      saveTable(table, "data/osello.csv");
    } else if (countB<countW) {
      text("WHITE WIN", 70, 220);
      saveTable(table, "data/osello.csv");
    }
  }
  if (countB == 0) {
    textSize(50);
    fill(255, 255, 0);
    text("BLACK WIN", 70, 220);
  } else if (countW == 0) {
    textSize(50);
    fill(255, 255, 0);
    text("WHITE WIN", 70, 220);
    saveTable(table, "data/osello.csv");
  }
  textSize(30);
  text(countB, 100, 460);
  text(countW, 300, 460);
}
void mousePressed() {
  int x = mouseX/SIZE;
  int y = mouseY/SIZE;
  int point=0;
  if (field[x][y] == NONE) {
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (black_turn) {
          if (PreCheck(x, y, i, j, BLACK)) {
            if (Check(x, y, i, j, BLACK)) {
              field[x][y] = BLACK;
              Save(x, y, BLACK);
              point++;
            }
          }
        }
      }
    }
  }
  if (point!=0) {
    black_turn=!black_turn;
  }
}


void keyPressed() {
  if (key == 'N' || key == 'n')
    black_turn = !black_turn;
}
int current_turn() {
  if (black_turn) {
    return BLACK;
  } else {
    return WHITE;
  }
}

