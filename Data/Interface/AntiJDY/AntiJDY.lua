--���λ������
------------------------------------------------------------------------------------------------------
--
-- ȫ�ֱ�����
--
--
local g_Type = -1;

-- ע��onLoad�¼�
function AntiJDY_PreLoad()

	--��⵽����
	this:RegisterEvent("DETECT_WAIGUA_JDY")
end

function AntiJDY_OnLoad()

	-- �������������ϲ���ʾ
	AntiJDY_sub:SetProperty("AlwaysOnTop", "True");
	--

end

-- OnEvent
function AntiJDY_OnEvent(event)
    AntiJDY_sub:SetProperty( "UnifiedPosition", "{{0.500000,-173.000000},{0.500000,-73.000000}}" )

	AntiJDY_Button:Hide();
	AntiJDY_InfoWindow:Show();

	--guochenshu
	if (event == "DETECT_WAIGUA_JDY" ) then
		g_Type = 1;
		local isWaiGuaShow = tonumber(arg0)
		if(isWaiGuaShow == 1) then
		
-- ע���������У� ��Զ��Ҫ���ˣ� ��ʼ����ʱ
-- �ٴξ����� ..#71100
			AntiJDY_Button:SetText("ȷ��");
			AntiJDY_Button:Show();

			--�����漴λ�ã�ʹ��������Ļ����Ļ1/5�ķ�Χ��
			--�ٴ����λ�ð� �൱�ڹ��ܻ���. #71100
			local x_Left= math.random(2,5)/10; --3/10;
			local y_Top= math.random(2,7)/10; --6/10;

			AntiJDY_sub:SetProperty("UnifiedPosition", "{{" .. x_Left .. ", 0.0},{" ..  y_Top .. ", 0.0}}");



			this:Show();
			Variable:SetVariable("WaiGua_ForceGameQuiting", "1", 1); --��ֹWM_CLOSE��Ϣ.
			--���˳��˲�����  #71100
			--EnterQuitWait(3); --ǿ���˳���Ϸ��.
			
		else
			this:Hide();
		end
	end

end


-------------------------------------------------------------
--
-- ��ť ����¼�
--
function AntiJDY_Bn1Click()

	if( -1 == g_Type ) then
		return
	end

	if (1 == g_Type) then
--		local isWaiGua = CheckWaiGuaJDY()
--		if( 1 == isWaiGua ) then
--			return
--		else
--			this:Hide()
--		end
	end
	this:Hide();
end

function AntiJDY_Frame_OnHiden()
	DataPool:SetCanUseHotKey(1);
	Variable:SetVariable("WaiGua_ForceGameQuiting", "0", 1); --��ȻҪ�޸Ŀ��� Ҫ��Ȼ���˴����û��� X ��alt+f4�ȹ�û�� ��WM_CLOSE��Ϣ #71100
end
