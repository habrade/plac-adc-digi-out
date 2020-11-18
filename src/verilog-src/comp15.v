module comp15 (
    din,
    dout
);

input [14:0] din;
output [3:0] dout;

(* ram_style = "block" *) reg [3:0] dout_r;

always @ (din)
begin
    case (din)
        15'b000_0000_0000_0000: dout_r = 4'h0;
        15'b000_0000_0000_0001: dout_r = 4'h1;
        15'b000_0000_0000_0011: dout_r = 4'h2;
        15'b000_0000_0000_0111: dout_r = 4'h3;
        15'b000_0000_0000_1111: dout_r = 4'h4;
        15'b000_0000_0001_1111: dout_r = 4'h5;
        15'b000_0000_0011_1111: dout_r = 4'h6;
        15'b000_0000_0111_1111: dout_r = 4'h7;
        15'b000_0000_1111_1111: dout_r = 4'h8;
        15'b000_0001_1111_1111: dout_r = 4'h9;
        15'b000_0011_1111_1111: dout_r = 4'ha;
        15'b000_0111_1111_1111: dout_r = 4'hb;
        15'b000_1111_1111_1111: dout_r = 4'hc;
        15'b001_1111_1111_1111: dout_r = 4'hd;
        15'b011_1111_1111_1111: dout_r = 4'he;
        default               : dout_r = 4'he;
    endcase  
end

assign dout = dout_r;

endmodule
