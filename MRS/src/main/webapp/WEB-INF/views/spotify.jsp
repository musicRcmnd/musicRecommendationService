<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="include/header.jsp" %>
	 <button id="togglePlay">Toggle Play</button>
	<section>
	
		code: <p>${code}</p>	
	
	
	</section>
	
	
	
	 <%@ include file="include/footer.jsp"%>
	 
	 <script src="https://sdk.scdn.co/spotify-player.js"></script>
	 <script>
	 	console.log('${code}');
	 	let co = 'BQCEsylrUF2yXp4PESPUBifYLGNiUeJLuuxXbVFq4yUe6_gWYPqrrzaGUiA5wIN0DVZNwbyKIvC7RhEKE00S1UCKDhZ_F5KaGxNGt9G69Hu4PcLnX7hzECWsWHbV7_lY8jJiH7xUinEMZSmm4LqB-oaBGWppk4XBvDycYGuQl5vFu0LwHya9pqFV3YodqQTb7RpjDbaGwc8N-ueibVmSWpumiNWK';
        window.onSpotifyWebPlaybackSDKReady = () => {
            const token = co;
            const player = new Spotify.Player({
                name: 'Web Playback SDK Quick Start Player',
                getOAuthToken: cb => { cb(token); },
            });

            player.connect().then(success => {
            	  if (success) {
            	    console.log('The Web Playback SDK successfully connected to Spotify!');
            	  }
            	});
        }
	 
	 </script>
