library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cnt60_a_sec is
port(
    clk,clr,enb: in std_logic;--clk：时钟输入信号，clr：清零端，enb：使能端
    key: in std_logic;	--输入按键脉冲，调整闹铃定时或时间
    alarm_clk: in std_logic;--1:alarm 0:clk --设置模式选择：闹铃调节模式、时间调节模式
    qout_sl: out std_logic_vector(3 downto 0); --显示输出秒的低位
    qout_sh: out std_logic_vector(3 downto 0);--显示输出秒的高位
    co: out std_logic; --进位输出，触发分计数模块
    out_do: out std_logic;--在整点报时中输出“嘟”触发信号
	out_di: out std_logic --在整点报时中输出“嘀”触发信号
);
end;

architecture a of cnt60_a_sec is
signal qout2_l:std_logic_vector(3 downto 0);
signal qout2_h:std_logic_vector(3 downto 0);
signal alarm_l:std_logic_vector(3 downto 0);
signal alarm_h:std_logic_vector(3 downto 0);
signal clk1,clk2,tclk,aclk,ac_slt: std_logic;
begin
process(alarm_clk) --当该端口输入一个脉冲时，修改设置模式：时间调整或闹铃模式切换
begin
	if alarm_clk'event and alarm_clk='1' then
		if ac_slt='0' then--如果为定时模式，将改为闹铃模式
			ac_slt<='1';
		else
			ac_slt<='0';
		end if;
	end if;
end process;

process(key,clk,ac_slt)--根据设置模式，处理key上的脉冲信号
begin
	if ac_slt='0' then --时间调整模式
		aclk<='0';
		if clk='1' and key='1' then --clk=1则tclk<=0，通过挖洞方式添加一个脉冲
			tclk<='0';
		elsif clk='0' and key='1' then --clk=0,则tclk<=1,产生一个高电平，添加一脉冲
			tclk<='1';
		else
			tclk<=clk;
		end if;
	elsif ac_slt='1' then --闹铃调整模式
		tclk<=clk;
		aclk<=key; --key上的脉冲直接修改闹铃定时值
	end if;
end process;

process(tclk,clr,enb) --60进制计数，个位、十位放在两个临时变量中，表示秒的状态
begin
	if clr='1' then--clearing works at the state of high voltage
		qout2_l<="0000";
		qout2_h<="0000";
	elsif tclk'event and tclk='1' then
		if enb='1' then--enable works at high voltage
			if qout2_l="1001" and qout2_h="0101" then
				qout2_l<="0000";--a full mode is completed and a carryout is generated
				qout2_h<="0000";
			elsif qout2_l="1001" then
					qout2_l<="0000";
					qout2_h<=qout2_h+1;
			else
					qout2_l<=qout2_l+1;-- in process of counting
			end if;
		end if;
	end if;
end process;
 
process(aclk,clr,enb)--修改闹铃的定时值
begin
	if clr='1' then--clearing works at the state of high voltage
		alarm_l<="0000";
		alarm_h<="0000";
	elsif aclk'event and aclk='1' then
		if enb='1' then--enable works at high voltage
			if alarm_l="1001" and alarm_h="0101" then
				alarm_l<="0000";--a full mode is completed and a carryout is generated
				alarm_h<="0000";
			elsif alarm_l="0101" then
					alarm_l<="0000";
					alarm_h<=alarm_h+1;
			else
					alarm_l<=alarm_l+1;-- in process of counting
			end if;
		end if;
	end if;
end process;
 
process(qout2_l,qout2_h,alarm_l,alarm_h,alarm_clk)-- 产生进位,显示时间或闹铃定时值
begin 
	if qout2_l="0000" and qout2_h="0000" then
		co<='1';
	else 
		co<='0';
	end if;
	if ac_slt='0' then -- 显示时间
		qout_sl<=qout2_l;
		qout_sh<=qout2_h;
	else          -- 显示定时值
		qout_sh<=alarm_h;
		qout_sl<=alarm_l;
	end if;
end process;

process(qout2_l,qout2_h) -- 根据秒的状态输出“嘟”、“嘀”触发信号
begin
	if qout2_h="0101" then
		if qout2_l="0000" then
			out_do<='1';
		elsif qout2_l="0010" then
			out_do<='1';
		elsif qout2_l="0100" then
			out_do<='1';
		elsif qout2_l="0110" then
			out_do<='1';
		elsif qout2_l="1000" then
			out_do<='1';
		else
			out_do<='0';
		end if;
	elsif qout2_h="0000" then
		if qout2_l="0000" then
			out_di<='1';
			out_do<='0';
		else 
			out_di<='0';
		end if;
	else
		out_do<='0';
		out_di<='0';
	end if;
end process;
end;
