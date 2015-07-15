void Save(int x,int y,int c){
  String place = "NONE";
  TableRow row = table.addRow();
  int allB = 0;
  int allW = 0;
  for(int i = 0;i<8;i++){
    for(int j = 0;j<8;j++){
      if(field[i][j] == BLACK){
        allB++;
      }else if(field[i][j] == WHITE){
        allW++;
      }
    }
  }
  if(x == 0){
    place = "a";
  }else if(x == 1){
    place = "b";
  }else if(x == 2){
    place = "c";
  }else if(x == 3){
    place = "d";
  }else if(x == 4){
    place = "e";
  }else if(x == 5){
    place = "f";
  }else if(x == 6){
    place = "g";
  }
  if(c==1){
    row.setString("PlaceB",place+y);
  }else if(c==2){
    row.setString("placeW",place+y);
  }
  row.setInt("BLACK",allB);
  row.setInt("WHITE",allW);
}
