
Unit CODE;

Interface
  Procedure Draw(); // Draw smthing @60
  Procedure Init(); // Before all code 
  Procedure Mouse_Pressed(Button , State , mX , mY : LongInt ) ;  // subj
  Procedure Key_Pressed(Key : LongInt ) ; // subj
 

Implementation
  Uses FastGraph , MATH;
  
  var x , y : LongInt;
      mode : LongInt;
      
  var Sonic : Array [ 1 .. 5 ] of TPoint;

  Procedure Draw();
  begin
    Clear();
    
    if ( mode = 0 ) then
      SetColor ( 255 , 0 , 0 ) 
    else
      SetColor ( 0 , 255 , 0 ) ; 
    
    Rectangle ( x-10 , y-10 , x+10 , y+10 ) ; 
    
    SetColor(0,0,255);
    Polygon ( Sonic , 4 ) ; 
    
    
    
    Paint();
  end;
  
  Procedure Init();
  begin 
    mode := 1 ; 
    x := 400;
    y := 400;
    
    Sonic[1].x := 10; Sonic[1].y := 10;
    Sonic[2].x := 22; Sonic[2].y := 13;
    Sonic[3].x := 50; Sonic[3].y := 50;
    Sonic[4].x := 10; Sonic[4].y := 50;
    Sonic[5].x := 10; Sonic[5].y := 10;
  end;
  
  Procedure Mouse_Pressed(Button , State , mX , mY : LongInt ) ;  // subj
  begin
    mode := state;
  end;
    
  Procedure Key_Pressed(Key : LongInt ) ; // subj
  begin
    if ( key = ord('w') ) then
      inc ( y , 5 ) ; 
    if ( key = ord('s') ) then
      inc ( y , -5 ) ; 
    if ( key = ord('a') ) then
      inc ( x , -5 ) ;
    if ( key = ord('d') ) then
      inc ( x , 5 ) ; 
  end;
  

Initialization
end.