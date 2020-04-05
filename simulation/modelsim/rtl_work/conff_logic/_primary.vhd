library verilog;
use verilog.vl_types.all;
entity conff_logic is
    port(
        \out\           : out    vl_logic;
        busin           : in     vl_logic_vector(31 downto 0);
        ir              : in     vl_logic_vector(31 downto 0);
        CONin           : in     vl_logic;
        w1              : out    vl_logic;
        w2              : out    vl_logic;
        w3              : out    vl_logic;
        w4              : out    vl_logic
    );
end conff_logic;
