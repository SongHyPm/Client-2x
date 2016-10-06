--��Ӧ�Ľű��źͺ�����
local scriptId = 300133
local functionName = "OnSudokuCheck"
local newtooltip=
{
	[0] = {Tooltip = "TJRW_100511_74"}
}

--�����ּ���Ӧ��ͼƬ 1-5Ϊ���5�����ֶ�Ӧ��ͼƬ��6-10Ϊ��Ҳ��ɸı��λ�õ�ͼƬ��11Ϊ��
local JiugongImage = {
	{1, "set:Tianji image:Tianji_1"},
	{2, "set:Tianji image:Tianji_2"},
	{3, "set:Tianji image:Tianji_3"},
	{4, "set:Tianji image:Tianji_4"},
	{5, "set:Tianji image:Tianji_5"},
--
	{1, "set:Tianji image:Tianji_1_lock"},
	{2, "set:Tianji image:Tianji_2_lock"},
	{3, "set:Tianji image:Tianji_3_lock"},
	{4, "set:Tianji image:Tianji_4_lock"},
	{5, "set:Tianji image:Tianji_5_lock"},
--
	{0, "set:Tianji image:Tianji_0"}, --����հ�
}

--��ʮ����ؼ���
local JiugongSet = {}

--�ӷ������õ��Ķ�ʮ�������ĳ�ʼ����
local JiugongNumber = {}

--��ǰ��ʮ������������
local JiugongCurr = {}

--�ͻ��˲����������õ�������
local sudoku = {}
local times = {}
local num = {}
local result = {}

function Jiugong_PreLoad()
	this:RegisterEvent("UI_COMMAND");
end

function Jiugong_OnLoad()
	this:Hide()
	Jiugong_Clear()
end

function Jiugong_OnEvent(event)

	if ( event == "UI_COMMAND" and tonumber(arg0) == 20100516) then
		--�����ȷ���رս���
		Jiugong_Close()
	end

	if ( event == "UI_COMMAND" and tonumber(arg0) == 20100515) then
		--�򿪽��棬���ݴ���Ĳ�����д����ͼƬ��״̬
		GetSudoku()
		--�ڴ˴����C++�ӿڵ��ã���25�����ӵ������ĸ������н����,����������������
		local i = 1
		while i <= 25 do
--			JiugongNumber[i] = UnPack_Sudoku(i, s1, s2, s3, s4)
			JiugongCurr[i] = JiugongNumber[i]
			i = i + 1
		end
		--
		--������������ͼƬ(���½���)
		Jiugong_Draw(0, 0, 0)

		this:Show()
	end

	if ( event == "UI_COMMAND" and tonumber(arg0) == 20100518) then
		--��ҵ����С��������֣�������������ͼƬ
		local index = tonumber(arg2)
		local value = tonumber(arg1)

		if value > 5 or value < 1 or index < 1 or index > 25 then
			return 0
		end
		
		--��������ǲ����޸ĵģ�����ʾ���
		if JiugongNumber[index] ~= 0 then
			PushDebugMessage("#{TJRW_100511_74}")
			return
		end

		--������������ͼƬ(���½���)
		Jiugong_Draw(1, index, value)

	end

end

--=========================================================
--���ý���
--=========================================================
function Jiugong_Clear() 
	Jiugong_DragTitle:SetText("")
	Jiugong_Text:SetText("#{TJRW_100511_29}")

	--��ʼ��25������
	JiugongSet[1] = Jiugong_Image01
	JiugongSet[2] = Jiugong_Image02
	JiugongSet[3] = Jiugong_Image03
	JiugongSet[4] = Jiugong_Image04
	JiugongSet[5] = Jiugong_Image05	
	JiugongSet[6] = Jiugong_Image06
	JiugongSet[7] = Jiugong_Image07
	JiugongSet[8] = Jiugong_Image08
	JiugongSet[9] = Jiugong_Image09
	JiugongSet[10] = Jiugong_Image10
	JiugongSet[11] = Jiugong_Image11
	JiugongSet[12] = Jiugong_Image12
	JiugongSet[13] = Jiugong_Image13
	JiugongSet[14] = Jiugong_Image14
	JiugongSet[15] = Jiugong_Image15
	JiugongSet[16] = Jiugong_Image16
	JiugongSet[17] = Jiugong_Image17
	JiugongSet[18] = Jiugong_Image18
	JiugongSet[19] = Jiugong_Image19
	JiugongSet[20] = Jiugong_Image20
	JiugongSet[21] = Jiugong_Image21
	JiugongSet[22] = Jiugong_Image22
	JiugongSet[23] = Jiugong_Image23
	JiugongSet[24] = Jiugong_Image24
	JiugongSet[25] = Jiugong_Image25
	
	local i = 1
	while i <= 25 do
		JiugongSet[i]:SetProperty("Image", JiugongImage[11][2]);	--����Ϊ�հ�ͼƬ
		JiugongCurr[i] = 0
		JiugongNumber[i] = 0
		i = i + 1
	end
