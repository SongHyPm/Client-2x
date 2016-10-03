-- L�c D߽ngto� � Id = 4to� � �¼�����
-- ����,�����Ho�n t�t nhi�m v�21,ͬʱ��û��Ho�n t�t nhi�m v�22,ͬʱL�c D߽ng����û�б�������C�i n�y ����to� � ʱ��,

-- ǰ������
x113007_g_PreMissionId = 21
x113007_g_MissionId = 22

x113007_g_OnTimerIndex = -1

-- ������
x113007_g_GroupId = 1

--**********************************
--���������¼�
--**********************************
function x113007_OnEnterArea( sceneId, selfId, areaId)

	-- Th�a m�n�������to� � ����	
  if IsMissionHaveDone(sceneId,selfId,x113007_g_PreMissionId) < 1 then
  	return 0
  end
  
  -- �������Ѿ������C�i n�y ����,�Ͳ���ˢ�Ƿ������
  if IsMissionHaveDone(sceneId,selfId,x113007_g_MissionId) > 0 then
  	return 0
  end
  
  -- ����ͼ����ng����ng�Ѿ���T�i C�i n�y ����,C�i n�y �����ng���������to� � ,���Է�����
  local nMonsterNum = GetMonsterCount(sceneId)
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "Ki�u Phong"  then
			return
		end
		
		if GetName(sceneId, nMonsterId)  == "A Ch�u"  then
			return
		end
	end

  -- ��������,�Ƿ�,A Ch�u
  local nNpc1 = LuaFnCreateMonster(sceneId, 442, 283, 116, 3, 0, 36008)
	local nNpc2 = LuaFnCreateMonster(sceneId, 443, 283, 113, 3, 0, 200025)

	SetCharacterName(sceneId, nNpc1, "Ki�u Phong")
	SetCharacterName(sceneId, nNpc2, "A Ch�u")
	
	-- ������ʧʱ��
	SetCharacterDieTime(sceneId, nNpc1, 600000)
	SetCharacterDieTime(sceneId, nNpc2, 600000)
	
	-- ���ng�m�t c�i����
	--local groupId = AllocateMonsterGroup(sceneId)
	
	-- ��T�i �̶�to� � ʹ��m�t c�i������,T�i S� d�ng tr߾c ����վͿ���
	ReleaseMonsterGroup(sceneId, x113007_g_GroupId)
	
	AddGroupLeader(sceneId, x113007_g_GroupId, nNpc1)
	AddGroupMember(sceneId, x113007_g_GroupId, nNpc2, 2, 1)
	RefixPosOfGroupMember(sceneId,x113007_g_GroupId,nNpc1)

	SetIntervalDistOfGroupMember(sceneId, x113007_g_GroupId, 1)
	
	SetPatrolId(sceneId, nNpc1, 5)
	
end

--**********************************
--���������¼�
--**********************************
function x113007_OnLeaveArea( sceneId, selfId, areaId)

end

