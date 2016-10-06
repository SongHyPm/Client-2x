--gloable
-- �����Ĭ��λ��
local g_UnifiedXPosition;
local g_UnifiedYPosition;

local MAX_GROUP = 20;
local GROUP_CHAT_INDEX = 9;

local curHistroyPointer = 0;
local maxHistroyNumber = 0;
local curFriendGroup = 0;
local curFriendIndex = 0;
local numberPerPage = 10;
local maxHistroyPage = 0;
local g_IsTeamOutLine={};
local g_TeamOutLineStr={};
local g_IsGroupShow = false;
local curChatGroupID = 0;
local g_curFirstPos = -1;    --��¼λ�� ��ֹˢ��list λ�ûع�
--===============================================
-- OnLoad()
--===============================================
function Friend_IMHistory_PreLoad()
	this:RegisterEvent("OPEN_IM_CHAT_HISTORY");
	this:RegisterEvent("OPEN_IM_GROUP_HISTORY");
	-- ��Ϸ���ڳߴ緢���˱仯
	this:RegisterEvent("ADJEST_UI_POS")

	-- ��Ϸ�ֱ��ʷ����˱仯
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end

function Friend_IMHistory_OnLoad()
	-- ��������Ĭ�����λ��
	g_UnifiedXPosition	= Friend_IMHistory_Frame:GetProperty("UnifiedXPosition");
	g_UnifiedYPosition	= Friend_IMHistory_Frame:GetProperty("UnifiedYPosition");
	
	g_IsTeamOutLine = {0,0,0,0,0,0,0,0,0};
	g_TeamOutLineStr = {
							"�ҵĺ���"	,
							"����һ"	,
							"�����" 	,
							"������"	,
							"������"	,
							"����"		,
							[8] = "��ʱ����",
							[9] = "�ҵ�Ⱥ",
						}
	g_curFirstPos = -1;
end

--===============================================
-- OnEvent()
--===============================================
function Friend_IMHistory_OnEvent( event )

	if ( event == "OPEN_IM_CHAT_HISTORY" ) then --˽��
		g_IsTeamOutLine = {0,0,0,0,0,0,0,0,0};
		local nGroup = tonumber(arg0);
		local nIndex = tonumber(arg1);

		if(nGroup == 0 and nIndex == 0) then
			Friend_IMHistory_ListUpdate();
			Friend_IMHistory_Chat_Show( 0, 0 );
			return;
		elseif(nGroup<0 or nIndex<0) then
			PushDebugMessage("#{LTQH_XML_83}");
			Friend_IMHistory_ListUpdate();
			Friend_IMHistory_Chat_Show( 0, 0 );
			return;
		else
			g_IsTeamOutLine[nGroup] = 1;
			Friend_IMHistory_ListUpdate();
			Friend_IMHistory_FriendList:SetItemSelect(nGroup+nIndex);
			Friend_IMHistory_Chat_Show( nGroup, nIndex );
		end
	end
	if (event == "OPEN_IM_GROUP_HISTORY") then
		local nChatGroupID = tonumber(arg0);
		--PushDebugMessage("nChatGroupID" .. nChatGroupID);
		g_IsTeamOutLine = {0,0,0,0,0,0,0,0,0};
		g_IsTeamOutLine[GROUP_CHAT_INDEX] = 1;
		Friend_IMHistory_ListUpdate();
		local i;
		for i = 0,MAX_GROUP-1 do
			local id , name ,count ,ownerid = DataPool:GetChatGroupInfoByIndex(i);
			if(id == nChatGroupID)then
				Friend_IMHistory_FriendList:SetItemSelect(GROUP_CHAT_INDEX + i -1); --��Ϊ��ʱ����ǰ��ճ�һλ ����Ҫ��1
				Friend_IMHistory_Group_Show(nChatGroupID);
				break;
			end
		end
	elseif( event == "ADJEST_UI_POS" ) then
		Friend_IMHistory_ResetPos()
	elseif( event == "VIEW_RESOLUTION_CHANGED" ) then
		Friend_IMHistory_ResetPos()
	end

end

--��ʾ˽����Ϣ
function Friend_IMHistory_Chat_Show( nChannel, nIndex )
	g_IsGroupShow = false;
	curFriendGroup = tonumber(nChannel);
	curFriendIndex = tonumber(nIndex);
	maxHistroyNumber = Friend:GetIMChatNumber( curFriendGroup, curFriendIndex );
	curHistroyPointer = maxHistroyNumber;

	Friend_IMHistory_ContentUpdate();
	this:Show();
end

--��ʾȺ����Ϣ
function Friend_IMHistory_Group_Show( nGroupID)
	g_IsGroupShow = true;
	curChatGroupID = tonumber(nGroupID);
	maxHistroyNumber = DataPool:GetIMGroupChatNumber(curChatGroupID);
	curHistroyPointer = maxHistroyNumber;

	Friend_IMHistory_ContentUpdate();
	this:Show();