end

--=========================================================
--���½���
--=========================================================
function Jiugong_Update( pos_ui, pos_packet )

end

--=========================================================
--�ر�
--=========================================================
function Jiugong_Close()
	this:Hide()
	PushEvent("UI_COMMAND", 20100520);
	Jiugong_Clear()
end

--=========================================================
--��������
--=========================================================
function Jiugong_OnHide()
	this:Hide()
	PushEvent("UI_COMMAND", 20100520);
	Jiugong_Clear()
end

--=========================================================
--�ػ�����
--=========================================================
function Jiugong_Draw( flag, index, value )
	--flagΪ0�ǵ�һ����ʾ��flagΪ1������ĳ������
	if flag == 0 then
		local i = 1
		while i <= 25 do
			JiugongCurr[i] = 0
			i = i + 1
		end
		i = 1
		while i <= 25 do
			JiugongSet[i]:SetProperty("Image", JiugongImage[11][2]);	--����Ϊ�հ�ͼƬ
			JiugongSet[i]:SetToolTip(GetDictionaryString("TJRW_100511_73"))--��ȫ��Ϊ����������������֡�
			if JiugongNumber[i] ~= 0 then
				JiugongSet[i]:SetToolTip(GetDictionaryString(newtooltip[0].Tooltip))--����ʼ�ļ����ĳɡ��㲻���޸�...��
				JiugongCurr[i] = JiugongNumber[i]
				for j, v in JiugongImage do
					if j > 5 and v[1] == JiugongNumber[i] then
						JiugongSet[i]:SetProperty("Image", v[2])
						break
					end
				end
			end
			i = i + 1
		end
	elseif flag == 1 then
		--�������ֺ�ͼƬ
		JiugongCurr[index] = value		
		for j, v in JiugongImage do
			if j <= 5 and v[1] == value then
				JiugongSet[index]:SetProperty("Image", v[2])
				break
			end
		end
	end
end

--=========================================================
--��д����
--=========================================================
function Jiugong_Add(index)
	if JiugongNumber[index] ~= 0 then
--		PushDebugMessage("�����ܸı��������")
		return
	end
--��Ӵ�����
--	PushDebugMessage(index)
	PushEvent("UI_COMMAND", 20100519, index);
end

--=========================================================
--�ύ��Ŀ
--=========================================================
function Jiugong_Confirm()
	--�ύǰ��Ҫ���
	
	--����Ƿ�����
	local i = 1
	while i <= 25 do
		if JiugongCurr[i] == 0 then
			PushDebugMessage("#{TJRW_100511_30}")
			return
		end
		i = i + 1
	end
	
	--�����д�Ƿ���ȷ
	i = 1
	while i <= 25 do
		if Jiugong_Check(i) ~= 1 then
			PushDebugMessage("#{TJRW_100511_30}")
			return
		end
		i = i + 1
	end
	

	--�ύ
	Clear_XSCRIPT();--����������ʾ��Ϣ
	Set_XSCRIPT_Function_Name(functionName);
	Set_XSCRIPT_ScriptID(scriptId);
--	Set_XSCRIPT_Parameter(0,1);
	Set_XSCRIPT_ParamCount(0);
	Send_XSCRIPT();
end

--=========================================================
--������Ŀ
--=========================================================
function Jiugong_Reset()
	Jiugong_Draw(0, 0, 0)
