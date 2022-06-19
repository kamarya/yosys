module top (CLK, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8);
    /* I/O */
    input CLK;
    output LED1;
    output LED2;
    output LED3;
    output LED4;
    output LED5;
    output LED6;
    output LED7;
    output LED8;

    /* Counter register */
    reg [31:0] counter = 32'b0;

    /* LED drivers */
    assign LED1 = counter[18];
    assign LED2 = counter[19];
    assign LED3 = counter[20];
    assign LED4 = counter[21];
    assign LED5 = counter[22];
    assign LED6 = counter[23];
    assign LED7 = counter[24];
    assign LED8 = counter[25];

    /* always */
    always @ (posedge CLK) begin
        counter <= counter + 1;
    end

endmodule
