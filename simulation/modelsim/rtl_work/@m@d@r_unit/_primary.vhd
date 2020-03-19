library verilog;
use verilog.vl_types.all;
entity MDR_unit is
    port(
        read            : in     vl_logic;
        clk             : in     vl_logic;
        MDRin           : in     vl_logic;
        clr             : in     vl_logic;
        BusMuxIn        : in     vl_logic_vector(31 downto 0);
        Mdatain         : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end MDR_unit;
