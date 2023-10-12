#include <stdio.h>
#include <stdlib.h>
//#include <time.h>

#define UP 0     //-y
#define DOWN 1   //+y
#define LEFT 2   //-x
#define RIGHT 3  //+x

volatile int * const VG_ADDR = (int *)0x11100000;
volatile int * const VG_COLOR = (int *)0x11140000;
volatile int * const  LEDS = (int *) 0x11080000;
volatile int * const SWITCHES = (int*)  0x11000000;
#define nodeadend //generate a maze without any dead ends! (consequently, many solutions to maze)
//#define prim
#define backtrack //enable this to generate mazes using depth-first search. Don't enable both.

long numin=1;     //Number of cells in the maze.
#define xsize 40	// 160  for 320x240
#define  ysize 30	//  120

void initialize();
void generate();
static void draw_dot(int X, int Y, int color);


#define in(X) (X&1)		//Bit0	
#define up(X) ((X&2)>>1)		//Bit1
#define left(X) ((X&4)>>2)	//Bit2
#define prevy(X) ((X&0x1F8)>>3)	//Bits[8:3]  6 bits
#define prevx(X) ((X&0xFE00)>>9)	//Bits[15:9]  7 bits


#define in_w(X,Y) X&=~(1);  X|=Y		//Bit0	
#define up_w(X,Y) X&=~(2);  X|=(Y<<1)	//Bit1
#define left_w(X,Y) X&=~(4); X|=(Y<<2)	//Bit2
#define prevy_w(X,Y) X&=~(0x1F8);  X|=(Y<<3)	//Bits[8:3]  6 bits
#define prevx_w(X,Y) X&=~(0xFE00); X|=(Y<<9)	//Bits[15:9]  7 bits

//use 16 bits to store these fields

int MAZE[xsize][ysize];


//#define WHITE printf(" ")
//#define BLACK printf("X")
#define WHITE	draw_dot(x,y,0xFF)
#define BLACK	draw_dot(x,y,0X00)
#define RED 	draw_dot(x,y,0xE0)

void draw_maze()
{
	int width=(xsize-1)*2-1;
	int height=(ysize-1)*2-1;
	//Actual writing of data begins here:
	for(int y = 0; y <= height - 1; y++){
		for(int x = 0; x <= width - 1; x++){
			if(x%2 == 1 && y%2 == 1){
				//if(x/2+1 == xspecial && y/2+1 == yspecial) RED;
				//else{
					if((in(MAZE[x/2+1][y/2+1]))==1) WHITE; else BLACK;
				//}
			}else if(x%2 == 0 && y%2 == 0){
				BLACK;
			}else if(x%2 == 0 && y%2 == 1){
				if((left(MAZE[x/2+1][y/2+1]))==1) BLACK; else WHITE;
			}else if(x%2 == 1 && y%2 == 0){
				if((up(MAZE[x/2+1][y/2+1]))==1) BLACK; else WHITE;
			}
		}
		//printf("\n");
	}
}

void draw_maze2(int xcur,int ycur)
{
	int width=(xsize-1)*2-1;
	int height=(ysize-1)*2-1;
	//Actual writing of data begins here:
	for(int y = 0; y <= height - 1; y++){
		for(int x = 0; x <= width - 1; x++){
			if(x%2 == 1 && y%2 == 1){
				if(x/2+1 == xcur && y/2+1 == ycur) RED;
				else{
					if((in(MAZE[x/2+1][y/2+1]))==1) WHITE; else BLACK;
				}
			}else if(x%2 == 0 && y%2 == 0){
				BLACK;
			}else if(x%2 == 0 && y%2 == 1){
				if((left(MAZE[x/2+1][y/2+1]))==1) BLACK; else WHITE;
			}else if(x%2 == 1 && y%2 == 0){
				if((up(MAZE[x/2+1][y/2+1]))==1) BLACK; else WHITE;
			}
		}
		//printf("\n");
	}
}



void wait(int t)
{
	for(int i=0;i<t;i++);
	return;
}

int main(){
	//Read the switches
	// srand (value of switches)
	srand(*SWITCHES); //seed random number generator with system time
	while(1)
	{
		*LEDS = 1;
		initialize();      //initialize the maze
		//draw_maze();
		*LEDS=2;
		generate();        //generate the maze
		*LEDS=3;
		draw_maze();	   // draws the maze
		*LEDS=4;
		wait(10000);
		while((*SWITCHES&1)==0);
	}
	return 0;
}

