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
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amount", "", "Amount is a required field.");
//		Bid bid = (Bid)target;
//		Bid highBid = services.getHighBidByAuction(bid.getAuction().getIdAuction());
//		String currentUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
//		String highBidder = highBid.getUser().getUsername();
//		String auctionOwner = bid.getAuction().getUser().getUsername();
//		if (bid.getAmount().compareTo(highBid.getAmount()) <=0) {
//			//can't bid less than current bid
//			errors.rejectValue("amount", "", "You must bid more than the current bid. Try again.");
//		}
//		if (currentUser.equals(auctionOwner)) {
//			//can't bid on own auction
//			errors.rejectValue("amount", "", "You can not bid on your own auction.");
//		}
//		if (currentUser.equals(highBidder)) {
//			//can't bid if already have high bid
//			errors.rejectValue("amount", "", "You already have the high bid.");
//		}
	}

}
