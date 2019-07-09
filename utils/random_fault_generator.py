import random

N = 24
lt_sel = ["1000", "0100", "0010", "0001"]

def generate_fault(fault_num):
    f.write("\n")
    def get_name():
        return "fault" + str(fault_num)

    def get_random_sel_bits(bin_num):
        return str(lt_sel[random.randint(0,3)])

    def get_random_bits(bit_num):
        a = ""
        for _ in range(bit_num):
            a += str(random.randint(0,1))
        return str(a)

    def write_constant(val_name, val_type, value):
        f.write("\tconstant ")
        f.write(get_name() + "_" + val_name + "\t:")
        f.write(" " + val_type + "\t:= ")
        f.write(value + ";\n")

    write_constant(
        val_name = "select",
        val_type = "string",
        value = '"' + get_random_sel_bits(4) + '"'
    )
    write_constant(
        val_name = "value",
        val_type = "string",
        value = '"' + get_random_bits(24) + '"'
    )
    rand_mac = random.randint(0, 8)
    rand_el  = random.randint(0, 2)
    rand_fir  = random.randint(1, 5)
    write_constant(
        val_name = "val_sig",
        val_type = "string",
        value = "\"/fir_tb/fir_1/GEN_MAC("+str(rand_mac)+")/MAC/fault_value("+str(rand_el)+")\""
    )
    write_constant(
        val_name = "val_sig_n_modular",
        val_type = "string",
        value = "\"/fir_tb/n_modular_fir_1/GEN_FIRS("+str(rand_fir)+")/fir/GEN_MAC("+str(rand_mac)+")/MAC/fault_value("+str(rand_el)+")\""
    )
    write_constant(
        val_name = "sel_sig",
        val_type = "string",
        value = "\"/fir_tb/fir_1/GEN_MAC("+str(rand_mac)+")/MAC/fault_select("+str(rand_el)+")\""
    )
    write_constant(
        val_name = "sel_sig_n_modular",
        val_type = "string",
        value = "\"/fir_tb/n_modular_fir_1/GEN_FIRS("+str(rand_fir)+")/fir/GEN_MAC("+str(rand_mac)+")/MAC/fault_select("+str(rand_el)+")\""
    )
    start_time = random.randint(100, 2800);
    write_constant(
        val_name = "start_time",
        val_type = "time",
        value = str(start_time) + " ns"
    )
    stop_time  = random.randint(start_time+50, 2850);
    write_constant(
        val_name = "stop_time",
        val_type = "time",
        value = str(stop_time) + " ns"
    )



f = open("../tb/random_faults.vhd", "w")

f.write("library ieee;\n")
f.write("use ieee.std_logic_1164.all;\n\n")

f.write("package random_faults is\n\n")

for i in range(10):
    generate_fault(i);


f.write("\nend random_faults;\n")



