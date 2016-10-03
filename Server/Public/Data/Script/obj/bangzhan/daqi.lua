--��ս����
--��̨NPC�����ű�

--�ű���
x402301_g_ScriptId	= 402301

--��ս�����ű�
x402301_g_BangzhanScriptId	= 402047

--�����T�i ʱ��
x402301_g_FlagTime	= 10*60

x402301_g_OpenFlagSelfIDIndex = 10						--��ǰ��T�i ������̨to� � selfidT�i 32c�i����������to� � ����
x402301_g_OpenFlagStartTime = 11							--��ǰ��T�i ������̨to� � ��ʼʱ��T�i 32c�i����������to� � ����
x402301_g_FlagRemainedTime = 12								--���������Ժ�to� � ʣ��ʱ��T�i 32c�i����������to� � ����

x402301_g_GuildPoint_GetFlag = 4							--���ֹ�������,��GuildWarPoint.txtto� � ID

--��ս��������,��Ӧ������to� �  enum GUILDWAR_INT_ARRAY
x402301_g_A_FlagNumIndex = 16									--A��ռ��������T�i ��ս������to� � ����
x402301_g_B_FlagNumIndex = 17									--B��ռ��������T�i ��ս������to� � ����

--c�i�˻�����������,��Ӧ����enum GUILDWAR_INT_INDEX
x402301_g_Human_FlagIndex = 3									--c�i��ռ������������


--��ӪNPC
x402301_g_A_FlagName = "Vi�m Ho�ng chi�n k�"
x402301_g_A_FlagID = 13332
x402301_g_A_FlagPosX = 115.9615
x402301_g_A_FlagPosZ = 130.9660

x402301_g_B_FlagName = "Xi V�u chi�n k�"
x402301_g_B_FlagID = 13323
x402301_g_B_FlagPosX = 115.9615
x402301_g_B_FlagPosZ = 130.9660

--**********************************
--���⽻��:�����ж�
--**********************************
function x402301_OnActivateConditionCheck( sceneId, selfId, activatorId )
	--��ng����ng����
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--��ng����ng��C�n to� � ����
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--��ng��ʼ�Ƿ�
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_79}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--��̨�� �� mu�n d�ng l�n ����
	local RemainedTime = LuaFnGetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime )
	if RemainedTime > 0 then
		local minute = floor(RemainedTime / 60)
		local second = mod(RemainedTime, 60)
		
		BeginEvent(sceneId)
			if minute == 0 then
				AddText(sceneId,"#{BHXZ_081103_80}"..second.."#{BHXZ_081103_81}")
			else
				AddText(sceneId,"#{BHXZ_081103_80}"..minute.." ph�t "..second.."#{BHXZ_081103_81}")
			end
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--�޵�״̬�޷�����...������Լ���
	if LuaFnIsUnbreakable(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_124}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- ȡ �i�m����to� � ����ID����
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local guildid = GetHumanGuildID(sceneId, activatorId)
	
	if guildid ~= Aguildid and guildid ~= Bguildid then
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i kh�ng c� Bang h�i.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	local OpenFlagSelfId = LuaFnGetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex )
	local OpenFlagStartTime = LuaFnGetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime )
	local NowTime = LuaFnGetCurrentTime()
	
	if OpenFlagSelfId ~= 0 then --������T�i ��������
		if OpenFlagSelfId == activatorId then --�Լ�
			return 1
		else --����ng�Լ�
			if (NowTime - OpenFlagStartTime) <= 180 then --��ng��ʱ
				BeginEvent(sceneId)
					AddText(sceneId,GetName(sceneId, OpenFlagSelfId).."#{BHXZ_081103_65}")
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,activatorId)
				return 0
			end
		end
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, activatorId )	-- ��ǰ��T�i ������̨to� � selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, NowTime )	-- ��ǰ��T�i ������̨to� � ��ʼʱ��
	
	return 1

end

