library verilog;
use verilog.vl_types.all;
entity Outport is
    port(
        clr             : in     vl_logic;
        clock           : in     vl_logic;
        enable          : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end Outport;
