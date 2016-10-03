-- �콱NPC

x899996_g_scriptId = 899996

--**********************************
--�¼��������
--**********************************
function x899996_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "Thi�n quan kh� kh�n th�t m�nh, xin ��i c�p ��t t�i c�p 10 l�i �n!" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		AddText( sceneId, "#YTa l� #YB�ch H� C�c#W truy�n t�ng s�!" )
		   		AddText( sceneId, "#YTr�n ng߶i ph�i mang theo ch�a kho�#cFF0000T� Tuy�t #W--#G Chu T߾c,#Y ta m�i c� th� ng߽i ��a �n T� Tuy�t Trang t�ng ti�p theo --#GChu T߾c C�c!" )
		   		AddText( sceneId, "#Ch�a kho� #cFF0000T� Tuy�t #W--#G Chu T߾c#Y c� th� r�t ra t� ��nh qu�i v�t � #YB�ch H� C�c#W!" )
				AddNumText( sceneId, x899996_g_scriptId, "#c00ff00Ta �i qua", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x899996_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 210 then
		BeginEvent( sceneId )
   		local n = GetMonsterCount(sceneId)
		if n>170 then
   		strText = "Tr߾c m�t s� l��ng qu�i v�t l�: "..n..", l�m gi�m s� l��ng qu�i xu�ng 170 th� n� s� h�i sinh con kh�c,!"
  		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
   		else 
		BeginEvent( sceneId )
		LuaFnCreateMonster(531, 39339, 30, 30, 17, 0, 402030)
                AddText( sceneId, "G�i qu�i v�t m�i th�nh c�ng! B�n quan c�ng qu�i v�t t�ng s� l��ng l�: "..n.."!" )
           	AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		end
          elseif GetNumText() == 200 then

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		if MosDataID == 42120 or MosDataID == 42121 or MosDataID == 42122 or MosDataID == 42123 or MosDataID == 42124 or MosDataID == 42125 or MosDataID == 42126 or MosDataID == 42127 or MosDataID == 42128
                 or MosDataID == 42129 or MosDataID == 42130 or MosDataID == 42131 or MosDataID == 42132 or MosDataID == 42133 or MosDataID == 42134 or MosDataID == 42135 or MosDataID == 42136 or MosDataID == 42137
                 or MosDataID == 42138 or MosDataID == 42139 or MosDataID == 42181 then
              	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#GB�ch H� C�c qu�i v�t c�n ch�a b� ti�u di�t s�ch s�, xin h�y ti�u di�t to�n b� r�i �n truy�n t�ng!" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
			return 
		end
	end

	       	local nStoneId0 = 39901040
		       c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
                          if c0 >=1 then
			         BeginEvent( sceneId ) 
			         LuaFnDelAvailableItem(sceneId,selfId,39901040,300)--ɾ����Ʒ
			         CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 540, 83,23,10 )--����
			         EndEvent( sceneId )
               	         DispatchEventList( sceneId, selfId, targetId )
                          else
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G��ng t�y t�y ti�n �n l�a d�i ta! Ng߽i tr�n ng߶i c�n b�n kh�ng c� s� h�u v�t ph�m, c�n th�n ta ��!" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
       	            end
	    end
end