end

--=========================================================
--�����
--=========================================================
function Jiugong_Check(index)
	--���жϸ��л��߸����Ƿ��Ѿ���д�������
	value = JiugongCurr[index]
	local arr = math.floor((index - 1) / 5) + 1
	local row = math.mod(index, 5)
	if row == 0 then
		row = 5
	end
	local start = 5 * (arr - 1) + 1
	local stop = start + 4
	local i = start
	while i <= stop do
		local curr = JiugongCurr[i]
		if curr == value and i ~= index then
--			PushDebugMessage("������ֲ��ܷ������")
--			PushEvent("UI_COMMAND", 20100519, index)
			return 0
		end
		i = i + 1
	end
	i = 0
	while i <= 4 do
		local curr = JiugongCurr[5 * i + row]
		if curr == value and (5 * i + row) ~= index then
--			PushDebugMessage("������ֲ��ܷ������")
--			PushEvent("UI_COMMAND", 20100519, index)
			return 0
		end
		i = i + 1
	end
	return 1
end

--=========================================================
--�����ǿͻ����õ��������㷨����
--=========================================================
function GetSudoku()
	Sudoku_Init()
	Sudoku_Sudoku()
	Sudoku_Generate()
	Sudoku_Output()
end

function Sudoku_Init()
	local i = 1
	while i <= 25 do
		sudoku[i] = 0
		times[i] = 0
		local j = 1;
		while j <= 5 do
			num[i][j] = j
			j = j + 1
		end
		i = i + 1
	end
	return
end

function Sudoku_Sudoku()
	local i = 1
	while i <= 25 do
		sudoku[i] = Sudoku_GetNum(i)
		if sudoku[i] == 0 then
			times[i] = 0
			i = i - 2
		elseif Sudoku_Check(i) == 0 then
			i = i - 1
		end
		i = i + 1
	end
	return
end

function Sudoku_GetNum(i)
	if times[i] == 5 then
		return 0
	end
	local pos = 5-times[i]
	local index = math.random(1, pos)
	local tmp = num[i][5 - times[i]]
	num[i][5 - times[i]] = num[i][index]
	num[i][index] = tmp
	tmp = num[i][5 - times[i]]
	times[i] = times[i] + 1
	return tmp
end

function Sudoku_Check(pos)
	local value = sudoku[pos]
	local row = math.floor((pos - 1)/5)
	local col = math.mod((pos -1), 5)
	local start = 5 * row + 1
	local endl = start + 4
	local i = start
	while i <= endl do
		if pos ~= i and value == sudoku[i] then
			return 0
		end
		i = i + 1
	end
	i = 0
	while i <=4 do
		if pos ~= i*5 + col + 1 and value == sudoku[i*5+col+1] then
			return 0
		end
		i = i + 1
	end
	return 1
end

function Sudoku_Output()
	local i = 1
	while i <= 25 do
		JiugongNumber[i] = result[i]
--		JiugongNumber[i] = sudoku[i]
		i = i + 1
	end
end

function Sudoku_Exchange()
	--�������������Խ��о���任��������Բο��������˵��������룬�ͻ�����ʱ����
end

function Sudoku_Generate()
	local i = 1
	while i <= 25 do
		result[i] = 0
		i = i + 1
	end
	i = 1
	while i <= 10 do
		local index = math.random(1, 25)
		while result[index] ~= 0 or Sudoku_CheckResult(index) == 0 do
			index = math.random(1, 25)
		end
		result[index] = sudoku[index]
		i = i + 1
	end
end

function Sudoku_CheckResult(pos)
	local row = math.floor((pos - 1)/5)
	local col = math.mod((pos -1), 5)
	local start = 5 * row + 1
	local endl = start + 4
	local totalrow = 0
	local totalcol = 0
	local i = start
	while i <= endl do
		if result[i] ~= 0 then
			totalrow = totalrow + 1
		end
		i = i + 1
	end
	i = 0
	while i <=4 do
		if result[i*5+col+1] ~= 0 then
			totalcol = totalcol + 1
		end
		i = i + 1
	end
	if totalrow >= 3 or totalcol >= 3 then
		return 0
	end
	return 1
end