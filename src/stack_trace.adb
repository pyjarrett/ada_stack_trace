with Ada.Exceptions;
with Ada.Text_IO;
with GNAT.Traceback.Symbolic;

procedure Stack_Trace is
   use Ada.Text_IO;

   Bad : exception;

   procedure Foo is
   begin
      raise Bad;
   end Foo;


   procedure Bar is
   begin
      Foo;
   end Bar;
begin
   Bar;
exception
    when Err : others =>
        Put_Line (Ada.Exceptions.Exception_Information (Err));
        Put_Line ("Exception traceback: " & GNAT.Traceback.Symbolic.Symbolic_Traceback (Err));
end Stack_Trace;
