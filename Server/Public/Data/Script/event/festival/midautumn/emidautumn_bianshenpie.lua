--�����
--����-��Բ�����±��

--�ű���
x050020_g_ScriptId = 050020

--x050020_g_EndDayTime = 7290   --�����ʱ�� 2007-10-18
x050020_g_EndDayTime = 8304   --�����ʱ�� 2008-10-31,��������

x050020_g_PingFengSn = 40004428			--����ID
x050020_g_BianShenPieSn = 30505132	--���ݵ��±�ID

x050020_g_strBianShenPieInfo = "#{ZHONGQIUBIANSHEN_001}"
x050020_g_strGongGaoInfo = {

	"#Y Nh�c Th߶ng Vi�n#cff99cc c߶i to n�i: #{_INFOUSR%s}#cff99cc anh h�ng, 3 c�i#W#{_INFOMSG%s}#cff99cc n�y c� ph�i ch�ng �o�t t� trong tay #YD� еc#cff99cc kh�ng? Ta s� kh�ng th�t t�n, c�i #{_INFOMSG%s}#cff99cc n�y s� l� c�a ng߽i! ",
	"#Y Nh�c Th߶ng Vi�n#cff99cckinh h�i: #{_INFOUSR%s}#cff99cc, c�c h� th�t s� t� trong tay #YH�ng H�ng V߽ng#cff99cc �o�t ���c 3 mi�ng #{_INFOMSG%s}#cff99cc! Vi�n #{_INFOMSG%s}#cff99cc n�y n�i sao th� c�ng nh�n l�y �i! ",
	"#Y Nh�c Th߶ng Vi�n#cff99cc nh�n#{_INFOUSR%s}#cff99cc t� trong tay #YC�t Vinh#cff99cc �o�t ���c 3 mi�ng #{_INFOMSG%s}#cff99cc vui m�ng v� c�ng, l�y ra 1 vi�n #{_INFOMSG%s}#cff99cc � �n ��p. ",

}

--**********************************
--������ں���
--**********************************
function x050020_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()

	if NumText == 101 then

		BeginEvent(sceneId)
			AddText(sceneId, x050020_g_strBianShenPieInfo)
			AddNumText(sceneId, x050020_g_ScriptId, "бi", 6, 201 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 201 then

		--�����ݵ��±�....
		x050020_GivePlayerPie( sceneId, selfId, targetId )
	elseif NumText == 102 then
	
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZQHD_20070916_013}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--�о��¼�
--**********************************
function x050020_OnEnumerate( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050020_g_ScriptId, "Ta mu�n bi�n th�n th�nh b�nh Trung Thu", 6, 101 )													
end

--**********************************
--�����ng���ѽ���
--**********************************
function x050020_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime <= x050020_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--��������ݵ��±�
--**********************************
function x050020_GivePlayerPie( sceneId, selfId, targetId )

	--�رնԻ�����....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

	--��ng����3c�i....
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050020_g_PingFengSn)
	if itemCount < 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi�m v� ��o c� kh�ng ��, kh�ng th� �i" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--ɾ��ǰ��ȡ����to� � Transfer....
	local pingFengPos = GetItemBagPos( sceneId, selfId, x050020_g_PingFengSn, 0 )
	if pingFengPos < 0 then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi�m v� ��o c� kh�ng ��, kh�ng th� �i" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
	end
	local pingFengTransfer = GetBagItemTransfer(sceneId,selfId,pingFengPos)

	--��ⱳ����ng���еط�....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ch� tr�ng trong t�i x�ch kh�ng ��" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--��ng��ɾ��th�t b�i....
	if 0 == DelItem(sceneId, selfId, x050020_g_PingFengSn, 3) then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi�m v� ��o c� kh�ng ��, kh�ng th� �i" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--����Ʒ������....
	local BagIndex = TryRecieveItem( sceneId, selfId, x050020_g_BianShenPieSn, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then

		BeginEvent( sceneId )
			AddText( sceneId, "C�c h� �i ���c 1 D�ch Dung �an: B�nh Trung Thu" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )

		--���繫��....
		local ItemTransfer = GetBagItemTransfer(sceneId,selfId,BagIndex)
		local PlayerName = GetName(sceneId, selfId)
		local nMsgIndex = random(3)
		local str
		if nMsgIndex == 1 then
			str = format( x050020_g_strGongGaoInfo[1], PlayerName, pingFengTransfer, ItemTransfer )
		elseif nMsgIndex == 2 then
			str = format( x050020_g_strGongGaoInfo[2], PlayerName, pingFengTransfer, ItemTransfer )
		else
			str = format( x050020_g_strGongGaoInfo[3], PlayerName, pingFengTransfer, ItemTransfer )
		end
		BroadMsgByChatPipe( sceneId, selfId, str, 4 )

	end

end

--**********************************
--���Ti�p th�����
--**********************************
function x050020_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti�p th�
--**********************************
function x050020_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050020_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050020_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--�����ng������ύ
--**********************************
function x050020_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x050020_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x050020_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x050020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x050020_OnItemChanged( sceneId, selfId, itemdataId )
end
