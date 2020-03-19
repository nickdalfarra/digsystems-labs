library verilog;
use verilog.vl_types.all;
entity Mux8bit32to1 is
    port(
        \select\        : in     vl_logic_vector(4 downto 0);
        i0              : in     vl_logic_vector(7 downto 0);
        i1              : in     vl_logic_vector(7 downto 0);
        i2              : in     vl_logic_vector(7 downto 0);
        i3              : in     vl_logic_vector(7 downto 0);
        i4              : in     vl_logic_vector(7 downto 0);
        i5              : in     vl_logic_vector(7 downto 0);
        i6              : in     vl_logic_vector(7 downto 0);
        i7              : in     vl_logic_vector(7 downto 0);
        i8              : in     vl_logic_vector(7 downto 0);
        i9              : in     vl_logic_vector(7 downto 0);
        i10             : in     vl_logic_vector(7 downto 0);
        i11             : in     vl_logic_vector(7 downto 0);
        i12             : in     vl_logic_vector(7 downto 0);
        i13             : in     vl_logic_vector(7 downto 0);
        i14             : in     vl_logic_vector(7 downto 0);
        i15             : in     vl_logic_vector(7 downto 0);
        i16             : in     vl_logic_vector(7 downto 0);
        i17             : in     vl_logic_vector(7 downto 0);
        i18             : in     vl_logic_vector(7 downto 0);
        i19             : in     vl_logic_vector(7 downto 0);
        i20             : in     vl_logic_vector(7 downto 0);
        i21             : in     vl_logic_vector(7 downto 0);
        i22             : in     vl_logic_vector(7 downto 0);
        i23             : in     vl_logic_vector(7 downto 0);
        i24             : in     vl_logic_vector(7 downto 0);
        i25             : in     vl_logic_vector(7 downto 0);
        i26             : in     vl_logic_vector(7 downto 0);
        i27             : in     vl_logic_vector(7 downto 0);
        i28             : in     vl_logic_vector(7 downto 0);
        i29             : in     vl_logic_vector(7 downto 0);
        i30             : in     vl_logic_vector(7 downto 0);
        i31             : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end Mux8bit32to1;
