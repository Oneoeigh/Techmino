return{
	name={
		"隐形",
		"隐形",
		"Blind",
	},
	level={
		"半隐",
		"半隐",
		"HALF",
	},
	info={
		"最强大脑",
		"最强大脑",
		"Invisible board",
	},
	color=color.cyan,
	env={
		drop=30,lock=45,
		visible="time",
		dropPiece=Event.reach_winCheck,
		freshLimit=10,
		target=200,
		bg="glow",bgm="newera",
	},
	load=function()
		newPlayer(1,340,15)
	end,
	mesDisp=function(P,dx,dy)
		mDraw(drawableText.line,-82,300)
		mDraw(drawableText.techrash,-82,420)
		setFont(75)
		mStr(P.stat.row,-82,220)
		mStr(P.stat.clear_4,-82,340)
	end,
	score=function(P)return{P.stat.row<=200 and P.stat.row or 200,P.stat.time}end,
	scoreDisp=function(D)return D[1].." Lines   "..toTime(D[2])end,
	comp=function(a,b)return a[1]>b[1]or a[1]==b[1]and a[2]<b[2]end,
	getRank=function(P)
		local L=P.stat.row
		if L>=200 then
			local T=P.stat.time
			return
			T<=140 and 5 or
			T<=200 and 4 or
			3
		else
			return
			L>=150 and 3 or
			L>=100 and 2 or
			L>=40 and 1 or
			L>=1 and 0
		end
	end,
}