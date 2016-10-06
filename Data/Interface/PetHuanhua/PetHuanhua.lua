local m_UI_NUM = 20090804	--���޻û�

local m_PetIndex = -1
local m_ObjCared = -1
local m_needMoney = 0
local m_Comfirmed = 0

local m_KeepModel = -1

local g_PetHuanhua_Frame_UnifiedPosition;

function PetHuanhua_PreLoad()
	this : RegisterEvent( "UI_COMMAND" )
	this : RegisterEvent( "REPLY_MISSION_PET" )						-- ��Ҵ��б�ѡ��һֻ����
	this : RegisterEvent( "UPDATE_PET_PAGE" )						-- ������ϵ��������ݷ����仯����������һֻ����
	this : RegisterEvent( "DELETE_PET" )							-- ������ϼ���һֻ����
	this : RegisterEvent("UNIT_MONEY");
	this : RegisterEvent("MONEYJZ_CHANGE")	
	this:RegisterEvent("ADJEST_UI_POS")
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end



function PetHuanhua_OnLoad()
	

	g_PetHuanhua_Frame_UnifiedPosition=PetHuanhua_Frame:GetProperty("UnifiedPosition");
end



function PetHuanhua_OnEvent(event)
	
	if event == "UI_COMMAND" and tonumber( arg0 ) == m_UI_NUM then
		
		if this : IsVisible() then
			return
		end

		PetHuanhua_BeginCareObj( Get_XParam_INT(0) );
		PetHuanhua_CleanUp()
		this:Show()
		m_Comfirmed = 0
		Pet : ShowPetList( 1 )
		PetHuanhua_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetHuanhua_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));

	elseif (event == "UNIT_MONEY" and this : IsVisible()) then
		PetHuanhua_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetHuanhua_UICheck()
	elseif (event == "MONEYJZ_CHANGE" and this : IsVisible()) then
		PetHuanhua_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
		PetHuanhua_UICheck()
	elseif event == "REPLY_MISSION_PET" and this : IsVisible() then
		
		PetHuanhua_OnSelectPet( tonumber( arg0 ) )
	elseif event == "UPDATE_PET_PAGE"  and this:IsVisible() then
		PetHuanhua_CleanUp()
	elseif event == "DELETE_PET"  and this:IsVisible() then
		this:Hide()
	elseif (event == "ADJEST_UI_POS" ) then
		PetHuanhua_Frame_On_ResetPos()
		
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		PetHuanhua_Frame_On_ResetPos()
	end

end


--Close
function PetHuanhua_Close_Window()
	this:Hide();
end

--OK
function PetHuanhua_OK_Clicked()
	if m_PetIndex == -1  then
		return
	end
	
	if m_KeepModel ~= 1 and m_KeepModel ~= 0 then
		PushDebugMessage("#{RXZS_090804_32}")      --����û��ѡ��û����޵���ۣ�
		return
	end
	
	local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
	
	if selfMoney < m_needMoney then
		PushDebugMessage("#{WH_090729_18}")  --�Բ��������Ͻ�Ǯ���㣬�޷��������С�
		return
	end

	local isExist = IsItemExist(30502005)
	if isExist == 0 then
		isExist = IsItemExist(30502006)
		if isExist == 0 then
			PushDebugMessage("#{RXZS_090804_6}")  --������ȱ�ٻû����ϣ����޻û�����
			return
		end
	end


	
	local hid,lid = Pet:GetGUID(m_PetIndex);
	if m_Comfirmed == 0 then
		Pet:PetHHComfirm(m_PetIndex ,m_KeepModel )
		m_Comfirmed = 1
	else
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name( "Pet_HH" )
			Set_XSCRIPT_ScriptID( 800124 )
			Set_XSCRIPT_Parameter( 0, hid )
			Set_XSCRIPT_Parameter( 1, lid )
			Set_XSCRIPT_Parameter( 2, m_KeepModel )
			Set_XSCRIPT_ParamCount( 3 )
		Send_XSCRIPT()
		m_Comfirmed = 0
	end
end

--Select Pet
function PetHuanhua_SelectPet_Clicked()
	Pet : ShowPetList( 0 )
	Pet : ShowPetList( 1 )
end

--����ͼ��
function PetHuanhua_Pet_Show()
	if(not (Pet:IsPresent(m_PetIndex)) ) then
		return;
	end
	local transfomerID = Pet:GetHHChangeModel(m_PetIndex)
	if transfomerID ~= nil and transfomerID > 0 then
		Pet:HuanhuaOpenPetJian(m_PetIndex,0);
	end
end


--Change Model
function PetHuanhua_ChangeModel(mode)
	if  m_PetIndex == -1 then
		return
	end
	if IsWindowShow("PetJian") then
		CloseWindow("PetJian" ,true)
	end
	if m_KeepModel ~= mode then
		m_Comfirmed = 0
	end

	m_KeepModel = mode
	
	PetHuanhua_UICheck()
end


function PetHuanhua_Pet_Modle_TurnLeft( start )
	--������ת��ʼ
	if(start == 1) then
		PetHuanhua_FakeObject:RotateBegin(-0.3);
	--������ת����
	else
		PetHuanhua_FakeObject:RotateEnd();
	end

end


function PetHuanhua_Pet_Modle_TurnRight( start )
	--������ת��ʼ
	if(start == 1) then
		PetHuanhua_FakeObject:RotateBegin(0.3);
	--������ת����
	else
		PetHuanhua_FakeObject:RotateEnd();
	end
end


