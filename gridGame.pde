
//globals
int[][] board;
int cols, rows;
float cellWidth, cellHeight;

void setup() {
  size(800, 800);

  cols = 10;
  rows = 10;

  initializeValues();
}

void draw() {
  displayBoard();
  findMouse();
}

void findMouse(){
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
  
  if (board[xCord][yCord] == 0){
    board[xCord][yCord] = 1;
  }
  //else{
  //  board[xCord][yCord] = 0;
  //}
}

void displayBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1) {
        fill(0);  //cursor
      } else{
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