package org.cs300.auctionhouse.controllers;

import java.util.List;

import org.cs300.auctionhouse.domain.Auction;
import org.cs300.auctionhouse.services.Services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//Spring will inject the services here we hope
	@Autowired
	protected Services services;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(Model model) {
		List<Auction> auctions = services.getAllAuctions();
		model.addAttribute("auctions", auctions);
		return "home";
	}
	
	
	@RequestMapping(value="/category/{id}", method=RequestMethod.GET)
	public String home(@PathVariable("id") int id, Model model) {
		List<Auction> auctions = services.getAuctionsByCategory(id);
		model.addAttribute("auctions", auctions);
		return "home";
	}
	
}

