(*Author: André Lustosa
  Date: 22/03/2018
  Last Changed on: 26/03/2018
	*)

class Main inherits IO{
	n:Int;
	popped_data:String;
	is_cmd_x:Bool;
	top1:String;
	top2:String;
	atoi:A2I;
	stat:Int;
	read_command:String;
	stack_head:StackCommand;
	temp_command_1:StackCommand;
	temp_command_2:StackCommand;
	string_temp:String;

    push(st:String):Object
    {{
        n<-n+1;
		temp_command_1<-new StackCommand;
        temp_command_1.init(st);
        if n=1 then stack_head<-temp_command_1 
        else
        	{temp_command_1.addthis(stack_head);
            	stack_head<-temp_command_1;}
        fi;
    }};

    pop():String
    {{
        n<-n-1;
        string_temp<-stack_head.getelem();
        stack_head<-stack_head.getnext();
        string_temp;
    }};

    
	print_stack():Object
	{{
		
		temp_command_2<-stack_head;
		while not isvoid temp_command_2 
						   loop 
						   {out_string(temp_command_2.getelem());out_string("\n");
						   temp_command_2<-temp_command_2.getnext();
						   }
						   pool;
	
	}};

	
	main():Object
	{{
		n<-0;
		is_cmd_x<-true;
		atoi<-new A2I;
		while is_cmd_x loop 
				{
					out_string(">");
					read_command<-in_string();
		            if read_command ="x" then {is_cmd_x<-false;}
					else
		        	if read_command="e" then 
						{
							popped_data<-pop();
							if popped_data="+" then
							{
								top1<-pop();
								top2<-pop();
								push(atoi.i2a(atoi.a2i(top1)+atoi.a2i(top2)));
							}
				           	else if popped_data="s" then {top1<-pop();top2<-pop();push(top1);push(top2);}
				           	else push(popped_data)
								 fi
			       			fi;
	     				}
		           	else if read_command="d" then print_stack()
					else push(read_command)
						 fi
						fi
					fi;
				}
				 pool;	
			 
			 		
	}};




};

class StackCommand inherits IO{

	h:String;
	t:StackCommand;
	init(x:String):Object{
	h<-x
	};
	addthis(y:StackCommand):Object{
	t<-y
	};
	getelem():String{h};
	getnext():StackCommand{t};
};
