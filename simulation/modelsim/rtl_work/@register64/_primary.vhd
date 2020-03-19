library verilog;
use verilog.vl_types.all;
entity Register64 is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        Rin             : in     vl_logic;
        D               : in     vl_logic_vector(63 downto 0);
        Q               : out    vl_logic_vector(63 downto 0)
    );
end Register64;
