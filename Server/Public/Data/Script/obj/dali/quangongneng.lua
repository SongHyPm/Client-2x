--L�c D߽ngNPC
--�齱
--��ͨ
x210531_g_strGongGaoInfo = {
  "#e6f00c7#b#{_INFOUSR%s}#H qua nhi�u c� g�ng cu�i c�ng c�ng �� nguy�n li�u t�i �u Tr� Vu luy�n h�n th�nh c�ng! #{_INFOMSG%s}",
  "#e6f00c7#b#{_INFOUSR%s}#H qua nhi�u c� g�ng cu�i c�ng c�ng �� nguy�n li�u t�i �u Tr� Vu luy�n h�n th�nh c�ng! #{_INFOMSG%s}",
  "#e6f00c7#b#{_INFOUSR%s}#H qua nhi�u c� g�ng cu�i c�ng c�ng �� nguy�n li�u t�i �u Tr� Vu luy�n h�n th�nh c�ng! #{_INFOMSG%s}",
  "#e6f00c7#b#{_INFOUSR%s}#H qua nhi�u c� g�ng cu�i c�ng c�ng �� nguy�n li�u t�i �u Tr� Vu luy�n h�n th�nh c�ng! #{_INFOMSG%s}",
}
--**********************************
--�¼��������
--**********************************
function x210531_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#{SQSJ_0708_08}" )
		AddText( sceneId, "#GCh� �: #cfff263Sau khi luy�n h�n t�t c� ng�c c߶ng h�a t�c kh�c �u b� m�t h�t c�c h� n�n ch� � th�o g� ng�c tr߾c khi luy�n h�n." )
		--AddText( sceneId, "#G(#cFF0000��������#G)" )
		--AddText( sceneId, "����#G(#cFF0000LV5-LV6#G)#cFF0000100%��" )
		--AddText( sceneId, "#cff99ff��ʾ(#G���������Ƕto� � ��ʯ#cff99ff)" )
		AddNumText( sceneId, x210531_g_ScriptId, "#{SQSJ_XML_01}", 10, 100 )
		--AddNumText( sceneId, x210531_g_ScriptId, "#G(#cFF0000��������#G)", 5, 200 )
		--AddNumText( sceneId, x210531_g_ScriptId, "����#G(#cFF0000LV5-LV6#G)#cFF0000100%��", 5, 300 )
		--AddNumText( sceneId, x210531_g_ScriptId, "#cff99cc��ħ�꡻#W֮��#Y�ϳ�#G(#cFF0000����#G)#cFF0000��", 5, 400 )
		AddNumText( sceneId, x210531_g_ScriptId, "R�i kh�i", 8, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x210531_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#{SQSJ_XML_02}" )
		      --AddText( sceneId, "#G(#cFF0000LV1-LV3#G)#cFF000050%��" )
		      --AddText( sceneId, "��������C�n ����: " )
		      --AddText( sceneId, "#G���Ӧto� � ����#W1#G��" )
		      --AddText( sceneId, "#cff99ffTh�n binh ph�#W20#cff99ffc�i" )
		      --AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "Luy�n H�n Th�n Kh� 102", 10, 101)
			AddNumText( sceneId, x210531_g_scriptId, "Luy�n H�n Th�n Kh� 106", 10, 102)
		--AddNumText( sceneId, x210531_g_scriptId, "Luy�n H�n Lai Th�n Kh� 106", 5, 103)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 8, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 101 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ffЬ luy�n Th�n kh� 102 c�n:" )
		      --AddText( sceneId, "#c0066ffm�t ��#G(#cFF0000LV1-LV3#G)#cFF000050%��" )
		      --AddText( sceneId, "��������C�n ����: " )
		      AddText( sceneId, "#cff99ffTh�n kh� 102 g�m #G1 #cff99ffc�i" )
		      AddText( sceneId, "#cff99ffTh�n Binh Ph� c�p 3 #G10 #cff99ffc�i" )
		      AddText( sceneId, "#cff0000Ch� �: ��ng c�p s� d�ng c�a Th�n Kh� Luy�n H�n c�p 102 s� bi�n th�nh 106. Sau khi luy�n h�n t�t c� ng�c c߶ng h�a t�c kh�c �u b� m�t h�t c�c h� n�n ch� � th�o g� ng�c tr߾c khi luy�n h�n." )
			AddNumText( sceneId, x210531_g_scriptId, "#GC�u Ti�u Di�m D߽ngG", 10, 1011)
			AddNumText( sceneId, x210531_g_scriptId, "#GH�ng Hoang Long V�#G", 10, 1012)
			AddNumText( sceneId, x210531_g_scriptId, "#G��t Ma Nh�t Th�n#G", 10, 1013)
			AddNumText( sceneId, x210531_g_scriptId, "#G� Thi�n Tr߶ng Sinh#G", 10, 1014)
			AddNumText( sceneId, x210531_g_scriptId, "#G��i Di�n Thi�n Huy�n#G", 10, 1015)
			--AddNumText( sceneId, x210531_g_scriptId, "#GChuy�n H�n Di�t Ph�ch C�u#G", 10, 1050)
			AddNumText( sceneId, x210531_g_scriptId, "#GL�c ��o Ho�ng Tuy�n#G", 10, 1016)
			AddNumText( sceneId, x210531_g_scriptId, "#GTh�i C� �i�u Linh#G", 10, 1017)
			AddNumText( sceneId, x210531_g_scriptId, "#GV� T߾ng Tuy�t Tung#G", 10, 1018)
			AddNumText( sceneId, x210531_g_scriptId, "#GV�n Th� Kh� Vinh#G", 10, 1019)
			AddNumText( sceneId, x210531_g_scriptId, "#GM�t Th� V߽ng Quy�n #G", 10, 1020)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1011 then
	       	local nStoneId0 = 10300102
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300007, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1012 then
	       	local nStoneId0 = 10301102
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554501, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1013 then
	       	local nStoneId0 = 10301202
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then	
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301202,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554502, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1014 then
	       	local nStoneId0 = 10303102
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)
				       local bagpos01 = TryRecieveItem( sceneId, selfId, 10554503, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1015 then
	       	local nStoneId0 = 10302102
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554504, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
	elseif GetNumText() == 1016 then
	       	local nStoneId0 = 10303202
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303202,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554505, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1017 then
	       	local nStoneId0 = 10304102
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554506, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
	elseif GetNumText() == 1018 then
	       	local nStoneId0 = 10305102
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554507, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 1019 then
	       	local nStoneId0 = 10305202
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305202,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554508, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 1020 then
	       	local nStoneId0 = 10302102
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554509, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 1050 then
	       	local nStoneId0 = 10157011
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GLuy�n h�n th�n kh� th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 102 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ffЬ luy�n Th�n kh� 106 c�n:" )
		      --AddText( sceneId, "#c0066ffm�t ��#G(#cFF0000LV1-LV3#G)#cFF000050%��" )
		      --AddText( sceneId, "��������C�n ����: " )
		      AddText( sceneId, "#cff99ffTh�n kh� 106 g�m #G1 #cff99ffc�i" )
		      AddText( sceneId, "#cff99ffTh�n Binh Ph� c�p 3 #G20 #cff99ffc�i" )
		      AddText( sceneId, "#cff0000Ch� �: ��ng c�p s� d�ng c�a Th�n Kh� Luy�n H�n c�p 106 s� bi�n th�nh 106. Sau khi luy�n h�n t�t c� ng�c c߶ng h�a t�c kh�c �u b� m�t h�t c�c h� n�n ch� � th�o g� ng�c tr߾c khi luy�n h�n." )
			AddNumText( sceneId, x210531_g_scriptId, "#GX�ch Di�m C�u V�n �ao#G", 10, 1021)
			AddNumText( sceneId, x210531_g_scriptId, "#GTr�m �u �o�n S�u Th߽ng#G", 10, 1022)
			AddNumText( sceneId, x210531_g_scriptId, "#GD�ch Thi�n Ph� T� Tr��ng#G", 10, 1023)
			AddNumText( sceneId, x210531_g_scriptId, "#GH�m Quang L�ng �nh Ki�m#G", 10, 1024)
			AddNumText( sceneId, x210531_g_scriptId, "#GV�n Nh�n Long Uy�n Ki�m#G", 10, 1025)
			AddNumText( sceneId, x210531_g_scriptId, "#GChuy�n H�n Di�t Ph�ch C�u#G", 10, 1026)
			AddNumText( sceneId, x210531_g_scriptId, "#GL�i Minh C�ch H�a Phi�n#G", 10, 1027)
			AddNumText( sceneId, x210531_g_scriptId, "#GTo�i T�nh V� �nh Ho�n#G", 10, 1028)
			AddNumText( sceneId, x210531_g_scriptId, "#GThi�n Tinh Di�u D߽ng Ho�n#G", 10, 1029)
			AddNumText( sceneId, x210531_g_scriptId, "#GTinh Di V� Ng�n Ki�m #G", 10, 1030)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1021 then
	       	local nStoneId0 = 10300007
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300007,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300007, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1022 then
	       	local nStoneId0 = 10301001
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301001,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301001, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1023 then
	       	local nStoneId0 = 10301199
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301199,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301199, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1024 then
	       	local nStoneId0 = 10302007
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302007,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302007, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1025 then
	       	local nStoneId0 = 10302009
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302009,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
	elseif GetNumText() == 1026 then
	       	local nStoneId0 = 10303001
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303001,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303001, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1027 then
	       	local nStoneId0 = 10304009
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304009,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
	elseif GetNumText() == 1028 then
	       	local nStoneId0 = 10305007
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305007,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305007, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 1029 then
	       	local nStoneId0 = 10305009
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305009,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 1030 then
	       	local nStoneId0 = 10302200
	       	local nStoneId1 = 30505818
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302200,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505818,10)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302200, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 200 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #Y����Boss������#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV3-LV5#G)#cFF000070%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh�����Tinh��#W100#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV3-LV5#G)#cFF000070%��", 5, 201)
			--AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV5-LV6#G)#cFF000015%��", 5, 202)
			--AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV6-LV7#G)#cFF000015%��", 5, 203)
			--AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV7-LV8#G)#cFF000015%��", 5, 204)
			--AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV8-LV9#G)#cFF000015%��", 5, 205)
			--AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV9-LV10#G)#cFF000015%��", 5, 206)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #Y����Boss������#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV3-LV5#G)#cFF000070%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh�����Tinh��#W100#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "#G����#YԪ�����#G(#cFF0000LV3-LV5#G)#cFF000070%��", 5, 2011)
			AddNumText( sceneId, x210531_g_scriptId, "#G�š�#YLinhϬ��#G(#cFF0000LV3-LV5#G)#cFF000070%��", 5, 2012)
			AddNumText( sceneId, x210531_g_scriptId, "#G�졤#YTi�u Dao����#G(#cFF0000LV3-LV5#G)#cFF000070%��", 5, 2013)
			AddNumText( sceneId, x210531_g_scriptId, "#G�ޡ�#Y�������#G(#cFF0000LV3-LV5#G)#cFF000070%��", 5, 2014)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2011 then
	       	local nStoneId0 = 10300008
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301001, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2012 then
	       	local nStoneId0 = 10302008
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302010, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2013 then
	       	local nStoneId0 = 10304008
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305007, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 2014 then
	       	local nStoneId0 = 10305326
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305328, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 103 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ffЬ luy�n Th�n kh� 102 c�n:" )
		      --AddText( sceneId, "#c0066ffm�t ��#G(#cFF0000LV1-LV3#G)#cFF000050%��" )
		      --AddText( sceneId, "��������C�n ����: " )
		      AddText( sceneId, "#cff99ffTh�n kh� 102 g�m #G1 #cff99ffc�i" )
		      AddText( sceneId, "#cff99ffTh�n Binh Ph� c�p 1 #G20 #cff99ffc�i" )
		      AddText( sceneId, "#cff0000Ch� �: ��ng c�p s� d�ng c�a Th�n Kh� Luy�n H�n c�p 82 s� bi�n th�nh 86. Sau khi luy�n h�n t�t c� ng�c c߶ng h�a t�c kh�c �u b� m�t h�t c�c h� n�n ch� � th�o g� ng�c tr߾c khi luy�n h�n." )
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffccC�u Ti�u Di�m D߽ng", 10, 2021)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffccH�ng Hoang Long V�", 10, 2022)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffcc��t Ma Nh�t Th�n", 10, 2023)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffcc� Thi�n Tr߶ng Sinh", 10, 2024)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffcc��i Di�n Thi�n Huy�n", 10, 2025)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffccL�c ��o Ho�ng Tuy�n", 10, 2026)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffccTh�i C� �i�u Linh", 10, 2027)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffccV� T߾ng Tuy�t Tung", 10, 2028)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffccV�n Th� Kh� Vinh", 10, 2029)
			AddNumText( sceneId, x210531_g_scriptId, "#c33ffccM�t Th� V߽ng Quy�n", 10, 2030)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 2021 then
	       	local nStoneId0 = 10300004
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554500, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2022 then
	       	local nStoneId0 = 10301102
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554501, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2023 then
	       	local nStoneId0 = 10301202
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301202,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554502, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 2024 then
	       	local nStoneId0 = 10303102
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554503, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 2025 then
	       	local nStoneId0 = 10302102
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554504, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 2026 then
	       	local nStoneId0 = 10303202
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303202,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554505, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 2027 then
	       	local nStoneId0 = 10304102
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554506, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 2028 then
	       	local nStoneId0 = 10305102
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554507, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 2029 then
	       	local nStoneId0 = 10305202
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305202,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554508, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			
				elseif GetNumText() == 2030 then
	       	local nStoneId0 = 10303102
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303102,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,20)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10554509, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 203 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #YƮ�츱��#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV9-LV19#G)#cFF000015%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh�����Tinh��#W1#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff6633ն��ǹ#G(#cFF0000LV6-LV7#G)#cFF000015%��", 5, 2031)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff6633ŪӰ��#G(#cFF0000LV6-LV7#G)#cFF000015%��", 5, 2032)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff6633���#G(#cFF0000LV6-LV7#G)#cFF000015%��", 5, 2033)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2031 then
	       	local nStoneId0 = 10301002
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301002,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301003, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2032 then
	       	local nStoneId0 = 10302011
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2033 then
	       	local nStoneId0 = 10305008
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 204 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #YƮ�츱��#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV9-LV19#G)#cFF000015%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh�����Tinh��#W1#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff�ϳ�ǹ#G(#cFF0000LV7-LV8#G)#cFF000015%��", 5, 2041)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff��Ԩ��#G(#cFF0000LV7-LV8#G)#cFF000015%��", 5, 2042)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff���黷#G(#cFF0000LV7-LV8#G)#cFF000015%��", 5, 2043)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2041 then
	       	local nStoneId0 = 10301003
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301003,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301004, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2042 then
	       	local nStoneId0 = 10302012
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302013, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2043 then
	       	local nStoneId0 = 10305009
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305009,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305010, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 205 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #YƮ�츱��#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV9-LV19#G)#cFF000015%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh�����Tinh��#W1#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff�ϳ�ǹ#G(#cFF0000LV8-LV9#G)#cFF000015%��", 5, 2051)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff��Ԩ��#G(#cFF0000LV8-LV9#G)#cFF000015%��", 5, 2052)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff���黷#G(#cFF0000LV8-LV9#G)#cFF000015%��", 5, 2053)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2051 then
	       	local nStoneId0 = 10301004
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301005, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2052 then
	       	local nStoneId0 = 10302013
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302013,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2053 then
	       	local nStoneId0 = 10305010
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 206 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #YƮ�츱��#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV9-LV19#G)#cFF000015%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh�����Tinh��#W1#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff�ϳ�ǹ#G(#cFF0000LV9-LV10#G)#cFF000015%��", 5, 2061)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff��Ԩ��#G(#cFF0000LV9-LV10#G)#cFF000015%��", 5, 2062)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff���黷#G(#cFF0000LV9-LV10#G)#cFF000015%��", 5, 2063)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2061 then
	       	local nStoneId0 = 10301005
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301005,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301197, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2062 then
	       	local nStoneId0 = 10302014
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302014,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303000, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 2063 then
	       	local nStoneId0 = 10305011
	       	local nStoneId1 = 30505819
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30505819,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 300 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #Y����Boss������#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV5-LV6#G)#cFF0000100%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh������Tinh��#W200#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV5-LV6#G)#cFF0000100%��", 5, 301)
			--AddNumText( sceneId, x210531_g_scriptId, "����#G(#cFF0000LV11-LV#WMAX#G)#cFF000020%��", 5, 302)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 301 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #Y����Boss������#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV5-LV6#G)#cFF0000100%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh������Tinh��#W200#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff6633�廢�ϻ�#G(#cFF0000LV5-LV6#G)#cFF0000100%��", 5, 3011)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff99ff����˫��#G(#cFF0000LV5-LV6#G)#cFF0000100%��", 5, 3012)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#cff6633��������#G(#cFF0000LV5-LV6#G)#cFF0000100%��", 5, 3013)
			AddNumText( sceneId, x210531_g_scriptId, "#G�졤#cff6633�������#G(#cFF0000LV5-LV6#G)#cFF0000100%��", 5, 3014)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 3011 then
	       	local nStoneId0 = 10301001
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301001,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301002, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 3012 then
	       	local nStoneId0 = 10302010
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 3013 then
	       	local nStoneId0 = 10305007
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305007,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305008, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 3014 then
	       	local nStoneId0 = 10305328
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305328,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305329, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 302 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����Linh��Tinh��#W c� th� � #YƮ�츱��#W ��t ���c!" )
		      AddText( sceneId, "#c0066ff����#G(#cFF0000LV19-LV#WMAX#G)#cFF000020%��" )
		      AddText( sceneId, "��c�pLinh��װ��C�n ����: " )
		      AddText( sceneId, "#G���Ӧto� � Linh��װ��#W1#Gc�i" )
		      AddText( sceneId, "#cff99ffLinh������Tinh��#W1#cff99ffc�i" )
		      AddText( sceneId, "#G��X�c nh�nҪ��c�p��?" )
			AddNumText( sceneId, x210531_g_scriptId, "#G����#ccc33cc������#G(#cFF0000LV11-LV#WMAX#G)#cFF000020%��", 5, 3021)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#ccc33ccת�깳#G(#cFF0000LV11-LV#WMAX#G)#cFF000020%��", 5, 3022)
			AddNumText( sceneId, x210531_g_scriptId, "#G����#ccc33ccħɷ��#G(#cFF0000LV11-LV#WMAX#G)#cFF000020%��", 5, 3023)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 3021 then
	       	local nStoneId0 = 10301198
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId )
 		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10301198,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301199, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[H� th�ng]:#G�������,Ch�c m�ng#{_INFOUSR%s}L�c D߽ngLinh��װ����c�p��,ȡ �i�m�ռ���Ʒ#{_INFOMSG%s}!Linh����c�p�����Դ���ǿ,����ng�Ӽ�����,PKɱ��to� � �ر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 3022 then
	       	local nStoneId0 = 10303001
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
 		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10303001,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303002, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[H� th�ng]:#G�������,Ch�c m�ng#{_INFOUSR%s}L�c D߽ngLinh��װ����c�p��,ȡ �i�m�ռ���Ʒ#{_INFOMSG%s}!Linh����c�p�����Դ���ǿ,����ng�Ӽ�����,PKɱ��to� � �ر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 3023 then
	       	local nStoneId0 = 10305013
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
 		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10305013,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[H� th�ng]:#G�������,Ch�c m�ng#{_INFOUSR%s}L�c D߽ngLinh��װ����c�p��,ȡ �i�m�ռ���Ʒ#{_INFOMSG%s}!Linh����c�p�����Դ���ǿ,����ng�Ӽ�����,PKɱ��to� � �ر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng ng߽i, th�n kh� luy�n h�n th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 400 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cff99cc��ħ�꡻#W֮��#W c� th� � #G������#W ��t ���c!" )
		      AddText( sceneId, "�ϳ�����C�n ����: " )
		      AddText( sceneId, "#cff99ff����֮ʯ" )
		      AddText( sceneId, "#G����֮ʯ#W���.�#Y������#G����#W��ȡ" )
		      AddText( sceneId, "#cff99cc��ħ�꡻#W֮��#G+#cFF0000����֮ʯ#G=#cFF0000����" )
			AddNumText( sceneId, x210531_g_scriptId, "�ϳ�#G����#Y���浶#G��[LV1]#cFF0000��������", 5, 401)
			AddNumText( sceneId, x210531_g_scriptId, "�ϳ�#G����#Y���⽣#G��[LV1]#cFF0000����˫��", 5, 402)
			AddNumText( sceneId, x210531_g_scriptId, "�ϳ�#G����#Y������#G��[LV1]#cFF0000���Ȼ���", 5, 403)
			AddNumText( sceneId, x210531_g_scriptId, "R�i kh�i", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 401 then
	       	local nStoneId0 = 10470012
	       	local nStoneId1 = 30503093
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10470012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503093,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300006, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng��,�m�t ��ɹ�!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 402 then
	       	local nStoneId0 = 10470012
	       	local nStoneId1 = 30503093
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10470012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503093,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302006, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng��,�m�t ��ɹ�!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 403 then
	       	local nStoneId0 = 10470012
	       	local nStoneId1 = 30503093
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10470012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503093,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304006, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x210531_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#GCh�c m�ng��,�m�t ��ɹ�!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#GB�n kh�ng �� nguy�n li�u � luy�n h�n."
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
end
--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x210531_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x210531_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x210531_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x210531_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x210531_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x210531_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x210531_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
