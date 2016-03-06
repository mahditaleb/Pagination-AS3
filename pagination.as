
	/**
	 * ...
	 * @author mahditaleb 
	 * Email: Mahditaleb1@yahoo.com
	 *  Use 9 Button(names:p0,p1,...,p8) in your Flash document. 
	 */
import flash.events.Event;
var startNumber = 0;
var currentPage = 1;
var lastTotal:Number=0
var LastCountPerPage:Number;
for(var i = 0; i < 9; i++ ) {
this["p" + i].visible = false;	
}
function pagination(total:Number,perPage:Number)
{
	lastTotal = total
	LastCountPerPage=perPage
	var pageCount:Number = Math.ceil(lastTotal / LastCountPerPage);
	if (pageCount > 1)
	{
		if (currentPage>1)
		{
			p0.visible = true;
			p0.addEventListener(MouseEvent.CLICK,newPage);
			p0.txt.text = "<";
		}
		else
		{
			p0.visible = false;
		}
		p8.visible = true;
		p8.addEventListener(MouseEvent.CLICK,newPage);
		p8.txt.text = ">";

	}
	var tmp = pageCount;
	if (pageCount > 7)
	{
		tmp = 7;
	}
	for (var i = 1; i <= tmp; i++)
	{
		this['p' + i].visible = true;
		this['p' + i].addEventListener(MouseEvent.CLICK,newPage);
		this['p' + i].txt.text = i;
	}
	p1.gotoAndStop(2);
	if (pageCount > 7)
	{
		p6.txt.text = "...";
		p6.removeEventListener(MouseEvent.CLICK,newPage);
		p7.txt.text = String(pageCount);
	}
	else
	{
		this['p' + i].visible = true;
		this['p' + i].txt.text = ">";
		p8.visible = false;
	}
}

function newPage(e:Event)
{
	if (e.target.parent.txt.text == "...")
	{
		return;
	}
	else if (e.target.parent.txt.text == "<")
	{
		--currentPage;
	}
	else if (e.target.parent.txt.text == ">")
	{
		++currentPage;
	}
	else
	{
		currentPage = Number(e.target.parent.txt.text);
	}
	startNumber = currentPage * LastCountPerPage;
	var pageCount:Number = Math.ceil(lastTotal / LastCountPerPage);
	if (currentPage>1)
	{
		p0.visible = true;
		p0.txt.text = "<";
	}
	else
	{
		p0.visible = false;
	}
	if (currentPage<pageCount)
	{
		p8.visible = true;
		p8.txt.text = ">";
	}
	else
	{
		p8.visible = false;
	}
	if (currentPage>=5)
	{
		p2.txt.text = "...";
		p2.visible = true;
		p3.txt.text = String(currentPage - 1);
		p3.visible = true;
		p4.txt.text = currentPage;
		p4.visible = true;

		if (pageCount==currentPage+1)
		{
			p5.txt.text = String(currentPage + 1);
			p5.visible = true;
			p6.visible = false;
			p7.visible = false;
			p8.visible = false;
		}
		else if (pageCount>currentPage+1)
		{
			p5.txt.text = String(currentPage + 1);
			p5.visible = true;
			p6.txt.text = "...";
			p6.visible = true;
			p7.txt.text = String(pageCount);
			p7.visible = true;
		}
		else
		{
			p5.visible = false;
			p6.visible = false;
			p7.visible = false;
			p8.visible = false;
		}
	}
	else
	{
		pagination(lastTotal,LastCountPerPage);
	}

	for (var i=0; i<9; i++)
	{
		if (currentPage == Number(this["p"+i].txt.text))
		{
			this["p" + i].gotoAndStop(2);
		}
		else
		{
			this["p" + i].gotoAndStop(1);
		}
	}
	
	//action
	action(currentPage)
}
