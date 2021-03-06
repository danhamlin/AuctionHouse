package org.cs300.auctionhouse.validators;

import org.cs300.auctionhouse.domain.Bid;
import org.cs300.auctionhouse.services.Services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class BidValidator implements Validator {

	@Autowired
	protected Services services;

	public boolean supports(Class<?> arg0) {
		return Bid.class.isAssignableFrom(arg0);
	}

	public void validate(Object target, Errors errors) {
		
		Bid bid = (Bid)target;
		int id = bid.getAuction().getIdAuction();
		Bid highBid = services.getHighBidByAuction(id);
		
		//check if user did enter amount.	
		if (!services.getAuctionByID(id).getUser().getUsername().equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amount", "", "You must enter a bid amount.");
		}
		//check that user is not bidding on their own auction
		if (services.getAuctionByID(id).getUser().getUsername().equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
			errors.rejectValue("amount", "", "You cannot bid on your own auction.");
			//skip the last couple checks because they don't matter at this point
			return;
		}
		if (highBid != null && bid.getAmount() != null) {
			//check that user is not same as last bid
			if (highBid.getUser().getUsername().equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
				errors.rejectValue("amount", "", "You already have the high bid.");
				//skip the last check because it doesn't matter at this point
				return; 
			}
			//check that this bid is higher than last
			if (bid.getAmount().compareTo(highBid.getAmount()) <= 0)
				errors.rejectValue("amount", "", "You must bid more than the current bid. Try again.");
			//check precision of bid
			if (bid.getAmount().scale() > 2 || bid.getAmount().scale() < 0)
				errors.rejectValue("amount", "", "You must bid in one cent increments.");
			//check for non-digit characters
			//if (bid.getAmount().)
		}
		/*//check bid format. Acceptable input (1+, 1+.0, 1+.00, 0.1, 0.11)
		if (!bid.getAmount().toString().matches("^[0-9]+(:?\\.?[0-9]{0,2})$")){
			errors.rejectValue("amount", "", "Wrong price format entered. Try again.");
		}*/
	}

}