void initialize(){

	for(int x=0;x<xsize;x++)
		for(int y=0;y<ysize;y++)
			MAZE[x][y]=0;
	numin=1;
	//Initialize the maze!
	for(int x=0;x<xsize;x++){
		for(int y=0;y<ysize;y++){
			//The maze cells on the edges of the maze are "in" to provide padding. Otherwise, all maze cells are not in.
			in_w(MAZE[x][y],  (x==0||x==xsize-1||y==0||y==ysize-1)?1:0);
			//All maze cells have all walls existing by default, except the perimeter cells.
			up_w(MAZE[x][y],  ((x==0||x==xsize-1||y==0)?0:1));
			left_w(MAZE[x][y], ((x==0||y==0||y==ysize-1)?0:1));

			//printf("%d ", in(MAZE[x][y]));
		}
		//printf("\n");
	}
	return;
}

void generate(){
	int xcur=1, ycur=1;	//start growing from the corner. It could theoretically start growing from anywhere, doesn't matter.
	in_w(MAZE[xcur][ycur],1);
	int whichway;
	int success;
	do{

#ifdef nodeadend
		if( in(MAZE[xcur][ycur-1])&&in(MAZE[xcur][ycur+1])&&
			   in(MAZE[xcur-1][ycur])&&in(MAZE[xcur+1][ycur]) ){
				   //If at a dead end, randomly destroy a wall to make it not a dead end!
			do{
				success=0;
				whichway=rand()%4;

				switch(whichway){
				case UP:
					if(up(MAZE[xcur][ycur])&&ycur!=1){
						success=1;
						up_w(MAZE[xcur][ycur],0);
					}
					break;
				case DOWN:
					if(up(MAZE[xcur][ycur+1])&&ycur!=ysize-2){
						success=1;
						up_w(MAZE[xcur][ycur+1],0);
					}
					break;
				case LEFT:
					if(left(MAZE[xcur][ycur])&&xcur!=1){
						success=1;
						left_w(MAZE[xcur][ycur],0);
					}
					break;
				case RIGHT:
					if(left(MAZE[xcur+1][ycur])&&xcur!=xsize-2){
						success=1;
						left_w(MAZE[xcur+1][ycur],0);
					}
					break;
				}
			}while(!success);
		}
#endif
#ifdef backtrack
		while( (in(MAZE[xcur][ycur-1])==1) &&(in(MAZE[xcur][ycur+1])==1)&&
			  (in(MAZE[xcur-1][ycur])==1)&&(in(MAZE[xcur+1][ycur])==1) ){
				   //If all the neighbourhood cells are in, backtrack.
				int xcur2=prevx(MAZE[xcur][ycur]);
				ycur=prevy(MAZE[xcur][ycur]);
				xcur=xcur2;
		}
#endif
#ifdef prim
		do{
			//randomly find a cell that's in the maze
			xcur=rand()%(xsize-2)+1;
			ycur=rand()%(ysize-2)+1;
		}while((in(MAZE[xcur][ycur])==0) ||
			(in(MAZE[xcur][ycur-1])==1)&&(in(MAZE[xcur][ycur+1])==1)&&
			(in(MAZE[xcur-1][ycur])==1)&&(in(MAZE[xcur+1][ycur])==1));
#endif
		do{
			//Randomly grow the maze if possible.
			success=0;
			whichway=rand()%4;
			switch(whichway){
			case UP:
				if(!in(MAZE[xcur][ycur-1])){
					success=1;
					up_w(MAZE[xcur][ycur],0);
					prevx_w(MAZE[xcur][ycur-1],xcur);
					prevy_w(MAZE[xcur][ycur-1],ycur);
					ycur--;
				}
				break;
			case DOWN:
				if(!in(MAZE[xcur][ycur+1])){
					success=1;
					up_w(MAZE[xcur][ycur+1],0);
					prevx_w(MAZE[xcur][ycur+1],xcur);
					prevy_w(MAZE[xcur][ycur+1],ycur);
					ycur++;
				}
				break;
			case LEFT:
				if(!in(MAZE[xcur-1][ycur])){
					success=1;
					left_w(MAZE[xcur][ycur],0);
					prevx_w(MAZE[xcur-1][ycur],xcur);
					prevy_w(MAZE[xcur-1][ycur],ycur);
					xcur--;
				}
				break;
			case RIGHT:
				if(!in(MAZE[xcur+1][ycur])){
					success=1;
					left_w(MAZE[xcur+1][ycur],0);
					prevx_w(MAZE[xcur+1][ycur],xcur);
					prevy_w(MAZE[xcur+1][ycur],ycur);
					xcur++;
				}
				break;
			}
		}while(!success);
		in_w(MAZE[xcur][ycur],1);
		numin++; //Every iteration of this loop, one maze cell is added to the maze.
		if(((*SWITCHES&2)>>1)==1)
		{	draw_maze2(xcur,ycur);
			wait(50000);
		}
	}while(numin<(xsize-2)*(ysize-2));
	return;


}


static void draw_dot(int X, int Y, int color){
	*VG_ADDR = (Y<<7) | X;
	*VG_COLOR = color;
}



















