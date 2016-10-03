--���� �i�m
--��Ӧ�����: -1
--Nh�n B�c���������
--�ű���******(712532)

--m�t c�i�����ﺬ�м�c�i��Ʒ
x712532_g_DropNumTable  = {
	{num = 1, odd = 0.2},	--1c�ito� � ����
	{num = 2, odd = 0.4},	--2c�ito� � ����
	{num = 3, odd = 0.2},	--3c�ito� � ����
	{num = 4, odd = 0.15},	--4c�ito� � ����
	{num = 5, odd = 0.05},	--5c�ito� � ����
}

x712532_g_TickCreate_Msg = ""

--ÿ����Ʒ��ng������Ʒ,�Ҵ�����Ʒ�ѵ�������ng��c�i
x712532_g_DropTable = {
	--������
	{
		itemType = 4, 	--������to� � ���ͱ�ʶ
	 	odd = 0.42, 			--���ּ���
	 	numOdd = {
							{num = 2, odd = 0.2},				--2c�ito� � ����
							{num = 4, odd = 0.4},				--4c�ito� � ����
							{num = 6, odd = 0.2},				--6c�ito� � ����
							{num = 8, odd = 0.15},			--8c�ito� � ����
							{num = 10, odd = 0.05},			--10c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						20101011,20101012,20101013,20102005,20102017,20103005,20104005,20105005,
					},
	},
	--������
	{
		itemType = 12, 	--������to� � ���ͱ�ʶ
	 	odd = 0.42, 			--���ּ���
	 	numOdd = {
							{num = 1, odd = 0.3},				--1c�ito� � ����
							{num = 2, odd = 0.4},				--2c�ito� � ����
							{num = 3, odd = 0.3},				--3c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						20102029,20103017,20103029,20103041,20103053,20105017,
					},
	},
	--�߼�ֵ����
	{
		itemType = 3, 	--������to� � ���ͱ�ʶ
	 	odd = 0.01, 			--���ּ���
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						30505178,
					},
	},
	--��ɫ������
	{
		itemType = 5, 	--��ɫ������to� � ���ͱ�ʶ
	 	odd = 0.05, 		--���ּ���
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						10100005,10101005,10102005,10103005,10104005,10105005,
					},
	},
	--��ɫװ����
	{
		itemType = 6, 	--��ɫװ����to� � ���ͱ�ʶ
	 	odd = 0.05, 		--���ּ���
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						10110012,10110013,10110014,10111012,10111013,10111014,10112012,10112013,10112014,10113012,10113013,10113014,10120005,10121005,10122005,
					},
	},
	--���ݵ�
	{
		itemType = 7, 	--������to� � ���ͱ�ʶ
	 	odd = 0.04, 			--���ּ���
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						30501148,30501149,30501150,
					},
	},
	--��Ĺ�й�Y�u Quy�t
	{
		itemType = 8, 	--������to� � ���ͱ�ʶ
	 	odd = 0.01, 			--���ּ���
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c�ito� � ����
						 },
		idx = {	--��Ʒ���кű�
						30700200,
					},
	},
}

--�������ʱ��2006-8-21 17:33 �޸�Ϊ�ɹ��������ݽ���

--���ݱ�����������ҵ����ж�Ӧto� � ����
function x712532_GetTableIndexByOdd(tb)
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
function x712532_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--���������to� � ��ʧʱ��
	
	-- �������м�c�i��Ʒ
	local numIdx = x712532_GetTableIndexByOdd(x712532_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712532_g_DropNumTable[numIdx].num do
			--C�i n�y ��Ʒ��ngʲô����to� � ��Ʒ
			local showIdx = x712532_GetTableIndexByOdd(x712532_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--C�i n�y ����to� � ��Ʒ������ng��c�i
				dropNumIdx = x712532_GetTableIndexByOdd(x712532_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712532_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712532_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712532_g_DropTable[showIdx].idx[itemIdx]
						--��ӵ��������Ʒ������
						for k = 1, x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " Tr߶ng c�nh s� (" .. x .. ", " .. y .. ") t�o ra m�t v�t ph�m "..
											 "("..x712532_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end
						end
					end
				elseif(dropNumIdx and 9 == x712532_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712532_g_DropTable[showIdx].idx)))
					local petId = x712532_g_DropTable[showIdx].idx[petIdx]
					--������޵�����
					for k = 1, x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num do
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
				if(9 ~= x712532_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("V�t ph�m b�n trong c� (lo�i "..x712532_g_DropTable[showIdx].itemType..")"..
								x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								" m�t ["..itemName.."].")
					itemNum = x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "T� b�o s߽ng t�o ra");
				end
			end
			
		end -- end of for i = 1, x712532_g_DropNumTable[numIdx].num do
		
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
function x712532_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712532_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 �ȴ�����to� � server�Ի�ƽ̨
		print( sceneId .. " Tr߶ng c�nh s� "..x712532_g_TickCreate_Msg)
	end
end
--m�t �δ�����c�i����to� � ��ɺ�������****************************************************

--��ǰ������ʼ
function x712532_OnOpen( sceneId, selfId, targetId )
--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
end
--��ǰ��������


--���պ�����ʼ
function x712532_OnRecycle( sceneId, selfId, targetId )
--Tr� v�1,���� �i�m����
	return 1
end
--���պ�������

--�򿪺�����ʼ
function x712532_OnProcOver( sceneId, selfId, targetId )
end

--�򿪺�������
function x712532_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
