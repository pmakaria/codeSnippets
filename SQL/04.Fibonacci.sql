--Implemet the Fibonacci sequence in SQL (Oracle version)

function fib (n in number) return number 
is

begin
	 if n=0 then
	 	return 0;
	 end if;	
	 if  n=1 then
	 	  return 1;
	 else
	 return fib(n-1)+fib(n-2);
	 end if;
end;


---------------------
--Call the function we created above.
declare
i number;
f number;
begin
     for i in 1..15 loop
          f:=fib(i);      
          dbms_output.put_line ('Fibonacci seq for :'||to_char(i)||' is:'||to_char(f));
     end loop;
end;