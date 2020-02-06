library verilog;
use verilog.vl_types.all;
entity Adder2bit is
    port(
        X               : in     vl_logic;
        Y               : in     vl_logic;
        XandY           : out    vl_logic
    );
end Adder2bit;
