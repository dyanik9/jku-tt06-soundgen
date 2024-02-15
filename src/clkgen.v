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
	Counter with upper limit, for clkgen (creates just one strobe if maxval reached!)
*/

//‘ifndef __CLKGEN__
//‘define __CLKGEN__

module clkgen #(parameter N = 16) (
    input wire clk_i,    	// clock
    input wire reset,    	// reset
    input wire [N-1:0] maxval,	// maxval
    output wire clk_o // 1 if overflow, else 0
);	
	// assign output
	assign clk_o = clk_strobe;
	
	// declare local registers
    reg [N-1:0] ctr_r;
    reg clk_strobe;

    // here is the action
    always @(posedge clk_i) begin 
        if (reset) begin
            ctr_r <= 'd0;
            clk_strobe <= 'b0;
        end else if (ctr_r >= maxval - 'd1) begin
			ctr_r <= 'd0;
			clk_strobe <= 'b1;
        end else begin
			ctr_r <= ctr_r + 'd1;
			clk_strobe <= 'b0;
        end
    end
endmodule

//‘endif
