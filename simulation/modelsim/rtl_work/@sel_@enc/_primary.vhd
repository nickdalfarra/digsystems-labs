library verilog;
use verilog.vl_types.all;
entity Sel_Enc is
    port(
        Gra             : in     vl_logic;
        Grb             : in     vl_logic;
        Grc             : in     vl_logic;
        Rin             : in     vl_logic;
        Rout            : in     vl_logic;
        BAout           : in     vl_logic;
        IR              : in     vl_logic_vector(31 downto 0);
        Rins            : out    vl_logic_vector(15 downto 0);
        Routs           : out    vl_logic_vector(15 downto 0);
        C_sign_extended : out    vl_logic_vector(31 downto 0)
    );
end Sel_Enc;
