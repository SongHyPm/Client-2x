--����С��
--�Ҹ�to� � ����
--�㿴������,������,������O(��_��)O~ OK���ǿ�ʼ�ɡ�����������
x000177_g_ScriptId	= 000177
--************************************************************************
function x000177_OnDefaultEvent( sceneId, selfId, targetId )
		local lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGCHUI );
		local CurTime = GetDayTime();
		if CurTime <= lastDayTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�����Ӗ�ÿ��ֻ��L�nh m�t ��,������������." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	    BeginEvent( sceneId )
		  AddText( sceneId, "#Y¡¡������Ԫ��,����ף��ӭ���꣡#G12��21��-1��31��,#W���ȼ���60��to� � ���ÿ����ɵ�������L�nh #cff99ff�����Ӗ�#Wm�t ö,��������to� � ����,Ϊ��to� � m�t ��ף�����㽫���������ջ� " )
		  AddNumText( sceneId, x000177_g_ScriptId, "L�nh �����Ӗ�",5,10 )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
    end
end
--************************************************************************
function x000177_OnEventRequest( sceneId, selfId, targetId, eventId )
	  local	key	= GetNumText()
	  if key == 10 then
	  local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	  if FreeSpace < 2  then
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
			TryRecieveItem( sceneId, selfId, 30309825, 1)
			AddText( sceneId, "#GCh�c m�ng�� ��t ���cm�t ö�����Ӗ�!" )
			EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )
	local playerName = GetName(sceneId,selfId)
	local strText = format("#G#{_INFOUSR%s}#W��T�i #c00ffffL�c D߽ng�㳡[256,252]#cff99ff�Ҹ�to� � ����#W����Ŀ����,���Ͼ�Ȼ����m�t ö#G����to� � �Ӗ�#W��T�i ����!",playerName ) 
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	local CurTime = GetDayTime();
	    SetMissionData(sceneId, selfId, MD_ZHONGCHUI, CurTime);
      end
	  end
	end
end	

--����С��дto� � ,���Ƽ���ʵ�ܸ���,����to� � ����ng�ջ�*************************************