--**********************************
--���⽻��:���ĺͿ۳�����
--**********************************
function x402301_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ɹ���Ч����
--**********************************
function x402301_OnActivateEffectOnce( sceneId, selfId, activatorId )
	--��ng����ng����
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 1
	end

	--��ng����ng��C�n to� � ����
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 1
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- ȡ �i�m����to� � ����ID����
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local guildid = GetHumanGuildID(sceneId, activatorId)
	
	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end
	
	--��������NPC,����
	if guildid == Aguildid then
		local MstId = LuaFnCreateMonster(sceneId, x402301_g_A_FlagID, x402301_g_A_FlagPosX, x402301_g_A_FlagPosZ, 3, 0, -1 )
		SetCharacterName( sceneId, MstId, x402301_g_A_FlagName )
		LuaFnSetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime, x402301_g_FlagTime )	--���������Ժ�to� � ʣ��ʱ��
		
		local addpoint = GetGuildWarPoint(sceneId, x402301_g_GuildPoint_GetFlag)
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddAGuildPoint", sceneId, activatorId, guildid, addpoint )
		local alreadynum = GetGuildIntNum( sceneId, guildid, x402301_g_A_FlagNumIndex )
		SetGuildIntNum( sceneId, guildid, x402301_g_A_FlagNumIndex, alreadynum+1 )
		--CityChangeAttr( sceneId, activatorId, GUILD_CONTRIB_POINT, 30 ) --���Ӱﹱ
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, activatorId, x402301_g_Human_FlagIndex, 1 )
		
		local guid = LuaFnObjId2Guid(sceneId, activatorId)
		local log = format("HumanGuildID=%d,Apply_GuildID=%d,Applied_GuildID=%d", guildid, Aguildid, Bguildid)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_FLAG, guid, log)
		
		local msg = LuaFnGetGuildName(sceneId, activatorId).."#{BHXZ_081103_125}"..GetName(sceneId, activatorId).." �� mu�n d�ng l�n "..x402301_g_A_FlagName.."."
		for i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402301_NotifyFailTips(sceneId, mems[i], msg)
				Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
			end
		end
	elseif guildid == Bguildid then
		local MstId = LuaFnCreateMonster(sceneId, x402301_g_B_FlagID, x402301_g_B_FlagPosX, x402301_g_B_FlagPosZ, 3, 0, -1 )
		SetCharacterName( sceneId, MstId, x402301_g_B_FlagName )
		LuaFnSetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime, x402301_g_FlagTime )	--���������Ժ�to� � ʣ��ʱ��
		
		local addpoint = GetGuildWarPoint(sceneId, x402301_g_GuildPoint_GetFlag)
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddBGuildPoint", sceneId, activatorId, guildid, addpoint )
		local alreadynum = GetGuildIntNum( sceneId, guildid, x402301_g_B_FlagNumIndex )
		SetGuildIntNum( sceneId, guildid, x402301_g_B_FlagNumIndex, alreadynum+1 )
		--CityChangeAttr( sceneId, activatorId, GUILD_CONTRIB_POINT, 30 ) --���Ӱﹱ
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, activatorId, x402301_g_Human_FlagIndex, 1 )
		
		local guid = LuaFnObjId2Guid(sceneId, activatorId)
		local log = format("HumanGuildID=%d,Apply_GuildID=%d,Applied_GuildID=%d", guildid, Aguildid, Bguildid)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_FLAG, guid, log)
		
		local msg = LuaFnGetGuildName(sceneId, activatorId).."#{BHXZ_081103_125}"..GetName(sceneId, activatorId).." �� mu�n d�ng l�n "..x402301_g_B_FlagName.."."
		for i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402301_NotifyFailTips(sceneId, mems[i], msg)
				Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
			end
		end
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, 0 )	-- ��ǰ��T�i ������̨to� � selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, 0 )	-- ��ǰ��T�i ������̨to� � ��ʼʱ��
	
	return 1
end

--**********************************
--���⽻��:������ÿʱ������Ч����
--**********************************
function x402301_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ʼʱto� � ���⴦��
--**********************************
function x402301_OnActivateActionStart( sceneId, selfId, activatorId )
		return 1
end

--**********************************
--���⽻��:��������ʱto� � ���⴦��
--**********************************
function x402301_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--���⽻��:�����ж�ʱto� � ���⴦��
--**********************************
function x402301_OnActivateInterrupt( sceneId, selfId, activatorId )
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, 0 )	-- ��ǰ��T�i ������̨to� � selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, 0 )	-- ��ǰ��T�i ������̨to� � ��ʼʱ��
	
	return 0
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x402301_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