end

--===============================================
-- OnUpdate()
--===============================================
function Friend_IMHistory_ContentUpdate()
	local i = curHistroyPointer -1 ;
	local minHistroyPointer = curHistroyPointer - numberPerPage;
	if( minHistroyPointer < 0 ) then
		minHistroyPointer = 0;
	end

	if( minHistroyPointer == 0 ) then
		Friend_IMHistory_GotoNextPage:Disable();
	else
		Friend_IMHistory_GotoNextPage:Enable();
	end
	if( curHistroyPointer == maxHistroyNumber ) then
		Friend_IMHistory_GotofrontPage:Disable();
	else
		Friend_IMHistory_GotofrontPage:Enable();
	end

	Friend_IMHistory_HistoryContent:ClearListBox();

	if(g_IsGroupShow == false) then --˽��
		local str = "";
		while i >= minHistroyPointer do
			str = Friend:GetIMChatData( tonumber( curFriendGroup ), tonumber( curFriendIndex ), tonumber(i), "TIME" );
			str = str.." "..Friend:GetIMChatData( tonumber( curFriendGroup ), tonumber( curFriendIndex ), tonumber(i), "SENDER" );
			str = str.."#r";
			str = str..Friend:GetIMChatData( tonumber( curFriendGroup ), tonumber( curFriendIndex ), tonumber(i), "CONTEX" )
			Friend_IMHistory_HistoryContent:AddItem( str, i, "FFFFFFFF", 4 );
			i = i - 1;
		end
	elseif (g_IsGroupShow == true) then --Ⱥ��
		local str = "";
		while i >= minHistroyPointer do
			str = DataPool:GetIMGroupChatData( tonumber( curChatGroupID ), tonumber(i), "TIME" );
			str = str.." "..DataPool:GetIMGroupChatData( tonumber( curChatGroupID ), tonumber(i), "SENDER" );
			str = str.."#r";
			str = str..DataPool:GetIMGroupChatData( tonumber( curChatGroupID ), tonumber(i), "CONTEX" )
			Friend_IMHistory_HistoryContent:AddItem( str, i, "FFFFFFFF", 4 );
			i = i - 1;
		end
	end
	--����ҳ����ʾ
	local curpage = tonumber((maxHistroyNumber - curHistroyPointer) / numberPerPage);
	curpage = math.floor( curpage ) + 1;
	if(maxHistroyNumber == 0) then
		curpage = 0;
	end
	maxHistroyPage = math.ceil(tonumber(maxHistroyNumber / numberPerPage ));
	Friend_IMHistory_CurPageNumber:SetText(tostring(curpage .. "/" .. maxHistroyPage));

end

function Friend_IMHistory_ListUpdate()

	Friend_IMHistory_FriendList:ClearListBox();
	--һ��7�� ����ʱ���ѵ�������
	for i = 1 , 7 do
		local j = i
		if i == 7 then
			j = 8
		end

		local strOutlineName = ""
		local strTitle = ""
		if(j>=1 and j<=4) then
			strTitle = DataPool:GetGroupingNameByIndex(i-1);
		else
			strTitle = g_TeamOutLineStr[j];
		end

		if g_IsTeamOutLine[j] == 1 then
			strOutlineName = "#gFE7E82- " .. strTitle;
		else
			strOutlineName = "#gFE7E82+ " .. strTitle;
		end

		if( strOutlineName ~= "" or strOutlineName ~= 0 ) then
			local iStart = j*10000;
			local friendnumber = DataPool:GetFriendNumber( tonumber( j ) );
			if friendnumber < 1 then
				strOutlineName = "#gFE7E82- " .. strTitle;
			end
			Friend_IMHistory_FriendList:AddItem( strOutlineName, iStart )
			if( 1 == g_IsTeamOutLine[ j ] and friendnumber >= 1) then
				local index=0;
				while index < friendnumber  do
					local name = DataPool:GetFriend( j, index, "NAME" );
					--PushDebugMessage(name);
					Friend_IMHistory_FriendList:AddItem( "    " .. name, iStart + index + 1, "FFFFFFFF", 4 );
					index = index + 1;
				end
			end
		end
	end
	--Ⱥ�б�
	local strOutlineGroup;
	if g_IsTeamOutLine[GROUP_CHAT_INDEX] == 1 then
			strOutlineGroup = "#gFE7E82- " .. g_TeamOutLineStr[GROUP_CHAT_INDEX]
	else
		strOutlineGroup = "#gFE7E82+ " .. g_TeamOutLineStr[GROUP_CHAT_INDEX]
	end
	if( strOutlineGroup ~= "" or strOutlineGroup ~= 0 ) then
		local iStart = 90000;
		local groupNumber = tonumber(DataPool:GetChatGroupNumber( ));
		if groupNumber < 1 then
			strOutlineGroup = "#gFE7E82- " .. g_TeamOutLineStr[GROUP_CHAT_INDEX];
		end
		Friend_IMHistory_FriendList:AddItem( strOutlineGroup, iStart )
		if( 1 == g_IsTeamOutLine[ GROUP_CHAT_INDEX ] ) then
			for i = 0 ,MAX_GROUP - 1 do
				local id , name ,count ,ownerid = DataPool:GetChatGroupInfoByIndex(i)
				if id ~= -1 then
					Friend_IMHistory_FriendList:AddItem(  "    " .. name.."["..tostring(count).."]",iStart + i+1 ,"FFFFFFFF", 4);
				end
			end
		end
	end

	if g_curFirstPos ~= -1 then
		Friend_IMHistory_FriendList:SetCurrentFirstItem(g_curFirstPos);
		g_curFirstPos = -1
	end
