
//globals
int[][] board;
int cols, rows;
float cellWidth, cellHeight;
int blockType;//black = ground, blue = spike, yellow = coin, green = player, red = enemy.  

void setup() {
  size(800, 800);

  cols = 10;
  rows = 10;
  blockType = 0;

  initializeValues();
}

void draw() {
  displayBoard();
  whatBlock();
  findMouse();
}
void keyPressed(){
  if (key == '1'){
    blockType = 0;
  }
  if (key == '2'){
    blockType = 1;
  }
  if (key == '3'){
    blockType = 2;
  }
  if (key == '4'){
    blockType = 3;
  }
  if (key == '5'){
    blockType = 4;
  }
}

void whatBlock(){
  if (blockType == 0){
    fill(0);
  }
  if (blockType == 1){
    fill(0,0,255);
  }
}

void findMouse(){
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
  if (mousePressed && blockType == 0){
    board[xCord][yCord] = 1;
  }
  if (mousePressed && blockType == 1){
    board[xCord][yCord] = 2;
  }
}

void displayBoard() {
  //int xCord = int(mouseX/cellWidth);
  //int yCord = int(mouseY/cellHeight);
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1 && blockType == 0){
        fill(0);
      }
      else if (board[x][y] == 2 && blockType == 1){
        fill(0,0,255);
      }
      else{
        fill(255); //empty
      }
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
    }
  }
}

void initializeValues() {
  board = new int[cols][rows];
  cellWidth = width/cols;
  cellHeight = height/rows;
}