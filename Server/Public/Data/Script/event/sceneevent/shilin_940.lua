--Th�ch L�m ����to� � ң��
--212124
-- ע��ʹ�ó�����ʱ�������.
-- ��������

--MisDescBegin
--�ű���
x212124_g_ScriptId = 212124

--Ti�p th�����NPC����
x212124_g_Position_X=183
x212124_g_Position_Z=168
x212124_g_SceneID=26
x212124_g_AccomplishNPC_Name="Tr�nh Ng�c"

--�����
x212124_g_MissionId = 940

--ǰ������
x212124_g_MissionIdPre = 605

--Ŀ��NPC
x212124_g_Name	="Tr�nh Ng�c"

--�������
x212124_g_MissionKind = 37

--��ng c�p nhi�m v� 
x212124_g_MissionLevel = 56

--��ng����ngTinhӢ����
x212124_g_IfMissionElite = 0

--������
x212124_g_MissionName="C�i nh�n say �m"
x212124_g_MissionInfo="#{Mis_30_60_desc_015}"
x212124_g_MissionTarget="    H� t�ng D߽ng Thi�t T�n �n Vi�n Nguy�t Th�n, sau �� �n Th�ch L�m Vi�n Nguy�t Th�n t�m Tr�nh Ng�c #{_INFOAIM183,167,26, Tr�nh Ng�c}. "
x212124_g_MissionContinue="  T߾ng c�ng c�a ta nh�t �nh s� tr� v�, nh�t �nh nh� th�, ta tin l� v�y!"
x212124_g_MissionComplete="  Ta h�nh nh� c�m nh�n ���c �nh m�t �m �p c�a t߾ng c�ng, ch�ng nh�t �nh c�ch ta kh�ng xa. Thi�t T�n! Ch�ng �ang � ��u ? Ta s� ��i ch�ng quay v�."

x212124_g_MoneyBonus=16000
x212124_g_exp=20000

x212124_g_Custom	= { {id="�� h� t�ng D߽ng Thi�t T�n",num=1} }
x212124_g_IsMissionOkFail = 0
--MisDescEnd

-- ����·��Id
x212124_g_PatrolPathIndex = 0

-- ������ʱ��Index
x212124_g_SceneTimerIndex = -1
x212124_g_Step = 0
x212124_g_StartTime = 0
x212124_g_PlayerNum = 0
x212124_g_PlayerId= {-1,-1,-1,-1,-1,-1}


--**********************************
--������ں���
--**********************************
function x212124_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ�C�i n�y ����
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212124_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212124_g_Name then
			--x212124_OnContinue( sceneId, selfId, targetId )
			local bDone = x212124_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				AddText(sceneId,x212124_g_MissionName)
				AddText(sceneId,x212124_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId,bDone)		
			
			
		end
	
	--Th�a m�n�����������
	elseif x212124_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212124_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212124_g_MissionName)
				AddText(sceneId,x212124_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212124_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212124_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212124_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ�C�i n�y ����
	if IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212124_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212124_g_Name then
			AddNumText(sceneId, x212124_g_ScriptId,x212124_g_MissionName,2,-1);
		end
	--Th�a m�n�����������
	elseif x212124_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212124_g_Name then
			AddNumText(sceneId,x212124_g_ScriptId,x212124_g_MissionName,1,-1);
		end
	end

end

--**********************************
--���Ti�p th�����
--**********************************
function x212124_CheckAccept( sceneId, selfId )
	-- 1,��������ng����ng�Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 ) then
		return 0
	end
		
	-- ��c�p���
	if GetLevel(sceneId, selfId) < x212124_g_MissionLevel then
		return 0
	end
	
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionIdPre) < 1 ) then
		return 0
	end
	
	return 1
end

