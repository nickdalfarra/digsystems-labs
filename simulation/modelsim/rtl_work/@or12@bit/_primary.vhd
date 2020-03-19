library verilog;
use verilog.vl_types.all;
entity Or12Bit is
    port(
        w               : in     vl_logic_vector(3 downto 0);
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        z               : out    vl_logic_vector(3 downto 0)
    );
end Or12Bit;