function PetHuanhua_OnHidden()
	PetHuanhua_CleanUp()
	Pet : ShowPetList( 0 )
end


function PetHuanhua_OnSelectPet(petIndex)
	
	if( -1 == petIndex ) then
		return;
	end
	
	--�����ѱ���������ѡ��
	if (Pet:GetPetLocation(petIndex) ~= -1) then
		return;
	end

	m_Comfirmed = 0


	--�ѻû�
	local gen = Pet:GetType(petIndex)
	if gen ~= nil and gen >= 100 then	--100����Ϊ�û�����
		PushDebugMessage("#{RXZS_090804_3}")    --��ѡ��������Ѿ���ɻû��������ٴλû���
		return
	end
	
	--���Ͳ���	
	local isCan = Pet:EnableHuanhua(petIndex)
	if isCan ~= 1 then 
		PushDebugMessage("#{RXZS_090804_5}")   --��ѡ������޲����ϻû�Ҫ��
		return
	end
	
	--���ǲ���
	local savvy = Pet:GetSavvy(petIndex)
	if savvy ~= nil and savvy < 5 then
		PushDebugMessage("#{RXZS_090804_4}")    --����������Եȼ�����5�������ܽ��лû���
		return
	end
	
	--����������װ��	
	if Pet:IsPetHaveEquip(petIndex) == 1 then
		PushDebugMessage("#{RXZS_090804_2}")	--���Ƚ�����װ��ж��
		return
	end
	

	PetHuanhua_FakeObject:SetFakeObject("");
	Pet:SetSkillStudyModel(petIndex);

	PetHuanhua_FakeObject:SetFakeObject( "My_PetStudySkill" );
	
	
	--�л����޵�ʱ���ͷ���һ������
	if(m_PetIndex ~= -1) then
		Pet:SetPetLocation(m_PetIndex,-1);
	end

	m_PetIndex = petIndex;	--�Ѿ�ѡ��������
	Pet:SetPetLocation(m_PetIndex,5);
--	Pet:ClosePetSkillStudyMsgBox()
	PetHuanhua_ModeSelect:SetCheck(0)
	PetHuanhua_ModeSelect2:SetCheck(0)
	m_KeepModel = -1
	PetHuanhua_UICheck()
end
	

function PetHuanhua_CleanUp()
	
	Pet:SetPetLocation(m_PetIndex,-1);
	m_PetIndex = -1;
	
	PetHuanhua_FakeObject:SetFakeObject("");
	
	PetHuanhua_Money:SetProperty("MoneyNumber", 0 );
	PetHuanhua_Pet_Text:SetText("")
	PetHuanhua_OK:Disable()
	PetHuanhua_Jian:Disable()

	PetHuanhua_ModeSelect:SetCheck(0)
	PetHuanhua_ModeSelect:Disable()
	PetHuanhua_ModeSelect2:SetCheck(0)
	PetHuanhua_ModeSelect2:Disable()
	
	m_Comfirmed = 0
	m_KeepModel = -1
end

function PetHuanhua_UICheck()
	
	if  m_PetIndex ~= -1 then
		local isMoneyEnough = 0
		
		local szPetName,szOn = Pet:GetPetList_Appoint(m_PetIndex);
		if  szOn ~= "on_packa"  then 
			PetHuanhua_CleanUp()
			return
		end
		PetHuanhua_SelfMoney:SetProperty("MoneyNumber", Player:GetData("MONEY") );
		PetHuanhua_SelfJiaozi:SetProperty("MoneyNumber", Player:GetData("MONEY_JZ")  );
		
		local strName , strName2 = Pet:GetName(m_PetIndex)
		PetHuanhua_Pet_Text:SetText(strName)	
		PetHuanhua_Jian:Enable()
		m_needMoney = Pet:GetHuanhuaMoney(m_PetIndex)
		if m_needMoney ~= nil then
			PetHuanhua_Money:SetProperty("MoneyNumber", m_needMoney );
			local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ") 
			if selfMoney >= m_needMoney then
				isMoneyEnough = 1
			end
		end
		
		PetHuanhua_ModeSelect:Enable()
		local transfomerID = Pet:GetHHChangeModel(m_PetIndex)
		if transfomerID ~= nil and transfomerID > 0 then
			PetHuanhua_ModeSelect2:Enable()
			PetHuanhua_Jian:Enable()
		else
			PetHuanhua_ModeSelect2:SetCheck(0)
			PetHuanhua_ModeSelect2:Disable()
			PetHuanhua_Jian:Disable()
		end

		if isMoneyEnough == 1 then
			PetHuanhua_OK:Enable()
		else
			PetHuanhua_OK:Disable()
		end
	else
		PetHuanhua_Money:SetProperty("MoneyNumber", 0 );
		PetHuanhua_Pet_Text:SetText("")
		PetHuanhua_OK:Disable()
		PetHuanhua_Jian:Disable()

		PetHuanhua_ModeSelect:SetCheck(0)
		PetHuanhua_ModeSelect:Disable()
		PetHuanhua_ModeSelect2:SetCheck(0)
		PetHuanhua_ModeSelect2:Disable()
	end
end

--Care Obj
function PetHuanhua_BeginCareObj(obj_id)
	
	m_ObjCared = DataPool : GetNPCIDByServerID(obj_id);
	this:CareObject(m_ObjCared, 1);
end

function PetHuanhua_Frame_On_ResetPos()
  PetHuanhua_Frame:SetProperty("UnifiedPosition", g_PetHuanhua_Frame_UnifiedPosition);
end