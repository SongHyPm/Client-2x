-- 征友平台: 查找， cuiyinjie 2008.10.21

-- 此条件和PlayerZhengyouPT.lua里定义一致，要同时更改, 注意门派有区别 
local g_Conditions = {
	MenPai = {"Thi猽 L鈓", "Minh Gi醥", "C醝 Bang", "V� 衋ng", "Nga My", "Tinh T鷆", "Thi阯 Long", "Thi阯 S絥", "Ti陁 Dao", "Kh鬾g c�", "To鄋 b�"},
	Level = {"B k�", "D呔i c 10", "C 10 皙n 20", "C 20 皙n 30", "C 30 皙n 40", "C 40 皙n 50", "C 50 皙n 60", "C 60 皙n 70", "C 70 皙n 80", "C 80 皙n 90", "C 90 皙n 100", "Tr阯 c 100"},
	Sexy = {"Kh鬾g gi緄 h課", "Nam", "N�"},
	Banghui = {"To鄋 b�", "C� bang ph醝", "Kh鬾g bang ph醝"},
	ADType	= {"To鄋 b�", "K猼 H鬾", "Bang H礽", "S� 邪", "K猼 Ngh頰"},   -- 此处用字典不行，列表框好像不支持 {"全部", "#{ZYPT_081103_008}", "#{ZYPT_081103_009}", "#{ZYPT_081103_010}", "#{ZYPT_081103_011}",},
	HotLevel = {"To鄋 b�", "0-10", "11-20", "21-30", "31-40", "41-50", "51-60", "61-70", "71-80"},
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
	   if ( "ZhengyouSearch" .. i == sWndName ) then  --先关闭其它开着的窗口
           CloseWindow("ZhengyouInfoFabu");
           CloseWindow("ZhengyouYaoqiu");
           CloseWindow("VotedPlayer");
	   	   this:Show();
	       if ( 5 == i ) then   -- 在查找标签里时也为查找全部 
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

-- 开始查找 
function ZhengyouSearch_BeginSearch()
	local sMenpai, iMenpai 	=  g_Ctrls.MenpaiCombo:GetCurrentSelect();
	local sLevel, iLevel 	=  g_Ctrls.LevelCombo:GetCurrentSelect();	
	local sSexy, iSexy 		=  g_Ctrls.SexyCombo:GetCurrentSelect();
	local sBanghui, iBanghui =  g_Ctrls.BanghuiCombo:GetCurrentSelect();
	local sADType, iADType 	=  g_Ctrls.ADTypeCombo:GetCurrentSelect();
	local sHotLevel, iHotLevel 	=  g_Ctrls.HotLevelCombo:GetCurrentSelect();
	--发送查找请求
	--注意： 门派的全部和其它不一样，其它都是0， 而门派为10才是全部 
	RequestSearchFindFriendInfo(iMenpai, iBanghui, iSexy, iADType, iLevel, iHotLevel);
	this:Hide();
end