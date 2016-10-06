-- �����Ĭ��λ��
local g_UnifiedXPosition;
local g_UnifiedYPosition;

local Titles = {};-- {"��������","��������"};
local TagButtons = {};--{Friend_IMSetting_TagButton1,Friend_IMSetting_TagButton2}
local TagContents = {};
local TagNum = 2;
local MaxGroupingName = 4; --����ĸ�����
local g_CurTagIndex = 0;

--===============================================
-- OnLoad()
--===============================================
function Friend_IMSetting_PreLoad()
	this:RegisterEvent("OPEN_IM_SETTING");
	this:RegisterEvent("UPDATE_GROUPINGNAME");
	-- ��Ϸ���ڳߴ緢���˱仯
	this:RegisterEvent("ADJEST_UI_POS")

	-- ��Ϸ�ֱ��ʷ����˱仯
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end

function Friend_IMSetting_OnLoad()

	-- ��������Ĭ�����λ��
	g_UnifiedXPosition	= Friend_IMSetting_Frame:GetProperty("UnifiedXPosition");
	g_UnifiedYPosition	= Friend_IMSetting_Frame:GetProperty("UnifiedYPosition");
	
	Titles[1] = "#{LTQH_XML_69}";	--��������
	Titles[2] = "#{LTQH_XML_70}";	--��������

	TagButtons[1] = Friend_IMSetting_BasicSetting;
	TagButtons[2] = Friend_IMSetting_GroupSetting;

	TagContents[1] = Friend_IMSetting_BasicContent;
	TagContents[2] = Friend_IMSetting_GroupContent;


end

--===============================================
-- OnEvent()
--===============================================
function Friend_IMSetting_OnEvent( event )

	if ( event == "OPEN_IM_SETTING" ) then
		Friend_IMSetting_UpdateFrame();
		Friend_IMSetting_Tag_Clicked(1);
		Friend_IMSetting_SetButton(1);
		this:Show();
	end
	if ( event == "UPDATE_GROUPINGNAME") then
		if(tonumber(arg0) == 1) then
			PushDebugMessage("#{LTQH_XML_92}");
			Friend_IMSetting_UpdateFrame();
		end
	elseif( event == "ADJEST_UI_POS" ) then
		Friend_IMSetting_ResetPos()
	elseif( event == "VIEW_RESOLUTION_CHANGED" ) then
		Friend_IMSetting_ResetPos()
	end

end

function Friend_IMSetting_UpdateFrame()
	local n1,n2,n3,n4,n5 = SystemSetup:GetChatSetting();

	Friend_IMSetting_Basic1				:SetCheck(n1);					-- �ܾ������ż�
	Friend_IMSetting_Basic2				:SetCheck(n2);					-- �ܾ����Һ���
	Friend_IMSetting_Basic3				:SetCheck(n3);					-- �ܾ�Ĭ�����ż�
	Friend_IMSetting_Basic4				:SetCheck(n4);					-- �ܾ�����������Ϣ
	Friend_IMSetting_Basic5				:SetCheck(n5);					-- �ܾ��κ��������Ҽ�������Ⱥ

	--clear
	Friend_IMSetting_GroupNameNew:SetText("");
	Friend_IMSetting_GroupName:SetText("");
	Friend_IMSetting_GroupName:ResetList();

	local GroupName;
	for i = 1, MaxGroupingName do
		GroupName = DataPool:GetGroupingNameByIndex(i-1);
		Friend_IMSetting_GroupName:AddTextItem( GroupName, i);
	end

end

--ȷ��
function Friend_IMSetting_Accept_Clicked()
	if(g_CurTagIndex == 1) then
		local n1,n2,n3,n4,n5 = SystemSetup:GetChatSetting();

		n1 = Friend_IMSetting_Basic1:GetCheck();				  -- �ܾ������ż�
		n2 = Friend_IMSetting_Basic2:GetCheck();                  -- �ܾ����Һ���
		n3 = Friend_IMSetting_Basic3:GetCheck();                  -- �ܾ�Ĭ�����ż�
		n4 = Friend_IMSetting_Basic4:GetCheck();                  -- �ܾ�����������Ϣ
		n5 = Friend_IMSetting_Basic5:GetCheck();                  -- �ܾ��κ��������Ҽ�������Ⱥ


		SystemSetup:SaveChatSetting ( n1,n2,n3,n4,n5 );
		this:Hide();
	elseif(g_CurTagIndex == 2) then
		if(Friend_IMSetting_Modify_Clicked() == 1) then
			this:Hide();
		end
	end

end
--ȡ��
function Friend_IMSetting_Cancel_Clicked()
	this:Hide();
end

--�޸ķ�������
function Friend_IMSetting_Modify_Clicked()
	local oldName , nIndex = Friend_IMSetting_GroupName:GetCurrentSelect();
	local newName = Friend_IMSetting_GroupNameNew:GetText();
	if(nIndex<1 or nIndex>MaxGroupingName) then
		PushDebugMessage("#{LTQH_XML_71}");
		return -1;
	end
	if( newName == "" or newName == nil) then
		PushDebugMessage("#{LTQH_XML_72}");
		return -1;
	end

	local Ret = DataPool:ModifyGroupingName(nIndex-1,newName);
	if(Ret == nil or tonumber(Ret) < 0) then
		PushDebugMessage("#{LTQH_XML_86}");
		return -1;
	end
	return 1;
end

function Friend_IMSetting_OnHidden()
	Friend_IMSetting_SetButton(-1);
end

function Friend_IMSetting_Tag_Clicked(Index)
	g_CurTagIndex = Index;
	Friend_IMSetting_CloseTag(-1);
	Friend_IMSetting_OpenTag(Index);
	Friend_IMSetting_SetTitle(Index);
end

--�ر�Tag����
function Friend_IMSetting_CloseTag(Index)
	local i;
	if(Index == -1) then	--ȫ���ر�
		for i=1,TagNum do
			TagContents[i]:Hide();
		end
		return;
	end
	if(Index>0 and Index <= TagNum) then
		TagContents[Index]:Hide();
	end
end

--��Tag����
function Friend_IMSetting_OpenTag(Index)
	if(Index>0 and Index <= TagNum) then
		TagContents[Index]:Show();
	end
end

--���ñ���
function Friend_IMSetting_SetTitle(Index)
	if(Index>0 and Index <= TagNum) then
		Friend_IMSetting_Explain:SetText(Titles[Index]);
	end
end

--���ð�ť״̬
function Friend_IMSetting_SetButton(Index)
	local i;
	if(Index == -1) then	--ȫ��ȡ��ѡ��״̬
		for i=1,TagNum do
			TagButtons[i]:SetCheck(0);
		end
		return;
	end
	if(Index>0 and Index <= TagNum) then
		TagButtons[Index]:SetCheck(1);
	end
end

function Friend_IMSetting_ResetPos()
	Friend_IMSetting_Frame:SetProperty("UnifiedXPosition", g_UnifiedXPosition);
	Friend_IMSetting_Frame:SetProperty("UnifiedYPosition", g_UnifiedYPosition);
end
