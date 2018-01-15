//objective:
//you and another player place blocks on the grid untill one of you places a block on another player's block, so the object of the game is to simpily... not put your block on
//on the other player's block. Easy right? Wrong! For there is a twist! When you play the game you will find that you are unable to see the other player's blocks.
//Making this a game of luck, it may be easy at first to avoid the other players blocks however as the game goes on the board fills up untill one of you makes an error in you placement.
//and the other player wins!
//-------------------------------------------------------
//how to play (game is two players):
//*black goes first*
//1.)player one picks a location on the board to place a block (if you place a block on one of you prevous blocks don't worry, you get a second turn just press space)
//2.)the players block will the dissappear, but do not be alarmed because you have mearly moved into the "limbo" phase. in this phase none will be able to see the blocks that have been
//placed. at this stage the players will swap and when player one cannot see the screen press space to switch to player two's board.
//3.)player two picks a location on the board to place a block and then it goes back to the "limbo" phase and cycle continues!
//4.)have fun!
//------------------------------------------------------------------------
//future plans / knownIssues:
//-I would like to add more players (with the current setup this would be very easy)
//-would like to be able to select a grid size and number of players in a main menu
//-No known bugs
//-This works with any grid size
//--------------------------------------------------------------------
//By Cale Leach

//globals
int[][] board;
int cols, rows;
float cellWidth, cellHeight;
int blockType, lastBlockType;
boolean placed;
int state;

void setup() {
  size(800, 800);

  cols = 10;
  rows = 10;
  blockType = 0;
  state = 0;
  placed = false;
  
  initializeValues();
}

void draw() {
  if (state == 0) {
    displayBoard();
    whatBlock();
    findMouse();
  }
  else if (state == 1) {
    background(0);
    fill(255);
    textSize(40);
    text("Black Wins!",width/2 - 100,height/2);
  }
  else if (state == 2) {
    background(0,0,255);
    fill(255);
    textSize(40);
    text("Blue Wins!",width/2 - 90,height/2);
  }
}

//color of the block
void whatBlock() {
  if (blockType == 0){
    fill(0);
  }
  if (blockType == 1){
    fill(0,0,255);
  }
}

//finds which square the mouse is in and deals with the placement of blocks in empty space
void findMouse() {
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
  if (placed == false) {
    if (mousePressed && blockType == 0 && board[xCord][yCord] != 1) {
      board[xCord][yCord] = 1;
      placed = true;
      lastBlockType = 0;
    }
    else if (mousePressed && blockType == 1 && board[xCord][yCord] != 2) {
      board[xCord][yCord] = 2;
      placed = true;
      lastBlockType = 1;
    }
  }
}

//deals with the placement of blocks in a taken space
void spotTaken() {
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
  if (mousePressed && blockType == 0 && board[xCord][yCord] == 1) {
    println("you already have a block there");
  }
  if (mousePressed && blockType == 1 && board[xCord][yCord] == 1) {
    state = 1;
    println("black wins!");
  }
  if (mousePressed && blockType == 1 && board[xCord][yCord] == 2) {
    println("you already have a block there");
  }
  if (mousePressed && blockType == 0 && board[xCord][yCord] == 2) {
    state = 2;
    println("Blue wins!");
  }
}


//shows the board with the different colors
void displayBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1 && blockType == 0) {
        fill(0);
      }
      else if (board[x][y] == 2 && blockType == 1) {
        fill(0,0,255);
      }
      else {
        fill(255); //empty
      }
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
    }
  }
}

//makes the board
void initializeValues() {
  board = new int[cols][rows];
  cellWidth = width/cols;
  cellHeight = height/rows;
}

//is the block black or blue?
void keyReleased() {
    if (key == '1') {
    blockType = 0;
  }
  if (key == '2') {
    blockType = 1;
  }
  if (key == ' ') {
    placed = false;
    if (lastBlockType == 0) {
      blockType = 1; 
    }
    else if (lastBlockType == 1) {
      blockType = 0; 
    }
  }
}

void mousePressed() {
  spotTaken();
}

//hides the board form the players
void mouseReleased() {
  blockType = 3;
}