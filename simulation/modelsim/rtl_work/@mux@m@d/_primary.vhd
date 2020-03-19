library verilog;
use verilog.vl_types.all;
entity MuxMD is
    port(
        read            : in     vl_logic;
        BusMuxOut       : in     vl_logic_vector(31 downto 0);
        Mdatain         : in     vl_logic_vector(31 downto 0);
        D               : out    vl_logic_vector(31 downto 0)
    );
end MuxMD;
