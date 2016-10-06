local IsShow = 0;

local g_name = "";
--===============================================
-- OnLoad()
--===============================================
function FriendInfo_PreLoad()

	this:RegisterEvent("TOGLE_FRIEND_INFO");
	this:RegisterEvent("UPDATE_FRIEND_INFO");
end

function FriendInfo_OnLoad()

end

function FriendInfoSiLiao_Clicked(itemname)
	 Talk:ContexMenuTalk(g_name);
end
--===============================================
-- OnEvent()
--===============================================
function FriendInfo_OnEvent( event )
	
	if ( event == "TOGLE_FRIEND_INFO" ) then
			if( tonumber(arg0) == -1 ) then
				FriendInfo_OnHide();
				return;
			end
			FriendInfo_Show( -1, -1 );
	
	elseif( event == "UPDATE_FRIEND_INFO" ) then
		FriendInfo_Update( arg0, arg1 );
	end

end


--===============================================
-- UpdateFrame()
-- 第几个频道的第几个人
--===============================================
function FriendInfo_Update( nChannel, nIndex )
	g_name = "";
	if(IsShow == 1)then
		AxTrace( 0,0,"channel="..tostring(nChannel).."    nIndex"..tostring( nIndex ) );
		local strFaceImage = DataPool:GetFriend( nChannel, nIndex, "PORTRAIT" );
		if( nChannel== -1 ) then
			FriendInfo_PlayerHead:SetProperty("Image", "");
			FriendInfo_ID:SetText( "ID:");
			FriendInfo_Name:SetText( "H� t阯: " );
			FriendInfo_Level:SetText( "C: " );
			FriendInfo_MenPai:SetText( "Ph醝:  ");
			FriendInfo_FriendlyGrade:SetText( "H鋙 h鎢: " );
			FriendInfo_Confraternity:SetText( "Bang H礽: ");
			FriendInfo_GuildLeague:SetText( "#{TM_20080311_30}");
			FriendInfo_Explain:SetText( "T鈓 tr課g: " );
			FriendInfo_Relation:SetText( "Quan h�: " );
			FriendInfo_Agname:SetText( "Danh hi畊: " );
			FriendInfo_Locus:SetText( "V� tr�: " );
			FriendInfo_TeamInfo:SetText( "Nh髆: " );
			
			FriendInfo_Join:SetText( "M秈 v鄌 nh髆" );
			FriendInfo_Join:Disable();
	
		else
			g_name = DataPool:GetFriend( nChannel, nIndex, "NAME"  ) ;
			FriendInfo_PlayerHead:SetProperty("Image", tostring(strFaceImage));
			FriendInfo_ID:SetText( "ID:"..tostring( DataPool:GetFriend( nChannel, nIndex, "ID_TEXT" ) ) );
			FriendInfo_Name:SetText( "H� t阯: "..DataPool:GetFriend( nChannel, nIndex, "NAME"  ) );
			FriendInfo_Level:SetText( "C: "..tostring( DataPool:GetFriend( nChannel, nIndex, "LEVEL" ) ) );
			FriendInfo_MenPai:SetText( "Ph醝:  "..DataPool:GetFriend( nChannel, nIndex, "MENPAI_TEXT" ) );
			if( tonumber( nChannel ) == 6 ) then 
				FriendInfo_FriendlyGrade:SetText( "H鋙 h鎢: " );
			else
				FriendInfo_FriendlyGrade:SetText( "H鋙 h鎢: "..tostring( DataPool:GetFriend( nChannel, nIndex, "FRIENDSHIP" ) ) );
			end
			FriendInfo_Confraternity:SetText( "Bang H礽: "..DataPool:GetFriend( nChannel, nIndex, "GUID_NAME" ) );
			--FriendInfo_GuildLeague:SetText( "#{TM_20080311_30}"..DataPool:GetFriend( nChannel, nIndex, "GUILD_LEAGUE_NAME" ) );
			FriendInfo_Explain:SetText( "T鈓 tr課g: "..DataPool:GetFriend( nChannel, nIndex, "MOOD" ) );
			
			if( tonumber( nChannel ) == 6 ) then 
				FriendInfo_Relation:SetText( "Quan h�: Giao 醕" );
			else
				FriendInfo_Relation:SetText( "Quan h�: "..DataPool:GetFriend( nChannel, nIndex, "RELATION_TEXT" ) );
			end
			
			
			FriendInfo_Agname:SetText( "Danh hi畊: "..DataPool:GetFriend( nChannel, nIndex, "TITLE" ) );
			FriendInfo_Locus:SetText( "V� tr�: "..DataPool:GetFriend( nChannel, nIndex, "SCENE" ) );
			FriendInfo_TeamInfo:SetText( "Nh髆: "..DataPool:GetFriend( nChannel, nIndex, "TEAM_NUMBER" ) );
			local TeamNumber = DataPool:GetFriend( nChannel, nIndex, "TEAM_NUMBER" );
			FriendInfo_Join:Enable();
			if( TeamNumber == "Ch遖 l 鸬i" ) then
				FriendInfo_Join:SetText( "M秈 v鄌 nh髆" );
			else
				FriendInfo_Join:SetText( "Xin 鸢ng h鄋h" );
			end
		end
		if( tonumber( nChannel ) == 5 ) then 
			FriendInfo_Join:Hide();
			FriendInfo_Groupinge:Hide();
			FriendInfo_Correspondence:Hide();
		else
			FriendInfo_Join:Show();
			FriendInfo_Groupinge:Show();
			FriendInfo_Correspondence:Show();
		end
		this:Show();
	end;
	
