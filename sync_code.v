// Design code for Synchronous FIFO

module sync_fifo(
    input clk,
    input reset,
    input wr_en,
    input rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);
reg [7:0] mem [0:7];
reg [2:0] wr_ptr;
reg [2:0] rd_ptr;
reg [3:0] count;

//Status flag
assign empty = (count == 0);
assign full  = (count == 8);
 
//Reset Logicalways @(posedge clk)
begin
    if (reset)
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count  <= 0;
        data_out <= 0;
    end
    else
    begin
     
        //Write operation
        if (wr_en && !full)
        begin
           mem[wr_ptr] <= data_in;
           wr_ptr <=wr_ptr + 1;
           count <= count+1;
        end
     
        //Read operation
        else if (rd_en && !empty)
        begin
        	data_out<= mem[rd_ptr];
        	rd_ptr<=rd_ptr+1;
        	count<=count-1;
    	end
	end
end


endmodule
