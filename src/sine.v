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
	generate a 9-bit sinewave with 255 values, which will be played with varying frequency (using big LUT)
*/

//`ifndef __SINE__
//`define __SINE__

module sine (
	input wire clk,    	
	input wire sin_clk,	// frequency to play sine with (varying)
    input wire reset,
	output wire [8:0] pos_out,
	output wire [8:0] neg_out
);	
	reg [7:0] ctr_r;
	
	reg [8:0] pos_out_r;
	reg [8:0] neg_out_r;
	
	assign pos_out = pos_out_r;
	assign neg_out = neg_out_r;

    always @(posedge clk) begin
        if (reset) begin
            ctr_r <= 'd0;
            pos_out_r <= 'd0;
            neg_out_r <= 'd0;
        end else if (sin_clk) begin
        	// this is a 9-bit sinewave LUT with 255 values, which will be played using varying frequency
        	case(ctr_r)
				'd0: begin pos_out_r <= 'd0; neg_out_r <= 'd0; end
				'd1: begin pos_out_r <= 'd12; neg_out_r <= 'd0; end
				'd2: begin pos_out_r <= 'd25; neg_out_r <= 'd0; end
				'd3: begin pos_out_r <= 'd37; neg_out_r <= 'd0; end
				'd4: begin pos_out_r <= 'd50; neg_out_r <= 'd0; end
				'd5: begin pos_out_r <= 'd62; neg_out_r <= 'd0; end
				'd6: begin pos_out_r <= 'd74; neg_out_r <= 'd0; end
				'd7: begin pos_out_r <= 'd87; neg_out_r <= 'd0; end
				'd8: begin pos_out_r <= 'd99; neg_out_r <= 'd0; end
				'd9: begin pos_out_r <= 'd111; neg_out_r <= 'd0; end
				'd10: begin pos_out_r <= 'd124; neg_out_r <= 'd0; end
				'd11: begin pos_out_r <= 'd136; neg_out_r <= 'd0; end
				'd12: begin pos_out_r <= 'd148; neg_out_r <= 'd0; end
				'd13: begin pos_out_r <= 'd160; neg_out_r <= 'd0; end
				'd14: begin pos_out_r <= 'd172; neg_out_r <= 'd0; end
				'd15: begin pos_out_r <= 'd183; neg_out_r <= 'd0; end
				'd16: begin pos_out_r <= 'd195; neg_out_r <= 'd0; end
				'd17: begin pos_out_r <= 'd207; neg_out_r <= 'd0; end
				'd18: begin pos_out_r <= 'd218; neg_out_r <= 'd0; end
				'd19: begin pos_out_r <= 'd229; neg_out_r <= 'd0; end
				'd20: begin pos_out_r <= 'd240; neg_out_r <= 'd0; end
				'd21: begin pos_out_r <= 'd251; neg_out_r <= 'd0; end
				'd22: begin pos_out_r <= 'd262; neg_out_r <= 'd0; end
				'd23: begin pos_out_r <= 'd273; neg_out_r <= 'd0; end
				'd24: begin pos_out_r <= 'd283; neg_out_r <= 'd0; end
				'd25: begin pos_out_r <= 'd294; neg_out_r <= 'd0; end
				'd26: begin pos_out_r <= 'd304; neg_out_r <= 'd0; end
				'd27: begin pos_out_r <= 'd314; neg_out_r <= 'd0; end
				'd28: begin pos_out_r <= 'd324; neg_out_r <= 'd0; end
				'd29: begin pos_out_r <= 'd333; neg_out_r <= 'd0; end
				'd30: begin pos_out_r <= 'd343; neg_out_r <= 'd0; end
				'd31: begin pos_out_r <= 'd352; neg_out_r <= 'd0; end
				'd32: begin pos_out_r <= 'd361; neg_out_r <= 'd0; end
				'd33: begin pos_out_r <= 'd370; neg_out_r <= 'd0; end
				'd34: begin pos_out_r <= 'd378; neg_out_r <= 'd0; end
				'd35: begin pos_out_r <= 'd386; neg_out_r <= 'd0; end
				'd36: begin pos_out_r <= 'd395; neg_out_r <= 'd0; end
				'd37: begin pos_out_r <= 'd402; neg_out_r <= 'd0; end
				'd38: begin pos_out_r <= 'd410; neg_out_r <= 'd0; end
				'd39: begin pos_out_r <= 'd417; neg_out_r <= 'd0; end
				'd40: begin pos_out_r <= 'd424; neg_out_r <= 'd0; end
				'd41: begin pos_out_r <= 'd431; neg_out_r <= 'd0; end
				'd42: begin pos_out_r <= 'd438; neg_out_r <= 'd0; end
				'd43: begin pos_out_r <= 'd444; neg_out_r <= 'd0; end
				'd44: begin pos_out_r <= 'd450; neg_out_r <= 'd0; end
				'd45: begin pos_out_r <= 'd456; neg_out_r <= 'd0; end
				'd46: begin pos_out_r <= 'd461; neg_out_r <= 'd0; end
				'd47: begin pos_out_r <= 'd467; neg_out_r <= 'd0; end
				'd48: begin pos_out_r <= 'd472; neg_out_r <= 'd0; end
				'd49: begin pos_out_r <= 'd476; neg_out_r <= 'd0; end
				'd50: begin pos_out_r <= 'd481; neg_out_r <= 'd0; end
				'd51: begin pos_out_r <= 'd485; neg_out_r <= 'd0; end
				'd52: begin pos_out_r <= 'd488; neg_out_r <= 'd0; end
				'd53: begin pos_out_r <= 'd492; neg_out_r <= 'd0; end
				'd54: begin pos_out_r <= 'd495; neg_out_r <= 'd0; end
				'd55: begin pos_out_r <= 'd498; neg_out_r <= 'd0; end
				'd56: begin pos_out_r <= 'd501; neg_out_r <= 'd0; end
				'd57: begin pos_out_r <= 'd503; neg_out_r <= 'd0; end
				'd58: begin pos_out_r <= 'd505; neg_out_r <= 'd0; end
				'd59: begin pos_out_r <= 'd507; neg_out_r <= 'd0; end
				'd60: begin pos_out_r <= 'd508; neg_out_r <= 'd0; end
				'd61: begin pos_out_r <= 'd509; neg_out_r <= 'd0; end
				'd62: begin pos_out_r <= 'd510; neg_out_r <= 'd0; end
				'd63: begin pos_out_r <= 'd510; neg_out_r <= 'd0; end
				'd64: begin pos_out_r <= 'd511; neg_out_r <= 'd0; end
				'd65: begin pos_out_r <= 'd510; neg_out_r <= 'd0; end
				'd66: begin pos_out_r <= 'd510; neg_out_r <= 'd0; end
				'd67: begin pos_out_r <= 'd509; neg_out_r <= 'd0; end
				'd68: begin pos_out_r <= 'd508; neg_out_r <= 'd0; end
				'd69: begin pos_out_r <= 'd507; neg_out_r <= 'd0; end
				'd70: begin pos_out_r <= 'd505; neg_out_r <= 'd0; end
				'd71: begin pos_out_r <= 'd503; neg_out_r <= 'd0; end
				'd72: begin pos_out_r <= 'd501; neg_out_r <= 'd0; end
				'd73: begin pos_out_r <= 'd498; neg_out_r <= 'd0; end
				'd74: begin pos_out_r <= 'd495; neg_out_r <= 'd0; end
				'd75: begin pos_out_r <= 'd492; neg_out_r <= 'd0; end
				'd76: begin pos_out_r <= 'd488; neg_out_r <= 'd0; end
				'd77: begin pos_out_r <= 'd485; neg_out_r <= 'd0; end
				'd78: begin pos_out_r <= 'd481; neg_out_r <= 'd0; end
				'd79: begin pos_out_r <= 'd476; neg_out_r <= 'd0; end
				'd80: begin pos_out_r <= 'd472; neg_out_r <= 'd0; end
				'd81: begin pos_out_r <= 'd467; neg_out_r <= 'd0; end
				'd82: begin pos_out_r <= 'd461; neg_out_r <= 'd0; end
				'd83: begin pos_out_r <= 'd456; neg_out_r <= 'd0; end
				'd84: begin pos_out_r <= 'd450; neg_out_r <= 'd0; end
				'd85: begin pos_out_r <= 'd444; neg_out_r <= 'd0; end
				'd86: begin pos_out_r <= 'd438; neg_out_r <= 'd0; end
				'd87: begin pos_out_r <= 'd431; neg_out_r <= 'd0; end
				'd88: begin pos_out_r <= 'd424; neg_out_r <= 'd0; end
				'd89: begin pos_out_r <= 'd417; neg_out_r <= 'd0; end
				'd90: begin pos_out_r <= 'd410; neg_out_r <= 'd0; end
				'd91: begin pos_out_r <= 'd402; neg_out_r <= 'd0; end
				'd92: begin pos_out_r <= 'd395; neg_out_r <= 'd0; end
				'd93: begin pos_out_r <= 'd386; neg_out_r <= 'd0; end
				'd94: begin pos_out_r <= 'd378; neg_out_r <= 'd0; end
				'd95: begin pos_out_r <= 'd370; neg_out_r <= 'd0; end
				'd96: begin pos_out_r <= 'd361; neg_out_r <= 'd0; end
				'd97: begin pos_out_r <= 'd352; neg_out_r <= 'd0; end
				'd98: begin pos_out_r <= 'd343; neg_out_r <= 'd0; end
				'd99: begin pos_out_r <= 'd333; neg_out_r <= 'd0; end
				'd100: begin pos_out_r <= 'd324; neg_out_r <= 'd0; end
				'd101: begin pos_out_r <= 'd314; neg_out_r <= 'd0; end
				'd102: begin pos_out_r <= 'd304; neg_out_r <= 'd0; end
				'd103: begin pos_out_r <= 'd294; neg_out_r <= 'd0; end
				'd104: begin pos_out_r <= 'd283; neg_out_r <= 'd0; end
				'd105: begin pos_out_r <= 'd273; neg_out_r <= 'd0; end
				'd106: begin pos_out_r <= 'd262; neg_out_r <= 'd0; end
				'd107: begin pos_out_r <= 'd251; neg_out_r <= 'd0; end
				'd108: begin pos_out_r <= 'd240; neg_out_r <= 'd0; end
				'd109: begin pos_out_r <= 'd229; neg_out_r <= 'd0; end
				'd110: begin pos_out_r <= 'd218; neg_out_r <= 'd0; end
				'd111: begin pos_out_r <= 'd207; neg_out_r <= 'd0; end
				'd112: begin pos_out_r <= 'd195; neg_out_r <= 'd0; end
				'd113: begin pos_out_r <= 'd183; neg_out_r <= 'd0; end
				'd114: begin pos_out_r <= 'd172; neg_out_r <= 'd0; end
				'd115: begin pos_out_r <= 'd160; neg_out_r <= 'd0; end
				'd116: begin pos_out_r <= 'd148; neg_out_r <= 'd0; end
				'd117: begin pos_out_r <= 'd136; neg_out_r <= 'd0; end
				'd118: begin pos_out_r <= 'd124; neg_out_r <= 'd0; end
				'd119: begin pos_out_r <= 'd111; neg_out_r <= 'd0; end
				'd120: begin pos_out_r <= 'd99; neg_out_r <= 'd0; end
				'd121: begin pos_out_r <= 'd87; neg_out_r <= 'd0; end
				'd122: begin pos_out_r <= 'd74; neg_out_r <= 'd0; end
				'd123: begin pos_out_r <= 'd62; neg_out_r <= 'd0; end
				'd124: begin pos_out_r <= 'd50; neg_out_r <= 'd0; end
				'd125: begin pos_out_r <= 'd37; neg_out_r <= 'd0; end
				'd126: begin pos_out_r <= 'd25; neg_out_r <= 'd0; end
				'd127: begin pos_out_r <= 'd12; neg_out_r <= 'd0; end
				'd128: begin pos_out_r <= 'd0; neg_out_r <= 'd0; end
				'd129: begin pos_out_r <= 'd0; neg_out_r <= 'd12; end
				'd130: begin pos_out_r <= 'd0; neg_out_r <= 'd25; end
				'd131: begin pos_out_r <= 'd0; neg_out_r <= 'd37; end
				'd132: begin pos_out_r <= 'd0; neg_out_r <= 'd50; end
				'd133: begin pos_out_r <= 'd0; neg_out_r <= 'd62; end
				'd134: begin pos_out_r <= 'd0; neg_out_r <= 'd74; end
				'd135: begin pos_out_r <= 'd0; neg_out_r <= 'd87; end
				'd136: begin pos_out_r <= 'd0; neg_out_r <= 'd99; end
				'd137: begin pos_out_r <= 'd0; neg_out_r <= 'd111; end
				'd138: begin pos_out_r <= 'd0; neg_out_r <= 'd124; end
				'd139: begin pos_out_r <= 'd0; neg_out_r <= 'd136; end
				'd140: begin pos_out_r <= 'd0; neg_out_r <= 'd148; end
				'd141: begin pos_out_r <= 'd0; neg_out_r <= 'd160; end
				'd142: begin pos_out_r <= 'd0; neg_out_r <= 'd172; end
				'd143: begin pos_out_r <= 'd0; neg_out_r <= 'd183; end
				'd144: begin pos_out_r <= 'd0; neg_out_r <= 'd195; end
				'd145: begin pos_out_r <= 'd0; neg_out_r <= 'd207; end
				'd146: begin pos_out_r <= 'd0; neg_out_r <= 'd218; end
				'd147: begin pos_out_r <= 'd0; neg_out_r <= 'd229; end
				'd148: begin pos_out_r <= 'd0; neg_out_r <= 'd240; end
				'd149: begin pos_out_r <= 'd0; neg_out_r <= 'd251; end
				'd150: begin pos_out_r <= 'd0; neg_out_r <= 'd262; end
				'd151: begin pos_out_r <= 'd0; neg_out_r <= 'd273; end
				'd152: begin pos_out_r <= 'd0; neg_out_r <= 'd283; end
				'd153: begin pos_out_r <= 'd0; neg_out_r <= 'd294; end
				'd154: begin pos_out_r <= 'd0; neg_out_r <= 'd304; end
				'd155: begin pos_out_r <= 'd0; neg_out_r <= 'd314; end
				'd156: begin pos_out_r <= 'd0; neg_out_r <= 'd324; end
				'd157: begin pos_out_r <= 'd0; neg_out_r <= 'd333; end
				'd158: begin pos_out_r <= 'd0; neg_out_r <= 'd343; end
				'd159: begin pos_out_r <= 'd0; neg_out_r <= 'd352; end
				'd160: begin pos_out_r <= 'd0; neg_out_r <= 'd361; end
				'd161: begin pos_out_r <= 'd0; neg_out_r <= 'd370; end
				'd162: begin pos_out_r <= 'd0; neg_out_r <= 'd378; end
				'd163: begin pos_out_r <= 'd0; neg_out_r <= 'd386; end
				'd164: begin pos_out_r <= 'd0; neg_out_r <= 'd395; end
				'd165: begin pos_out_r <= 'd0; neg_out_r <= 'd402; end
				'd166: begin pos_out_r <= 'd0; neg_out_r <= 'd410; end
				'd167: begin pos_out_r <= 'd0; neg_out_r <= 'd417; end
				'd168: begin pos_out_r <= 'd0; neg_out_r <= 'd424; end
				'd169: begin pos_out_r <= 'd0; neg_out_r <= 'd431; end
				'd170: begin pos_out_r <= 'd0; neg_out_r <= 'd438; end
				'd171: begin pos_out_r <= 'd0; neg_out_r <= 'd444; end
				'd172: begin pos_out_r <= 'd0; neg_out_r <= 'd450; end
				'd173: begin pos_out_r <= 'd0; neg_out_r <= 'd456; end
				'd174: begin pos_out_r <= 'd0; neg_out_r <= 'd461; end
				'd175: begin pos_out_r <= 'd0; neg_out_r <= 'd467; end
				'd176: begin pos_out_r <= 'd0; neg_out_r <= 'd472; end
				'd177: begin pos_out_r <= 'd0; neg_out_r <= 'd476; end
				'd178: begin pos_out_r <= 'd0; neg_out_r <= 'd481; end
				'd179: begin pos_out_r <= 'd0; neg_out_r <= 'd485; end
				'd180: begin pos_out_r <= 'd0; neg_out_r <= 'd488; end
				'd181: begin pos_out_r <= 'd0; neg_out_r <= 'd492; end
				'd182: begin pos_out_r <= 'd0; neg_out_r <= 'd495; end
				'd183: begin pos_out_r <= 'd0; neg_out_r <= 'd498; end
				'd184: begin pos_out_r <= 'd0; neg_out_r <= 'd501; end
				'd185: begin pos_out_r <= 'd0; neg_out_r <= 'd503; end
				'd186: begin pos_out_r <= 'd0; neg_out_r <= 'd505; end
				'd187: begin pos_out_r <= 'd0; neg_out_r <= 'd507; end
				'd188: begin pos_out_r <= 'd0; neg_out_r <= 'd508; end
				'd189: begin pos_out_r <= 'd0; neg_out_r <= 'd509; end
				'd190: begin pos_out_r <= 'd0; neg_out_r <= 'd510; end
				'd191: begin pos_out_r <= 'd0; neg_out_r <= 'd510; end
				'd192: begin pos_out_r <= 'd0; neg_out_r <= 'd511; end
				'd193: begin pos_out_r <= 'd0; neg_out_r <= 'd510; end
				'd194: begin pos_out_r <= 'd0; neg_out_r <= 'd510; end
				'd195: begin pos_out_r <= 'd0; neg_out_r <= 'd509; end
				'd196: begin pos_out_r <= 'd0; neg_out_r <= 'd508; end
				'd197: begin pos_out_r <= 'd0; neg_out_r <= 'd507; end
				'd198: begin pos_out_r <= 'd0; neg_out_r <= 'd505; end
				'd199: begin pos_out_r <= 'd0; neg_out_r <= 'd503; end
				'd200: begin pos_out_r <= 'd0; neg_out_r <= 'd501; end
				'd201: begin pos_out_r <= 'd0; neg_out_r <= 'd498; end
				'd202: begin pos_out_r <= 'd0; neg_out_r <= 'd495; end
				'd203: begin pos_out_r <= 'd0; neg_out_r <= 'd492; end
				'd204: begin pos_out_r <= 'd0; neg_out_r <= 'd488; end
				'd205: begin pos_out_r <= 'd0; neg_out_r <= 'd485; end
				'd206: begin pos_out_r <= 'd0; neg_out_r <= 'd481; end
				'd207: begin pos_out_r <= 'd0; neg_out_r <= 'd476; end
				'd208: begin pos_out_r <= 'd0; neg_out_r <= 'd472; end
				'd209: begin pos_out_r <= 'd0; neg_out_r <= 'd467; end
				'd210: begin pos_out_r <= 'd0; neg_out_r <= 'd461; end
				'd211: begin pos_out_r <= 'd0; neg_out_r <= 'd456; end
				'd212: begin pos_out_r <= 'd0; neg_out_r <= 'd450; end
				'd213: begin pos_out_r <= 'd0; neg_out_r <= 'd444; end
				'd214: begin pos_out_r <= 'd0; neg_out_r <= 'd438; end
				'd215: begin pos_out_r <= 'd0; neg_out_r <= 'd431; end
				'd216: begin pos_out_r <= 'd0; neg_out_r <= 'd424; end
				'd217: begin pos_out_r <= 'd0; neg_out_r <= 'd417; end
				'd218: begin pos_out_r <= 'd0; neg_out_r <= 'd410; end
				'd219: begin pos_out_r <= 'd0; neg_out_r <= 'd402; end
				'd220: begin pos_out_r <= 'd0; neg_out_r <= 'd395; end
				'd221: begin pos_out_r <= 'd0; neg_out_r <= 'd386; end
				'd222: begin pos_out_r <= 'd0; neg_out_r <= 'd378; end
				'd223: begin pos_out_r <= 'd0; neg_out_r <= 'd370; end
				'd224: begin pos_out_r <= 'd0; neg_out_r <= 'd361; end
				'd225: begin pos_out_r <= 'd0; neg_out_r <= 'd352; end
				'd226: begin pos_out_r <= 'd0; neg_out_r <= 'd343; end
				'd227: begin pos_out_r <= 'd0; neg_out_r <= 'd333; end
				'd228: begin pos_out_r <= 'd0; neg_out_r <= 'd324; end
				'd229: begin pos_out_r <= 'd0; neg_out_r <= 'd314; end
				'd230: begin pos_out_r <= 'd0; neg_out_r <= 'd304; end
				'd231: begin pos_out_r <= 'd0; neg_out_r <= 'd294; end
				'd232: begin pos_out_r <= 'd0; neg_out_r <= 'd283; end
				'd233: begin pos_out_r <= 'd0; neg_out_r <= 'd273; end
				'd234: begin pos_out_r <= 'd0; neg_out_r <= 'd262; end
				'd235: begin pos_out_r <= 'd0; neg_out_r <= 'd251; end
				'd236: begin pos_out_r <= 'd0; neg_out_r <= 'd240; end
				'd237: begin pos_out_r <= 'd0; neg_out_r <= 'd229; end
				'd238: begin pos_out_r <= 'd0; neg_out_r <= 'd218; end
				'd239: begin pos_out_r <= 'd0; neg_out_r <= 'd207; end
				'd240: begin pos_out_r <= 'd0; neg_out_r <= 'd195; end
				'd241: begin pos_out_r <= 'd0; neg_out_r <= 'd183; end
				'd242: begin pos_out_r <= 'd0; neg_out_r <= 'd172; end
				'd243: begin pos_out_r <= 'd0; neg_out_r <= 'd160; end
				'd244: begin pos_out_r <= 'd0; neg_out_r <= 'd148; end
				'd245: begin pos_out_r <= 'd0; neg_out_r <= 'd136; end
				'd246: begin pos_out_r <= 'd0; neg_out_r <= 'd124; end
				'd247: begin pos_out_r <= 'd0; neg_out_r <= 'd111; end
				'd248: begin pos_out_r <= 'd0; neg_out_r <= 'd99; end
				'd249: begin pos_out_r <= 'd0; neg_out_r <= 'd87; end
				'd250: begin pos_out_r <= 'd0; neg_out_r <= 'd74; end
				'd251: begin pos_out_r <= 'd0; neg_out_r <= 'd62; end
				'd252: begin pos_out_r <= 'd0; neg_out_r <= 'd50; end
				'd253: begin pos_out_r <= 'd0; neg_out_r <= 'd37; end
				'd254: begin pos_out_r <= 'd0; neg_out_r <= 'd25; end
				'd255: begin pos_out_r <= 'd0; neg_out_r <= 'd12; end
				default: begin pos_out_r <= 'd0; neg_out_r <= 'd0; end
			endcase
			
			ctr_r <= ctr_r + 'd1;	// auto overflow
        end
    end
endmodule

//`endif
