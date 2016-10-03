--��翷帱��....
--ս�����ϴ�Ի��ű�....

--�ű���
x893075_g_ScriptId = 893075

--�����߼��ű���....
x893075_g_FuBenScriptId = 893063


--**********************************
--������ں���....
--**********************************
function x893075_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "B�ng X�, t�n ti�u nh�n nham hi�m n�y n�m �� v� mu�n �c chi�m Y�u Truy�n c�a S� ph�, h�n �� ra tay h� �c huynh mu�i 3 ng߶i ch�ng ta." )

		--�жϵ�ǰ�Ƿ������ս����ˮ....	
		if 1 == CallScriptFunction( x893075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
			AddNumText( sceneId, x893075_g_ScriptId, "Quy�t chi�n B�ng X�", 10, 1 )
		end
		--�жϵ�ǰ�Ƿ������ս������ˮ....	
		if 2 == CallScriptFunction( x893075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
			AddNumText( sceneId, x893075_g_ScriptId, "�i ti�p v�o trong", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x893075_OnEventRequest( sceneId, selfId, targetId, eventId )
   if GetNumText() == 1 then

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x893075_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
		return
	end

	--�ǲ��Ƕӳ�....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�жϵ�ǰ�Ƿ������ս����ˮ....	
	if 1 ~= CallScriptFunction( x893075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
		return
	end

	--������ںͱ��BOSSChi�n �u �򷵻�....
	local ret, msg = CallScriptFunction( x893075_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--������翷��ʱ���������Լ�....
	CallScriptFunction( x893075_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893075_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
      CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 160,120,10 )--����
  end

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x893075_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 5 gi�y sau b�t �u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 4 gi�y sau b�t �u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 3 gi�y sau b�t �u." )
		return
	end

	if 4 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 2 gi�y sau b�t �u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 1 gi�y sau b�t �u." )
		return
	end

	if 2 == step then
		--��ʾChi�n �u b�t �u.....
		CallScriptFunction( x893075_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u b�t �u." )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x893075_g_FuBenScriptId, "CreateBOSS", sceneId, "PangQi_BOSS", -1, -1 )
		return
	end

end
