package com.music.mrs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.mrs.spotify.service.ISpotifyService;

@Controller
@RequestMapping("/spotify")
public class SpotifyController {
	
	@Autowired
	private ISpotifyService service;
	
	@GetMapping("/code")
	public String getCode(String code) {
		System.out.println(code);
		return "spotify";
	}

}
