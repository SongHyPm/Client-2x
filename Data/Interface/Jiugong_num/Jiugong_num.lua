
--ƴͼ���Ƽ���ӦͼƬ
local JiugongImage = {
	{1, "set:Choujiang image:Choujiang_14"},
	{2, "set:Choujiang image:Choujiang_15"},
	{3, "set:Choujiang image:Choujiang_12"},
	{4, "set:Choujiang image:Choujiang_16"},
	{5, "set:Choujiang image:Choujiang_13"},
}

--��¼������Ǵ�������ĸ�λ��
local pos = 0

function Jiugong_num_PreLoad()
	this:RegisterEvent("UI_COMMAND");
end

function Jiugong_num_OnLoad()
	this:Hide()
--	Jiugong_num_Image01:SetProperty("Image", JiugongImage[1][2])
--	Jiugong_num_Image02:SetProperty("Image", JiugongImage[2][2])
--	Jiugong_num_Image03:SetProperty("Image", JiugongImage[3][2])
--	Jiugong_num_Image04:SetProperty("Image", JiugongImage[4][2])
--	Jiugong_num_Image05:SetProperty("Image", JiugongImage[5][2])
end

function Jiugong_num_OnEvent(event)

	if ( event == "UI_COMMAND" and tonumber(arg0) == 20100519) then
			pos = tonumber(arg1)
			this:Show()
	end
	if ( event == "UI_COMMAND" and tonumber(arg0) == 20100520) then
			this:Hide()
	end

end

--=========================================================
--���ý���
--=========================================================
function Jiugong_num_Clear() 

end

--=========================================================
--���½���
--=========================================================
function Jiugong_num_Update( pos_ui, pos_packet )

end

--=========================================================
--�ر�
--=========================================================
function Jiugong_num_Close()
	this:Hide()
end

--=========================================================
--��������
--=========================================================
function Jiugong_num_OnHide()
	this:Hide()
end

--=========================================================
--ѡ������
--=========================================================
function Jiugong_num_Add(index) 
	PushEvent("UI_COMMAND", 20100518, index, pos);
	Jiugong_num_Close()
end
function Jiugong_Close()
	this:Hide()
end