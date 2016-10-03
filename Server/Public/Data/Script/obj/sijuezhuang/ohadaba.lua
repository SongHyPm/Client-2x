--��翷帱��....
--����ԶԻ��ű�....

--�ű���
x893070_g_ScriptId = 893070

--�����߼��ű���....
x893070_g_FuBenScriptId = 893063

--**********************************
--������ں���....
--**********************************
function x893070_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"Ph�a tr߾c ch�nh l� T� Tuy�t Trang. Ch�ng ta ph�i �i s�u v�o trong m�i c� th� t�m ���c kho b�u. Tr߾c m�t l� T� Tuy�t �i�n.")
		AddText(sceneId,"B�n trong T� Tuy�t �i�n c� r�t nhi�u h� v�. Nh�ng m�t khi �� nghe th�y ti�ng chu�ng, h� s� r�i �i. Ta c� th� khi�n th�nh vi�n c�n chi�n trong �i ng� t�ng h�nh v�o ��nh chu�ng. L�c �� m�i c� th� x�ng v�o.")

		--�жϵ�ǰ�Ƿ������ս....	
		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MinMo" ) then
		AddText(sceneId,"H� v� trong �i�n �� kh�ng c�n, ta ���c T� Tuy�t th� sinh M�n M�c ��a t�i, m�i ng߶i �u b� h�n b�t gi�, � ta t�i �p h�i h�n kho b�u � n�i n�o. H�n th߶ng th�ch L� B�ch  [ T߽ng Ti�n T�u ], m�i l�n s� d�ng tuy�t k� �u t�ng g�p ��i l��ng s�t th߽ng. M�i ng߶i ch� c�n ch� � n� tr�nh h�n khi h�n ph�t ra T߽ng Ti�n T�u, sau �� tho�i m�i b�t gi� h�n kh�ng l� v�n �!")
		    AddNumText( sceneId, x893070_g_ScriptId, "Khi�u chi�n M�n M�c", 10, 1 )
		end
		--�жϵ�ǰ�Ƿ���ս���֮����....	
		if 0 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		    AddNumText( sceneId, x893070_g_ScriptId, "�i ti�p v�o trong", 10, 2 )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x893070_OnEventRequest( sceneId, selfId, targetId, eventId )

   if GetNumText() == 1 then

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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

	--������ںͱ��BOSSChi�n �u �򷵻�....
	local ret, msg = CallScriptFunction( x893070_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--�жϵ�ǰ�Ƿ������սɣ����....	
	if 1 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MinMo" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "Ng߽i �� khi�u chi�n." )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--������翷��ʱ���������Լ�....
	CallScriptFunction( x893070_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893070_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 101, 52)

  end

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x893070_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 5 gi�y sau b�t �u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 4 gi�y sau b�t �u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 3 gi�y sau b�t �u." )
		return
	end

	if 4 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 2 gi�y sau b�t �u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 1 gi�y sau b�t �u." )
		return
	end

	if 2 == step then
		--��ʾChi�n �u b�t �u.....
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u b�t �u." )
		--ɾ��NPC....
		--CallScriptFunction( x893070_g_FuBenScriptId, "DeleteBOSS", sceneId, "MinMo_NPC" )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x893070_g_FuBenScriptId, "CreateBOSS", sceneId, "MinMo_BOSS", -1, -1 )
		return
	end

end
