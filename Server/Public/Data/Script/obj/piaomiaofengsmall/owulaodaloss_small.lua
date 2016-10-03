--��翷帱��....
--ս��� L�o ��i�Ի��ű�....

--�ű���
x402288_g_ScriptId = 402288

--�����߼��ű���....
x402288_g_FuBenScriptId = 402276


--**********************************
--������ں���....
--**********************************
function x402288_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_19}" )

		--�жϵ�ǰ��ng�����Khi�u chi�nL� Thu Th�y....	
		if 1 == CallScriptFunction( x402288_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
			AddNumText( sceneId, x402288_g_ScriptId, "Quy�t chi�n L� Thu Th�y?", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x402288_OnEventRequest( sceneId, selfId, targetId, eventId )

	--�����T�i ����BOSS��Tr� v�....
	if 1 == CallScriptFunction( x402288_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
		return
	end

	--��ng����ng�ӳ�....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�жϵ�ǰ��ng�����Khi�u chi�nL� Thu Th�y....	
	if 1 ~= CallScriptFunction( x402288_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
		return
	end

	--�����T�i �ͱ�to� � BOSSCu�c chi�n ��Tr� v�....
	local ret, msg = CallScriptFunction( x402288_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--M� ra ��翷��ʱ���������Լ�....
	CallScriptFunction( x402288_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402288_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ��to� � OnTimer....
--**********************************
function x402288_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 5 gi�y sau s� b�t �u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 4 gi�y sau s� b�t �u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 3 gi�y sau s� b�t �u" )
		return
	end

	if 4 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 2 gi�y sau s� b�t �u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 1 gi�y sau s� b�t �u" )
		return
	end

	if 2 == step then
		--��ʾCu�c chi�n b�t �u....
		CallScriptFunction( x402288_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n b�t �u" )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x402288_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui_BOSS", -1, -1 )
		return
	end

end
