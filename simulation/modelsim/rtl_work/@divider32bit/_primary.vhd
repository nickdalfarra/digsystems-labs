library verilog;
use verilog.vl_types.all;
entity Divider32bit is
    port(
        Qin             : in     vl_logic_vector(31 downto 0);
        Min             : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(63 downto 0);
        diverror        : out    vl_logic
    );
end Divider32bit;
