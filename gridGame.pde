
//globals
int[][][] board;
int[][][] board2;
int cols, rows, type;
float cellWidth, cellHeight;
int blockType;//black = ground, blue = spike, yellow = coin, green = player, red = enemy. 
boolean filledBlack, filledBlue;
int state;

void setup() {
  size(800, 800);

  cols = 2;
  rows = 1;
  type = 3;
  blockType = 0;
  state = 0;
  filledBlack = false;
  filledBlue = false;

  initializeValues();
}

void draw() {
  if (state == 0) {
    displayBoard();
    whatBlock();
    findMouse();
  }
  else {
    background(255,0,0);
  }
}
void keyPressed(){
  if (key == '1'){
    blockType = 0;
  }
  if (key == '2'){
    blockType = 1;
  }
  //if (key == '3'){
  //  blockType = 2;
  //}
  //if (key == '4'){
  //  blockType = 3;
  //}
  //if (key == '5'){
  //  blockType = 4;
  //}
}

void whatBlock(){
  if (blockType == 0){
    fill(0);
  }
  if (blockType == 1){
    fill(0,0,255);
  }
}

void asignBlock() {
   
}

void findMouse(){
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
  if (mousePressed && type == 3){
    if (blockType == 0) {
      board[xCord][yCord][1] = 1;
      //type = 1;
      println(xCord);
    }
    else if (blockType == 1) {
      board[xCord][yCord][2] = 2;
      type = 2;
    }
  }
  else if (mousePressed && type == 2) {
    if (blockType == 0) {
      state = 1;
    }
    else if (blockType == 1) {
      println("you already have a block there");
    }
  }
  else if (mousePressed && type == 1) {
    if (blockType == 1) {
      state = 1; 
    }
    else if (blockType == 0) {
      println("you already have a block there"); 
    }
  }
}

void displayBoard() {
  //int xCord = int(mouseX/cellWidth);
  //int yCord = int(mouseY/cellHeight);
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y][1] == 1 && blockType == 0){
        fill(0);
      }
      else if (board[x][y][2] == 2 && blockType == 1){
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
  board = new int[cols][rows][type];
  board2 = new int[cols][rows][type];
  cellWidth = width/cols;
  cellHeight = height/rows;
}