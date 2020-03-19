library verilog;
use verilog.vl_types.all;
entity Register32 is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        Rin             : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end Register32;
