module bm (output [7:0] product, input [3:0] ip1, ip2, input clk,rst);
integer count=0;
reg [8:0] tprod;
wire [1:0] check;

initial
begin
tprod[4:1]=ip2;
end

assign check=tprod[1:0];
assign product=tprod[8:1];
always @ (posedge clk,posedge rst)
begin
if (rst==1)
begin
tprod=9'd0;
count=0;
end
else
begin
while(count<4)
begin
case (check)
2'b00: tprod={tprod[0],tprod[8:1]};
2'b11: tprod={tprod[0],tprod[8:1]};
2'b01:
begin
tprod[8:5]=tprod[8:5]+ip1;
tprod={1'b0,tprod[8:1]};
count=count+1;
end
2'b10:
begin
tprod[8:5]=tprod[8:5]-ip1;
tprod={1'b1,tprod[8:1]};
count=count+1;
end
endcase

end
end
end

endmodule