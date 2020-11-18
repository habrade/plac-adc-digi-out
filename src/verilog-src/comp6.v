module comp6 (
    din,
    dout
);

input [5:0] din;
output [2:0] dout;

(* ram_style = "block" *) reg [2:0] dout_r;

always @ (din)
begin
    case (din)
        6'b00_0000 : dout_r = 3'h0;
        6'b00_0001 : dout_r = 3'h1;
        6'b00_0011 : dout_r = 3'h2;
        6'b00_0111 : dout_r = 3'h3;
        6'b00_1111 : dout_r = 3'h4;
        6'b01_1111 : dout_r = 3'h5;
        default    : dout_r = 3'h5;
    endcase  
end

assign dout = dout_r;

endmodule
