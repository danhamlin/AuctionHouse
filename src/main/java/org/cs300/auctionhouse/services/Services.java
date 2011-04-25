package org.cs300.auctionhouse.services;

import java.util.List;

import org.cs300.auctionhouse.domain.Auction;
import org.cs300.auctionhouse.domain.Authority;
import org.cs300.auctionhouse.domain.Bid;
import org.cs300.auctionhouse.domain.Category;
import org.cs300.auctionhouse.domain.Feedback;
import org.cs300.auctionhouse.domain.PersonalInfo;
import org.cs300.auctionhouse.domain.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

// This class is the business services tier in the application.
// @Transactional is needed so that a Hibernate transaction is set up,
// otherwise updates won't have an affect

@Transactional
public class Services {

	// So Spring can inject the session factory
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// Shortcut for sessionFactory.getCurrentSession()
	public Session sess() {
		return sessionFactory.getCurrentSession();
	}

	public void createUser(User user, PersonalInfo pi) {
		user.setEnabled(true);
		Authority auth = new Authority(user, "ROLE_USER");
		pi.setUser(user);
		sess().save(user);
		sess().save(pi);
		sess().save(auth);
	}

	public void updateUser(User user, PersonalInfo pi) {
		sess().update(user);
		sess().update(pi);
	}

	public int saveNewAuction(Auction auction) {
		sess().save(auction);
		return auction.getIdAuction();
	}

	public void updateAuction(Auction auction) {
		sess().update(auction);
	}

	@SuppressWarnings("unchecked")
	public List<Auction> getAllAuctions() {
		return sess().createQuery("from Auction where finished=false").list();
	}

	@SuppressWarnings("unchecked")
	public List<Auction> getAuctionsByCategory(int id) {
		return sess().createQuery("from Auction where finished=false and category.idCategory=:id").setInteger("id", id).list();
	}

	@SuppressWarnings("unchecked")
	public List<Auction> getUserSales(String currentUser) {
		return sess().createQuery("from Auction where user.username=:id and finished=false").setString("id", currentUser).list();
	}

	@SuppressWarnings("unchecked")
	public List<Auction> getUserFinishedSales(String currentUser) {
		return sess().createQuery("from Auction auction where auction.user.username=:username and auction.finished=true").setString("username", currentUser).list();
	}

	@SuppressWarnings("unchecked")
	public List<Auction> getUserBids(String currentUser) {
		return sess().createQuery("select distinct bid.auction from Bid bid where bid.user.username=:id and bid.auction.finished=false").setString("id", currentUser).list();
	}

	@SuppressWarnings("unchecked")
	public List<Auction> getUserWonBids(String currentUser) {
		return sess().createQuery("select distinct bid.auction from Bid bid where bid.auction.sold=true and bid.amount=(select max(amount) from Bid bid2 where bid2.user.username=:id and bid.auction=bid2.auction)").setString("id", currentUser).list();
	}

	@SuppressWarnings("unchecked")
	public List<Auction> getUserClosedBids(String currentUser) {
		return sess().createQuery("select distinct bid.auction from Bid bid where bid.user.username=:id and bid.auction.finished=true").setString("id", currentUser).list();
	}

	public Auction getAuctionByID(int id) {
		return (Auction)
			sess().createQuery("from Auction where idAuction=:idAuction").setInteger("idAuction", id).uniqueResult();
	}

	public User findByName(String username) {
		return (User) sess().createQuery("from User where username=:username").setString("username", username).uniqueResult();
	}

	public byte[] getAuctionImage(int id) {
		return getAuctionByID(id).getPicture();
	}

	public List<Bid> getBidsByAuctionID(int id) {
		return getAuctionByID(id).getBids();
	}

	@SuppressWarnings("unchecked")
	public List<Category> getAllCategories() {
		return sess().createQuery("from Category").list();
	}

	public Category getCategoryByID(int id) {
		return (Category)sess().createQuery("from Category where id=:id").setInteger("id", id).uniqueResult();
	}

	public Bid getHighBidByAuction(int id) {
		return (Bid)sess().createQuery("select bid from Bid bid where bid.amount = (select max(amount) from Bid bid2 where bid2.auction.idAuction = bid.auction.idAuction and bid2.auction.idAuction=:id)").setInteger("id", id).uniqueResult();
	}

	public void saveNewBid(Bid bid) {
		sess().save(bid);
	}

	@SuppressWarnings("unchecked")
	public List<Feedback> getFeedbackForUserSales(String username) {
		return sess().createQuery("from Feedback feedback where feedback.auction.user.username=:id").setString("id", username).list();
	}

	@SuppressWarnings("unchecked")
	public List<Feedback> getFeedbackForUserBids(String username) {
		return sess().createQuery("select feedback from Feedback feedback where feedback.auction = (select distinct bid.auction from Bid bid where bid.user.username=:id and bid.auction.sold=true)").setString("id", username).list();
	}

	public void saveFeedback(Feedback feedback) {
		sess().save(feedback);
	}

	@SuppressWarnings("unchecked")
	public List<Auction> searchAuctions(String searchTerm) {
		return sess().createQuery("").setString("searchTerm", searchTerm).list();
	}
}