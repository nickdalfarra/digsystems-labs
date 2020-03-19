library verilog;
use verilog.vl_types.all;
entity Multiplier is
    port(
        M               : in     vl_logic_vector(31 downto 0);
        Q               : in     vl_logic_vector(31 downto 0);
        MUL             : in     vl_logic;
        P               : out    vl_logic_vector(63 downto 0)
    );
end Multiplier;
