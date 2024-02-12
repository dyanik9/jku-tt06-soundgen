/*
 * Copyright (c) 2024 Yanik Drmla
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_soundgen (
    input wire       ena,      	// will go high when the design is enabled
    input wire       clk,      	// clock
    input wire       rst_n,     // reset_n - low to reset
    
    // not needed
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe   	// IOs: Bidirectional Enable path (active high: 0=input, 1=output)
);	

	assign uio_out[0] = 1'b0;
	assign uio_out[1] = 1'b0;
	assign uio_out[2] = 1'b0;
	assign uio_out[3] = 1'b0;
	assign uio_out[4] = 1'b0;
	assign uio_out[5] = 1'b0;
	assign uio_out[6] = pwm_pos;
	assign uio_out[7] = pwm_neg;

    wire reset = ! rst_n;
    
    wire pwm_neg;
    wire pwm_pos;
    
    // handle not needed wires
    /* verilator lint_off UNUSEDSIGNAL */
    wire [7:0] dummy1 = ui_in;
    wire [7:0] dummy2 = uio_in;
    wire foo = ena;
    /* verilator lint_on UNUSEDSIGNAL */
    assign uio_oe = 8'b1;
    assign uo_out = 8'b0;
    // ---------
    
    // Prelude
    prelude prelude (
		.clk(clk),
		.reset(reset),
		.pwm_neg(pwm_neg),
		.pwm_pos(pwm_pos)
    );

endmodule // tt_um_soundgen
