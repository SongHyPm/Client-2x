-- ʱװȾɫ���¼�

local objCared = -1;
local MAX_OBJ_DISTANCE = 3.0

function DressPaint_Fitting_PreLoad()
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("OPEN_DRESS_PAINT_FITTING");
	this:RegisterEvent("CLOSE_DRESS_PAINT_FITTING");	
	this:RegisterEvent("OBJECT_CARED_EVENT");
	this:RegisterEvent("SEX_CHANGED");
	this:RegisterEvent("PROGRESSBAR_SHOW")
end

function DressPaint_Fitting_OnLoad()
end

function DressPaint_Fitting_OnHiden()
	SetDefaultMouse();
	
	-- �ָ�����ǰ��װ������
	DressReplaceColor:RestoreDressPaintFitting();
	
	-- ȡ������NPC
	this:CareObject(objCared, 0, "DressPaint_Fitting")
	objCared = -1

	this:Hide();
end

function DressPaint_Fitting_OnEvent(event)

	-- �뿪��Ϸ����
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		DressPaint_Fitting_Close();
	end
	
	-- Ⱦɫ�ɹ���������¼俪�ţ����ȹر�
	if event == "UI_COMMAND" and tonumber(arg0) == 091111 then		
		if this:IsVisible() then
			DressPaint_Fitting_Close();
		end
	end
	
	-- �����¼�
	if(event == "OPEN_DRESS_PAINT_FITTING") then
			
		-- ����
		local nDressBagPos = tonumber(arg0)
		DressReplaceColor : FittingOnDress(nDressBagPos)
		this:Show();
		
		-- ����ʹ���ĸ�ģ��
		DressPaint_Fitting_FakeObject : SetFakeObject("");	
		DressPaint_Fitting_FakeObject : SetFakeObject("Dress_Player");
				
		-- ��ʼ����NPC
		local npcID = Get_XParam_INT(0);
		local objCared = DataPool:GetNPCIDByServerID(npcID);
		if objCared == -1 then
			--PushDebugMessage("server�����������������⡣")		-- �߻�˵�ˣ�������ʾ~~
			return;
		end		
		this:CareObject(objCared, 1, "DressPaint_Fitting");
	end
	
	-- �ر����¼�
	if (event == "CLOSE_DRESS_PAINT_FITTING") then		
		DressPaint_Fitting_Close();
	end
	
	-- ����NPC
	if (event == "OBJECT_CARED_EVENT") then
		if(tonumber(arg0) ~= objCared) then
			return;
		end
		
		--��������˵ľ������һ��������߱�ɾ�����Զ��ر�
		if(arg1 == "distance" and tonumber(arg2)>MAX_OBJ_DISTANCE or arg1=="destroy") then
			DressPaint_Fitting_Close();
		end
	end
	
	-- ����
	if event == "SEX_CHANGED" and  this:IsVisible() then
		-- ����ģ����Ϣ
		DressPaint_Fitting_FakeObject : Hide();
		DressPaint_Fitting_FakeObject : Show();
		DressPaint_Fitting_FakeObject : SetFakeObject("Dress_Player");
	end
	
	if (event == "PROGRESSBAR_SHOW" and this:IsVisible())	then
		--�ͽ���������
		DressPaint_Fitting_Close()
	end

end

----------------------------------------------------------------------------------
--
-- �ر�
--
function DressPaint_Fitting_Close()
	
	-- �ָ�����ǰ��װ������
	DressReplaceColor:RestoreDressPaintFitting()
	
	--ȡ������
	this:CareObject(objCared, 0, "DressPaint_Fitting");
	objCared = -1

	this:Hide();
end

----------------------------------------------------------------------------------
--
-- ��ת����ͷ��ģ�ͣ�����)
--
function DressPaint_Fitting_TurnLeft(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then	
		--������ת��ʼ
		if(start == 1) then
			DressPaint_Fitting_FakeObject:RotateBegin(-0.3);
		--������ת����
		else
			DressPaint_Fitting_FakeObject:RotateEnd();
		end
	end
end

----------------------------------------------------------------------------------
--
--��ת����ͷ��ģ�ͣ�����)
--
function DressPaint_Fitting_TurnRight(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then	
		--������ת��ʼ
		if(start == 1) then
			DressPaint_Fitting_FakeObject:RotateBegin(0.3);
		--������ת����
		else
			DressPaint_Fitting_FakeObject:RotateEnd();
		end
	end
end