<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="include/header.jsp" %>
	<section>
		<h1>여기는 section</h1>
		<table>
			<thead>
				<tr>
					<td>기준 일자</td>
					<td>기준 시각</td>
					<td>기준 X좌표</td>
					<td>기준 Y좌표</td>
					<td>값</td>
				</tr>
			</thead>
			<tbody>
				<tr id="resultRow">
					<td>test</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</section>
    
    <%@ include file="include/footer.jsp"%>

	<script>

		window.onload = () => {
			
			const rsRow = [...document.querySelectorAll('#resultRow *')];

			let xhr = new XMLHttpRequest();
			// let date = new date();
			let currentDate = "20230522";
			let currentTime = "1700";

			let url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
			let queryParams = '?' + encodeURIComponent('serviceKey') + '='
			+'biMFKPX2rMio1vYOKily9qXhvrK7ATHwXvrB%2FUi4f0x9jTnToB%2BOzwAOK81JSQHiqe1WZGA6FL%2BIdr0p3%2F%2F%2BJA%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*pageNo*/
			queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
			queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
			queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(currentDate); /**/
			queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent(currentTime); /**/
			queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
			queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
			
			/* const reqObj = {
	                method: 'post',
	                headers: {
	                    'Content-Type':'application/json'
	                },
	                body: JSON.stringify({
	                    'category' : "category",
	                    'obsrValue' : "obsrValue"
	                })
	            } */
			fetch(url+queryParams).then(res => res.json())
			.then(data => {
				console.log(data.response.body.items.item);
				console.log(data);
				console.log(data.response.body.items.item[0].category);
				console.log(rsRow[0]);
				rsRow[0].textContent = data.response.body.items.item[7].baseDate;
				rsRow[1].textContent = data.response.body.items.item[7].baseTime;
				rsRow[2].textContent = data.response.body.items.item[7].nx;
				rsRow[3].textContent = data.response.body.items.item[7].ny;
				rsRow[4].textContent = data.response.body.items.item[7].obsrValue;
				//초단기예보로 바꾸고 기온,하늘상태,강수형태 받자
				console.log(rsRow[0].textContent);
				console.log(data.response.body.items.item[7].obsrValue);
			});


		}



	</script>