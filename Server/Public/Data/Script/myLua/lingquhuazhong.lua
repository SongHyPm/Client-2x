--����С��
--L�nh ������
--�㿴������,������,������O(��_��)O~ OK���ǿ�ʼ�ɡ�����������
x000178_g_ScriptId	= 000178
--************************************************************************
function x000178_OnDefaultEvent( sceneId, selfId, targetId )
		local CurTime = GetQuarterTime();
		local iTime = GetMissionData( sceneId, selfId, MD_XIANHUAZHONGZI );
		if iTime+3 >= CurTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�ʻ�to� � ����ÿ��m�t СʱL�nh m�t ��,���m�t ������." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	    BeginEvent( sceneId )
		  AddText( sceneId, "#W��i L�����ngc�i����to� � �ط�,�ļ��紺,����m�t c�i�ֻ�����˵,�������ng���á������Ҵ�����m�t Щ��˹to� � õ��,���ϱ�Hoa ti�n t�TinhLinh������." )
		  AddNumText( sceneId, x000178_g_ScriptId, "�ʻ�to� � ����#GÿСʱL�nh m�t ��",5,10 )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
    end
end
--************************************************************************
function x000178_OnEventRequest( sceneId, selfId, targetId, eventId )
	  local	key	= GetNumText()
	  if key == 10 then
	  local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	  if FreeSpace < 4  then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000Ch� tr�ng trong t�i x�ch kh�ng ��,��T�i ���߰�������c�i��λ." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	 local level = GetLevel( sceneId, selfId )
	 if level < 60 then
		  BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�ȼ�����60���޷�L�nh " )
		  EndEvent( sceneId )
		  DispatchEventList( sceneId, selfId, targetId )
		  return
		else
		  BeginEvent( sceneId ) 
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			AddText( sceneId, "#GCh�c m�ng�� ��t ���c�����ʻ�to� � ����!" )
			EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )
	local playerName = GetName(sceneId,selfId)
	local strText = format("#G#{_INFOUSR%s}#W��T�i #c00ffff��i L�[307,164]#cff99ff����#W��ѯ�����ֻ�to� � Kinh nghi�m,���ﾹȻ����to� �  ��a cho ������#G�ʻ�to� � ����!",playerName ) 
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		local CurTime = GetQuarterTime();
	    SetMissionData(sceneId, selfId, MD_XIANHUAZHONGZI, CurTime);
      end
	  end
	end
end	

--����С��дto� � ,���Ƽ���ʵ�ܸ���,����to� � ����ng�ջ�*************************************
