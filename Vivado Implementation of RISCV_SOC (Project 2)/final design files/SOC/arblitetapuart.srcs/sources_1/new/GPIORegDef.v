`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2025 22:50:19
// Design Name: 
// Module Name: GPIORegDef
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// GPIO Direction Control
`define GPIO_DIRECTION                  8'h00  // Address for GPIO direction control
`define GPIO_DIRECTION_OUTPUT_DEFAULT   0
`define GPIO_DIRECTION_OUTPUT_B         0  // Start bit (LSB)
`define GPIO_DIRECTION_OUTPUT_T         31  // End bit (MSB)
`define GPIO_DIRECTION_OUTPUT_W         32  // Width of the field
`define GPIO_DIRECTION_OUTPUT_R         31:0 // Bit range for all GPIOs

// GPIO Input Register
`define GPIO_INPUT                      8'h04  // Address for GPIO Input Register
`define GPIO_INPUT_VALUE_DEFAULT        0
`define GPIO_INPUT_VALUE_B              0  // Start bit (LSB)
`define GPIO_INPUT_VALUE_T              31  // End bit (MSB)
`define GPIO_INPUT_VALUE_W              32  // Width of the field
`define GPIO_INPUT_VALUE_R              31:0 // Bit range for all GPIOs

// GPIO Output Register
`define GPIO_OUTPUT                     8'h08  // Address for GPIO Output Register
`define GPIO_OUTPUT_DATA_DEFAULT        0
`define GPIO_OUTPUT_DATA_B              0  // Start bit (LSB)
`define GPIO_OUTPUT_DATA_T              31  // End bit (MSB)
`define GPIO_OUTPUT_DATA_W              32  // Width of the field
`define GPIO_OUTPUT_DATA_R              31:0 // Bit range for all GPIOs

// GPIO Output Set
`define GPIO_OUTPUT_SET                 8'h0C  // Address for GPIO Output Set
`define GPIO_OUTPUT_SET_DATA_DEFAULT    0
`define GPIO_OUTPUT_SET_DATA_B          0  // Start bit (LSB)
`define GPIO_OUTPUT_SET_DATA_T          31  // End bit (MSB)
`define GPIO_OUTPUT_SET_DATA_W          32  // Width of the field
`define GPIO_OUTPUT_SET_DATA_R          31:0 // Bit range for all GPIOs

// GPIO Output Clear
`define GPIO_OUTPUT_CLR                 8'h10  // Address for GPIO Output Clear
`define GPIO_OUTPUT_CLR_DATA_DEFAULT    0
`define GPIO_OUTPUT_CLR_DATA_B          0  // Start bit (LSB)
`define GPIO_OUTPUT_CLR_DATA_T          31  // End bit (MSB)
`define GPIO_OUTPUT_CLR_DATA_W          32  // Width of the field
`define GPIO_OUTPUT_CLR_DATA_R          31:0 // Bit range for all GPIOs

// GPIO Interrupt Mask
`define GPIO_INT_MASK                   8'h14  // Address for GPIO Interrupt Mask
`define GPIO_INT_MASK_ENABLE_DEFAULT    0
`define GPIO_INT_MASK_ENABLE_B          0  // Start bit (LSB)
`define GPIO_INT_MASK_ENABLE_T          31  // End bit (MSB)
`define GPIO_INT_MASK_ENABLE_W          32  // Width of the field
`define GPIO_INT_MASK_ENABLE_R          31:0 // Bit range for all GPIOs

// GPIO Interrupt Set
`define GPIO_INT_SET                    8'h18  // Address for GPIO Interrupt Set
`define GPIO_INT_SET_SW_IRQ_DEFAULT     0
`define GPIO_INT_SET_SW_IRQ_B           0  // Start bit (LSB)
`define GPIO_INT_SET_SW_IRQ_T           31  // End bit (MSB)
`define GPIO_INT_SET_SW_IRQ_W           32  // Width of the field
`define GPIO_INT_SET_SW_IRQ_R           31:0 // Bit range for all GPIOs

// GPIO Interrupt Clear
`define GPIO_INT_CLR                   8'h1C  // Address for GPIO Interrupt Clear
`define GPIO_INT_CLR_ACK_DEFAULT       0
`define GPIO_INT_CLR_ACK_B             0  // Start bit (LSB)
`define GPIO_INT_CLR_ACK_T             31  // End bit (MSB)
`define GPIO_INT_CLR_ACK_W             32  // Width of the field
`define GPIO_INT_CLR_ACK_R             31:0 // Bit range for all GPIOs

// GPIO Interrupt Status
`define GPIO_INT_STATUS                8'h20  // Address for GPIO Interrupt Status
`define GPIO_INT_STATUS_RAW_DEFAULT    0
`define GPIO_INT_STATUS_RAW_B          0  // Start bit (LSB)
`define GPIO_INT_STATUS_RAW_T          31  // End bit (MSB)
`define GPIO_INT_STATUS_RAW_W          32  // Width of the field
`define GPIO_INT_STATUS_RAW_R          31:0 // Bit range for all GPIOs

// GPIO Interrupt level
`define GPIO_INT_LEVEL                 8'h24  // Address for GPIO Interrupt level
`define GPIO_INT_LEVEL_ACTIVE_HIGH_DEFAULT    0
`define GPIO_INT_LEVEL_ACTIVE_HIGH_B          0  // Start bit (LSB)
`define GPIO_INT_LEVEL_ACTIVE_HIGH_T          31  // End bit (MSB)
`define GPIO_INT_LEVEL_ACTIVE_HIGH_W          32  // Width of the field
`define GPIO_INT_LEVEL_ACTIVE_HIGH_R          31:0 // Bit range for all GPIOs

// GPIO Interrupt Mode
`define GPIO_INT_MODE                 8'h28  // Address for GPIO Interrupt Mode
`define GPIO_INT_MODE_EDGE_DEFAULT    0
`define GPIO_INT_MODE_EDGE_B          0  // Start bit (LSB)
`define GPIO_INT_MODE_EDGE_T          31  // End bit (MSB)
`define GPIO_INT_MODE_EDGE_W          32  // Width of the field
`define GPIO_INT_MODE_EDGE_R          31:0 // Bit range for all GPIOs

