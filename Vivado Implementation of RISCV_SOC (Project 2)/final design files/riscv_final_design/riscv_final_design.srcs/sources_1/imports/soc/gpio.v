
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

module gpio(
    // Inputs
     input          clk_i
    ,input          rst_i
    ,input          cfg_awvalid_i
    ,input  [31:0]  cfg_awaddr_i
    ,input          cfg_wvalid_i
    ,input  [31:0]  cfg_wdata_i
    ,input  [3:0]   cfg_wstrb_i
    ,input          cfg_bready_i
    ,input          cfg_arvalid_i
    ,input  [31:0]  cfg_araddr_i
    ,input          cfg_rready_i
    ,input  [31:0]  gpio_input_i

    // Outputs
    ,output     reg    cfg_awready_o
    ,output     reg   cfg_wready_o
    ,output     reg  cfg_bvalid_o
    ,output  [1:0]   cfg_bresp_o
    ,output     reg cfg_arready_o
    ,output    reg  cfg_rvalid_o
    ,output  reg[31:0]  cfg_rdata_o
    ,output  [1:0]   cfg_rresp_o
    ,output reg [31:0]  gpio_output_o
    ,output reg [31:0]  gpio_output_enable_o
    ,output reg        intr_o
);

reg [31:0] wdata;
wire read_enable, write_enable;
reg [31:0] gpio_direction_output_reg; 
reg gpio_output_set_write_flag;
reg gpio_output_write_flag;
reg gpio_output_clr_write_flag;
reg [31:0]  gpio_int_mask_enable_reg;  
reg gpio_int_set_write_flag;
reg gpio_int_clr_write_flag;
reg [31:0]  gpio_int_level_active_high_data_reg;
reg [31:0]  gpio_int_mode_edge_data_reg;
reg [31:0] data_r;
reg rvalid_reg;
reg rvalid_update;
reg bvalid_reg;
reg [31:0] gpio_input_data_reg;
reg [31:0] output_data_reg;
reg [31:0] output_data_update;
reg intr_o_update;
reg [31:0] interrupt_raw_status_reg;
reg [31:0] interrupt_raw_status_update;
reg [31:0] prev_gpio_input_data_reg;


// Synchronising the data coming with clock edge

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    wdata <= 32'b0;
else
    wdata <= cfg_wdata_i;


// enabling the data read using AXI signals


assign read_enable  = cfg_arvalid_i && cfg_arready_o;
 assign write_enable = cfg_awvalid_i && cfg_awready_o;
assign cfg_bresp_o  = 2'b0;
assign cfg_rresp_o = 2'b0;

always @(*) begin
    if(rst_i)begin
        cfg_awready_o = 1'b0;
        cfg_wready_o  = 1'b0;
        cfg_arready_o = 1'b0;
    end 
    else begin
    cfg_awready_o = (cfg_awvalid_i & ~cfg_arvalid_i);
    cfg_wready_o  = cfg_wvalid_i;
    cfg_arready_o = cfg_arvalid_i;
end
end
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    cfg_rvalid_o = 1'b0;
else if (read_enable)
    cfg_rvalid_o= 1'b1;
else if (cfg_rready_i)
    cfg_rvalid_o = 1'b0;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    cfg_bvalid_o = 1'b0;
else if (write_enable)
    cfg_bvalid_o = 1'b1;
else if (cfg_bready_i)
    cfg_bvalid_o = 1'b0;


//  GPIO DIRECTION REGISTER

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_direction_output_reg <= 32'd`GPIO_DIRECTION_OUTPUT_DEFAULT;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_DIRECTION))
    gpio_direction_output_reg <= cfg_wdata_i[`GPIO_DIRECTION_OUTPUT_R];


// GPIO OUTPUT REGISTER

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_output_write_flag <= 1'b0;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_OUTPUT))
    gpio_output_write_flag <= 1'b1;
else
    gpio_output_write_flag <= 1'b0;

wire [31:0]  gpio_output_data_wire = wdata[`GPIO_OUTPUT_DATA_R];


// GPIO OUTPUT SET REGISTER

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_output_set_write_flag <= 1'b0;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_OUTPUT_SET))
    gpio_output_set_write_flag <= 1'b1;
else
    gpio_output_set_write_flag <= 1'b0;


wire [31:0]  gpio_output_set_data_wire = gpio_output_set_write_flag? wdata[`GPIO_OUTPUT_SET_DATA_R]: 32'b0;

// GPIO OUTPUT CLEAR REGISTER

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_output_clr_write_flag <= 1'b0;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_OUTPUT_CLR))
    gpio_output_clr_write_flag <= 1'b1;
else
    gpio_output_clr_write_flag <= 1'b0;

wire [31:0]  gpio_output_clr_data_wire = gpio_output_clr_write_flag?wdata[`GPIO_OUTPUT_CLR_DATA_R]: 32'b0;

// Loading the value of GPIO INT MASK REGISTER to Controller

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_int_mask_enable_reg <= 32'd`GPIO_INT_MASK_ENABLE_DEFAULT;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_INT_MASK))
    gpio_int_mask_enable_reg <= cfg_wdata_i[`GPIO_INT_MASK_ENABLE_R];


// GPIO INT SET REGISTER

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_int_set_write_flag <= 1'b0;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_INT_SET))
    gpio_int_set_write_flag <= 1'b1;
else
    gpio_int_set_write_flag <= 1'b0;

wire [31:0]  gpio_int_set_sw_irq_data_wire = gpio_int_set_write_flag? wdata[`GPIO_INT_SET_SW_IRQ_R]:32'h0;


// GPIO INT CLEAR REGISTER


always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_int_clr_write_flag <= 1'b0;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_INT_CLR))
    gpio_int_clr_write_flag <= 1'b1;
