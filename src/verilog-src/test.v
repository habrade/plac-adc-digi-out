`timescale 1ns/100ps

module  test(
    clk,
    clk_p1,
    clk_p2,
    rst,

    t1,
    t2,
    t3,
    t4,
    t5,

    calc_out
);

input clk;
input clk_p1;
input clk_p2;
input rst;

input  [13:0] t1;
input  [5:0]  t2;
input  [5:0]  t3;
input  [5:0]  t4;
input  [14:0] t5;

output reg [12:0] calc_out;

wire clk_p1_delay;
wire clk_p2_delay;

reg [3:0] t1_v [5:0];
reg [2:0] t2_v [4:0];
reg [2:0] t3_v [3:0];
reg [2:0] t4_v [2:0];
reg [3:0] t5_v [1:0];

wire [3:0] t1_v_0;
wire [2:0] t2_v_0;
wire [2:0] t3_v_0;
wire [2:0] t4_v_0;
wire [3:0] t5_v_0;

assign #7.0 clk_p1_delay = clk_p1;
assign #7.0 clk_p2_delay = clk_p2;

comp14 gen_t1_in (
    .din(t1),
    .dout(t1_v_0)
);

comp6 gen_t2_in (
    .din(t2),
    .dout(t2_v_0)
);

comp6 gen_t3_in (
    .din(t3),
    .dout(t3_v_0)
);

comp6 gen_t4_in (
    .din(t4),
    .dout(t4_v_0)
);

comp15 gen_t5_in (
    .din(t5),
    .dout(t5_v_0)
);


always @(*)
begin
 t1_v[0] = t1_v_0;
 t2_v[0] = t2_v_0;
 t3_v[0] = t3_v_0;
 t4_v[0] = t4_v_0;
 t5_v[0] = t5_v_0;
end

integer i;

always @(posedge clk_p1_delay or negedge clk_p1_delay)
begin
    if (rst == 1) begin
        for (i=1; i<=5; i=i+1) begin
            t1_v[i] <= 4'h0;
        end
    end
    else begin
        for (i=0; i<5; i=i+1) begin
            t1_v[i+1] <= t1_v[i];
        end
    end  
end

always @(posedge clk_p2_delay or negedge clk_p2_delay)
begin
    if (rst == 1) begin
        for (i=1; i<=4; i=i+1) begin
            t2_v[i] <=  4'h0;
        end
    end
    else begin
        for (i=0; i<4; i=i+1) begin
            t2_v[i+1] <= t2_v[i];
        end
    end  
end

always @(posedge clk_p1_delay or negedge clk_p1_delay)
begin
    if (rst == 1) begin
        for (i=1; i<=3; i=i+1) begin
            t3_v[i] <=  4'h0;
        end
    end
    else begin
        for (i=0; i<3; i=i+1) begin
            t3_v[i+1] <= t3_v[i];
        end
    end  
end


always @(posedge clk_p2_delay or negedge clk_p2_delay)
begin
    if (rst == 1) begin
        for (i=1; i<=2; i=i+1) begin
            t4_v[i] <=  4'h0;
        end
    end
    else begin
        for (i=0; i<2; i=i+1) begin
            t4_v[i+1] <= t4_v[i];
        end
    end  
end

always @(posedge clk_p1_delay or negedge clk_p1_delay)
begin
    if (rst == 1)
        t5_v[1] <= 4'h0;
    else
        t5_v[1] <= t5_v[0];
end

always @(posedge clk)
begin
    if (rst == 1)
        calc_out <= 13'h0000;
    else
        calc_out <= (t1_v[5] << 9) +
                    (t2_v[4] << 7) +
                    (t3_v[3] << 5) +
                    (t4_v[2] << 3) +
                    t5_v[1];
end

endmodule


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
