library verilog;
use verilog.vl_types.all;
entity Alu is
    port(
        clk             : in     vl_logic;
        \AND\           : in     vl_logic;
        \OR\            : in     vl_logic;
        ADD             : in     vl_logic;
        SUB             : in     vl_logic;
        MUL             : in     vl_logic;
        DIV             : in     vl_logic;
        SHR             : in     vl_logic;
        SHL             : in     vl_logic;
        \ROR\           : in     vl_logic;
        \ROL\           : in     vl_logic;
        NEG             : in     vl_logic;
        \NOT\           : in     vl_logic;
        IncPC           : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        C               : out    vl_logic_vector(63 downto 0)
    );
end Alu;
