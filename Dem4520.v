module Dem4(clk,q,ra);
  input clk;
  output reg [1:0] q = 0;
  output reg ra;
  
  always @ (posedge clk) begin
    if(q==3) q<=0;
    else q<=q+1;
  end
  always @ (posedge clk) begin
    if(q==3) ra<=1;
    else ra<=0;
  end
endmodule

/*******************************************************/
module Dem5(clk,q,ra);
  input clk;
  output reg [2:0] q = 0;
  output reg ra;
  
  always @ (posedge clk) begin
    if(q==4) q<=0;
    else q<=q+1;
  end
  always @ (posedge clk) begin
    if(q==4) ra<=1;
    else ra<=0;
  end
endmodule
/*******************************************************/
module Dem20(clk,q,ra);
  input clk;
  output reg [4:0] q;
  output reg ra;
  
  //internal signal
  wire [1:0] q1;
  wire [2:0] q2;
  wire ra1;
  wire ra2;
  
  Dem4 D1(.clk(clk),.q(q1),.ra(ra1));
  Dem5 D2(.clk(ra1),.q(q2),.ra(ra2));
  
  always @ (posedge clk) begin
    case(q2)
      3'd0 : q<=q1;
      3'd1 : q<=q1+4;
      3'd2 : q<=q1+8;
      3'd3 : q<=q1+12;
      3'd4 : q<=q1+16;
    endcase
  end
  
  always @ (posedge clk) begin
    if(q==19) ra<=1;
    else ra<=0;
  end
    
endmodule
/*******************************************************/
module Test;
  reg clk;
  wire [4:0] q;
  wire ra;
  
  Dem20 D(.clk(clk),.q(q),.ra(ra));
  initial begin
    clk=1;
    repeat(200) #20 clk = ~clk;
  end
endmodule

    
