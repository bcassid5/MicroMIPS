library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity micromips is

	port (
		clk: in std_logic;
		samp_incrPC:out std_logic_vector(31 downto 0);
		samp_nextPC:out std_logic_vector(31 downto 0);
		samp_instr:out std_logic_vector(31 downto 0);
		samp_op:out std_logic_vector(5 downto 0);
		samp_fn:out std_logic_vector(5 downto 0);
		samp_rs:out std_logic_vector(31 downto 0);
		samp_rt:out std_logic_vector(31 downto 0);
		samp_alu:out std_logic_vector(31 downto 0);
		samp_regin:out std_logic_vector(31 downto 0);
		samp_instru_in:out std_logic_vector(16 downto 0)
	);

end micromips;

architecture bhv of micromips is 

component next_add is
	port(
		rt: in std_logic_vector (31 downto 0);
		rs: in std_logic_vector (31 downto 0);
		PC: in std_logic_vector (29 downto 0);
		BrType: in std_logic_vector (1 downto 0);
		BPCSrc: in std_logic_vector (1 downto 0);
		NextPC: out std_logic_vector (31 downto 0);
		IncrPC: out std_logic_vector (31 downto 0);
		SE: in std_logic_vector (13 downto 0);
		JTA: in std_logic_vector (25 downto 0);
		SysCallAddr: in std_logic_vector (29 downto 0)
	);
end component;

component program_ctr is
	port(
		CLK: in std_logic;
		PC_In: in std_logic_vector(31 downto 0);
		PC_out: out std_logic_vector(31 downto 0)
	);
end component;
	
component instr_cache is
	port(
		ADDR: in std_logic_vector(31 downto 0);
      outp: out std_logic_vector(31 downto 0)
	);
end component;

component register_file is
	port(
		RegW: in std_logic;
		DR: in std_logic_vector (4 downto 0);
		SR1: in std_logic_vector (4 downto 0);
		SR2: in std_logic_vector (4 downto 0);
		Reg_In: in std_logic_vector (31 downto 0);
		Data_Out1: out std_logic_vector (31 downto 0);
		Data_Out2: out std_logic_vector (31 downto 0)
		
	);
end component;

component alu is
	port(
		X, Y: in std_logic_vector (31 downto 0);
		Sel: in std_LOGIC_vector(4 downto 0);
		Ovfl: out std_logic;
		S: out std_logic_vector (31 downto 0)
	);
end component;

component data_cache is
	port(
		data_in: in std_logic_vector (31 downto 0);
		data_out: out std_logic_vector (31 downto 0);
		addr: in std_logic_vector (31 downto 0);
		CS: in std_logic; -- chip select
		WE: in std_logic; -- write enable
		OE: in std_logic	-- read enable
		
	);
end component;

component mux_4to1_top is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           A, B, C, D : in  STD_LOGIC_VECTOR (31 downto 0);     -- inputs
           X   : out STD_LOGIC_vector (31 downto 0));                        -- output
end component;

component mux_2to1_top is
	port (
		A, B: in std_logic_vector (31 downto 0);
		SEL: in std_logic;
		X: out std_logic_vector (31 downto 0)
	);
end component;

component cnt_unit is
	port(
		En: in std_logic;
		Op: in std_logic_vector (5 downto 0);
		Fn: in std_logic_vector (5 downto 0);
		Instruct: out std_logic_vector (16 downto 0)
	);
end component;

component mux_4to1_5 is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);            -- select input
           A, B, C, D : in  STD_LOGIC_VECTOR (4 downto 0);     -- inputs
           X   : out STD_LOGIC_vector (4 downto 0));           -- output
end component;

