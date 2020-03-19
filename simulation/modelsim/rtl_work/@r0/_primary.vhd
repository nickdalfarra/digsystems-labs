library verilog;
use verilog.vl_types.all;
entity R0 is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        R0in            : in     vl_logic;
        BAout           : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end R0;
