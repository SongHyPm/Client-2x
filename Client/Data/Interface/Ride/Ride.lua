local Current_Ride_Index = -1;
local  g_Ride;			--��˶���
local  g_EquipMask;
function Ride_PreLoad()
	
	-- �򿪽���
	this:RegisterEvent("OPEN_RIDE_PAGE");
	this:RegisterEvent("UNIT_XIULIAN");
	--�뿪�������Զ��ر�
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	--��Ҹ������
	this:RegisterEvent("PLAYER_UPDATE_RIDE");
	
	this:RegisterEvent("REFRESH_EQUIP");
	
end

function Ride_OnLoad()
	g_Ride = Ride_Equip;
	g_EquipMask	= Ride_Equip_Mask;
end

-- OnEvent
function Ride_OnEvent(event)
	if ( event == "OPEN_RIDE_PAGE" ) then
		Ride_SetTabState()
		if(this:IsVisible()) then
			
			this:Hide();
			return;
		end

		Ride_OnShow();
		this:Show();
	end
	
	if( event == "PLAYER_LEAVE_WORLD") then
		this:Hide();
		return;
	end
	
	if("REFRESH_EQUIP" == event) then 
		if(this:IsVisible()) then
			
			Ride_OnShow();
			return;
		end
	end
	
	if("PLAYER_UPDATE_RIDE" == event)then
		if(this:IsVisible()) then
			Ride_OnShow();
		end
	end
	
	if("REFRESH_EQUIP" == event)then
		if(this:IsVisible()) then
			Ride_Object_Update();
		end
	end
	
	return;		
end

function Ride_OnShow()
	Ride_Ride : SetCheck(1);
	local selfUnionPos = Variable:GetVariable("SelfUnionPos");
	if(selfUnionPos ~= nil) then
		Ride_Frame:SetProperty("UnifiedPosition", selfUnionPos);
	end

	Ride_List : ClearListBox();
	Ride_FakeObject : SetFakeObject( "" );
	local nRideIndex = LifeAbility : Get_UserEquip_VisualID(8)
	Player : SetHorseModel(nRideIndex);
	if (nRideIndex ~= -1) then
		Ride_FakeObject : SetFakeObject( "My_Horse" );
	end
	
	nRideIndex = -1
	while nRideIndex < 64 do
		nRideIndex = nRideIndex + 1;
		StrName = Player : GetMyHorse(nRideIndex);
		
		if StrName ~= "-1" then
			Ride_List : AddItem(StrName, nRideIndex);
		end
	
	end
	
	Ride_Equip_Update();

end

function Ride_ListBox_Selected()
	Ride_List : ClearSelectState();
	if 1 == 0 then
		Current_Ride_Index = Ride_List : GetFirstSelectItem();
	
		if 	Current_Ride_Index ~= -1 then
			AxTrace(0,1,"Current_Ride_Index="..Current_Ride_Index)
			Player:GetMyHorse(Current_Ride_Index);
			Ride_FakeObject : SetFakeObject( "" );
			Player : SetHorseModel(Current_Ride_Index);
			Ride_FakeObject : SetFakeObject( "My_Horse" );
		end
	end
end

----------------------------------------------------------------------------------
--
-- ѡװ���ģ�ͣ�����)
--
function Ride_Modle_TurnLeft(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then
		--������ת��ʼ
		if(start == 1) then
			Ride_FakeObject:RotateBegin(-0.3);
		--������ת����
		else
			Ride_FakeObject:RotateEnd();
		end
	end
end

----------------------------------------------------------------------------------
--
-- ѡװ���ģ�ͣ�����)
--
function Ride_Modle_TurnRight(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then
		--������ת��ʼ
		if(start == 1) then
			Ride_FakeObject:RotateBegin(0.3);
		--������ת����
		else
			Ride_FakeObject:RotateEnd();
		end
	end
end
function Ride_Wuhun_Switch()
	Variable:SetVariable("SelfUnionPos", Ride_Frame:GetProperty("UnifiedPosition"), 1);
	PushEvent("UI_COMMAND",20111211)
end
function Ride_Xiulian_Page_Switch()
	local nLevel = Player:GetData("LEVEL")
	if(nLevel >= 70) then
		Variable:SetVariable("SelfUnionPos", Ride_Frame:GetProperty("UnifiedPosition"), 1);
		PushEvent("UI_COMMAND",20111212)
	else
		Wuhun_Xiulian : SetCheck(0)
		PushDebugMessage("#{XL_090707_62}")
	end
end
function Ride_SelfEquip_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Ride_Frame:GetProperty("UnifiedPosition"), 1);
	OpenEquip(1);
end
function Ride_SetTabState()
	Ride_SelfEquip:SetCheck(0)
	Ride_Wuhun:SetCheck(0)
	Ride_SelfData:SetCheck(0)
	Ride_Blog:SetCheck(0)
	Ride_Pet:SetCheck(0)
	Ride_Xiulian:SetCheck(0)
	Ride_Ride:SetCheck(1)
	Ride_OtherInfo:SetCheck(0)
end
--���Լ�������ҳ��
function Ride_SelfData_Switch()
	Variable:SetVariable("SelfUnionPos", Ride_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPrivatePage("self");
end

function Ride_Pet_Switch()
	Variable:SetVariable("SelfUnionPos", Ride_Frame:GetProperty("UnifiedPosition"), 1);
	TogglePetPage();
end

function Ride_Other_Info_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Ride_Frame:GetProperty("UnifiedPosition"), 1);
	OtherInfoPage();
end

function Ride_Equip_Click( buttonIn )
	local button = tonumber( buttonIn );
	if( button == 1 ) then
		g_Ride:DoAction();	--���
	else
		g_Ride:DoSubAction();	--���
	end
end

function Ride_Equip_Update()
	g_Ride:SetActionItem(-1);
	local ActionMount = EnumAction(8, "equip");
	g_Ride:SetActionItem(ActionMount:GetID());	
	
	if( ActionMount:GetEquipDur() < 0.1 ) then
		g_EquipMask:Show();
	else
		g_EquipMask:Hide();
	end
end


function Ride_Object_Update()
	
	Ride_FakeObject : SetFakeObject( "" );
	local nRideIndex = LifeAbility : Get_UserEquip_VisualID(8)
	Player : SetHorseModel(nRideIndex);
	if (nRideIndex ~= -1) then
		Ride_FakeObject : SetFakeObject( "My_Horse" );
	else
		Ride_FakeObject : SetFakeObject( "" );
	end
end