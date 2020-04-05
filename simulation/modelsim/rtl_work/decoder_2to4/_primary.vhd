library verilog;
use verilog.vl_types.all;
entity decoder_2to4 is
    port(
        brzr            : out    vl_logic;
        brnz            : out    vl_logic;
        brpl            : out    vl_logic;
        brmi            : out    vl_logic;
        \in\            : in     vl_logic_vector(1 downto 0)
    );
end decoder_2to4;
