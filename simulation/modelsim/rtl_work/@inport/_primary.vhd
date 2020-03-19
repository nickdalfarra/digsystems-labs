library verilog;
use verilog.vl_types.all;
entity Inport is
    port(
        clear           : in     vl_logic;
        clock           : in     vl_logic;
        strobe          : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end Inport;
