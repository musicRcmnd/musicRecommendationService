<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="include/header.jsp" %>
	<link rel="alternate" type="application/json+oembed" href="https://open.spotify.com/oembed?url=https://open.spotify.com/album/4ghBzVOTFoeKPPmyNKjVtI" />
	
	<section>
		<button id="togglePlay">Toggle Play</button>
		<h1>여기는 section</h1>
		<table>
			<thead>
				<tr>
					<td>기준 일자</td>
					<td>기준 시각</td>
					<td>하늘 형태</td>
					<td>강수 형태</td>
					<td>기온</td>
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



		<iframe style="border-radius: 12px" width="200" height="152" title="Spotify Embed: My Path to Spotify: Women in Engineering " frameborder="0" allowfullscreen allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy" src="https://open.spotify.com/embed/album/4ghBzVOTFoeKPPmyNKjVtI?utm_source=oembed"?utm_source=oembed"></iframe>
		
		
	</section>
    
    <%@ include file="include/footer.jsp"%>
	 <script src="https://sdk.scdn.co/spotify-player.js"></script>
	<script>

		window.onload = () => {
			
			const rsRow = [...document.querySelectorAll('#resultRow *')];

			// let date = new date();
			let currentDate = "20230522";
			let currentTime = "1700";
			let key = 'biMFKPX2rMio1vYOKily9qXhvrK7ATHwXvrB%2FUi4f0x9jTnToB%2BOzwAOK81JSQHiqe1WZGA6FL%2BIdr0p3%2F%2F%2BJA%3D%3D';
			let nX = '55';
			let nY = '127';
			
			let temper,sky,pty; // 기온, 하늘상태, 강수형태
			
			let url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst'; /*URL*/
			let queryParams = '?serviceKey='+key
					+'&pageNo=1&numOfRows=25&dataType=JSON'
					+'&base_date='+currentDate
					+'&base_time='+currentTime
					+'&nx='+nX
					+'&ny='+nY
			
			fetch(url+queryParams).then(res => res.json())
				.then(data =>{
					console.log(data);
					console.log(data.response);
					console.log(data.response.body);
					console.log(data.response.body.items);
					console.log(data.response.body.items.item);
					let rs = data.response.body.items.item;
					
					console.log(rs[6].fcstValue); //강수 형태
					pty=rs[6].fcstValue; //강수 형태
					console.log(rs[18].fcstValue); //하늘 형태
					sky=rs[18].fcstValue
					console.log(rs[24].fcstValue); //하늘 형태
					temper=rs[24].fcstValue

					rsRow[0].textContent=currentDate;
					rsRow[1].textContent=currentTime;
					rsRow[2].textContent=sky;
					rsRow[3].textContent=pty;
					rsRow[4].textContent=temper;
					
				});



		}

		// document.getElementById('spotify').addEventListener('click',function(){

		// 	var client_id = '61195beb56f14da19d09a1b3b6216b90';
		// 	var redirect_uri = 'http://localhost:8181/spotify';

		// 	var app = express();

		// 	app.get('/login', function(req, res) {

		// 	var state = generateRandomString(16);
		// 	var scope = 'user-read-private user-read-email';

		// 	res.redirect('https://accounts.spotify.com/authorize?' +
		// 		querystring.stringify({
		// 		response_type: 'code',
		// 		client_id: client_id,
		// 		scope: scope,
		// 		redirect_uri: redirect_uri,
		// 		state: state
		// 		}));
		// 	});


		// });

		/* let client_id = '61195beb56f14da19d09a1b3b6216b90';
		let redirect_uri = 'https://localhost:8181/spotify';

		window.location.href = 'https://accounts.spotify.com/authorize?'+client_id;
 */
 


 	let co = 'BQDvTmStiUYUl8sn7HLAJe7V1EqWsWhhxXfebljUzc0Y50ZggviAFu1GRNm8tJF1jy7esrdj2VI1Rk-ZdVY6aFpr_USBSbEY-j-U52xnhgbAo99yY8axXdxdMSmKjhctmKfpeYcv9QhQqtAPUik2jU9Pm3Lxyc-z4AIf1RrsqvCWcGgp32MZ8XyeCrmeps2a7LrU_R6vozGoYGUab7NGs4psDuQ9';
    window.onSpotifyWebPlaybackSDKReady = () => {
        const token = co;
        const player = new Spotify.Player({
            name: 'Web Playback SDK Quick Start Player',
            getOAuthToken: cb => { cb(token); },
            volume: 0.5
        });

        // Ready
        player.addListener('ready', ({ device_id }) => {
            console.log('Ready with Device ID', device_id);
        });

        // Not Ready
        player.addListener('not_ready', ({ device_id }) => {
            console.log('Device ID has gone offline', device_id);
        });

        player.addListener('initialization_error', ({ message }) => {
            console.error(message);
        });

        player.addListener('authentication_error', ({ message }) => {
            console.error(message);
        });

        player.addListener('account_error', ({ message }) => {
            console.error(message);
        });

        document.getElementById('togglePlay').onclick = function() {
          player.togglePlay();
        };

        player.connect();
    }

	</script>