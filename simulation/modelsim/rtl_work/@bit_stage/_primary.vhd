library verilog;
use verilog.vl_types.all;
entity Bit_stage is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic;
        c0              : in     vl_logic;
        G               : out    vl_logic;
        P               : out    vl_logic;
        s               : out    vl_logic
    );
end Bit_stage;
