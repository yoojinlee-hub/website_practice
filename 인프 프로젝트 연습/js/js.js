function checkDate(){
	var s=document.getElementById('date').value;
	var resDate= new Date(s);
	var today= new Date();
	var diff=resDate.getTime()-today.getTime();
	var days=Math.floor(diff/(1000*60*60*24));

	if(days>30)
		alert("30일 이후는 예약이 불가능 합니다.");
}