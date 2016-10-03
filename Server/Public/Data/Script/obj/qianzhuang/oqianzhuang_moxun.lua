--ǮׯNPC
--ĪѰ
--��ͨ

x181004_g_ScriptId	= 181004

--������
x181004_g_Key				=
{
	["inf"]	= 1000,		--Ԫ������
	["bak"]	= 1001,		--Tr� v���m�t ҳ
}

--Ԫ���̵�
--����(˳����� 1-N),name = �̵�����,id = �̵�ID,key = GetNumText(˳�����)
x181004_g_LnShop		=
{
	["nam"]	= "Th߽ng ti�m tinh luy�n",
	["key"]	= 1,
--	[1]	= { name = "����Tinh��(Tinh������)", id = 153, key = 101 },
	[1]	= { name = "Mua ��i �ao v� Tr߶ng th߽ng �� T�o а", id = 156, key = 101 },
	[2]	= { name = "Mua нn �o�n v� Song �o�n �� T�o а", id = 157, key = 102 },
	[3]	= { name = "Mua Phi�n v� Ho�n �� T�o а", id = 158, key = 103 },
}
x181004_g_ZhShop		=
{
	["nam"]	= "Th߽ng ti�m tinh ch�",
	["key"]	= 2,
--	[1]	= { name = "�����޲�(Tinh�Ʋ���)", id = 154, key = 201 },
	[1]	= { name = "Mua M�o v� Y ph�c �� T�o а", id = 159, key = 201 },
	[2]	= { name = "Mua Bao tay v� H�i �� T�o а", id = 160, key = 202 },
	[3]	= { name = "Mua H� uy�n v� H� ki�n �� T�o а", id = 161, key = 203 },
	[4]	= { name = "Mua Y�u ��i �� T�o а", id = 162, key = 204 },
}
x181004_g_GnShop		=
{
	["nam"]	= "Th߽ng ti�m tinh c�ng",
	["key"]	= 3,
--	[1]	= { name = "��������(Tinh������)", id = 155, key = 301 },
	[1]	= { name = "Mua H�ng li�n �� T�o а", id = 163, key = 301 },
	[2]	= { name = "Mua Gi�i ch� �� T�o а", id = 164, key = 302 },
	[3]	= { name = "Mua H� ph� �� T�o а", id = 165, key = 303 },
}

--**********************************
--�¼��������
--**********************************
function x181004_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "    K� tr�n nguy�n li�u, c�c lo�i �� T�o а, xin kh�ch quan l�a ch�n!" )
		AddNumText( sceneId, x181004_g_ScriptId, x181004_g_LnShop["nam"], 7, x181004_g_LnShop["key"] )
		AddNumText( sceneId, x181004_g_ScriptId, x181004_g_ZhShop["nam"], 7, x181004_g_ZhShop["key"] )
		AddNumText( sceneId, x181004_g_ScriptId, x181004_g_GnShop["nam"], 7, x181004_g_GnShop["key"] )
		AddNumText( sceneId, x181004_g_ScriptId, "Gi�i thi�u Kim Nguy�n B�o", 11, x181004_g_Key["inf"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x181004_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	
	if key == x181004_g_LnShop["key"] then
		x181004_OnOpenShop( sceneId, selfId, targetId, x181004_g_LnShop )

	elseif key == x181004_g_ZhShop["key"] then
		x181004_OnOpenShop( sceneId, selfId, targetId, x181004_g_ZhShop )
		
	elseif key == x181004_g_GnShop["key"] then
		x181004_OnOpenShop( sceneId, selfId, targetId, x181004_g_GnShop )

	elseif floor( key / 100 ) == x181004_g_LnShop["key"] then
		for i = 1, getn( x181004_g_LnShop ) do
			if key == x181004_g_LnShop[i].key then
				DispatchShopItem( sceneId, selfId, targetId, x181004_g_LnShop[i].id )
				break
			end
		end
	
	elseif floor( key / 100 ) == x181004_g_ZhShop["key"] then
		for i = 1, getn( x181004_g_ZhShop ) do
			if key == x181004_g_ZhShop[i].key then
				DispatchShopItem( sceneId, selfId, targetId, x181004_g_ZhShop[i].id )
				break
			end
		end
	
	elseif floor( key / 100 ) == x181004_g_GnShop["key"] then
		for i = 1, getn( x181004_g_GnShop ) do
			if key == x181004_g_GnShop[i].key then
				DispatchShopItem( sceneId, selfId, targetId, x181004_g_GnShop[i].id )
				break
			end
		end
		
	elseif key == x181004_g_Key["inf"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif key == x181004_g_Key["bak"] then
		x181004_OnDefaultEvent( sceneId, selfId, targetId )
	end

end

--**********************************
--չ���̵�
--**********************************
function x181004_OnOpenShop( sceneId, selfId, targetId, lstShop )

	BeginEvent( sceneId )
		for i = 1, getn( lstShop ) do
			AddNumText( sceneId, x181004_g_ScriptId, lstShop[i].name, 7, lstShop[i].key )
		end
		AddNumText( sceneId, x181004_g_ScriptId, "Tr� v� trang tr߾c", -1, x181004_g_Key["bak"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end
