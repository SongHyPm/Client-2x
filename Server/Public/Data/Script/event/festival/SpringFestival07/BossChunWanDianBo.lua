--BOSS���� �i�m���ű�

--�ű���
x050044_g_ScriptId = 050044

--�������ؽű��ű���....
x050044_g_MainScriptId = 050030

--��ͨ �i�m��ȯ��Ŀ��....
x050044_g_ChapterTblA = {

	[1] = { id=2,  name="����: �����ٽ������"				},
	[2] = { id=3,  name="����: ����������"						},
	[3] = { id=5,  name="����: ������"								},
	[4] = { id=6,  name="СƷ: �����to� � ����"					},
	[5] = { id=8,  name="����: ˫�ڹ�"								},
	[6] = { id=10, name="СƷ: m�t ������"							}

}

--��c�p �i�m��ȯ��Ŀ��....
x050044_g_ChapterTblB = {

	[1] = { id=2,  name="����: �����ٽ������"				},
	[2] = { id=3,  name="����: ����������"						},
	[3] = { id=5,  name="����: ������"								},
	[4] = { id=6,  name="СƷ: �����to� � ����"					},
	[5] = { id=7,  name="�赸: ��Ƥ��"								},
	[6] = { id=8,  name="����: ˫�ڹ�"								},
	[7] = { id=10, name="СƷ: m�t ������"							},
	[8] = { id=11, name="����: ������ng��Ʒ����Ӱ���"	}

}

--��ͨ �i�m��ȯID....
x050044_g_TicketIdA = 30900046

--��c�p �i�m��ȯID....
x050044_g_TicketIdB = 30900047


--**********************************
--�¼��������
--**********************************
function x050044_OnDefaultEvent( sceneId, selfId,targetId )

	local NumText = GetNumText()

	if NumText == 0	then

		--��ʾ��ͨ �i�m��ȯ��Ŀ�б�....
		BeginEvent(sceneId)
			AddText(sceneId,"#{CWDB_20080225_02}")
			local ChapterCount = getn( x050044_g_ChapterTblA )
			for i=1, ChapterCount do
				AddNumText( sceneId, x050044_g_ScriptId, x050044_g_ChapterTblA[i].name, 6, i+100 )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 1	then

		--��ʾ��c�p �i�m��ȯ��Ŀ�б�....
		BeginEvent(sceneId)
			AddText(sceneId,"#{CWDB_20080225_03}")
			local ChapterCount = getn( x050044_g_ChapterTblB )
			for i=1, ChapterCount do
				AddNumText( sceneId, x050044_g_ScriptId, x050044_g_ChapterTblB[i].name, 6, i+200 )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

	if NumText > 200 then

		--ʹ�ø�c�p �i�m��ȯ �i�m����Ŀ....
		x050044_DianBo( sceneId, selfId, targetId, 2, NumText - 200 )

	elseif NumText > 100 then

		--ʹ����ͨ �i�m��ȯ �i�m����Ŀ....
		x050044_DianBo( sceneId, selfId, targetId, 1, NumText - 100 )

	end

end


--**********************************
--�о��¼�
--**********************************
function x050044_OnEnumerate( sceneId, selfId, targetId )

--		AddNumText( sceneId, x050044_g_ScriptId, "��ͨ �i�m��ȯ �i�m��", 6, 0 )
--		AddNumText( sceneId, x050044_g_ScriptId, "��c�p �i�m��ȯ �i�m��", 6, 1 )

end


--**********************************
-- �i�m��ָ����Ŀ....
--**********************************
function x050044_DianBo( sceneId, selfId, targetId, type, idx )

	--��⵱ǰ��ng��T�i ���Ž�Ŀ....
	if 1 == CallScriptFunction( x050044_g_MainScriptId, "IsChapterPlaying", sceneId ) then
		BeginEvent(sceneId)
			AddText( sceneId, "#{CWDB_20080225_04}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	local ChapterData = nil
	if type == 1 then
		ChapterData = x050044_g_ChapterTblA[idx]
	elseif type == 2 then
		ChapterData = x050044_g_ChapterTblB[idx]
	end
	if not ChapterData then
		return
	end

	local needItemId = -1
	if type == 1 then
		needItemId = x050044_g_TicketIdA
	elseif type == 2 then
		needItemId = x050044_g_TicketIdB
	end

	local needItemName = "#{_ITEM"..needItemId.."}"
	local msgNoItem = "��û��Я��"..needItemName..",�����޷� �i�m����ĿŶ!"

	--�����ng���� �i�m������....
	if LuaFnGetAvailableItemCount(sceneId, selfId, needItemId) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--ɾ��ǰ��ȡ����to� � Transfer....
	local itemPos = GetItemBagPos( sceneId, selfId, needItemId, 1 )
	if itemPos < 0 then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	local needItemTransfer = GetBagItemTransfer(sceneId,selfId,itemPos)

	--ɾ�� �i�m������....
	if 1 ~= LuaFnDelAvailableItem( sceneId, selfId, needItemId, 1 ) then
		BeginEvent(sceneId)
			AddText( sceneId, msgNoItem )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	-- �i�m��....
	CallScriptFunction( x050044_g_MainScriptId, "PlayChapter", sceneId, ChapterData.id )

	--����....
	local PlayerName = GetName(sceneId, selfId)
	local str
	if type == 1 then
		str = format( "#{_INFOUSR%s}#PS� d�ng #{_INFOMSG%s}#P,���� �i�m���´�BOSS������to� � ���󲿷ֽ�ĿŶ,Tinh�ʲ��ݴ���..�", PlayerName, needItemTransfer )
	elseif type == 2 then
		str = format( "#{_INFOUSR%s}#PS� d�ng #{_INFOMSG%s}#P,�´�BOSS�������Ŀ���� �i�m,Tinh�ʲ��ݴ��Ŷ�..�", PlayerName, needItemTransfer )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )

	--�رնԻ���....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end