--**********************************
--Ti�p th�
--**********************************
function x212124_OnAccept( sceneId, selfId, targetId )
	if x212124_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- ������to� � �ķ���ng����ng�ﵽ��Ҫ��(ǰ������ng c�p t�m ph�p ���ڵ���25c�p)
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 25 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("Nhi�m v� n�y y�u c�u 6 lo�i t�m ph�p �u ��t c�p 55.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ʹ��m�t c�i������ʱ��������...
	if x212124_g_Step ~= 0  and x212124_g_Step ~= 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "M�c ti�u �ang b�n, xin ��i")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end
	
	-- ����to� � ����C�n ��������to� � ��ʱ��,ͬʱ����������to� � ��ʱ��
	if x212124_g_Step == 0   then
		local ret = AddMission( sceneId,selfId, x212124_g_MissionId, x212124_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#YNh�t k� nhi�m v� c�a c�c h� �� �y" , MSG2PLAYER_PARA )
			return
		end
		
		-- T�i �����Ͽ�m�t c�i��ʱ��,
		StartMissionTimer(sceneId, selfId, x212124_g_MissionId)

		-- C�i n�y ������ʱ��,Ӧ����ngm�t ֱ��C�i n�y �ռ��to� � ,����,ֻҪC�i n�y ֵ������-1,�Ͳ�Ҫ�����ng�
		if x212124_g_SceneTimerIndex == -1  then
			x212124_g_SceneTimerIndex = SetTimer(sceneId, selfId, x212124_g_ScriptId, "OnSceneTimer", 1)
		end
		
		x212124_g_StartTime = LuaFnGetCurrentTime()
		x212124_g_Step = 1
		
		x212124_g_PlayerId[1] = selfId
		x212124_g_PlayerNum = 1
		
		Msg2Player(  sceneId, selfId,"#Y Ho�n th�nh nhi�m v�: C�i nh�n th�m t�nh",MSG2PLAYER_PARA )

		-- �������
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212124_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	end
	
	if x212124_g_Step == 2   then
		
	end
	
	
end

function x212124_OnSceneTimer(sceneId, selfId)

	if x212124_g_Step < 3  then
		local nSelfId = -1
		local bHavePlayer = 0
			for i=1, x212124_g_PlayerNum  do	
				if x212124_g_PlayerId[i] ~= -1  then
					if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])==1  and
						 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) == 1   then
						bHavePlayer = 1
						nSelfId = x212124_g_PlayerId[i]
						break
					end
				end
			end
		
		if bHavePlayer == 0   then
			-- ��ʱ��ֹͣ,�������to� � ȫ�ֱ���
			x212124_g_Step = 0
			x212124_g_StartTime = 0
			x212124_g_PlayerId[1] = -1
			x212124_g_PlayerId[2] = -1
			x212124_g_PlayerId[3] = -1
			x212124_g_PlayerId[4] = -1
			x212124_g_PlayerId[5] = -1
			x212124_g_PlayerId[6] = -1
			x212124_g_PlayerNum = 0
			x212124_g_StartTime = 0
			return
		end
	end
	
	-- ֻҪ����Ŀ���ߵ��� �i�m,�ͻָ�����to� � ����
	if x212124_g_Step == 1   then
		-- ��С��to� � ������ҷ���m�t ����to� � ����
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nYangTX = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "D߽ng Thi�t T�n"  then
				nYangTX = nMonsterId
				bHaveMonster = 1
			end
		end
		
		for i=1, x212124_g_PlayerNum  do	
			if x212124_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])==1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) == 1   then
					bHavePlayer = 1
					nSelfId = x212124_g_PlayerId[i]
					
					break
				end
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, nSelfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, nSelfId, i)
			if PlayerId ~= nSelfId    then
				CallScriptFunction((212124), "OnDefaultEvent", sceneId, PlayerId, nYangTX )
			end
		end
		
		-- ����C�i n�y ��������to� � ���
		x212124_g_StartTime = LuaFnGetCurrentTime()
		x212124_g_Step = 2
		
	elseif x212124_g_Step == 2   then
		-- �ȴ�5 gi�y,C�i n�y ʱ����ng�ȴ���to� � ���m�t �����C�i n�y ����to� � ʱ��
		if LuaFnGetCurrentTime() - x212124_g_StartTime > 5   then
			--CallScriptFunction((200060), "Paopao",sceneId, "D߽ng Thi�t T�n", "Th�ch L�m", "Xu�t ph�t, xu�t ph�t!!!")
			x212124_g_Step = 3
			return
		end
		
	elseif x212124_g_Step == 3   then
		CallScriptFunction((200060), "Paopao",sceneId, "D߽ng Thi�t T�n", "Th�ch L�m", "Xu�t ph�t, xu�t ph�t!!!")
		
		-- b�t �u����
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nYangTX = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "D߽ng Thi�t T�n"  then
				nYangTX = nMonsterId
				nHaveMonster = 1
			end
		end
		
		if nHaveMonster == 0  then
			PrintStr("T�m kh�ng th�y D߽ng Thi�t T�n")
			return 
		end
		-- �i�m������Ѳ��·��
		--SetNPCAIType(sceneId, nYangTX, 0)
		SetPatrolId(sceneId, nYangTX, x212124_g_PatrolPathIndex)
		x212124_g_Step = 4


	elseif x212124_g_Step == 4   then
		-- �������Ŀ�굽��·���� �i�m,
		local Patrol_x
		local Patrol_z
		Patrol_x,Patrol_z = GetLastPatrolPoint(sceneId, x212124_g_PatrolPathIndex)
		
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nYangTX = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "D߽ng Thi�t T�n"  then
				nYangTX = nMonsterId
				nHaveMonster = 1
			end
		end
		
		-- ����Ҳ���C�i n�y ��.....��ʱû�д���,
		
		local targetX, targetZ = GetWorldPos(sceneId, nYangTX)
		local distance = floor(sqrt((Patrol_x-targetX)*(Patrol_x-targetX)+(Patrol_z-targetZ)*(Patrol_z-targetZ)))
		
		if distance <= 2 then
			CallScriptFunction((200060), "Paopao",sceneId, "D߽ng Thi�t T�n", "Th�ch L�m", "Ъn r�i, �n r�i!!!")
			x212124_g_Step = 0
			
			-- �������to� � �������,�������ʾ,�ȵ�to� � ������T�i ����ִ��
			for i=1, x212124_g_PlayerNum   do
				if x212124_g_PlayerId[i]~=-1   then
					local misIndex = GetMissionIndexByID(sceneId, x212124_g_PlayerId[i], x212124_g_MissionId)-- �i�m������T�i 20c�i������to� � ���к�
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 0, 1)
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 1, 1)
					BeginEvent(sceneId)
						AddText(sceneId, "H� t�ng D߽ng Thi�t T�n th�nh c�ng.")
					EndEvent()
					DispatchMissionTips(sceneId, x212124_g_PlayerId[i])
				end
			end
			return
		end
		
		-- ��������ng����ng����th�t b�i,
			-- th�t b�iԭ��
				-- 1,����Npc��Զ
				-- 2,�뿪��C�i n�y ����
				-- 3,����(���뿪C�i n�y ������ʵ��)
		for i=1, x212124_g_PlayerNum  do	
			if x212124_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])~=1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) ~= 1   then
					
					x212124_g_PlayerId[i] = -1
				end
			end
			
			if x212124_g_PlayerId[i] ~= -1  then
				local x, z = GetWorldPos(sceneId, x212124_g_PlayerId[i])
				local distance = floor(sqrt((x-targetX)*(x-targetX)+(z-targetZ)*(z-targetZ)))
				
				if distance>15   then
					BeginEvent(sceneId)
						AddText(sceneId, "H� t�ng D߽ng Thi�t T�n th�t b�i.")
					EndEvent()
					DispatchMissionTips(sceneId, x212124_g_PlayerId[i])
					
					local misIndex = GetMissionIndexByID(sceneId, x212124_g_PlayerId[i], x212124_g_MissionId)
					
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 0, 2)
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 1, 0)

					StopMissionTimer(sceneId, x212124_g_PlayerId[i],x212124_g_MissionId)
					x212124_g_PlayerId[i] = -1
				end
			end
		end
	end
	
end

--**********************************
--����
--**********************************
function x212124_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
  DelMission( sceneId, selfId, x212124_g_MissionId )
end

--**********************************
--����
--**********************************
function x212124_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212124_g_MissionName)
	AddText(sceneId,x212124_g_MissionComplete)
	AddMoneyBonus( sceneId, x212124_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x212124_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212124_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId, selfId, x212124_g_MissionId)-- �i�m������T�i 20c�i������to� � ���к�
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--�ύ
--**********************************
function x212124_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212124_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212124_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212124_g_exp)
		DelMission( sceneId, selfId, x212124_g_MissionId )
		MissionCom( sceneId, selfId, x212124_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHo�n th�nh nhi�m v�: C�i nh�n th�m t�nh",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212124_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212124_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212124_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--��ʱ�¼�
--**********************************
function x212124_OnTimer(sceneId,selfId)
	if sceneId ~= 26   then
		BeginEvent(sceneId)
			AddText(sceneId, "H� t�ng D߽ng Thi�t T�n th�t b�i.")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212124_g_MissionId)
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)
		SetMissionByIndex(sceneId, selfId, misIndex, 1, 0)
		
		StopMissionTimer(sceneId,selfId,x212124_g_MissionId)
	end
end
