--���� �i�m
--��Ӧ�����: -1
--�ع����������
--�ű���******(712533)

--m�t c�i�����ﺬ�м�c�i��Ʒ
x712533_g_DropNumTable  = {
	{num = 1, odd = 1.0},	--1c�ito� � ����
}

x712533_g_TickCreate_Msg = "�ػʵع���������Ʒ ��a cho ���!"

--ÿ����Ʒ��ng������Ʒ,�Ҵ�����Ʒ�ѵ�������ng��c�i
x712533_g_DropTable = {
	--��ʯ��
	{
		itemType = 7, 	--��ʯ��to� � ���ͱ�ʶ
	 	odd = 1.0, 		--���ּ���
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						20310004, --zchw �ػ���
					},
	},
}

--�������ʱ��2006-8-21 17:33 �޸�Ϊ�ɹ��������ݽ���

--���ݱ�����������ҵ����ж�Ӧto� � ����
function x712533_GetTableIndexByOdd(tb)
	local oddNow = random();
	
	local base = 0.0;
	for i = 1, getn(tb) do
		if(tb[i].odd + base >= oddNow) then
			return i;
		end
		base = base + tb[i].odd;
	end
	
	return nil;
end

--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ,Tr� v�ֵ -1 ֱ�ӻ������� �i�m,��ռ��
function x712533_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--����to� � ��ʧʱ��
	
	-- �������м�c�i��Ʒ
	local numIdx = x712533_GetTableIndexByOdd(x712533_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712533_g_DropNumTable[numIdx].num do
			--C�i n�y ��Ʒ��ngʲô����to� � ��Ʒ
			local showIdx = x712533_GetTableIndexByOdd(x712533_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--C�i n�y ����to� � ��Ʒ������ng��c�i
				dropNumIdx = x712533_GetTableIndexByOdd(x712533_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712533_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712533_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712533_g_DropTable[showIdx].idx[itemIdx]
						--��ӵ��������Ʒ������
						for k = 1, x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " Tr߶ng c�nh s� (" .. x .. ", " .. y .. ") t�o ra m�t v�t ph�m "..
											 "("..x712533_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end 
						end
					end
				elseif(dropNumIdx and 9 == x712533_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712533_g_DropTable[showIdx].idx)))
					local petId = x712533_g_DropTable[showIdx].idx[petIdx]
					--������޵�����
					for k = 1, x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num do
						local PetObjId = nil
						PetObjId = CreatePetOnScene( sceneId, petId, x, y )
						SetCharacterDieTime( sceneId, PetObjId, delDur )
						print( sceneId .. " Tr߶ng c�nh s� (" .. x .. ", " .. y .. ") t�o ra m�t Tr�n th� "..
									 GetName( sceneId, PetObjId ) .. "." )
					end 
				end
			end --end of if(showIdx) then
			
			--��¼��Ʒ�����������to� � ����
			if(showIdx and dropNumIdx and itemId ~= nil) then
				if(9 ~= x712533_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("V�t ph�m b�n trong c� (lo�i "..x712533_g_DropTable[showIdx].itemType..")"..
								x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								" m�t ["..itemName.."].")
					itemNum = x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "T� b�o s߽ng t�o ra");
				end
			end
			
		end -- end of for i = 1, x712533_g_DropNumTable[numIdx].num do
		
		--�趨����ʱ��
		if(ItemBoxId) then
			SetItemBoxMaxGrowTime( sceneId, ItemBoxId, delDur )
			return 0	--C�i n�y ���걻����ռ����
		end
	end
	
	return -1	--C�i n�y ����û�б�ռ��
end
--���ɺ�������**********************************************************************

--m�t �δ�����c�i����to� � ��ɺ�����ʼ****************************************************
function x712533_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712533_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 �ȴ�����to� � server�Ի�ƽ̨
		print( sceneId .. " Tr߶ng c�nh s� "..x712533_g_TickCreate_Msg)
	end
end
--m�t �δ�����c�i����to� � ��ɺ�������****************************************************

--��ǰ������ʼ
function x712533_OnOpen( sceneId, selfId, targetId )
--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
end
--��ǰ��������


--���պ�����ʼ
function x712533_OnRecycle( sceneId, selfId, targetId )
--Tr� v�1,���� �i�m����
	return 1
end
--���պ�������

--�򿪺�����ʼ
function x712533_OnProcOver( sceneId, selfId, targetId )
end

--�򿪺�������
function x712533_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
