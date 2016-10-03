--��翷帱��....
--ɣ�����Ի��ű�....

--�ű���
x893071_g_ScriptId = 893071

--�����߼��ű���....
x893071_g_FuBenScriptId = 893063

--**********************************
--������ں���....
--**********************************
function x893071_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "N�i n�y ch�nh l� ��o Thanh s� t�i - B�n Long C�c . Giang h� �n ��i ��o Thanh hai b�nh t�t, kh�ng th� nh�n th�y g�. Nh�ng c�ng phu v�n nh� c� l� T� Tuy�t Trang trung t�i c߶ng.#r ��o Thanh ch�n nu�i 4 lo�i m�c h� c�ng 10 lo�i thanh �ng. Ch�ng �i ��o Thanh trung th�nh, t�n t�m. N�u trong chi�n �u xu�t hi�n trong l�i n�i, nh�t �nh ph�i ��nh lui ch�ng �u ti�n!" )
		AddText( sceneId, "M�t kh�c h�n c�n c� Tuy�t k� � nh�t -- Tam Phong L�u V�n. Sau khi s� d�ng tuy�t k�, ��o Thanh xu�t qu� nh�p th�n, v� c�ng hung �c. Nghe n�i, k� n�ng n�y c� hi�u �ng ph� tr�n, h�o h�o l�i d�ng c� th� �em Tam Phong L�u V�n ph� gi�i!#r C�c ng߽i chu�n b� t�t, cho ta bi�t, ta s� c� c�ch d�n d� ��o Thanh ra!" )
		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		    AddNumText( sceneId, x893071_g_ScriptId, "Khi�u chi�n ��o Thanh", 10, 1 )
		end
		if 0 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
		    AddNumText( sceneId, x893071_g_ScriptId, "�i ti�p v�o trong", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x893071_OnEventRequest( sceneId, selfId, targetId, eventId )
   if GetNumText() == 1 then
	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x893071_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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
	local ret, msg = CallScriptFunction( x893071_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--�жϵ�ǰ�Ƿ������սɣ����....	
	if 1 ~= CallScriptFunction( x893071_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "Ng߽i �� khi�u chi�n." )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--������翷��ʱ���������Լ�....
	CallScriptFunction( x893071_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893071_g_ScriptId, -1, -1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 73, 91)
  end

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x893071_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 5 gi�y sau b�t �u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 4 gi�y sau b�t �u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 3 gi�y sau b�t �u." )
		return
	end

	if 4 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 2 gi�y sau b�t �u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u 1 gi�y sau b�t �u." )
		return
	end

	if 2 == step then
		--��ʾChi�n �u b�t �u.....
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi�n �u b�t �u." )
		--ɾ��NPC....
		--CallScriptFunction( x893071_g_FuBenScriptId, "DeleteBOSS", sceneId, "QinYun_NPC" )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x893071_g_FuBenScriptId, "CreateBOSS", sceneId, "QinYun_BOSS", -1, -1 )
		return
	end

end
