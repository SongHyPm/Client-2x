--��ӵ��to� � �¼�ID�б�
x400943_g_Transport = 400900

--��ҽ���m�t c�i area ʱ����
function x400943_OnEnterArea( sceneId, selfId )
        if GetLevel( sceneId, selfId ) < 90 then 
		BeginEvent( sceneId )
			AddText( sceneId, "  ����ǳ�Σ��,��C�a ng߽i ��c�p�в���90c�p,Ϊ��C�a ng߽i ��ȫ����,����Щʱ���ٳ��ǰ�." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	else 
		CallScriptFunction((x400943_g_Transport), "TransferFunc",sceneId, selfId, 425, 31, 27, 90, 1000)
	end
	
end


--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400943_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400943_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400943_OnLeaveArea( sceneId, selfId )
end
