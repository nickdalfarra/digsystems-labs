library verilog;
use verilog.vl_types.all;
entity Cla_16 is
    port(
        x               : in     vl_logic_vector(15 downto 0);
        y               : in     vl_logic_vector(15 downto 0);
        c0              : in     vl_logic;
        G               : out    vl_logic;
        P               : out    vl_logic;
        c16             : out    vl_logic;
        s               : out    vl_logic_vector(15 downto 0)
    );
end Cla_16;
