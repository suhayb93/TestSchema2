CREATE OR REPLACE NONEDITIONABLE type mdsys.vertex_type as object
(X  number,
 Y  number,
 Z  number,
 W  number,
 v5 number,
 v6 number,
 v7 number,
 v8 number,
 v9 number,
 v10 number,
 v11 number,
 ID number,
 Constructor
 Function vertex_type(x  In number,
                     y  In number,
                     id In number)
 Return Self As Result,
Constructor
Function vertex_type(x In number,
                     y In number,
                     z In number,
                     w in number)
Return Self As Result,
Constructor
Function vertex_type(x In number,
                     y In number,
                     z In number,
                     w in number,
                     id in number)
Return Self As Result );
/
CREATE OR REPLACE type body mdsys.vertex_type IS
 Constructor
 Function vertex_type(x  In number,
                     y  In number,
                     id In number)
 Return Self As Result IS
 BEGIN
   SELF.X := x;
   SELF.Y := Y;
   SELF.ID := id;
   SELF.Z := NULL;
   SELF.W := NULL;
   SELF.V5 := NULL;
   SELF.V6 := NULL;
   SELF.V7 := NULL;
   SELF.V8 := NULL;
   SELF.V9 := NULL;
   SELF.V10 := NULL;
   SELF.V11 := NULL;
   RETURN;
  END;
 Constructor
 Function vertex_type(x  In number,
                     y  In number,
                     z  In number,
                     w  In number)
 Return Self As Result IS
 BEGIN
   SELF.X := x;
   SELF.Y := Y;
   SELF.Z := z;
   SELF.W := w;
   SELF.ID := NULL;
   SELF.V5 := NULL;
   SELF.V6 := NULL;
   SELF.V7 := NULL;
   SELF.V8 := NULL;
   SELF.V9 := NULL;
   SELF.V10 := NULL;
   SELF.V11 := NULL;
   RETURN;
  END;
 Constructor
 Function vertex_type(x  In number,
                     y  In number,
                     z  In number,
                     w  In number,
                     id In number)
 Return Self As Result IS
 BEGIN
   SELF.X := x;
   SELF.Y := Y;
   SELF.ID := id;
   SELF.Z := z;
   SELF.W := w;
   SELF.V5 := NULL;
   SELF.V6 := NULL;
   SELF.V7 := NULL;
   SELF.V8 := NULL;
   SELF.V9 := NULL;
   SELF.V10 := NULL;
   SELF.V11 := NULL;
   RETURN;
  END;
 END;
/