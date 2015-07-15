final int SIZE = 50;//1マスの長さ
final int STONE_SIZE = (int)(SIZE*0.7);
final int NONE = 0;
final int BLACK = 1;
final int WHITE = 2;
Table table;

int [][] field;
boolean black_turn = true;

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
    //frameRate(1);
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
      }
    }
  }
  //draw_cursor();
  /*if (point != 0) {
   black_turn =! black_turn;
   }*/
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
    println("Check1");
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (black_turn) {
          if (PreCheck(x, y, i, j, BLACK)) {
            println("Check2");
            if (Check(x, y, i, j, BLACK)) {
              println("Check3");
              field[x][y] = BLACK;
              //black_turn=!black_turn;
              println(black_turn);
              Save(x,y,BLACK);
              point++;
            }
          }
        } 
        /*else if (!black_turn) {
         if (PreCheck(x, y, i, j, WHITE)) {
         println("Check2");
         if (Check(x, y, i, j, WHITE)) {
         println("Check3");
         field[x][y] = WHITE;
         println(black_turn);
         point++;
         }
         }
         }
         */
      }
    }
  }
  if (point!=0) {
    println("change");
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

