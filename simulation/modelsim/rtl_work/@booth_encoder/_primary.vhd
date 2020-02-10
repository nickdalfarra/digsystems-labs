library verilog;
use verilog.vl_types.all;
entity Booth_encoder is
    port(
        bits            : in     vl_logic_vector(2 downto 0);
        M               : in     vl_logic_vector(31 downto 0);
        P               : out    vl_logic_vector(63 downto 0)
    );
end Booth_encoder;
