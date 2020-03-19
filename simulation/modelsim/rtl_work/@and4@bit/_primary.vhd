library verilog;
use verilog.vl_types.all;
entity And4Bit is
    port(
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic;
        z               : out    vl_logic_vector(3 downto 0)
    );
end And4Bit;
