void draw_cursor(){
  //noCursor();
   int x = mouseX/SIZE;
   int y = mouseY/SIZE;
  
  if(field[x][y]!=NONE)  return;
    
  if(black_turn){
       fill(0);  //color black
       ellipse(mouseX, mouseY, STONE_SIZE, STONE_SIZE);
  }else{
       fill(255);  //color white
       ellipse(mouseX, mouseY, STONE_SIZE, STONE_SIZE);
    
  }
}
