module l7q3(input [3:0] ip1,ip2,output [7:0] op,input load,clk);

reg [8:0] prod=9'd0;
wire [3:0]t1;
wire [1:0]sel;

assign t1=(~ip1)+1'b1;
assign sel={prod[1],prod[0]};
assign op=prod[8:1];

always @ (posedge clk)
begin
if (load==1'b1)
prod={4'd0,ip2,1'd0};

else
case(sel)
2'b00:begin
      prod={prod[8],prod[8:1]};
      end
2'b01: begin
       prod=prod+{ip1,5'd0};
       prod={prod[8],prod[8:1]};
       end
2'b10:begin
      prod=prod+{t1,5'd0};
       prod={prod[8],prod[8:1]};
      end
2'b11: begin
      prod={prod[8],prod[8:1]};
      end
endcase
end
endmodule
//======================= TB ============================//
module tb;

reg [3:0] tip1,tip2;
reg tload,tclk;
wire [7:0]top;

l7q3 t0(tip1,tip2,top,tload,tclk);

always
begin
tclk=1'b1;
#5
tclk=1'b0;
#5;
end
initial
begin
tip1=4'd12;
tip2=4'd4;
tload=1'b1;
#10

tip1=4'd12;
tip2=4'd4;
tload=1'b0;
#50

tip1=4'd11;
tip2=4'd8;
tload=1'b1;
#10

tip1=4'd11;
tip2=4'd8;
tload=1'b0;
#50

tip1=4'd2;
tip2=4'd14;
tload=1'b1;
#10

tip1=4'd2;
tip2=4'd14;
tload=1'b0;
#50;
end
endmodule












	  


