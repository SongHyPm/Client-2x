--����Ԫ�� NPC
--ע�Ȿ�ű���������Ԫ����ع���,��m�t ����������to� � ���ӽ����޸�.

x181002_g_scriptId 	= 181002
x181002_g_buyrate 	= 0.5

x181002_g_shoptableindex=151
x181002_g_goodact		= 1		--����Ԫ���̵�
x181002_g_YuanBaoIntro	= 18	--Ԫ������

--**********************************
--�¼��������
--**********************************
function x181002_OnDefaultEvent( sceneId, selfId, targetId )
	if targetId == -1 then
		x181002_OnEventRequest( sceneId, selfId, targetId, nil )
	else
		BeginEvent( sceneId )
			strText = "    Ъn ��y m� xem, th߽ng ph�m b�n ch�y nh�t, gi� r� nh�t. Kh�ch quan, ng�i mau ch�n v�i m�n �i, b�o ��m ng�i mua v� xong ��m nay n�m m� c�ng ph�i c߶i "
			AddText( sceneId, strText )
			--AddNumText( sceneId, x181002_g_scriptId, "Mua nhi�t m�i th߽ng ph�m", 5, x181002_g_goodact)
			AddNumText( sceneId, x181002_g_scriptId, "Gi�i thi�u Kim Nguy�n B�o", 11, x181002_g_YuanBaoIntro)
			if targetId < 0 then
				targetId = -1	--Ϊ������������ѡ��
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x181002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181002_g_goodact then
		x181002_NewDispatchShopItem( sceneId, selfId,targetId, x181002_g_shoptableindex )
	elseif GetNumText() == x181002_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--�����������̵�,��Ϊ�����̵��NPC�̵�
--**********************************
function x181002_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