--signals for outputs
signal instru_temp: std_logic_vector (31 downto 0);
signal incr_pc_temp: std_logic_vector (31 downto 0);
signal next_pc_temp: std_logic_vector (31 downto 0);
signal pc_out_temp: std_logic_vector (31 downto 0);
signal rs_temp: std_logic_vector (31 downto 0);
signal rt_temp: std_logic_vector (31 downto 0);
signal alusrc_in_temp: std_logic_vector (31 downto 0);
signal aluovfl_temp: std_logic;
signal aluout_temp: std_logic_vector (31 downto 0);
signal dataout_temp: std_logic_vector (31 downto 0);
signal regin_temp: std_logic_vector (31 downto 0);
signal cntout_temp: std_logic_vector (16 downto 0);
signal regdstin_temp: std_logic_vector (4 downto 0);

--signals for instruction variables
signal regW: std_logic;
signal regDst: std_logic_vector (1 downto 0);
signal regInSrc: std_logic_vector (1 downto 0);
signal aluSrc: std_logic;
signal aluFunc: std_logic_vector (4 downto 0);
signal dataRead: std_logic;
signal dataWrite: std_logic;
signal BrJump: std_logic_vector (3 downto 0);



begin

			P0:program_ctr port map(clk, next_pc_temp, pc_out_temp);
			P1:instr_cache port map(pc_out_temp, instru_temp);
			P2:cnt_unit port map('1', instru_temp(31 downto 26), instru_temp(5 downto 0), cntout_temp);
			--"000000", "001100",
			--instru_temp(31 downto 26), instru_temp(5 downto 0),
			regW <= cntout_temp(16);
			regDst <= cntout_temp(15 downto 14);
			regInSrc <= cntout_temp(13 downto 12);
			aluSrc <= cntout_temp(11);
			aluFunc <= cntout_temp(10 downto 6);
			dataRead <= cntout_temp(5);
			dataWrite <= cntout_temp(4);
			BrJump <= cntout_temp(3 downto 0);
			
			M0:mux_4to1_5 port map(regDst, instru_temp(20 downto 16), instru_temp(15 downto 11), "11111", "00000", regdstin_temp);
			P3:register_file port map(regW, regdstin_temp, instru_temp(25 downto 21), instru_temp(20 downto 16), regin_temp, rs_temp, rt_temp);		
			M1:mux_2to1_top port map(rt_temp, instru_temp, aluSrc, alusrc_in_temp);
			P4:alu port map(rs_temp, alusrc_in_temp, aluFunc, aluovfl_temp, aluout_temp);
			P5:data_cache port map(aluout_temp, dataout_temp, rt_temp, '1', dataWrite, dataRead);			
			M2:mux_4to1_top port map(regInSrc, dataout_temp, aluout_temp, incr_pc_temp, "00000000000000000000000000000000", regin_temp);			
			P6:next_add port map(rt_temp, rs_temp, pc_out_temp(31 downto 2),BrJump(3 downto 2), BrJump(1 downto 0), next_pc_temp, incr_pc_temp, "00000000000000", instru_temp(25 downto 0), "010101010101010101010101010101");

			samp_incrPC <= incr_pc_temp;
			samp_nextPC <= next_pc_temp;
			samp_instr <= instru_temp;
			samp_op <= instru_temp(31 downto 26);
			samp_fn <= instru_temp(5 downto 0);
			samp_rs <= rs_temp;
			samp_rt <= rt_temp;
			samp_alu <= aluout_temp;
			samp_regin <= regin_temp;
			samp_instru_in <= cntout_temp;
end bhv;

	




--RegWrite <= Instruct(16) 
--RegDst <= Instruct(15 downto 14) 
--RegInSrc <= Instruct(13 downto 12) 
--ALUSrc <= Instruct(11)
--AddSub <= Instruct(10) 
--LogicFn <= Instruct(9 downto 8)		--ALUFunc <= Instruct(10 downto 6)
--FnClass <= Instruct(7 downto 6)
--DataRead <= Instruct(5) 
--DataWrite <= Instruct(4) 
--BrType <= Instruct(3 downto 2) 		--BR&Jump <= Instruct (3 downto 0)
--PCSrc <= Instruct(1 downto 0) 