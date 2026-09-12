/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_slurpyplurpy_counter (
    input  wire [7:0] ui_in,    		// Dedicated inputs
    output wire [7:0] uo_out,   		// Dedicated outputs
    input  wire [7:0] uio_in,   		// IOs: Input path
    output wire [7:0] uio_out,  		// IOs: Output path
    output wire [7:0] uio_oe,   		// IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      		// always 1 when the design is powered, so you can ignore it
    input  wire       clk,      		// clock
    input  wire       rst_n    		// reset_n - low to reset
);
    reg  [7:0] count;
    wire load_signal = uio_in[0];
    wire oe_signal   = uio_in[1];
    wire [7:0] data_in = ui_in;
  
    always @(posedge clk or negedge rst_n) begin
    
    if (!rst_n) begin
        // 1. Reset logic
        count <= {8'b0}; // Reset count to 0
    end else if (load_signal) begin
        // 2. Synchronous load logic
        count <= data_in;
    end else begin
        // 3. Counter increment logic
        count <= count + 1'b1;	// increment count by 1 bit
    end
end

    // All output pins must be assigned. If not used, assign to 0.
    assign uio_out = 0;
    assign uio_oe  = 0;
    assign uo_out = (oe_signal) ? count : 8'bzzzz_zzzz;

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_in[7:2], 1'b0};

endmodule
