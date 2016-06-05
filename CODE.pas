
Unit CODE;

Interface
  Procedure Draw(); // Draw smthing @60
  Procedure Init(); // Before all code 
  Procedure Mouse_Pressed(Button , State , mX , mY : LongInt ) ;  // subj
  Procedure Key_Pressed(Key : LongInt ) ; // subj
 

Implementation
  Uses FastGraph , MATH ;
  
  Type Point3D = record
    x , y , z : LongInt;
  end;
  
  function GetPoint3D ( x , y , z : LongInt ) : Point3D;
  begin
    GetPoint3D.x := x;
    GetPoint3D.y := y;
    GetPoint3D.z := z;
  end;
  
  Operator + ( Const L , R : Point3D ) Res : Point3D;
  begin
    Res.x := L.x + R.x;
    Res.y := L.y + R.y;
    Res.z := L.z + R.z;
  end;
  
  
  
  Const ClientWidth = 800;
        ClientHeight = 800;
        Dist = 100;
  
  Function Get2D ( Const P : Point3D ) : TPoint;
    var K : Extended;
  begin    
    Get2D.x := ROUND ( ClientWidth  div 2 + P.x * Dist / ( Dist + P.z ) ) ; 
    Get2D.y := ROUND (ClientHeight div 2 - P.y * Dist / ( Dist + P.z )  ) ; 
  end;
  
  procedure LineP ( const L , R : TPoint ) ;
  begin
    Line ( L.x , L.y , R.x , R.y ) ; 
  end;
  
  var P1 , P2 , P3 , P4 , move : Point3D; 
  
      rate : LongInt = 1;
  
  procedure Draw3d();
    var Wall : Array [ 1 .. 4 ] of TPoint;
        one , two : TPoint;
        
  begin
    inc ( Move.x , rate ) ; 
    inc ( Move.y , -rate);
    if ( abs ( Move.x ) > 400 ) or ( abs ( Move.y ) > 400 ) then
      rate := -rate;
  
    // Draw XYZ Axis
    
    One := Get2D ( Move ) ; 
    Two := Get2D ( Move + GetPoint3D ( 10000 , 0 , 0 ) ) ; 
    SetColor ( 255 , 0 , 0 ) ; 
    Line ( One.x , One.y , Two.x , Two.y ) ; 
    
    Two := Get2D ( Move + GetPoint3D ( 0 , 10000 , 0 ) ) ; 
    SetColor ( 255 , 0 , 0 ) ; 
    Line ( One.x , One.y , Two.x , Two.y ) ; 
    
    Two := Get2D ( Move + GetPoint3D ( 0 , 0 , 10000 ) ) ; 
    SetColor ( 255 , 0 , 0 ) ; 
    Line ( One.x , One.y , Two.x , Two.y ) ; 
    
    
    // Draw 3D Wall
    Wall[1] := Get2D ( P1 + Move ) ; 
    Wall[2] := Get2D ( P2 + Move ) ; 
    Wall[3] := Get2D ( P4 + Move ) ; 
    Wall[4] := Get2D ( P3 + Move ) ; 
    
    
    SetColor ( 34 , 150 , 150 ) ; 
    Polygon ( Wall , 4 ) ; 
    
    SetColor ( 200 , 200 , 200 ) ; 
    
    LineP ( Wall[1] , Wall[2] ) ; 
    LineP ( Wall[1] , Wall[4] ) ;
    LineP ( Wall[3] , Wall[4] ) ; 
    LineP ( Wall[2] , Wall[3] ) ;
     
    
    
    
    
    
  end;
  
  
    
  Procedure Draw();
  begin
    
    
    Clear();
    
    Draw3d();   
    
    
    Paint();
  end;
  
  Procedure Init();
  begin 
    
    P1.x := 100;
    P1.y := 100;
    P1.z := 100;
    
    P2.x := 100;
    P2.y := 400;
    P2.z := 100;
    
    P3.x := 400;
    P3.y := 100;
    P3.z := 200;
    
    P4.x := 400;
    P4.y := 400;
    P4.z := 200;
    
    Move.x := 0;
    Move.y := 0;
    Move.z := 0;
    
  end;
  
  Procedure Mouse_Pressed(Button , State , mX , mY : LongInt ) ;  // subj
  begin
  end;
    
  Procedure Key_Pressed(Key : LongInt ) ; // subj
  begin
    if ( Key = Ord ( 'w' ) ) then
      Move.y := Move.y - 10;
    if ( Key = Ord ( 's' ) ) then
      Move.y := Move.y + 10;
    if ( Key = Ord ( 'a' ) ) then
      Move.x := Move.x + 10;
    if ( Key = Ord ( 'd' ) ) then
      Move.x := Move.x - 10;
    if ( Key = 13 ) then
    begin
      writeLn ( Move.x , ' ' , Move.y ) ; 
    end;
  end;
  

Initialization
end.