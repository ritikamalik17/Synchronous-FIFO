//Test bench code for Synchronous FIFO
module sync_fifo_tb;

  //Input signals (driven by testbench)
reg clk;
reg reset;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

  //Outputs signals (driven by DUT)
wire [7:0] data_out;
wire full;
wire empty;

//Instantiating FIFO Module
sync_fifo uut(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock generation: 10 time unit period
always #5 clk = ~clk;

//Test stimulus
initial begin
    clk = 0;
    reset = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    #10 reset = 0;

    wr_en = 1;
    data_in = 8'hAA;
    #10;

    data_in = 8'hF0;
    #10;

    data_in = 8'h0F;
    #10;

    wr_en = 0;

    rd_en = 1;
    #30;

    rd_en = 0;

    $finish;
end
endmodule
