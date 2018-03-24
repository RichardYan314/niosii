// ============================================================================
// Copyright (c) 2016 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Wed May 11 09:51:57 2016
// ============================================================================


module top (

    ///////// Clocks /////////
    input              ADC_CLK_10,
    input              MAX10_CLK1_50,
    input              MAX10_CLK2_50,

    ///////// KEY /////////
    input    [ 1: 0]   KEY,

    ///////// SW /////////
    input    [ 9: 0]   SW,

    ///////// LEDR /////////
    output   [ 9: 0]   LEDR,

    ///////// HEX /////////
    output   [ 7: 0]   HEX0,
    output   [ 7: 0]   HEX1,
    output   [ 7: 0]   HEX2,
    output   [ 7: 0]   HEX3,
    output   [ 7: 0]   HEX4,
    output   [ 7: 0]   HEX5,

    ///////// SDRAM /////////
    output             DRAM_CLK,
    output             DRAM_CKE,
    output   [12: 0]   DRAM_ADDR,
    output   [ 1: 0]   DRAM_BA,
    inout    [15: 0]   DRAM_DQ,
    output             DRAM_LDQM,
    output             DRAM_UDQM,
    output             DRAM_CS_N,
    output             DRAM_WE_N,
    output             DRAM_CAS_N,
    output             DRAM_RAS_N,

    ///////// VGA /////////
    output             VGA_HS,
    output             VGA_VS,
    output   [ 3: 0]   VGA_R,
    output   [ 3: 0]   VGA_G,
    output   [ 3: 0]   VGA_B,

    ///////// Clock Generator I2C /////////
    output             CLK_I2C_SCL,
    inout              CLK_I2C_SDA,

    ///////// GSENSOR /////////
    output             GSENSOR_SCLK,
    inout              GSENSOR_SDO,
    inout              GSENSOR_SDI,
    input    [ 2: 1]   GSENSOR_INT,
    output             GSENSOR_CS_N,

    ///////// GPIO /////////
    inout    [35: 0]   GPIO,

    ///////// ARDUINO /////////
    inout    [15: 0]   ARDUINO_IO,
    inout              ARDUINO_RESET_N 

);


//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================



endmodule
