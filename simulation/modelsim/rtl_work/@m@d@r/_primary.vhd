library verilog;
use verilog.vl_types.all;
entity MDR is
    port(
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        mdrin           : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end MDR;
