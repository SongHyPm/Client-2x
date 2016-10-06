-- ����ƽ̨: ���ң� cuiyinjie 2008.10.21

-- ��������PlayerZhengyouPT.lua�ﶨ��һ�£�Ҫͬʱ����, ע������������ 
local g_Conditions = {
	MenPai = {"Thi�u L�m", "Minh Gi�o", "C�i Bang", "V� �ang", "Nga My", "Tinh T�c", "Thi�n Long", "Thi�n S�n", "Ti�u Dao", "Kh�ng c�", "To�n b�"},
	Level = {"B�t k�", "D߾i c�p 10", "C�p 10 �n 20", "C�p 20 �n 30", "C�p 30 �n 40", "C�p 40 �n 50", "C�p 50 �n 60", "C�p 60 �n 70", "C�p 70 �n 80", "C�p 80 �n 90", "C�p 90 �n 100", "Tr�n c�p 100"},
	Sexy = {"Kh�ng gi�i h�n", "Nam", "N�"},
	Banghui = {"To�n b�", "C� bang ph�i", "Kh�ng bang ph�i"},
	ADType	= {"To�n b�", "K�t H�n", "Bang H�i", "S� а", "K�t Ngh�a"},   -- �˴����ֵ䲻�У��б�����֧�� {"ȫ��", "#{ZYPT_081103_008}", "#{ZYPT_081103_009}", "#{ZYPT_081103_010}", "#{ZYPT_081103_011}",},
	HotLevel = {"To�n b�", "0-10", "11-20", "21-30", "31-40", "41-50", "51-60", "61-70", "71-80"},
}


function ZhengyouSearch_PreLoad()
	this:RegisterEvent("OPEN_WINDOW");
	this:RegisterEvent("CLOSE_WINDOW");
end

function ZhengyouSearch_OnLoad()
    ZhengyouSearch_SetControls();
	ZhengyouSearch_OnInitDialog(); 
 	ZhengyouSearch_Frame:SetProperty("AlwaysOnTop","True");
end

function ZhengyouSearch_OnEvent(event)
	if(event == "OPEN_WINDOW") then
		--if( arg0 == "ZhengyouSearch") then
		--	this:Show();
		--end
	    ZhengyouSearch_OnWindowOpen(arg0);
	elseif(event == "CLOSE_WINDOW") then
		if( arg0 == "ZhengyouSearch") then
			this:Hide();
		end	
	end
end

-- 
function ZhengyouSearch_OnWindowOpen(sWndName)
	local i = 0;
	for i = 0, 6 do
	   if ( "ZhengyouSearch" .. i == sWndName ) then  --�ȹر��������ŵĴ���
           CloseWindow("ZhengyouInfoFabu");
           CloseWindow("ZhengyouYaoqiu");
           CloseWindow("VotedPlayer");
	   	   this:Show();
	       if ( 5 == i ) then   -- �ڲ��ұ�ǩ��ʱҲΪ����ȫ�� 
	          g_Ctrls.ADTypeCombo:SetCurrentSelect(0);
	       else
	          g_Ctrls.ADTypeCombo:SetCurrentSelect(i);
	       end
	   end
	end
end

function ZhengyouSearch_SetControls()
    g_Ctrls = {
	    MenpaiCombo 	= ZhengyouSearch_MenPai,
	    LevelCombo 		= ZhengyouSearch_Level,
	    SexyCombo 		= ZhengyouSearch_Sexy,
	    BanghuiCombo 	= ZhengyouSearch_Confraternity,
	    ADTypeCombo		= ZhengyouSearch_Type,
	    HotLevelCombo   = ZhengyouSearch_Renqi,
	};
end

function ZhengyouSearch_OnInitDialog()
     local i = 1;
     for i = 1, table.getn(g_Conditions.MenPai) do
        g_Ctrls.MenpaiCombo:ComboBoxAddItem(g_Conditions.MenPai[i], i - 1);
        g_Ctrls.MenpaiCombo:SetCurrentSelect(10);
     end
     for i = 1, table.getn(g_Conditions.Level) do
        g_Ctrls.LevelCombo:ComboBoxAddItem(g_Conditions.Level[i], i - 1);
        g_Ctrls.LevelCombo:SetCurrentSelect(0);
     end
     for i = 1, table.getn(g_Conditions.Sexy) do
        g_Ctrls.SexyCombo:ComboBoxAddItem(g_Conditions.Sexy[i], i - 1);
        g_Ctrls.SexyCombo:SetCurrentSelect(0);
     end
     for i = 1, table.getn(g_Conditions.Banghui) do
        g_Ctrls.BanghuiCombo:ComboBoxAddItem(g_Conditions.Banghui[i], i - 1);
        g_Ctrls.BanghuiCombo:SetCurrentSelect(0);
     end
     for i = 1, table.getn(g_Conditions.ADType) do
        g_Ctrls.ADTypeCombo:ComboBoxAddItem(g_Conditions.ADType[i], i - 1);
        g_Ctrls.ADTypeCombo:SetCurrentSelect(0);
     end
     for i = 1, table.getn(g_Conditions.HotLevel) do
        g_Ctrls.HotLevelCombo:ComboBoxAddItem(g_Conditions.HotLevel[i], i - 1);
        g_Ctrls.HotLevelCombo:SetCurrentSelect(0);
     end
end

function ZhengyouSearch_Close()
   this:Hide();
end

-- ��ʼ���� 
function ZhengyouSearch_BeginSearch()
	local sMenpai, iMenpai 	=  g_Ctrls.MenpaiCombo:GetCurrentSelect();
	local sLevel, iLevel 	=  g_Ctrls.LevelCombo:GetCurrentSelect();	
	local sSexy, iSexy 		=  g_Ctrls.SexyCombo:GetCurrentSelect();
	local sBanghui, iBanghui =  g_Ctrls.BanghuiCombo:GetCurrentSelect();
	local sADType, iADType 	=  g_Ctrls.ADTypeCombo:GetCurrentSelect();
	local sHotLevel, iHotLevel 	=  g_Ctrls.HotLevelCombo:GetCurrentSelect();
	--���Ͳ�������
	--ע�⣺ ���ɵ�ȫ����������һ������������0�� ������Ϊ10����ȫ�� 
	RequestSearchFindFriendInfo(iMenpai, iBanghui, iSexy, iADType, iLevel, iHotLevel);
	this:Hide();
end