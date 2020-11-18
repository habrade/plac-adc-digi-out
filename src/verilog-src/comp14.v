module comp14 (
    din,
    dout
);

input [13:0] din;
output [3:0] dout;

(* ram_style = "block" *) reg [3:0] dout_r;

always @ (din)
begin
    case (din)
        14'b00_0000_0000_0000: dout_r = 4'h0;
        14'b00_0000_0000_0001: dout_r = 4'h1;
        14'b00_0000_0000_0011: dout_r = 4'h2;
        14'b00_0000_0000_0111: dout_r = 4'h3;
        14'b00_0000_0000_1111: dout_r = 4'h4;
        14'b00_0000_0001_1111: dout_r = 4'h5;
        14'b00_0000_0011_1111: dout_r = 4'h6;
        14'b00_0000_0111_1111: dout_r = 4'h7;
        14'b00_0000_1111_1111: dout_r = 4'h8;
        14'b00_0001_1111_1111: dout_r = 4'h9;
        14'b00_0011_1111_1111: dout_r = 4'ha;
        14'b00_0111_1111_1111: dout_r = 4'hb;
        14'b00_1111_1111_1111: dout_r = 4'hc;
        14'b01_1111_1111_1111: dout_r = 4'hd;
        default              : dout_r = 4'hd;
    endcase  
end

assign dout = dout_r;

endmodule
