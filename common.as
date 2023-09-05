;//////////�����ݒ�//////////
*IniCom
	#define STA_OPENING	0	;�I�[�v�j���O
	#define STA_TITLE		1	;�^�C�g��
	#define STA_INIT		2	;�X�e�[�W������
	#define STA_PLAY		3	;�Q�[���v���[��
	#define STA_ENDING	4	;�G���f�B���O
	#define STA_PAUSE	5	;�|�[�Y

	GameSta=STA_TITLE

	randomize
	gsel 0,-1
	gsel 1,2 : color 0,0,0 : boxf 0,0,640,480
	bgscr 7,300,300,1,170,90	;�Q�[���E�B���h�E
	picload "title.bmp"

	buffer 2,300,300,1 : palcopy 7	;�w�i
	color 20,20,0
	boxf 0,0,300,300
	repeat 300
		rnd x,300 : rnd y,300 : rnd a,100 : rnd b,100 : rnd c,100
		color 255-a,255-b,255-c
		pset x,y
	loop

	buffer 3,1000,1000,1			;�r�b�g�}�b�v�ǂݍ��ݗp�E�B���h�E
	picload "player.bmp",1,0,0
	picload "effect.bmp",1,0,80
	picload "enesht.bmp",1,0,130
	picload "etc.bmp",1,0,170

	MaxStage=1

	return

;//////////�w�i//////////
*BackGround
	BG2=300-BG1
	pos 0,0
	gcopy 2,0,BG2,300,BG1
	pos 0,BG1
	gcopy 2,0,0,300,BG2
	BG1++
	if BG1=300 : BG1-=300
	return

;//////////�X�e�[�^�X�\��//////////
*disp
	pos 0,0 : gcopy 3,17,186,45,16
	a=Score : x=0 : y=170
	repeat 8
		pos -cnt*8+100,0
		gcopy 3,a\10*8+x,y,8,16
		a=a/10
		if a=0 : x=64 : y=186
	loop
	pos 173,0 : gcopy 3,0,186,62,16
	a=HiScore : x=0 : y=170
	repeat 8
		pos -cnt*8+290,0
		gcopy 3,a\10*8+x,y,8,16
		a=a/10
		if a=0 : x=64 : y=186
	loop
	pos 0,284 : gcopy 3,0,218,40,16;
	pos 40,288 : gcopy 3,0,264,80,12
	pos 40,288 : gcopy 3,0,254,LsrPow/4,12
	pos 200,284 : gcopy 3,0,202,45,16
	if PlyShield!0 {
		repeat PlyShield
			pos cnt*8+245,284
			gcopy 3,72,186,8,16
		loop
	}
	return