end
--===============================================
-- OnButtonClick()
--===============================================
--��һҳ
function Friend_IMHistory_OnPageDown()
	curHistroyPointer = curHistroyPointer - numberPerPage;
	if( curHistroyPointer < 0 ) then
		curHistroyPointer = 0;
	end
	Friend_IMHistory_ContentUpdate();
end
--��һҳ
function Friend_IMHistory_OnPageUp()
	curHistroyPointer = curHistroyPointer + numberPerPage;
	if( curHistroyPointer > maxHistroyNumber ) then
		curHistroyPointer = maxHistroyNumber;
	end
	Friend_IMHistory_ContentUpdate();
end
--ת��
function Friend_IMHistory_GotoPage()
	local nPage = tonumber(Friend_IMHistory_GotoPageNumber:GetText());
	if(nPage == nil) then
		return;
	end
	if( nPage > maxHistroyPage)then
		nPage = maxHistroyPage;
	elseif( nPage <= 0 ) then
		nPage = 1;
	end
	Friend_IMHistory_GotoPageNumber:SetText(nPage);
	curHistroyPointer = maxHistroyNumber - (nPage - 1) * numberPerPage;
	if( curHistroyPointer < 0 ) then
		curHistroyPointer = 0;
	elseif 	( curHistroyPointer > maxHistroyNumber ) then
		curHistroyPointer = maxHistroyNumber;
	end

	Friend_IMHistory_ContentUpdate();
end

--ѡ���б�
function Friend_IMHistory_ListSelectChanged()
	local nSelIndex = Friend_IMHistory_FriendList:GetFirstSelectItem();

	local ItemIndex = math.mod( nSelIndex, 10000 )
	local TitleIndex = math.floor( nSelIndex / 10000 );

	if( 0 == ItemIndex ) then --ѡ�д���
		if( 0 == g_IsTeamOutLine[ TitleIndex ] ) then
			g_IsTeamOutLine[ TitleIndex ] = 1
		else
			g_IsTeamOutLine[ TitleIndex ] = 0
		end
		g_curFirstPos = Friend_IMHistory_FriendList:GetCurrentFirstItem();
		Friend_IMHistory_ListUpdate();
		if(TitleIndex == GROUP_CHAT_INDEX) then

		else
			Friend_IMHistory_Chat_Show(0,0);
		end
	else   --ѡ��С��
		if(TitleIndex == GROUP_CHAT_INDEX) then
			local id , name ,count ,ownerid = DataPool:GetChatGroupInfoByIndex(ItemIndex - 1);
			Friend_IMHistory_Group_Show(id);
		else
			Friend_IMHistory_Chat_Show(TitleIndex,ItemIndex - 1);
		end
	end
end

--ˢ��
function Friend_IMHistory_Refresh()
	if(g_IsGroupShow == false) then
		Friend_IMHistory_Chat_Show(curFriendGroup,curFriendIndex);
	else
		Friend_IMHistory_Group_Show(curChatGroupID);
	end
end

--����
function Friend_IMHistory_Export()
	local result,fileName;
	if(g_IsGroupShow == false) then
		result,fileName = Talk:SaveIMChatHistory(1,curFriendGroup,curFriendIndex);
	else
		result,fileName = Talk:SaveIMChatHistory(2,curChatGroupID,0);
	end
	if(result == nil or tonumber(result) == -2 )then
		PushDebugMessage("#{LTQH_XML_66}");
	elseif(tonumber(result) == -1) then
		PushDebugMessage("#{LTQH_XML_67}");
	else
		PushDebugMessage("#{LTQH_XML_68} " .. fileName);
	end
end


function Friend_IMHistory_OnHidden()

end

function Friend_IMHistory_ResetPos()
	Friend_IMHistory_Frame:SetProperty("UnifiedXPosition", g_UnifiedXPosition);
	Friend_IMHistory_Frame:SetProperty("UnifiedYPosition", g_UnifiedYPosition);
end
