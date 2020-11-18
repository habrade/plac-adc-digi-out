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

always @(posedge clk_p1)
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

always @(posedge clk_p2)
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

always @(posedge clk_p1)
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


always @(posedge clk_p2)
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

always @(posedge clk_p1)
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
        calc_out <= {t1_v[5][3:1],
                    t1_v[5][0] | t2_v[4][2],
                    t2_v[4][1] ,
                    t2_v[4][0] | t3_v[3][2],
                    t3_v[3][1] ,
                    t3_v[3][0] | t4_v[2][2],
                    t4_v[2][1] ,
                    t4_v[2][0] | t5_v[1][3] ,
                    t5_v[1][2:0]
                    };
end

endmodule