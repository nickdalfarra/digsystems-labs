library verilog;
use verilog.vl_types.all;
entity conff_logic is
    port(
        \out\           : out    vl_logic;
        busin           : in     vl_logic_vector(31 downto 0);
        ir              : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end conff_logic;