else
    gpio_int_clr_write_flag <= 1'b0;

wire [31:0]  gpio_int_clr_ack_data_wire =gpio_int_clr_write_flag? wdata[`GPIO_INT_CLR_ACK_R]:32'h0;

// Loading the value of GPIO INT LEVEL REGISTER TO Controller

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_int_level_active_high_data_reg <= 32'd`GPIO_INT_LEVEL_ACTIVE_HIGH_DEFAULT;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_INT_LEVEL))
    gpio_int_level_active_high_data_reg <= cfg_wdata_i[`GPIO_INT_LEVEL_ACTIVE_HIGH_R];

wire [31:0]  gpio_int_level_active_high_data_wire = gpio_int_level_active_high_data_reg;

// Loading the value of GPIO INT MODE REGISTER TO Controller

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    gpio_int_mode_edge_data_reg <= 32'd`GPIO_INT_MODE_EDGE_DEFAULT;
else if (write_enable && (cfg_awaddr_i[7:0] == `GPIO_INT_MODE))
    gpio_int_mode_edge_data_reg <= cfg_wdata_i[`GPIO_INT_MODE_EDGE_R];

wire [31:0]  gpio_int_mode_edge_data_wire = gpio_int_mode_edge_data_reg;


always @ (posedge clk_i or posedge rst_i )
if (rst_i)
begin
    gpio_input_data_reg  <= 32'b0;
end
else
begin
    gpio_input_data_reg  <=  gpio_input_i;
end

// -----------------         ---------------- ------------------- ---------------------- ------------------ ------------------ ------------------- -------------------- ------------------------------ -----------------

wire [31:0]  gpio_output_data_in_wire;             // Provides the current state of GPIO output register
wire [31:0]  gpio_int_status_raw_wire;


always @(posedge clk_i) begin
    if (rst_i) begin
    data_r <= 32'b0;
    end else begin
    case (cfg_araddr_i[7:0])
        `GPIO_DIRECTION:    data_r[`GPIO_DIRECTION_OUTPUT_R] <=     gpio_direction_output_reg;
        `GPIO_INPUT:        data_r[`GPIO_INPUT_VALUE_R] <=          gpio_input_data_reg;
        `GPIO_OUTPUT:       data_r[`GPIO_OUTPUT_DATA_R] <=          gpio_output_data_in_wire;
        `GPIO_INT_MASK:     data_r[`GPIO_INT_MASK_ENABLE_R] <=      gpio_int_mask_enable_reg;
        `GPIO_INT_STATUS:   data_r[`GPIO_INT_STATUS_RAW_R] <=       gpio_int_status_raw_wire;
        `GPIO_INT_LEVEL:    data_r[`GPIO_INT_LEVEL_ACTIVE_HIGH_R] <= gpio_int_level_active_high_data_reg;
        `GPIO_INT_MODE:     data_r[`GPIO_INT_MODE_EDGE_R] <=         gpio_int_mode_edge_data_reg;
        default:            data_r = 32'b0;
    endcase
    end
end


// AXI bvalid signal ff for proper handshake at clockedge as required

always @ (posedge clk_i or posedge rst_i)
if (rst_i) begin
    cfg_rdata_o <= 32'b0;
end else if (!cfg_rvalid_o || cfg_rready_i) begin
    cfg_rdata_o <= data_r;
end


always @(*)
begin
    output_data_update = output_data_reg;

    if (gpio_output_set_write_flag)
        output_data_update = output_data_reg | gpio_output_set_data_wire;
    else if (gpio_output_clr_write_flag)
        output_data_update = output_data_reg & ~gpio_output_clr_data_wire;
    else if (gpio_output_write_flag)
        output_data_update = gpio_output_data_wire;
end


always @ (posedge clk_i or posedge rst_i )
if (rst_i)
    output_data_reg  <= 32'b0;
else
    output_data_reg  <= output_data_update;

always @(posedge clk_i)
gpio_output_o <= output_data_reg;

//-----------------------------------------------------------------

always @ (posedge clk_i or posedge rst_i )
if (rst_i)
    prev_gpio_input_data_reg  <= 32'b0;
else
    prev_gpio_input_data_reg  <= gpio_input_data_reg;
    
    
wire [31:0] falling_edge = (~gpio_input_data_reg & prev_gpio_input_data_reg);
wire [31:0] rising_edge = (gpio_input_data_reg & ~prev_gpio_input_data_reg);

wire [31:0] raw_level = (~gpio_input_data_reg ^ gpio_int_level_active_high_data_wire ) & ~(gpio_int_mode_edge_data_wire);
wire [31:0] raw_mode = (gpio_int_level_active_high_data_wire ? rising_edge : falling_edge) & (gpio_int_mode_edge_data_wire);


wire [31:0] raw_status = raw_mode | raw_level;

always @(*) begin
interrupt_raw_status_update = raw_status;
if (gpio_int_clr_write_flag) 
    interrupt_raw_status_update =  interrupt_raw_status_update & ~ gpio_int_clr_ack_data_wire;

if (gpio_int_set_write_flag)
    interrupt_raw_status_update = interrupt_raw_status_update | gpio_int_set_sw_irq_data_wire; 
    
end

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    intr_o_update <= 1'b0;
    interrupt_raw_status_reg  <= 32'b0;
end
else
begin
    interrupt_raw_status_reg  <= interrupt_raw_status_update;
    intr_o_update <= |(interrupt_raw_status_reg & gpio_int_mask_enable_reg);
end

assign gpio_int_status_raw_wire = interrupt_raw_status_reg;
always @(posedge clk_i)
    intr_o <= intr_o_update;


always @(posedge clk_i)
    gpio_output_enable_o  <= gpio_direction_output_reg;
    
assign gpio_output_data_in_wire = gpio_output_o;

endmodule