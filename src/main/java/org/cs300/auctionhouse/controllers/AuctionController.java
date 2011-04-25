package org.cs300.auctionhouse.controllers;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;

import org.cs300.auctionhouse.domain.Auction;
import org.cs300.auctionhouse.domain.Bid;
import org.cs300.auctionhouse.domain.Category;
import org.cs300.auctionhouse.domain.Feedback;
import org.cs300.auctionhouse.domain.User;
import org.cs300.auctionhouse.services.Services;
import org.cs300.auctionhouse.ui.AuctionFileData;
import org.cs300.auctionhouse.validators.AuctionValidator;
import org.cs300.auctionhouse.validators.BidValidator;
import org.cs300.auctionhouse.validators.FeedbackValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({"auction", "bid", "afd", "fb"})
public class AuctionController {

	@Autowired
	protected Services services;
	@Autowired
	private AuctionValidator auctionValidator;
	@Autowired
	private BidValidator bidValidator;
	@Autowired
	private FeedbackValidator feedbackValidator;

    @ModelAttribute("categories")
    public List<Category> populateCategories() {
        return services.getAllCategories();
    }

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Category.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(services.getCategoryByID(Integer.valueOf(text)));
			}
		});
	}

	@RequestMapping(value = "/auction/{id}", method = RequestMethod.GET)
	public String auction(@PathVariable("id") int id, Model model) {
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		Auction auction = services.getAuctionByID(id);
		//figure out which feedback is which, this could use some refactoring
		if (!auction.getFeedbacks().isEmpty()) {
			List<Feedback> fb = auction.getFeedbacks();
			Feedback buyerFB, sellerFB;
			if (fb.size() == 1) {
				if (fb.get(0).getAuction().getUser().getUsername().equals(fb.get(0).getUser().getUsername())) {
					buyerFB = fb.get(0);
					sellerFB = null;
				} else {
					buyerFB = null;
					sellerFB = fb.get(0);
				}
			} else {
				if (fb.get(0).getAuction().getUser().getUsername().equals(fb.get(0).getUser().getUsername())) {
					buyerFB = fb.get(0);
					sellerFB = fb.get(1);
				} else {
					buyerFB = fb.get(1);
					sellerFB = fb.get(0);
				}
			}
			model.addAttribute("buyerFB", buyerFB);
			model.addAttribute("sellerFB", sellerFB);
		}
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("auction", auction);
		Bid bid = new Bid();
		bid.setAuction(auction);
		model.addAttribute("bid", bid);
		return "auction/auction";
	}
	
	@RequestMapping(value = "/auction/{id}", method = RequestMethod.POST)
	public String auctionSubmit(@PathVariable("id") int id, @ModelAttribute("bid") Bid bid, BindingResult result, SessionStatus status) {
		bidValidator.validate(bid, result);
		if (result.hasErrors()) {
			return "auction/auction";
		} else {
			bid.setUser(services.findByName(SecurityContextHolder.getContext().getAuthentication().getName()));
			bid.setTime(new Date());
			services.saveNewBid(bid);
			status.setComplete();
			return "redirect:" + id + "/bidsuccess";
		}
	}

	@RequestMapping(value = "/auction/{id}/bidsuccess", method = RequestMethod.GET)
	public String bidSuccess(@PathVariable("id") int id, Model model) {
		model.addAttribute("id", id);
		return "auction/bidsuccess";
	}

	@RequestMapping(value = "/auction/add", method = RequestMethod.GET)
	public String addAuctionForm(Model model) {
		AuctionFileData afd = new AuctionFileData();
		model.addAttribute("afd", afd);
		return "auction/add";
	}

	@RequestMapping(value = "/auction/add", method = RequestMethod.POST)
	public String addAuctionSubmit(@ModelAttribute("afd") AuctionFileData afd, BindingResult result, SessionStatus status) {
		auctionValidator.validate(afd, result);
		if (result.hasErrors()) {
			return "auction/add";
		} else {
			User user = services.findByName(SecurityContextHolder.getContext().getAuthentication().getName());
			afd.getAuction().setUser(user);
			afd.getAuction().setPicture(afd.getFile().getBytes());
			int id = services.saveNewAuction(afd.getAuction());
			status.setComplete();
			return "redirect:addsuccess?id=" + id;
		}
	}

	@RequestMapping(value = "auction/addsuccess", method = RequestMethod.GET)
	public String auctionSuccess(@RequestParam("id") int id, Model model) {
		model.addAttribute("id", id);
		return "auction/addsuccess";
	}

	@RequestMapping(value = "/auction/{id}/close", method = RequestMethod.GET)
	public String feedback(@PathVariable("id") int id, @RequestParam("sold") boolean sold, Model model) {
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		Auction auction = services.getAuctionByID(id);
		model.addAttribute("id", id);
		if (currentUser.equals(auction.getUser().getUsername())) {
			auction.setFinished(true);
			if (sold) auction.setSold(true);
			services.updateAuction(auction);
			return "auction/success";
		} else
			return "auction/failure";
	}

	@RequestMapping(value = "/auction/{id}/feedback/add", method = RequestMethod.GET)
	public String feedbackForm(@PathVariable("id") int id, Model model) {
		Auction auction = services.getAuctionByID(id);
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		String auctionWinner = services.getHighBidByAuction(id).getUser().getUsername();
		if (currentUser.equals(auctionWinner) || currentUser.equals(auction.getUser().getUsername())) {
			Feedback feedback = new Feedback();
			feedback.setAuction(auction);
			feedback.setUser(services.findByName(currentUser));
			boolean forSeller = !(currentUser.equals(auction.getUser().getUsername()));
			model.addAttribute("fb", feedback);
			model.addAttribute("currentUser", currentUser);
			model.addAttribute("auctionWinner", auctionWinner);
			model.addAttribute("forSeller", forSeller);
			return "auction/feedbackadd";
		} else
			return "auction/feedbackfailure";
	}

	@RequestMapping(value = "/auction/{id}/feedback/add", method = RequestMethod.POST)
	public String feedbackSubmit(@PathVariable("id") int id, @ModelAttribute("fb") Feedback feedback, BindingResult result, SessionStatus status) {
		feedbackValidator.validate(feedback, result);
		if (result.hasErrors()) {
			return "auction/feedbackadd";
		} else {
			services.saveFeedback(feedback);
			status.setComplete();
			return "redirect:success";
		}
	}

	@RequestMapping(value = "/auction/{id}/feedback/success", method = RequestMethod.GET)
	public String feedbackSuccess(@PathVariable("id") int id, Model model) {
		model.addAttribute("id", id);
		return "auction/feedbacksuccess";
	}
}