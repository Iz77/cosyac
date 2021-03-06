package backend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import backend.dao.ProductDAO;
import backend.dto.Product;

public class ProductTestCase {

	private static AnnotationConfigApplicationContext context;

	private static ProductDAO productDAO;

	private Product product;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("backend");
		context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
	}

	/*@Test public void testCRUDProduct() {
	 
	 // create operation 
	product = new Product();
	  
	  product.setName("LMN12554RW"); 
	  product.setBrand("LG");
	  product.setDescription("LG A/C"); 
	  product.setUnitPrice(1100); 
	  product.setActive(true);
	  product.setCategoryId(3); 
	  product.setSupplierId(1);
	  
	  assertEquals("Something went wrong while inserting a new product!",
			  true,productDAO.add(product));
	  
	  
	  // reading and updating the category 
	  product = productDAO.get(2);
	  product.setName("Samsung Galaxy S7"); 
	  assertEquals("Something went wrong while updating the existing record!",
			  true,productDAO.update(product));
	  
	  assertEquals("Something went wrong while deleting the existing record!",
			  true,productDAO.delete(product));
	  
	  // list 
	  assertEquals("Something went wrong while fetching the list of products!",
	  6,productDAO.list().size());
	  
	  }*/
	/*@Test
	public void testListActiveProducts() {
		assertEquals("Something went wrong while fetching the list of products!",
				  5,productDAO.listActiveProducts().size());
	}*/
	/*@Test
	public void testListActiveProductsByCategory() {
		assertEquals("Something went wrong while fetching the list of products!",
				  1,productDAO.listActiveProductsByCategory(1).size());
		assertEquals("Something went wrong while fetching the list of products!",
				  0,productDAO.listActiveProductsByCategory(2).size());
		assertEquals("Something went wrong while fetching the list of products!",
				  3,productDAO.listActiveProductsByCategory(3).size());
		assertEquals("Something went wrong while fetching the list of products!",
				  1,productDAO.listActiveProductsByCategory(4).size());
	}*/
	@Test
	public void testGetLatestActiveProducts() {
		assertEquals("Something went wrong while fetching the list of products!",
				  3,productDAO.getLatestActiveProducts(3).size());
	}

}
