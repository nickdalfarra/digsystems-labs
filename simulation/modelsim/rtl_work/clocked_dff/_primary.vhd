library verilog;
use verilog.vl_types.all;
entity clocked_dff is
    port(
        q               : out    vl_logic;
        qbar            : out    vl_logic;
        D               : in     vl_logic;
        clk             : in     vl_logic
    );
end clocked_dff;
