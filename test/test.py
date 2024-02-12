# SPDX-FileCopyrightText: © 2023 Uri Shaked <uri@tinytapeout.com>
# SPDX-License-Identifier: MIT

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_soundgen(dut):
	dut._log.info("start")
	clock = Clock(dut.clk, 0.1, units="us")
	cocotb.start_soon(clock.start())
	
	dut.rst_n.value = 0
	await ClockCycles(dut.clk, 1)
	dut.rst_n.value = 1
	await ClockCycles(dut.clk, 1)
	
	#await ClockCycles(dut.clk, 80000000)	# 8s simulation
	await ClockCycles(dut.clk, 1000000)	# 100ms simulation
