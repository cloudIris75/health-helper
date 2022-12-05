function CheckAddRoutine() {
	var number = document.newRoutine.number;
	var sets = document.newRoutine.sets;
	var minutes = document.newRoutine.minutes;
	var seconds = document.newRoutine.seconds;
	
	if (number.value.length == 0 || isNaN(number.value)) {
		alert("운동 횟수는 숫자만 입력할 수 있어요!");
		number.focus();
		return false;
	}
	if (number.value < 0) {
		alert("운동 횟수는 양수만 입력할 수 있어요!");
		number.focus();
		return false;
	}
	
	if (sets.value.length == 0 || isNaN(sets.value)) {
		alert("운동 세트는 숫자만 입력할 수 있어요!");
		sets.focus();
		return false;
	}
	if (sets.value < 0) {
		alert("운동 세트는 양수만 입력할 수 있어요!");
		sets.focus();
		return false;
	}
	
	if (minutes.value.length == 0 || isNaN(minutes.value)) {
		alert("[운동 시간] 분은 숫자만 입력할 수 있어요!");
		minutes.focus();
		return false;
	}
	if (minutes.value < 0) {
		alert("[운동 시간] 분은 양수만 입력할 수 있어요!");
		minutes.focus();
		return false;
	}
	
	if (seconds.value.length == 0 || isNaN(seconds.value)) {
		alert("[운동 시간] 초는 숫자만 입력할 수 있어요!");
		seconds.focus();
		return false;
	}
	if (seconds.value < 0) {
		alert("[운동 시간] 초는 양수만 입력할 수 있어요!");
		seconds.focus();
		return false;
	}
	
	document.newRoutine.submit();
	
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alset(msg);
		e.focus();
		return false;
	}
}