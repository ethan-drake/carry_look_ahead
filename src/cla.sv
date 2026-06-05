// Code your design here
module adder #(parameter WIDTH=4) (
  	input logic [WIDTH-1:0] srca,
    input logic [WIDTH-1:0] srcb,
    input logic cin,
    input logic is_signed,
    output logic [WIDTH-1:0] result,
    output logic cout,
    output logic zero_f,
    output logic ov_f
);
  
  logic [WIDTH-1:0] g, p;
  logic [WIDTH:0] c;
  assign g = srca & srcb;          
  assign p = srca ^ srcb;          
  // generate
  // propagate
  assign c[0] = cin;
  
  genvar i;
  generate
    for (i=0; i < WIDTH; i++) begin: cla
      assign c[i+1] = g[i] | (p[i] & c[i]);
    end
  endgenerate
  

  assign result  = p ^ c[WIDTH-1:0];
  assign cout = c[WIDTH];

  assign zero_f = (result==0);
  assign ov_f = is_signed ? ((c[WIDTH-1]) ^ (c[WIDTH])) : c[WIDTH];
  
endmodule