end

function FriendInfo_Show( arg_0, arg_1 )
		
	--FriendInfo_Update( Friend:GetCurrentTeam() ,Friend:GetCurrentSelect());
	--this:Show();
	IsShow = 1;
end

function FriendInfo_OnHide()
	this:Hide();
	IsShow = 0;
end

function FriendInfo_WriteMail()
	if(g_name == "") then
		return;
	end
	local group,index = DataPool:GetFriendByName(g_name);
	if(tonumber(group) ~=-1 and tonumber(index)~=-1)then
		DataPool:OpenMail( g_name );
	else
		PushDebugMessage("Thao t醕 th b読, V� h鋙 h鎢 n鄖 kh鬾g t皀 t読.")
		FriendInfo_OnHide();
	end
end

function FriendInfo_OnHelp()
end

function FriendInfo_OnHistroy()
	if(g_name == "") then
		return;
	end
	local group,index = DataPool:GetFriendByName(g_name);
	if(tonumber(group) ~=-1 and tonumber(index)~=-1)then
		DataPool:OpenHistroy(tonumber(group) ,tonumber(index) );
	else
		PushDebugMessage("Thao t醕 th b読, V� h鋙 h鎢 n鄖 kh鬾g t皀 t読.")
		FriendInfo_OnHide();
	end
	
end

function FriendInfo_OnJoin()
	if(g_name == "") then
		return;
	end
	local group,index = DataPool:GetFriendByName(g_name);
	if(tonumber(group) ~=-1 and tonumber(index)~=-1)then
		local TeamNumber = DataPool:GetFriend(tonumber(group) ,tonumber(index), "TEAM_NUMBER" );
		if( TeamNumber == "Ch遖 l 鸬i" ) then
			Friend:InviteTeam( DataPool:GetFriend(tonumber(group) ,tonumber(index), "NAME"  ) );
		else
			Friend:AskTeam( DataPool:GetFriend(tonumber(group) ,tonumber(index), "NAME"  ) );
		end
	else
		PushDebugMessage("Thao t醕 th b読, V� h鋙 h鎢 n鄖 kh鬾g t皀 t読.")
		FriendInfo_OnHide();
	end

	
end

function FriendInfo_OnGroup()
	if(g_name == "") then
		return;
	end
	local group,index = DataPool:GetFriendByName(g_name);
	if(tonumber(group) ~=-1 and tonumber(index)~=-1)then
		Friend:OpenGrouping(tonumber(group) ,tonumber(index)  );
	else
		PushDebugMessage("Thao t醕 th b読, V� h鋙 h鎢 n鄖 kh鬾g t皀 t読.")
		FriendInfo_OnHide();
	end
	
end

function FriendInfo_OnDelete()
	if(g_name == "") then
		return;
	end
	local group,index = DataPool:GetFriendByName(g_name);
	if(tonumber(group) ~=-1 and tonumber(index)~=-1)then
		DataPool:AskDelFriend( tonumber(group) ,tonumber(index) );
	else
		PushDebugMessage("Thao t醕 th b読, V� h鋙 h鎢 n鄖 kh鬾g t皀 t読.")
	end
	
	FriendInfo_OnHide();
end