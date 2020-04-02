library verilog;
use verilog.vl_types.all;
entity RAM is
    port(
        read            : in     vl_logic;
        write           : in     vl_logic;
        data            : inout  vl_logic_vector(31 downto 0);
        addr            : in     vl_logic_vector(8 downto 0)
    );
end RAM;
