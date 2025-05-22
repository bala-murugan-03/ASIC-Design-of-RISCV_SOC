# Configuration 
# Word size (width of each memory word in bits)
word_size = 32

# Number of words in the memory (depth of memory)
num_words = 2048

#calculates the size of the memory in kilobytes (kB) and formats it as a string.
human_byte_size = "{:.0f}kbytes".format((word_size * num_words)/1024/8)

# Allow byte writes
write_size = 32 # Bits

# Number of read_write ports
num_rw_ports = 1

# Number of read ports
num_r_ports = 1

# Number of write ports
num_w_ports = 0

# used to specify a human-readable string for the type and number of ports.
ports_human = '1rw1r'

tech_name = "sky130"
nominal_corner_only = True

route_supplies = "ring"
uniquify = True


# Output directory for the results
#output_name = "{tech_name}_sram_{human_byte_size}_{ports_human}_{word_size}x{num_words}_{write_size}".format(**locals())
output_name = "{tech_name}_sram_{human_byte_size}_{ports_human}_{word_size}x{num_words}_{write_size}".format(**locals())
output_path = "riscv_dcache8k/{output_name}".format(**locals())




