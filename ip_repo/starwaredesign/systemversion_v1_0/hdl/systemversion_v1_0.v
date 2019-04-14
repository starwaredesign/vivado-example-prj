// 
// systemversion.v
//
// Top level file for the system version IP core.
//
// FPGA version has the format maj.min.build where maj and min are set from the block design and
// build from the build script.
//
// Board type and revision are read from external pins.
//
// MIT License
// Copyright (c) 2019 Starware Design Ltd
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

module systemversion #(
  // Parameters of Axi Slave Bus Interface S_AXI
  parameter integer C_S_AXI_DATA_WIDTH = 32,
  parameter integer C_S_AXI_ADDR_WIDTH = 4 ,
  // FPGA version
  parameter integer C_VER_MAJ          = 0 ,
  parameter integer C_VER_MIN          = 1 ,
  parameter integer C_VER_BUILD        = 0 ,
  // size board type and board revision
  parameter integer C_BOARD_TYPE_WIDTH = 4 ,
  parameter integer C_BOARD_REV_WIDTH  = 4
) (
  //---------------------------------------------------------------------------
  // AXI-lite slave interface
  //---------------------------------------------------------------------------
  input                                   s_axi_aclk   ,
  input                                   s_axi_aresetn,
  input      [    C_S_AXI_ADDR_WIDTH-1:0] s_axi_awaddr ,
  input      [                       2:0] s_axi_awprot ,
  input                                   s_axi_awvalid,
  output reg                              s_axi_awready,
  input      [    C_S_AXI_DATA_WIDTH-1:0] s_axi_wdata  ,
  input      [(C_S_AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb  ,
  input                                   s_axi_wvalid ,
  output reg                              s_axi_wready ,
  output     [                       1:0] s_axi_bresp  ,
  output reg                              s_axi_bvalid ,
  input                                   s_axi_bready ,
  input      [    C_S_AXI_ADDR_WIDTH-1:0] s_axi_araddr ,
  input      [                       2:0] s_axi_arprot ,
  input                                   s_axi_arvalid,
  output reg                              s_axi_arready,
  output reg [    C_S_AXI_DATA_WIDTH-1:0] s_axi_rdata  ,
  output     [                       1:0] s_axi_rresp  ,
  output reg                              s_axi_rvalid ,
  input                                   s_axi_rready ,
  //---------------------------------------------------------------------------
  // I/O pins
  //---------------------------------------------------------------------------
  input      [    C_BOARD_TYPE_WIDTH-1:0] board_type   ,
  input      [     C_BOARD_REV_WIDTH-1:0] board_rev
);

// FPGA_VER register
`define FPGA_VER_MAJ_SIZE                   8
`define FPGA_VER_MAJ_OFFSET                 (`FPGA_VER_MIN_OFFSET + `FPGA_VER_MIN_SIZE)
`define FPGA_VER_MIN_SIZE                   8
`define FPGA_VER_MIN_OFFSET                 (`FPGA_VER_BUILD_OFFSET + `FPGA_VER_BUILD_SIZE)
`define FPGA_VER_BUILD_SIZE                 16
`define FPGA_VER_BUILD_OFFSET                0

`define FPGA_VER 0
`define BOARD    1 

//---------------------------------------------------------------------------
// Internal registers bank
//---------------------------------------------------------------------------
wire [C_S_AXI_DATA_WIDTH-1:0] fpga_ver_reg;
wire [C_S_AXI_DATA_WIDTH-1:0] board_reg;

//---------------------------------------------------------------------------
// FPGA version
//---------------------------------------------------------------------------
assign fpga_ver_reg[`FPGA_VER_MAJ_OFFSET+:`FPGA_VER_MAJ_SIZE]     = C_VER_MAJ;
assign fpga_ver_reg[`FPGA_VER_MIN_OFFSET+:`FPGA_VER_MIN_SIZE]     = C_VER_MIN;
assign fpga_ver_reg[`FPGA_VER_BUILD_OFFSET+:`FPGA_VER_BUILD_SIZE] = C_VER_BUILD;

//---------------------------------------------------------------------------
// Board type and revision
//---------------------------------------------------------------------------

wire [C_BOARD_TYPE_WIDTH-1:0]     board_type_sync;
wire [ C_BOARD_REV_WIDTH-1:0]     board_rev_sync ;

// Since the board type/rev signals are static, xpm_cdc_array_single can
// be used

xpm_cdc_array_single #(
  .DEST_SYNC_FF  (C_BOARD_TYPE_WIDTH),
  .SIM_ASSERT_CHK(0                 ),
  .SRC_INPUT_REG (0                 ),
  .WIDTH         (2                 )
) cdc_board_type (
  .src_clk (1'b0           ),
  .src_in  (board_type     ),
  .dest_clk(s_axi_aclk     ),
  .dest_out(board_type_sync)
);

xpm_cdc_array_single #(
  .DEST_SYNC_FF  (C_BOARD_REV_WIDTH),
  .SIM_ASSERT_CHK(0                ),
  .SRC_INPUT_REG (0                ),
  .WIDTH         (2                )
) cdc_board_rev (
  .src_clk (1'b0          ),
  .src_in  (board_rev     ),
  .dest_clk(s_axi_aclk    ),
  .dest_out(board_rev_sync)
);

assign board_reg[(C_S_AXI_DATA_WIDTH/2)+:(C_S_AXI_DATA_WIDTH/2)] = board_type_sync;
assign board_reg[0+:(C_S_AXI_DATA_WIDTH/2)] = board_rev_sync;

//-------------------------------------------------------------
// AXI4-lite address read and read channels
//-------------------------------------------------------------
always @(posedge s_axi_aclk or negedge s_axi_aresetn)
begin
  if (s_axi_aresetn == 1'b0)
    s_axi_arready <= 1'b0;
  else if (s_axi_arvalid == 1'b1 && s_axi_arready == 1'b0)
    s_axi_arready <= 1'b1;
  else
    s_axi_arready <= 1'b0;
end

always @(posedge s_axi_aclk or negedge s_axi_aresetn)
begin
  if (s_axi_aresetn == 1'b0) 
    s_axi_rvalid <= 1'b0;    
  else if (s_axi_arvalid == 1'b1 && s_axi_arready == 1'b1)
    s_axi_rvalid <= 1'b1;
  else if (s_axi_rready == 1'b1)
    s_axi_rvalid <= 1'b0;
end

// different response codes are not supported
assign s_axi_rresp = 2'b00; // RESP OK

always @(posedge s_axi_aclk or negedge s_axi_aresetn)
begin
  if (s_axi_aresetn == 1'b0)
    s_axi_rdata <= 0;
  else if (s_axi_arvalid == 1'b1 && s_axi_arready == 1'b1)
    case (s_axi_araddr[C_S_AXI_ADDR_WIDTH-1:2])
      `FPGA_VER   : s_axi_rdata <= fpga_ver_reg; 
      `BOARD      : s_axi_rdata <= board_reg;            
      default     : s_axi_rdata <= 0; 
    endcase
end

//-------------------------------------------------------------
// AXI4-lite address write and write channels
// Placeholder if registers write is needed in the future
//-------------------------------------------------------------
always @(posedge s_axi_aclk or negedge s_axi_aresetn)
begin
  if (s_axi_aresetn == 1'b0)
    s_axi_awready <= 1'b0;
  else if (s_axi_awvalid == 1'b1 && s_axi_awready == 1'b0)
    s_axi_awready <= 1'b1;
  else
    s_axi_awready <= 1'b0;
end

always @(posedge s_axi_aclk or negedge s_axi_aresetn)
begin
  if (s_axi_aresetn == 1'b0) 
    s_axi_wready <= 1'b0;    
  else if (s_axi_awready == 1'b1 && s_axi_awvalid == 1'b1)
    s_axi_wready <= 1'b1;
  else if (s_axi_wvalid == 1'b1)
    s_axi_wready <= 1'b0;
end

// different response codes are not supported
assign s_axi_bresp = 2'b00; // RESP OK

always @(posedge s_axi_aclk or negedge s_axi_aresetn)
begin
  if (s_axi_aresetn == 1'b0) 
    s_axi_bvalid <= 1'b0;    
  else if (s_axi_wready == 1'b1 && s_axi_wvalid == 1'b1)
    s_axi_bvalid <= 1'b1;
  else if (s_axi_bready == 1'b1)
    s_axi_bvalid <= 1'b0;
end

endmodule
