library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity balise is
	port(
	H, R : in std_logic;
	L    : out std_logic
	);
	
end balise;

architecture test of balise is
	type etats is (a, b, c, d, e, f);
	signal etatP, etatF : etats;
	begin
		process(H, R)
		begin
			if(R = '1')
				then etatP <= a;
			elsif(H'event and H = '1')
				then etatP <= etatF;
			end if;
		end process;
		
		process(etatP, R)
		begin
			if(R = '1')
				then L <= '1';
			elsif(etatP'event)
				then case etatP is
					when a => L <= '1';
					when c => L <= '1';
					when d => L <= '1';
					when others => L <= '0';
				end case;
			end if;
		end process;
		
	process(etatP, R)
		begin
			if(R = '1')
				then etatF <= b;
			elsif(etatP'event)
				then case etatP is
					when a => etatF <= b;
					when b => etatF <= c;
					when c => etatF <= d;
					when d => etatF <= e;
					when e => etatF <= f;
					when f => etatF <= a;
				end case;
			end if;
		end process;
	
		
		
end test;
