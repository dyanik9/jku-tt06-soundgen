// Copyright 2024 Yanik Drmla
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE−2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/*
	N bit DAC
*/

//‘ifndef __DAC__
//‘define __DAC__

module dac #(parameter N = 8) (
    input wire clk,    	// clock
    input wire dac_clk,
    input wire reset,    	// reset
    input wire [N-1:0] t_on,	// on-time
    input wire [N-1:0] period,
    output wire pwm_out
);	
	// assign output
	assign pwm_out = pwm;
	
	// declare local registers
    reg [N-1:0] ctr_r;
    wire pwm = ctr_r < t_on;	// 1 while count value < t_on else 0
    
    // here is the action
    always @(posedge clk) begin
        if (reset) begin
            ctr_r <= 'd0;
        end else if (dac_clk) begin
			if(ctr_r >= period - 'd1) begin
				ctr_r <= 'd0;
			end else begin
				ctr_r <= ctr_r + 'd1;
			end
        end
    end
endmodule

//‘endif
