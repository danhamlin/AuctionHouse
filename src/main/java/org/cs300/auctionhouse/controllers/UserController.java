package org.cs300.auctionhouse.controllers;

import java.util.List;

import org.cs300.auctionhouse.domain.Feedback;
import org.cs300.auctionhouse.domain.User;
import org.cs300.auctionhouse.services.Services;
import org.cs300.auctionhouse.ui.UserPersonalInfo;
import org.cs300.auctionhouse.validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class UserController {

	@Autowired
	protected Services services;
	@Autowired
	private UserValidator userValidator;

	@RequestMapping(value = "/user/add", method = RequestMethod.GET)
	public String addUserForm(Model model) {
		UserPersonalInfo upi = new UserPersonalInfo();
		model.addAttribute("upi", upi);
		return "user/add";
	}

	@RequestMapping(value = "/user/add", method = RequestMethod.POST)
	public String addUserSubmit(@ModelAttribute("upi") UserPersonalInfo upi,
			BindingResult result, SessionStatus status) {
		userValidator.validate(upi, result);
		if (result.hasErrors()) {
			return "user/add";
		} else {
			services.createUser(upi.getUser(), upi.getPersonalInfo());
			return "redirect:success";
		}
	}

	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public String updateUserForm(Model model) {
		UserPersonalInfo upi = new UserPersonalInfo();
		User user = services.findByName(SecurityContextHolder.getContext()
				.getAuthentication().getName());
		upi.setUser(user);
		upi.setPersonalInfo(user.getPersonalInfos().get(0));
		model.addAttribute("upi", upi);
		return "user/update";
	}

	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String updateUserSubmit(@ModelAttribute("upi") UserPersonalInfo upi,
			BindingResult result, SessionStatus status) {
		
		return "redirect:success";
	}

	@RequestMapping(value = "/user/success", method = RequestMethod.GET)
	public String addUserSuccess() {
		return "user/success";
	}

	@RequestMapping(value = "/user/feedback/{username}")
	public String userFeedback(@PathVariable("username") String username,
			Model model) {
		List<Feedback> feedbackIn = services.getFeedbackByUser(username);
		List<Feedback> feedbackOut = services.getFeedbackForUser(username);
		model.addAttribute("feedbackIn", feedbackIn);
		model.addAttribute("feedbackOut", feedbackOut);
		return "user/feedback";
	}
}
