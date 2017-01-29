package com.mkyong.web.controller;

import java.util.List;

import com.mkyong.dao.OrderDao;
import com.mkyong.dao.ProductDao;
import com.mkyong.model.Order;
import com.mkyong.model.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mkyong.dao.UserDao;
import com.mkyong.model.User;

import javax.servlet.http.HttpServletRequest;

@Controller
public class WelcomeController {

	private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);

	@Autowired
	UserDao userDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(Model model) {

		logger.debug("mkyong");

		//User user = userDao.findByName("Alexey");
		List<User> users = userDao.findAll();
		List<Product> products = productDao.findAll();


		model.addAttribute("user", users);
		model.addAttribute("product", products);
		
		return "welcome";
	}

	@RequestMapping(value = "/clients", method = RequestMethod.GET)
	public String clients(Model model) {
		List<User> users = userDao.findAll();

		model.addAttribute("users", users);
		return "clients";
	}

	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String orders (Model model) {
		List<Order> orders = orderDao.findAll();
		for (Order order: orders) {
			order.setProduct(productDao.findById(order.getProductId()));
			order.setUser(userDao.findById(order.getUserId()));
		}

		model.addAttribute("orders", orders);
		return "orders";
	}
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String products(Model model) {
		List<Product> products = productDao.findAll();
		model.addAttribute("product", products);
		return "products";
	}

	@RequestMapping(value = "/addproduct", method = RequestMethod.GET)
	public String addProduct(Model model) {
		model.addAttribute("product", new Product());
		return "addproduct";
	}

	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public String addProductAction(Product product) {
		productDao.addProduct(product);
		return "redirect:/products";
	}

	@RequestMapping(value = "/deleteproduct/{barcode}", method = RequestMethod.POST)
	public String deleteProductAction(@PathVariable int barcode, Model model) {
		productDao.removeProduct(barcode);
		return "redirect:/";
	}

	@RequestMapping(value = "/deleteproduct/{barcode}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int barcode, Model model) {
		Product product = productDao.findById(barcode);
		model.addAttribute("product", product);
		return "deleteproduct";
	}


	@RequestMapping(value = "/editproduct/{barcode}", method = RequestMethod.GET)
	public String editProduct(@PathVariable int barcode, Model model) {
		Product product = productDao.findById(barcode);
		model.addAttribute("product", product);
		return "editproduct";
	}

	@RequestMapping(value = "/editproduct/{barcode}", method = RequestMethod.POST)
	public String editProductAction(Product product) {
		productDao.editProduct(product);
		return "redirect:/products";
	}


	@RequestMapping(value = "/deleteclient/{id}", method = RequestMethod.GET)
	public String deleteClient(@PathVariable int id, Model model) {
		User user = userDao.findById(id);
		model.addAttribute("user", user);
		return "deleteclient";
	}

	@RequestMapping(value = "/deleteclient/{id}", method = RequestMethod.POST)
	public String deleteClientAction(@PathVariable int id, Model model) {
		userDao.removeClient(id);
		return "redirect:/clients";
	}


	@RequestMapping(value = "/editclient/{id}", method = RequestMethod.GET)
	public String editClient(@PathVariable int id, Model model) {
		User user = userDao.findById(id);
		model.addAttribute("user", user);
		return "editclient";
	}

	@RequestMapping(value = "/editclient/{id}", method = RequestMethod.POST)
	public String editClientAction(User user) {
		userDao.editClient(user);
		return "redirect:/clients";
	}


	@RequestMapping(value = "/addclient", method = RequestMethod.GET)
	public String addClient(Model model) {
		model.addAttribute("user", new User());
		return "addclient";
	}

	@RequestMapping(value = "/addclient", method = RequestMethod.POST)
	public String addClientAction(User user) {
		userDao.addClient(user);
		return "redirect:/clients";
	}

	@RequestMapping(value = "/addorder", method = RequestMethod.GET)
	public String addOrder (Model model) {
		List<User> users = userDao.findAll();
		List<Product> products = productDao.findAll();

		model.addAttribute("users", users);
		model.addAttribute("products", products);

		return "addorder";
	}

	@RequestMapping(value = "/addorder", method = RequestMethod.POST)
	public String addOrderAction (HttpServletRequest request) {
		User user = userDao.findById(Integer.parseInt(request.getParameter("userId")));

		List<Product> products = productDao.findAll();
		for (Product product : products) {
			System.out.println("for  :" + product.getName()  + " quantity:" + request.getParameter(Integer.toString(product.getBarcode())));

			int quantity = Integer.parseInt(request.getParameter(Integer.toString(product.getBarcode())));
			if (quantity > 0) {
				Order order = new Order();
				order.setUserId(user.getId());
				order.setUser(user);
				order.setProductId(product.getBarcode());
				order.setProductQuantity(quantity);
				order.setPrice(product.getPrice());
				orderDao.addOrder(order);
			}
		}


		System.out.println(request.getParameter("userId"));

		return "redirect:/orders";
	}



}