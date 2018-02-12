library verilog;
use verilog.vl_types.all;
entity l7q3 is
    port(
        ip1             : in     vl_logic_vector(3 downto 0);
        ip2             : in     vl_logic_vector(3 downto 0);
        op              : out    vl_logic_vector(7 downto 0);
        load            : in     vl_logic;
        clk             : in     vl_logic
    );
end l7q3;
