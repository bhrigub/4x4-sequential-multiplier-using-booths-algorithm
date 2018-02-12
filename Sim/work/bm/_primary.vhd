library verilog;
use verilog.vl_types.all;
entity bm is
    port(
        product         : out    vl_logic_vector(7 downto 0);
        ip1             : in     vl_logic_vector(3 downto 0);
        ip2             : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end bm;
